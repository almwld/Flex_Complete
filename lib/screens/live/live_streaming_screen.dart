import 'package:flutter/material.dart';

/// شاشة البث المباشر
class LiveStreamingScreen extends StatefulWidget {
  final String? streamId;

  const LiveStreamingScreen({super.key, this.streamId});

  @override
  State<LiveStreamingScreen> createState() => _LiveStreamingScreenState();
}

class _LiveStreamingScreenState extends State<LiveStreamingScreen> {
  final TextEditingController _commentController = TextEditingController();
  final List<LiveComment> _comments = [];
  int _viewerCount = 1250;
  bool _isLiked = false;
  int _likeCount = 3400;

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  void _loadComments() {
    setState(() {
      _comments.addAll([
        LiveComment(userName: 'مستخدم 1', comment: 'منتج رائع!', time: 'الآن'),
        LiveComment(userName: 'مستخدم 2', comment: 'السعر كم؟', time: 'الآن'),
        LiveComment(userName: 'مستخدم 3', comment: 'إضافة للسلة', time: 'الآن'),
      ]);
    });
  }

  void _sendComment() {
    if (_commentController.text.trim().isEmpty) return;
    setState(() {
      _comments.add(LiveComment(
        userName: 'أنا',
        comment: _commentController.text,
        time: 'الآن',
        isMe: true,
      ));
    });
    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // الفيديو
          Container(
            color: Colors.grey[900],
            child: const Center(
              child: Icon(Icons.live_tv, size: 100, color: Colors.white54),
            ),
          ),
          // شريط البث
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 8,
                left: 16,
                right: 16,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black87, Colors.transparent],
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color(0xFFD4AF37),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'البائع',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.circle, size: 8, color: Colors.white),
                                SizedBox(width: 4),
                                Text('LIVE', style: TextStyle(color: Colors.white, fontSize: 10)),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.visibility, size: 14, color: Colors.white.withOpacity(0.7)),
                          Text(
                            ' $_viewerCount',
                            style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
          // التعليقات
          Positioned(
            left: 0,
            right: 80,
            bottom: 100,
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                reverse: true,
                itemCount: _comments.length,
                itemBuilder: (context, index) {
                  final comment = _comments[_comments.length - 1 - index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${comment.userName}: ',
                            style: TextStyle(
                              color: comment.isMe ? const Color(0xFFD4AF37) : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: comment.comment, style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // أزرار التفاعل
          Positioned(
            right: 16,
            bottom: 100,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    _isLiked = !_isLiked;
                    _likeCount += _isLiked ? 1 : -1;
                  }),
                  child: Column(
                    children: [
                      Icon(
                        _isLiked ? Icons.favorite : Icons.favorite_border,
                        color: _isLiked ? Colors.red : Colors.white,
                        size: 36,
                      ),
                      Text(
                        '$_likeCount',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Icon(Icons.share, color: Colors.white, size: 32),
                const SizedBox(height: 16),
                const Icon(Icons.shopping_cart, color: Colors.white, size: 32),
              ],
            ),
          ),
          // حقل التعليق
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).padding.bottom + 8,
                top: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'اكتب تعليقاً...',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white12,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFFD4AF37)),
                    onPressed: _sendComment,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LiveComment {
  final String userName;
  final String comment;
  final String time;
  final bool isMe;

  LiveComment({
    required this.userName,
    required this.comment,
    required this.time,
    this.isMe = false,
  });
}
