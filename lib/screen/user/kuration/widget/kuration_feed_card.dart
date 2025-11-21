import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/kuration/widget/kuration_feed_interaction_bar.dart';
import 'package:koin/screen/util/create_random_gradient.dart';

// TODO: convert to freezed object
class Comment {
  final String author = "";
  final String content = "";
}

class KurationFeedPost {
  String subtitle = "default_subtitle";
  String title = "default_title";
  String imagePath = "/";
  String username = "default_username";
  DateTime uploadedDateTime = DateTime(1999, 12, 31, 12, 0, 0);

  int? likeCount;
  int? scrapCount;
  int? commentCount;
  List<Comment> comments = [];

  KurationFeedPost({
    required this.imagePath,
    required this.subtitle,
    required this.title,
    required this.username,
    required this.uploadedDateTime,
    required this.likeCount,
    required this.commentCount,
    required this.scrapCount,
    required this.comments,
  });
}

class KurationCardProfile extends StatelessWidget {
  final String username;
  final DateTime uploadedDateTime;
  const KurationCardProfile({
    super.key,
    required this.username,
    required this.uploadedDateTime,
  });

  String _formatUploadedTime() {
    debugPrint(uploadedDateTime.toString());
    Duration difference = DateTime.now().difference(uploadedDateTime);
    if (uploadedDateTime.isAfter(DateTime.now())) {
      throw Exception("Invalid uploaded DateTime");
    }

    // "$diff days ago"
    if (difference >= Duration(days: 1)) {
      if (difference < Duration(days: 2)) {
        return "${difference.inDays.floor()} day ago";
      }
      if (difference >= Duration(days: 30)) {
        return "${(difference.inDays / 30).floor()} months ago";
      }
      return "${difference.inDays.floor()} days ago";
    }

    // "$diff hour/hours ago"
    if (difference >= Duration(minutes: 60)) {
      if (difference < Duration(hours: 2)) {
        return "${difference.inHours.floor()} hour ago";
      }
      return "${difference.inHours.floor()} hours ago";
    }

    if (difference >= Duration(seconds: 60)) {
      if (difference < Duration(seconds: 120)) {
        return "${difference.inMinutes.floor()} minute ago";
      }
      return "${difference.inMinutes.floor()} minutes ago";
    }
    return "${difference.inSeconds.floor()} seconds ago";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: GrayScale.white),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    clipBehavior: Clip.hardEdge,
                    child: Container(
                      decoration: BoxDecoration(
                        // TODO: fetch user profile image and apply
                        gradient: createRandomGradient(),
                      ),
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    // username and difference between now and uploaded time
                    children: [
                      TextSpan(
                        text: username,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextSpan(text: "   "),
                      TextSpan(
                        text: _formatUploadedTime(),
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium?.copyWith(
                          color: GrayScale.gray400,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 10 * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('asset/img/icon/More_action.svg'),
            ),
          ],
        ),
      ),
    );
  }
}

class KurationFeedCard extends StatelessWidget {
  final KurationFeedPost post;
  const KurationFeedCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GrayScale.white,
      height: 394,
      child: Column(
        children: [
          KurationCardProfile(
            username: post.username,
            uploadedDateTime: post.uploadedDateTime,
          ),
          // TODO: fetch feed images
          Expanded(
            child: Stack(
              children: [
                // bottom overflow
                Image.asset(
                  post.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [GrayScale.black_50, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.subtitle,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: GrayScale.white),
                      ),
                      Text(
                        post.title,
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(color: GrayScale.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          KurationFeedInteractionBar(
            likeCount: post.likeCount ?? 0,
            scrapCount: post.scrapCount ?? 0,
            commentCount: post.commentCount ?? 0,
          ),
        ],
      ),
    );
  }
}
