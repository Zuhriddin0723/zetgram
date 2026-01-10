import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:zetgram/src/model/cometn_model/coment_model.dart';
import 'package:zetgram/src/model/post_model/post_model.dart';
import 'package:zetgram/src/repository/repository.dart';

class ContactBlocComment {
  final RepositoryComment repositoryComment = RepositoryComment();

  final PublishSubject<List<CommentModel>> _chatSubject =
  PublishSubject<List<CommentModel>>();

  Stream<List<CommentModel>> get stream => _chatSubject.stream;

  Future<void> getAllComment() async {
    final data = await repositoryComment.getAllComment();
    _chatSubject.sink.add(data);
  }

  void dispose() {
    _chatSubject.close(); // ✅ TO‘G‘RI
  }
}

final contactBlocComment = ContactBlocComment();
