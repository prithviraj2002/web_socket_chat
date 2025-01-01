import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_chat/domain/bloc/chat_bloc/chat_bloc.dart';
import 'package:web_socket_chat/domain/bloc/chat_bloc/chat_events.dart';
import 'package:web_socket_chat/domain/bloc/chat_bloc/chat_states.dart';
import 'package:web_socket_chat/domain/models/message_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController msgController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    msgController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chatBloc = context.read<ChatBloc>();
    chatBloc.add(GetChat());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Chat App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<ChatBloc, ChatState>(builder: (ctx, state) {
        if (state is ChatLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ChatErrorState) {
          return const Center(child: Text("Something went wrong"));
        } else if (state is ChatInitialState) {
          return Column(
            children: [
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        return BubbleNormal(
                          color: Colors.blue,
                          textStyle: TextStyle(color: Colors.white),
                          text: state.msgs[index].content,
                          isSender: state.msgs[index].sender == "User1"
                              ? true
                              : false,
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 12,
                        );
                      },
                      itemCount: state.msgs.length)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: msgController,
                        decoration: InputDecoration(
                            hintText: 'Send a text',
                            border: OutlineInputBorder()),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        final message = msgController.text;
                        if (message.isNotEmpty) {
                          MessageModel msg =
                              MessageModel(sender: "User1", content: message);
                          chatBloc.add(SendMessageEvent(msg: msg));
                          msgController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Container();
        }
      }, listener: (ctx, state) {
        if (state is ChatErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Something went wrong!")));
        }
      }),
    );
  }
}
