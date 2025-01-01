import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:web_socket_chat/data/endpoints.dart';
import 'package:web_socket_chat/domain/models/message_model.dart';
import 'package:http/http.dart' as http;

class WebSocketService {
  final IO.Socket socket;

  WebSocketService(String url)
      : socket = IO.io(url, {
    'transports': ['websocket'],
    'autoConnect': false,
  });

  void connect() {
    socket.connect();
  }

  void sendMessage(MessageModel msg) {
    final message = msg.toJson();
    socket.emit('sendMessage', message);
  }

  void listenForMessages(Function(MessageModel) onMessageReceived) {
    socket.on('receiveMessage', (data) {
      MessageModel msg = MessageModel(sender: data['sender'], content: data['content']);
      onMessageReceived(msg);
    });
  }

  Future<List<MessageModel>> getMsgs() async{
    List<MessageModel> msgs = [];
    try{

      final response = await http.get(Uri.parse(Endpoints.baseUrl+Endpoints.chatData));

      final msgData = jsonDecode(response.body);

      for(Map<String, dynamic> msg in msgData){
        msgs.add(MessageModel.fromJson(msg));
      }

      return msgs;

    } catch(e){
      debugPrint("An exception occurred while getting msgs: $e");
      throw Exception(e);
    }
  }

  void close() {
    socket.disconnect();
  }
}
