import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:whatsapp/src/features/screens/page_two.dart';
import 'package:whatsapp/src/utils/users.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  bool _isLoading = true; // State variable to control the loading state

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make status bar transparent
      statusBarIconBrightness: Brightness.light, // White icons
    ));
    _startLoading();
  }

  Future<void> _startLoading() async {
    // Wait for 2 seconds to show the progress indicator
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isLoading = false; // Hide the progress indicator
    });
    await Future.delayed(const Duration(seconds: 1));
    Get.to(PageTwo()); // Navigate to PageTwo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // color: Colors.amber,
            color: const Color(0xFF0b141b), // The blue container (bottom)
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color:
                        const Color(0xFF0b141b), // The blue container (bottom)
                    padding: const EdgeInsets.only(
                      top: 40,
                      // left: 15,
                      // right: 16
                    ), // Add padding for status bar and spacing
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {},
                            ),
                            const Text("Send to...",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.group_add_outlined),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                            IconButton(
                              color: Colors.white,
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  StatusContactsWidget(),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Frequently contacted",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(
                          children: List.generate(
                            ContactUsers.frequentUsers
                                .length, // Use the length of frequentUsers
                            (index) {
                              final user = ContactUsers.frequentUsers[
                                  index]; // Access each user from the list
                              return UserProfileWidget(
                                imageUrl: user['imageUrl'] ??
                                    'no', // Handle missing image URLs
                                name: user['name'] ??
                                    'Unknown User', // Handle missing names
                                status: user['status'] ??
                                    'No status', // Handle missing statuses
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Recent chats",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(),
                        Column(
                          children: List.generate(
                            ContactUsers.users
                                .length, // Use the length of frequentUsers
                            (index) {
                              final user = ContactUsers.users[
                                  index]; // Access each user from the list
                              return UserProfileWidget(
                                imageUrl: user['imageUrl'] ??
                                    'no', // Handle missing image URLs
                                name: user['name'] ??
                                    'Unknown User', // Handle missing names
                                status: user['status'] ??
                                    'No status', // Handle missing statuses
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading) // Show progress indicator based on loading state
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(0.8),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 17.w, right: 17.w),
                  child: Container(
                    padding: EdgeInsets.only(left: 23.w, right: 23.w),
                    height: 75.h,
                    width: double.maxFinite,
                    color: Colors.white,
                    child: Row(
                      children: [
                        const CircularProgressIndicator(),
                        SizedBox(width: 10.w),
                        const Text("Searching... ")
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class StatusContactsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, ),
      child: Row(
        children: [
          // Circular avatar with icon
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/status.png"))),
          ),
          SizedBox(width: 16),
          // Text column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My status',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'My contacts',
                  style: TextStyle(
                    color: Colors.grey, // Lighter color for the status text
                  ),
                ),
              ],
            ),
          ),
          // Ellipsis menu
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle menu tap
            },
          ),
        ],
      ),
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  final String imageUrl; // URL or path for the profile image
  final String name; // User's name
  final String status; // User's status message

  const UserProfileWidget({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h), // Add some padding around the widget
      child: Row(
        children: [
          // Profile image
          CircleAvatar(
            radius: 24, // Control the size of the avatar
            backgroundImage: AssetImage(
                "assets/${imageUrl}"), // Display image from URL or local path
          ),
          const SizedBox(width: 12), // Space between the image and the text

          // Name and Status in a Column
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white, // Text color (adjust to match design)
                ),
              ),
              const SizedBox(height: 4), // Space between name and status
              Container(
                width: MediaQuery.of(context).size.width*0.79,

                child: Text(
                  overflow: TextOverflow.ellipsis,
                  status,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.grey, // Lighter color for the status text
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
