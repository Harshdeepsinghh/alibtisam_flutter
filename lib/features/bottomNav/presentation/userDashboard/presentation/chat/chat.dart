import 'package:alibtisam_flutter/features/bottomNav/controller/chat_messages.dart';
import 'package:alibtisam_flutter/features/bottomNav/controller/user.dart';
import 'package:alibtisam_flutter/features/bottomNav/model/chat_message.dart';
import 'package:alibtisam_flutter/features/bottomNav/presentation/userDashboard/presentation/chat/chat_about.dart';
import 'package:alibtisam_flutter/helper/theme/app_colors.dart';
import 'package:alibtisam_flutter/helper/theme/controller/theme_controller.dart';
import 'package:alibtisam_flutter/helper/utils/custom_date_formatter.dart';
import 'package:alibtisam_flutter/client/socket_io.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  const ChatScreen({super.key, required this.chatId});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  final themeController = Get.find<ThemeController>();
  final userController = Get.find<UserController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    SocketConnection.joinChat(
        widget.chatId, userController.user!.id, _scrollToBottom);
    SocketConnection.listenMessages(_scrollToBottom);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(
          _scrollController.position.maxScrollExtent,
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String currDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Get.to(() => ChatAbout());
          },
          child: Text("Team name or Player name"),
        ),
      ),
      body: GetBuilder<ChatMessagesController>(
        init: ChatMessagesController(),
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      ...List.generate(controller.messages.length, (int index) {
                        ChatMessages message = controller.messages[index];
                        bool showDate = true;

                        if (index > 0) {
                          DateTime previousDate = DateTime.parse(
                              controller.messages[index - 1].updatedAt);
                          showDate = !_isSameDate(
                              DateTime.parse(message.updatedAt), previousDate);
                        }

                        return Column(
                          crossAxisAlignment:
                              message.senderId == userController.user!.id
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                          children: [
                            if (showDate)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Center(
                                  child: Text(
                                    customChatDateFormat(message.updatedAt),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            BubbleSpecialThree(
                              text: message.content,
                              color: message.senderId == userController.user!.id
                                  ? primaryColor()
                                  : kAppGreyColor(),
                              tail: true,
                              isSender:
                                  message.senderId == userController.user!.id,
                              textStyle: TextStyle(
                                color: message.senderId ==
                                            userController.user!.id ||
                                        themeController.isDarkTheme()
                                    ? Colors.white
                                    : null,
                                    //flutter run --enable-impeller
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child:
                                  Text(customChatTimeFormat(message.updatedAt)),
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: messageController,
                              maxLength: null,
                              onFieldSubmitted: (value) {
                                if (messageController.text.trim() != '') {
                                  SocketConnection.sendMessage(
                                    uid: userController.user!.id,
                                    message: messageController.text.trim(),
                                    chatId: widget.chatId,
                                  );
                                }
                                _scrollToBottom();
                                messageController.clear();
                              },
                              decoration: InputDecoration(
                                hintText: 'Type your message...',
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (messageController.text.trim() != '') {
                                SocketConnection.sendMessage(
                                  uid: userController.user!.id,
                                  message: messageController.text.trim(),
                                  chatId: widget.chatId,
                                );
                              }
                              _scrollToBottom();
                              messageController.clear();
                            },
                            icon: Icon(
                              Icons.send,
                              color: primaryColor(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}