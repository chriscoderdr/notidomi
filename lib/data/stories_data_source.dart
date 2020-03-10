import 'package:notidomi/models/story.dart';

abstract class StoriesDataSource {
  void initialize();

  Stream<List<Story>> stories();

  Stream<Story> story(String storyId);

  Stream<bool> inProgress();

  void loadMore();

  void dispose();
}
