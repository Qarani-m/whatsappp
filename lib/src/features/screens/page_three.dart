import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsapp/src/features/screens/page_two.dart';

class EvaProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF091015),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF091015),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage("assets/eva.png"),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Equity',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '~Equity Virtual Assistant',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.verified, color: Colors.blue, size: 16),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 50.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: const Color(0xFF242d34))),
                        child: const Column(
                          children: [
                            Image(image: AssetImage("assets/messages.png")),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Message",
                              style: TextStyle(color: Color(0xFFe7e4e4)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 50.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: const Color(0xFF242d34))),
                        child: const Column(
                          children: [
                            Image(image: AssetImage("assets/arrow.png")),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(color: Color(0xFFe7e4e4)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.w, horizontal: 20.w),
                  color: const Color(0xFF091015),
                  child: Column(
                    children: [
                      _buildInfoRow(
                          Icons.grid_view,
                          showImage: true,
                          'Eva is your Equity virtual assistant. She can help you perform your financial transactions in a simple conversation. Simply say \'Hi Eva\' and find out what she can do for you.'),
                      _buildInfoRow(Icons.location_on,
                          'P.O. Box 75104-00200, Nairobi, Kenya.'),
                      _buildInfoRow(
                          Icons.mail_outline, 'info@equitygroupholdings.com'),
                      _buildInfoRow(
                          Icons.public, 'https://equitygroupholdings.com/'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  color: const Color(0xFF091015),
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.grey[400],
                          size: 24,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Business Account',
                                style: TextStyle(
                                  color: Color(0xFFDEDCDC),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'This account uses WhatsApp Business',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  color: const Color(0xFF091015),
                  padding: EdgeInsets.only(
                    top: 7.h,
                    bottom: 7.h,
                    left: 11.w,
                  ),
                  child: const ListTile(
                    title: Text('Media, Links, and docs',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Color.fromARGB(255, 222, 220, 220))),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('1', style: TextStyle(color: Colors.white)),
                        Icon(Icons.chevron_right, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  color: const Color(0xFF091015),
                  padding: EdgeInsets.only(
                    top: 7.h,
                    bottom: 7.h,
                    left: 11.w,
                  ),
                  child: const Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.notifications_outlined,
                            color: Color(0xFFDEDCDC)),
                        title: Text('Notifications',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 222, 220, 220))),
                      ),
                      ListTile(
                        leading: Icon(Icons.image_outlined,
                            color: Color(0xFFDEDCDC)),
                        title: Text('Media visibility',
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color.fromARGB(255, 222, 220, 220))),
                      ),
                    ],
                  ),
                ),
                EquityProfileScreen()
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, {bool showImage = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showImage
              ? const Image(image: AssetImage("assets/shop.png"))
              : Icon(icon, color: Colors.grey, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                  color: text.startsWith("Eva") ? Colors.grey : Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomActionButtons extends StatelessWidget {
  final VoidCallback onMessagePressed;
  final VoidCallback onSharePressed;

  const CustomActionButtons({
    Key? key,
    required this.onMessagePressed,
    required this.onSharePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          icon: Icons.message,
          label: 'Message',
          onPressed: onMessagePressed,
        ),
        _buildActionButton(
          icon: Icons.share,
          label: 'Share',
          onPressed: onSharePressed,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.green, width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.green, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(color: Colors.green, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EquityProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        _buildChatLockSection(),
        _buildSecuritySection(),
        _divider(),
        _buildAboutSection(),
        _buildPhoneSection('+254 763 000000', 'Mobile'),
        _divider(),
        _buildNoGroupsSection(),
        _divider(),
        _buildOtherPhonesSection(),
        _divider(),
        _buildBlockReportSection(),
      ],
    );
  }

  Widget _buildChatLockSection() {
    return Container(
      color: const Color(0xFF091015),
      padding: EdgeInsets.only(
        top: 7.h,
        bottom: 7.h,
        left: 11.w,
      ),
      child: Container(
        child: ListTile(
          leading: const Icon(Icons.lock_outline, color: Colors.grey),
          title: const Text('Chat lock', style: TextStyle(color: Colors.white)),
          subtitle: const Text('Lock and hide this chat on this device.',
              style: TextStyle(color: Colors.grey)),
          trailing: Switch(
              inactiveTrackColor: Colors.transparent,
              value: false,
              onChanged: (value) {}),
        ),
      ),
    );
  }

  Widget _buildSecuritySection() {
    return Container(
      color: const Color(0xFF091015),
      padding: EdgeInsets.only(
        top: 7.h,
        bottom: 7.h,
        left: 11.w,
      ),
      child: const ListTile(
        leading: Icon(Icons.info_outline, color: Colors.grey),
        title: Text('Security', style: TextStyle(color: Colors.white)),
        subtitle: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text:
                      'This business uses a secure service from Meta to manage this chat. ',
                  style: TextStyle(color: Colors.grey)),
              TextSpan(
                  text: 'Learn more', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      color: const Color(0xFF091015),
      padding: EdgeInsets.only(
        top: 7.h,
        left: 20.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('About and phone number',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          const Text(
            'Equity\'s mission is to offer integrated financial services that socially and economically empower customers.',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 4),
          const Text('22 March 2022',
              style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(
            height: 5.h,
          ),
          const Divider(
            color: Color(0xFF212a31),
            thickness: 0.5,
          ),
          SizedBox(
            height: 5.h,
          )
        ],
      ),
    );
  }

  Widget _buildPhoneSection(String number, String label) {
    return Container(
      color: const Color(0xFF091015),
      padding: EdgeInsets.only(
        left: 11.w,
      ),
      child: ListTile(
        title: Text(number, style: const TextStyle(color: Colors.white)),
        subtitle: Text(label, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.message_outlined, color: Colors.green),
      ),
    );
  }

  Widget _buildNoGroupsSection() {
    return Container(
      color: const Color(0xFF091015),
      padding: EdgeInsets.only(
        top: 7.h,
        bottom: 7.h,
        left: 11.w,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('No groups in common',
                style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.group_add_outlined, color: Colors.black),
            ),
            title: Text('Create group with Equity',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherPhonesSection() {
    return Container(
      color: const Color(0xFF091015),
      padding: EdgeInsets.only(
        top: 7.h,
        bottom: 7.h,
        left: 11.w,
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Other phones', style: TextStyle(color: Colors.grey)),
          ),
          ListTile(
            title:
                Text('+254 763 000000', style: TextStyle(color: Colors.white)),
            subtitle: Text('Mobile', style: TextStyle(color: Colors.grey)),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.message_outlined, color: Colors.green),
                SizedBox(width: 16),
                Icon(Icons.phone_outlined, color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlockReportSection() {
    return Column(
      children: [
        Container(
          color: const Color(0xFF091015),
          padding: EdgeInsets.only(
            top: 7.h,
            bottom: 7.h,
            left: 11.w,
          ),
          child: ListTile(
            leading: Icon(Icons.block, color: Colors.red),
            title: Text('Block business', style: TextStyle(color: Colors.red)),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          color: const Color(0xFF091015),
          padding: EdgeInsets.only(
            top: 7.h,
            bottom: 7.h,
            left: 11.w,
          ),
          child: ListTile(
            leading: Icon(Icons.thumb_down_outlined, color: Colors.red),
            title: Text('Report business', style: TextStyle(color: Colors.red)),
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return SizedBox(
      height: 10.h,
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isReceived;
  final Color backgroundColor;
  final Color textColor;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.isReceived,
    this.backgroundColor = const Color(0xFF2E2E2E),
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: CustomPaint(
        painter: ChatBubblePainter(
          color: backgroundColor,
          isReceived: isReceived,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 250, // Set the maximum width here
          ),
          child: IntrinsicWidth(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                isReceived ? 24 : 12, // Left padding
                8, // Top padding
                isReceived ? 12 : 24, // Right padding
                8, // Bottom padding
              ),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      message,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 50,
                      child: Row(
                        children: [
                          Text("data", style: TextStyle(fontSize: 12)),
                          Icon(Icons.done_all, size: 12, color: textColor),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
