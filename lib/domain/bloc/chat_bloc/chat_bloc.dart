import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_chat/data/chat_repo/chat_repo.dart';
import 'package:web_socket_chat/domain/bloc/chat_bloc/chat_events.dart';
import 'package:web_socket_chat/domain/bloc/chat_bloc/chat_states.dart';
import 'package:web_socket_chat/domain/models/message_model.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepo repo;
  List<MessageModel> messages = [];

  ChatBloc({required this.repo}) : super(ChatInitialState(msgs: [])) {
    repo.connect();

    on<GetChat>((event, emit) async {
      emit(ChatLoadingState());

      try {
        List<MessageModel> msgs = await repo.getMsgs();
        messages = msgs;
        emit(ChatInitialState(msgs: messages));
      } catch (e) {
        emit(ChatErrorState(errorMessage: e.toString()));
      }
    });

    on<SendMessageEvent>((event, emit) {
      repo.sendMessage(event.msg);
      // messages.add(event.msg);
      emit(ChatInitialState(msgs: messages));
    });

    repo.receiveMessage((MessageModel msg) {
      add(ReceiveMessageEvent(message: msg)); // Dispatch the ReceiveMessageEvent
    });

    on<ReceiveMessageEvent>((event, emit) {
      messages.add(event.message);
      emit(ChatInitialState(msgs: List.from(messages)));
    });
  }

  @override
  Future<void> close() {
    repo.close();
    return super.close();
  }
}

