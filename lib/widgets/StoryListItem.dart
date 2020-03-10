import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notidomi/models/story.dart';
import 'package:timeago/timeago.dart' as timeago;

class StoryListItem extends StatelessWidget {
  final Story story;

  const StoryListItem({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget storyWidget = story.thumbnailUrl == null
        ? _TextStory(story: story)
        : _ThumbnailStory(story: story);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: storyWidget,
    );
  }
}

class _ThumbnailStory extends StatelessWidget {
  final Story story;

  const _ThumbnailStory({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: _StoryDescription(
            story: story,
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
              child: CachedNetworkImage(
                imageUrl: story.thumbnailUrl,
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(color: Colors.red),
                ),
                errorWidget: (context, url, error) => Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(child: Icon(Icons.error)),
                ),
                fit: BoxFit.cover,
                height: 150,
              )),
        ),
      ],
    );
  }
}

class _TextStory extends StatelessWidget {
  final Story story;

  const _TextStory({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: _StoryDescription(
            story: story,
          ),
        ),
      ],
    );
  }
}

class _StoryDescription extends StatelessWidget {
  final Story story;

  const _StoryDescription({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.story.title,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),
            overflow: TextOverflow.clip,
            maxLines: 4,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
              timeago.format(this.story.publishedAt,
                  locale: 'es', allowFromNow: true),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 10)),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Flexible(
              child: Container(
                  child: Text(
            this.story.subtitle,
            style: TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
                    maxLines: 3 ,
          )))
        ],
      ),
    );
  }
}
