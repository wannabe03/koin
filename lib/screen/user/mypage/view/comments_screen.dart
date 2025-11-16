import 'package:flutter/material.dart';

class UserComment {
  final String content;
  final String postTitle;
  final String date;
  final String boardName;
  final int likeCount;

  UserComment({
    required this.content,
    required this.postTitle,
    required this.date,
    required this.boardName,
    required this.likeCount,
  });
}

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  bool _isLoading = true;
  List<UserComment> _userComments = [];

  @override
  void initState() {
    super.initState();
    _loadCommentData();
  }

  Future<void> _loadCommentData() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _userComments = [
        UserComment(
          content: 'Its sooooo complecated...TT',
          postTitle: 'Korean words',
          date: '09/06',
          boardName: 'Korean Board',
          likeCount: 2,
        ),
        UserComment(
          content: 'Buldak Spicy Noodle is crazyyyy stop... enough...',
          postTitle: 'Am I the only one who still finds it spicy?',
          date: '09/06',
          boardName: 'Korean Board',
          likeCount: 2,
        ),
        UserComment(
          content:
              'Idk what i should say to this post... just admire him its crazyyyy',
          postTitle: 'Making a good thing',
          date: '09/06',
          boardName: 'Korean Board',
          likeCount: 0,
        ),
        UserComment(
          content: 'Hello :)',
          postTitle: 'Say hello 2 me pls',
          date: '09/06',
          boardName: 'Korean Board',
          likeCount: 9,
        ),
        UserComment(
          content: 'i wanna recommend Jeju Island',
          postTitle: 'Sooooo Good',
          date: '09/06',
          boardName: 'Korean Board',
          likeCount: 0,
        ),
        UserComment(
          content:
              'Interesting recipe! i wanna try tmr morning 🤤 Thank you so much for your share )))',
          postTitle: 'Kimchi stew recipe',
          date: '09/06',
          boardName: 'Korean Board',
          likeCount: 129,
        ),
        UserComment(
          content: 'Beef stew...',
          postTitle: 'no post title',
          date: '09/05',
          boardName: 'Korean Board',
          likeCount: 1,
        ),
      ];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Comments',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: _userComments.length,
                itemBuilder: (context, index) {
                  return _CommentItem(comment: _userComments[index]);
                },
              ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  final UserComment comment;
  const _CommentItem({required this.comment});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.content,
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            comment.postTitle,
            style: textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                comment.date,
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              const SizedBox(width: 8),
              Text(
                comment.boardName,
                style: textTheme.bodySmall?.copyWith(color: Colors.grey),
              ),
              const Spacer(),
              if (comment.likeCount > 0)
                Row(
                  children: [
                    const Icon(Icons.favorite, size: 14, color: Colors.red),
                    const SizedBox(width: 4),
                    Text(
                      comment.likeCount.toString(),
                      style: textTheme.bodySmall?.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
