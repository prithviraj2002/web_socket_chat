import 'package:web_socket_chat/domain/models/message_model.dart';

abstract class ChatEvent {}

class GetChat extends ChatEvent{}

class SendMessageEvent extends ChatEvent {
  MessageModel msg;

  SendMessageEvent({required this.msg});
}

class ReceiveMessageEvent extends ChatEvent {
  final MessageModel message;

  ReceiveMessageEvent({required this.message});
}
