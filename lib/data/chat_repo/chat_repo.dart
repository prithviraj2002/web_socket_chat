import 'dart:io';

import 'package:web_socket_chat/data/chat_service/chat_service.dart';
import 'package:web_socket_chat/domain/models/message_model.dart';

class ChatRepo{
  WebSocketService service;

  ChatRepo({required this.service});

  void connect() => service.connect();

  void close() => service.close();

  void sendMessage(MessageModel msg) => service.sendMessage(msg);

  void receiveMessage(dynamic Function(MessageModel) onReceived) => service.listenForMessages(onReceived);

  Future<List<MessageModel>> getMsgs() => service.getMsgs();
}