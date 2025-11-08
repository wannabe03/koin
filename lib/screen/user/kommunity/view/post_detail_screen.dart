import 'package:koin/screen/user/kommunity/model/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Comment {
  final String id;
  final String author;
  final String flag;
  final String content;
  final String date;
  final int likes;
  final List<Comment>? replies;

  Comment({
    required this.id,
    required this.author,
    required this.flag,
    required this.content,
    required this.date,
    this.likes = 0,
    this.replies,
  });
}

class PostDetailScreen extends StatefulWidget {
  final Post post;
  final String boardName;

  const PostDetailScreen({
    super.key,
    required this.post,
    required this.boardName,
  });

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  late int _currentLikes;
  late int _currentComments;
  bool _isLiked = false;

  int _currentScraps = 0;
  bool _isScrapped = false;
  bool _isAnonymous = true;

  final List<Comment> _comments = [];

  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _currentLikes = widget.post.likes;
    _currentComments = widget.post.comments;
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _currentLikes--;
        _isLiked = false;
      } else {
        _currentLikes++;
        _isLiked = true;
      }
    });
  }

  void _toggleScrap() {
    setState(() {
      if (_isScrapped) {
        _currentScraps--;
        _isScrapped = false;
      } else {
        _currentScraps++;
        _isScrapped = true;
      }
    });
  }

  void _addComment() {
    if (_commentController.text.trim().isEmpty) {
      return;
    }

    final String formattedDate = DateFormat(
      'MM/dd HH:mm',
    ).format(DateTime.now());

    final newComment = Comment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      author: _isAnonymous ? '익명' : 'Koiny',
      flag: _isAnonymous ? '😶' : '🇰🇷',
      content: _commentController.text,
      date: formattedDate,
      likes: 0,
      replies: [],
    );

    setState(() {
      _comments.insert(0, newComment);
      _currentComments++;
      _commentController.clear();
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        title: Text(widget.boardName),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Color(0xFFE0E0E0),
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      widget.post.author,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      widget.post.flag,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Text(
                                  widget.post.date,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.post.title,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.post.content,
                          style: const TextStyle(fontSize: 16, height: 1.5),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: _toggleLike,
                              child: Row(
                                children: [
                                  Icon(
                                    _isLiked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 18,
                                    color: _isLiked ? Colors.red : Colors.red,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Like $_currentLikes',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.chat_bubble_outline,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Comment $_currentComments',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: _toggleScrap,
                              child: Row(
                                children: [
                                  Icon(
                                    _isScrapped
                                        ? Icons.bookmark
                                        : Icons.bookmark_border,
                                    size: 18,
                                    color:
                                        _isScrapped ? Colors.grey : Colors.grey,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Scrap $_currentScraps',
                                    style: TextStyle(
                                      color:
                                          _isScrapped
                                              ? Colors.grey
                                              : Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(height: 8, color: const Color(0xFFF7F7F7)),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        _comments.isEmpty
                            ? const Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 24.0),
                                child: Text(
                                  '첫 번째 댓글을 작성해보세요.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            )
                            : ListView.builder(
                              itemCount: _comments.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final comment = _comments[index];
                                return _buildCommentItem(comment);
                              },
                            ),
                  ),
                ],
              ),
            ),
          ),
          _buildCommentInputField(),
        ],
      ),
    );
  }

  Widget _buildCommentItem(Comment comment) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(radius: 18, backgroundColor: Color(0xFFE0E0E0)),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              comment.author,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              comment.flag,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.more_horiz,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(comment.content),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          comment.date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        if (comment.likes > 0) ...[
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.favorite,
                            size: 12,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${comment.likes}',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (comment.replies != null && comment.replies!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 40.0, top: 10),
            child: ListView.builder(
              itemCount: comment.replies!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildReplyItem(comment.replies![index]);
              },
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReplyItem(Comment reply) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, right: 8.0),
            child: Icon(
              Icons.subdirectory_arrow_right,
              size: 18,
              color: Colors.grey,
            ),
          ),
          const CircleAvatar(radius: 18, backgroundColor: Color(0xFFE0E0E0)),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F7F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            reply.author,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            reply.flag,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.more_horiz,
                        size: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(reply.content),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        reply.date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      if (reply.likes > 0) ...[
                        const SizedBox(width: 8),
                        const Icon(Icons.favorite, size: 12, color: Colors.red),
                        const SizedBox(width: 2),
                        Text(
                          '${reply.likes}',
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isAnonymous = !_isAnonymous;
                });
              },
              child: Row(
                children: [
                  Icon(
                    _isAnonymous
                        ? Icons.check_box_outline_blank
                        : Icons.check_box,
                    size: 20,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 4),
                  const Text('익명', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: const InputDecoration(
                  hintText: 'Write here',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: _addComment,
              icon: const Icon(Icons.arrow_forward),
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
