import 'package:web_socket_chat/domain/models/message_model.dart';

abstract class ChatState {}

class ChatInitialState extends ChatState {
  List<MessageModel> msgs;

  ChatInitialState({required this.msgs});
}

class MessageSentState extends ChatState {}

class MessageReceivedState extends ChatState {
  final List<MessageModel> messages;

  MessageReceivedState({required this.messages});
}

class ChatErrorState extends ChatState{
  final String errorMessage;

  ChatErrorState({required this.errorMessage});
}

class ChatLoadingState extends ChatState{}
