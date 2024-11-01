import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp/src/features/screens/page_three.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const EquityVirtualAssistantAppBar(),
        backgroundColor: const Color(0xFF0b141b), // The blue container (bottom)

        body: Container(
          width: double.maxFinite,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/bacground.jpeg"))),
          // color: const Color(0xFF0b141b),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      // For a received message

                      WhatsAppChatBubble(
                        message: "Hello",
                        time: "10:30 AM",
                        isSent: true,
                        isRead: true,
                      ),
                    





                    
                    ],
                  ),
                ),
              ),
              CustomBottomAppBar(
                onMessageTap: () {
                  // Handle message tap
                },
                onAttachmentTap: () {
                  // Handle attachment tap
                },
                onCameraTap: () {
                  // Handle camera tap
                },
                onVoiceTap: () {
                  // Handle voice tap
                },
              ),
            ],
          ),
        ));
  }
}
 
class WhatsAppChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSent;
  final bool isRead;

  const WhatsAppChatBubble({
    Key? key,
    required this.message,
    required this.time,
    this.isSent = true,
    this.isRead = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          color: isSent ? const Color(0xFF0e5a3d) : Color(0xFF1f2c34),
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(8),
            bottomLeft: const Radius.circular(8),
            topLeft:
                isSent ? const Radius.circular(8) : const Radius.circular(0),
            topRight:
                isSent ? const Radius.circular(0) : const Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 1),
              blurRadius: 4,
            ),
          ],
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
          minWidth: 65.w,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                    ),
                  ),
                  if (isSent) ...[
                    const SizedBox(width: 5),
                    Icon(
                      Icons.done_all,
                      size: 12,
                      color: isRead ? Colors.grey : Colors.grey,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubblePainter extends CustomPainter {
  final Color color;
  final bool isReceived;

  ChatBubblePainter({
    required this.color,
    required this.isReceived,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    const double cornerRadius = 8.0;
    const double triangleHeight = 12.0;
    const double triangleWidth = 10.0;

    // Calculate starting point and adjust for triangle space
    final double startX = isReceived ? triangleWidth : 0;
    final double endX = isReceived ? size.width : size.width - triangleWidth;

    // Main bubble path
    if (isReceived) {
      // Received message (sharp top-left)
      path.moveTo(startX, 0);
      path.lineTo(endX - cornerRadius, 0);
      path.quadraticBezierTo(endX, 0, endX, cornerRadius);
    } else {
      // Sent message (sharp top-right)
      path.moveTo(startX, cornerRadius);
      path.quadraticBezierTo(startX, 0, startX + cornerRadius, 0);
      path.lineTo(endX, 0);
    }

    // Common path for both types
    if (isReceived) {
      path.lineTo(endX, size.height - cornerRadius);
      path.quadraticBezierTo(
          endX, size.height, endX - cornerRadius, size.height);
    } else {
      path.lineTo(endX, size.height - cornerRadius);
      path.quadraticBezierTo(
          endX, size.height, endX - cornerRadius, size.height);
    }

    // Bottom corners
    path.lineTo(startX + cornerRadius, size.height);
    path.quadraticBezierTo(
        startX, size.height, startX, size.height - cornerRadius);
    path.lineTo(startX, isReceived ? 0 : cornerRadius);

    // Draw the triangle
    final triangleY = 0.0;
    if (isReceived) {
      path.moveTo(triangleWidth, triangleY);
      path.lineTo(0, triangleY + triangleHeight / 2);
      path.lineTo(triangleWidth, triangleY + triangleHeight);
    } else {
      path.moveTo(endX, triangleY);
      path.lineTo(size.width, triangleY + triangleHeight / 2);
      path.lineTo(endX, triangleY + triangleHeight);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
// ---------------------------------

class EquityVirtualAssistantAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const EquityVirtualAssistantAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0b141b), // The blue container (bottom)
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 1,
      title: GestureDetector(
        onTap: () => Get.to(EvaProfilePage()),
        child: const Row(
          children: [
            CircleAvatar(
                radius: 20, backgroundImage: AssetImage("assets/eva.png")),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      'Equity Virtual Assistant',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.verified, color: Colors.blue, size: 16),
                  ],
                ),
                Text(
                  'Business Account',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.white),
          onPressed: () {
            // Handle menu button press
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomBottomAppBar extends StatelessWidget {
  final VoidCallback onMessageTap;
  final VoidCallback onAttachmentTap;
  final VoidCallback onCameraTap;
  final VoidCallback onVoiceTap;

  const CustomBottomAppBar({
    Key? key,
    required this.onMessageTap,
    required this.onAttachmentTap,
    required this.onCameraTap,
    required this.onVoiceTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      color: const Color(0xFF0b141b),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min, // Add this to minimize the row size
        children: [
          Container(
            width: 320.w,
            decoration: BoxDecoration(
              color: const Color(0xFF1F2C34),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisSize:
                  MainAxisSize.min, // This will help the row shrink-wrap
              children: [
                _buildIconButton(Icons.emoji_emotions_outlined, onMessageTap),
                Expanded(
                  // Use Flexible instead of Expanded
                  // fit: FlexFit.loose, // Ensure it doesn't expand beyond bounds
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      )),
                ),
                _buildIconButton(Icons.attach_file, onAttachmentTap),
                _buildIconButton(Icons.camera_alt, onCameraTap),
                const SizedBox(width: 8),
              ],
            ),
          ),
          _buildVoiceButton()
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return IconButton(
      icon: Icon(icon, color: Colors.grey[400]),
      onPressed: onTap,
    );
  }

  Widget _buildVoiceButton() {
    return GestureDetector(
      onTap: onVoiceTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xFF00A884),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.mic, color: Colors.white),
      ),
    );
  }
}
