import 'dart:io';
import 'dart:typed_data';
import 'package:ai_app/constants/colors.dart';
import 'package:ai_app/custom_widget/custom_text.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AiChat extends StatefulWidget {
  const AiChat({super.key});

  @override
  State<AiChat> createState() => _AiChatState();
}

class _AiChatState extends State<AiChat> {
  bool isLoading = false;

  String formatDate(DateTime date) {
    final DateFormat dayFormat = DateFormat('EEE');
    final DateFormat dayMonthFormat = DateFormat('d MMM yyyy');
    return '${dayFormat.format(date).toLowerCase()}, ${dayMonthFormat.format(date)}';
  }

  final Gemini gemini = Gemini.instance;

  List<ChatMessage> messages = [];

  ChatUser currentUser = ChatUser(id: "0", firstName: "User");
  ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini",
    profileImage:
    "https://seeklogo.com/images/G/google-gemini-logo-A5787B2669-seeklogo.com.png",
  );

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    String text = _messageController.text;
    if (text.isEmpty) return;

    ChatMessage chatMessage = ChatMessage(
      user: currentUser,
      createdAt: DateTime.now(),
      text: text,
    );
    setState(() {
      messages.add(chatMessage);
      _messageController.clear();
      isLoading = true;
    });
    FocusScope.of(context).unfocus();
    try {
      gemini.streamGenerateContent(text).listen((event) {
        String response = event.content?.parts?.fold(
            "", (previous, current) => "$previous ${current.text}") ??
            "";
        ChatMessage message = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: response,
        );
        setState(() {
          messages.add(message);
          isLoading = false;
        });
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  void _sendMediaMessage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
            url: file.path,
            fileName: "",
            type: MediaType.image,
          )
        ],
      );
      _sendMessage();
    }
  }

  void _clearMessages() {
    setState(() {
      messages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.center,
                colors: [
                  Color(0xFF00EE26),
                  Color(0xFF8E8930),
                  Color(0xFFFF3939),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Text(
                  'Cloudy',
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 25, bottom: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/cloud.svg'),
                              SizedBox(width: 5.w),
                              Text(
                                '40°',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 32.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Text14(
                              text: 'Partly cloudy',
                              color: Theme.of(context).primaryColor,
                            ),
                            Text(
                              formatDate(DateTime.now()),
                              style: TextStyle(
                                color: Theme.of(context).shadowColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 40),
                        InkWell(
                          onTap: _clearMessages,
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    color: Theme.of(context).shadowColor,
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 325,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...messages.map((message) => _buildMessageBubble(message)),
                                if (isLoading)
                                  SpinKitThreeBounce(
                                    color: Theme.of(context).primaryColor,
                                    size: 30.0,
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.h,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(13.r),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).shadowColor,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _messageController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 7,
                            decoration: InputDecoration(
                              hintText: 'Ask anything...',
                              contentPadding: EdgeInsets.symmetric(horizontal: 15),
                              hintStyle: TextStyle(
                                color: Theme.of(context).shadowColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 14,
                          right: 15,
                          left: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/keyboard.svg',
                                color: Theme.of(context).primaryColor,
                              ),
                              InkWell(
                                onTap: _sendMediaMessage,
                                child: Icon(
                                  Icons.image,
                                  color: Theme.of(context).primaryColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 15,
                          child: InkWell(
                            onTap: _sendMessage,
                            child: SvgPicture.asset(
                              'assets/icons/send.svg',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Divider(
                    color: Theme.of(context).shadowColor,
                    thickness: 2,
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Text(
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy',
                          style: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          'Learn more',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          width: 120.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    bool isCurrentUser = message.user.id == currentUser.id;
    AlignmentGeometry alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Align(
            alignment: alignment,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(15.r),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            DateFormat.Hm().format(message.createdAt),
            style: TextStyle(
              color: Theme.of(context).shadowColor,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}

