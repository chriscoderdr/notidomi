import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notidomi/data/firebase/firebase_stories_data_source.dart';
import 'package:notidomi/data/mock/mock_stories_data_source.dart';
import 'package:notidomi/data/stories_data_source.dart';
import 'package:notidomi/models/story.dart';
import 'package:notidomi/widgets/StoryListItem.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  StoriesDataSource _storiesDataSource;
  ScrollController _scrollController = ScrollController();
  bool loadMoreInProgress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storiesDataSource = MockStoriesDataSource();
    _storiesDataSource = FirebaseStoriesDataSource();
    loadMoreInProgress = true;
    _storiesDataSource.initialize();
    _storiesDataSource.inProgress().listen((event) {
      Future.delayed(Duration(seconds: 1)).then((value) {
        setState(() {
          loadMoreInProgress = event;
        });
      });
    });
    _scrollController.addListener(() {
      var maxScrollExtent = _scrollController.position.maxScrollExtent;
      var triggerFetchMoreSize = maxScrollExtent * 0.8;
      if (triggerFetchMoreSize > 0 &&
          _scrollController.position.pixels >= triggerFetchMoreSize &&
          !loadMoreInProgress) {
        loadMoreInProgress = true;
        _storiesDataSource.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("NotiDomi"),
      ),
      body: StreamBuilder<List<Story>>(
        stream: _storiesDataSource.stories(),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data.isNotEmpty) {
            return RefreshIndicator(
              onRefresh: () {
                _storiesDataSource.initialize();
                return Future.delayed(Duration(seconds: 1));
              },
              child: Column(children: <Widget>[
                Expanded(
                  child: ListView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _scrollController,
                    itemExtent: 150,
                    shrinkWrap: false,
                    padding: const EdgeInsets.all(8),
                    children: snapshot.data.map((story) {
                      return StoryListItem(story: story);
                    }).toList(),
                  ),
                ),
                this.loadMoreInProgress
                    ? LinearProgressIndicator()
                    : Container(),
              ]),
            );
          } else {
            if (this.loadMoreInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(child: Text("No hay articulos que mostrar"));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _storiesDataSource.dispose();
  }
}
