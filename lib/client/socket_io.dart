import 'package:alibtisam/features/bottomNav/controller/chat_messages.dart';
import 'package:alibtisam/features/bottomNav/controller/chats_list.dart';
import 'package:alibtisam/features/bottomNav/controller/user.dart';
import 'package:alibtisam/features/bottomNav/model/chat_message.dart';
import 'package:alibtisam/core/localStorage/token_id.dart';
import 'package:alibtisam/core/services/api_urls.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketConnection {
  static final userController = Get.find<UserController>();
  static IO.Socket socket = IO.io(socket_base_url, <String, dynamic>{
    'transports': ['websocket'],
    'autoconnect': true,
    'reconnection': true,
  });
  static connectSocket() async {
    socket.connect();
    socket.emit('setup', await getUid());
    socket.onConnect((_) {
      print('connect');
    });
  }

  static getNewChat() {
    print("-----------> listening new chats");
    socket.on("newChat", (chat) {
      final chatsListController = Get.find<ChatsListController>();
      chatsListController.fetchChatsList();
    });
  }

  static joinChat(String groupId, Function scroll) {
    final chatMessagesController = Get.find<ChatMessagesController>();
    chatMessagesController.messages.clear();
    socket.emit("joinChat", {"groupId": groupId});
    socket.on("allMessages", (res) {
      chatMessagesController.messages.clear();
      for (var message in res) {
        chatMessagesController.addMessages(ChatMessages.fromMap(message));
      }
      scroll();
    });
  }

  static sendMessage({
    required String uid,
    required String message,
    required String groupId,
  }) {
    socket.emit("message", {
      "senderId": uid,
      "content": message,
      "groupId": groupId,
    });
  }

  static clearListeners() {
    socket.clearListeners();
    getNewChat();
  }

  static void listenMessages(Function scroll) {
    final chatMessagesController = Get.find<ChatMessagesController>();
    socket.on('messageUpdate', (res) {
      print('---------------> $res');
      chatMessagesController.addMessages(ChatMessages.fromMap(res));
      scroll();
    });
  }
}
