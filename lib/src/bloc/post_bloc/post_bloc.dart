import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:zetgram/src/model/chat_model/chat_mode.dart';
import 'package:zetgram/src/model/post_model/post_model.dart';
import 'package:zetgram/src/repository/repository.dart';

class ContactBlocPost {
  final RepositoryPost repositoryPost = RepositoryPost();

  final PublishSubject<List<PostModel>> _chatSubject =
  PublishSubject<List<PostModel>>();

  Stream<List<PostModel>> get stream => _chatSubject.stream;

  Future<void> getAllPost() async {
    final data = await repositoryPost.getAllPost();
    _chatSubject.sink.add(data); // 🔥 MUHIM
  }

  void dispose() {
    _chatSubject.close(); // ✅ TO‘G‘RI
  }
}

final contactBlocPost = ContactBlocPost();
