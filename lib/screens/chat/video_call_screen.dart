import 'package:flutter/material.dart';

/// شاشة الاتصال المرئي
class VideoCallScreen extends StatefulWidget {
  final String? callerName;

  const VideoCallScreen({super.key, this.callerName});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  bool _isMuted = false;
  bool _isCameraOff = false;
  bool _isSpeaker = false;
  int _callDuration = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) setState(() => _callDuration++);
      return true;
    });
  }

  String _formatDuration(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // الفيديو الرئيسي
          Container(
            color: Colors.grey[900],
            child: Center(
              child: _isCameraOff
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: const Color(0xFFD4AF37),
                          child: Text(
                            widget.callerName?.substring(0, 1).toUpperCase() ?? '?',
                            style: const TextStyle(fontSize: 48, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          widget.callerName ?? 'غير معروف',
                          style: const TextStyle(color: Colors.white, fontSize: 24),
                        ),
                      ],
                    )
                  : const Icon(Icons.videocam, size: 100, color: Colors.white54),
            ),
          ),
          // الفيديو المصغر
          Positioned(
            top: 60,
            right: 16,
            child: Container(
              width: 100,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFD4AF37), width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const Center(
                  child: Icon(Icons.person, size: 40, color: Colors.white54),
                ),
              ),
            ),
          ),
          // معلومات الاتصال
          Positioned(
            top: 60,
            left: 16,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.callerName ?? 'غير معروف',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _formatDuration(_callDuration),
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          // أزرار التحكم
          Positioned(
            bottom: 60,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: _isMuted ? Icons.mic_off : Icons.mic,
                  isActive: _isMuted,
                  onTap: () => setState(() => _isMuted = !_isMuted),
                ),
                _buildActionButton(
                  icon: Icons.call_end,
                  isRed: true,
                  onTap: () => Navigator.pop(context),
                ),
                _buildActionButton(
                  icon: _isCameraOff ? Icons.videocam_off : Icons.videocam,
                  isActive: _isCameraOff,
                  onTap: () => setState(() => _isCameraOff = !_isCameraOff),
                ),
                _buildActionButton(
                  icon: _isSpeaker ? Icons.volume_up : Icons.volume_down,
                  isActive: _isSpeaker,
                  onTap: () => setState(() => _isSpeaker = !_isSpeaker),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    bool isActive = false,
    bool isRed = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: isRed ? Colors.red : (isActive ? Colors.white24 : Colors.white12),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
