import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_chat/data/chat_repo/chat_repo.dart';
import 'package:web_socket_chat/data/chat_service/chat_service.dart';
import 'package:web_socket_chat/data/endpoints.dart';
import 'package:web_socket_chat/data/notif_service/notif_service.dart';
import 'package:web_socket_chat/domain/bloc/chat_bloc/chat_bloc.dart';
import 'package:web_socket_chat/presentation/home_view.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (ctx) => ChatBloc(repo: ChatRepo(service: WebSocketService(Endpoints.baseUrl))),
          child: HomeView()
      ),
    );
  }
}
