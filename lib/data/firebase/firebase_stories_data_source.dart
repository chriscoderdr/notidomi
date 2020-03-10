import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notidomi/data/stories_data_source.dart';
import 'package:notidomi/models/story.dart';

class FirebaseStoriesDataSource implements StoriesDataSource {
  List<Story> _stories = List<Story>();
  StreamController<List<Story>> _streamController =
      StreamController<List<Story>>();
  StreamController<bool> _inProgressStreamController = StreamController<bool>();

  @override
  Stream<List<Story>> stories() {
    return _streamController.stream;
  }

  @override
  void dispose() {
    _streamController.close();
    _inProgressStreamController.close();
  }

  @override
  void initialize() {
    _stories = List<Story>();
    loadFromFirebase(limit: 10, after: null).listen((event) {
      _stories.addAll(event);
      if (event.isNotEmpty) {
        _streamController.add(_stories);
      }
      _inProgressStreamController.add(false);
    });
  }

  @override
  void loadMore() {
    loadFromFirebase(limit: 10, after: _stories.last.publishedAt)
        .listen((event) {
      _stories.addAll(event);
      if (event.isNotEmpty) {
        _streamController.add(_stories);
      }
      _inProgressStreamController.add(false);
    });
  }

  Stream<List<Story>> loadFromFirebase({int limit, after}) {
    var query = Firestore.instance
        .collection('stories')
        .orderBy("publishedAt", descending: true);

    if (after != null) {
      query = query.where("publishedAt", isLessThan: _stories.last.publishedAt);
    }

    return query.limit(limit).snapshots().map((snapshot) {
      return snapshot.documents
          .map((document) {
            return Story(
              id: document['id'],
              title: document['title'],
              subtitle: document['subtitle'],
              thumbnailUrl: document['thumbnailUrl'],
              publishedAt: document['publishedAt'].toDate(),
            );
          })
          .take(limit)
          .toList();
    });
  }

  @override
  Stream<bool> inProgress() {
    return _inProgressStreamController.stream;
  }

  @override
  Stream<Story> story(String storyId) {
    return Firestore.instance
        .collection('stories')
        .where('id', isEqualTo: storyId)
        .limit(1)
        .snapshots()
        .map((snapshot) {
      return snapshot.documents
          .map((document) {
            return Story(
              id: document['id'],
              title: document['title'],
              subtitle: document['subtitle'],
              thumbnailUrl: document['thumbnailUrl'],
              publishedAt: document['publishedAt'].toDate(),
            );
          })
          .toList()
          .first;
    });
  }
}
