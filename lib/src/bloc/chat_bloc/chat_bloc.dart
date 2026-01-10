import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:zetgram/src/model/chat_model/chat_mode.dart';
import 'package:zetgram/src/repository/repository.dart';

class ContactBlocChat {
  final RepositoryChat repositoryChat = RepositoryChat();

  final PublishSubject<List<ChatModel>> _chatSubject =
  PublishSubject<List<ChatModel>>();

  Stream<List<ChatModel>> get stream => _chatSubject.stream;

  Future<void> getAllChat() async {
    final data = await repositoryChat.getAllChat();
    _chatSubject.sink.add(data); // 🔥 MUHIM
  }

  void dispose() {
    _chatSubject.close(); // ✅ TO‘G‘RI
  }
}

final contactBlocChat = ContactBlocChat();
