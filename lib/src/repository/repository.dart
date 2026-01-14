import 'package:zetgram/src/model/chat_model/chat_mode.dart';
import 'package:zetgram/src/model/cometn_model/coment_model.dart';
import 'package:zetgram/src/model/post_model/post_model.dart';

import '../database/database_helper.dart';

class RepositoryChat {
  final DataBaseHelper dataBaseHelper = DataBaseHelper();

  Future<int> saveChat(ChatModel data) => dataBaseHelper.saveChat(data);

  Future<int> deleteChat(int id) async => await dataBaseHelper.deleteChat(id);

  Future<List<ChatModel>> getAllChat() => dataBaseHelper.getChat();
}

class RepositoryPost {
  DataBaseHelper dataBaseHelper = DataBaseHelper();
  Future<int> savePost(PostModel data) => dataBaseHelper.savePost(data);
  // Future<int> deletePost(int id) => dataBaseHelper.deletePost(id);
  Future<List<PostModel>> getAllPost() => dataBaseHelper.getPost();

  Future<int> updateLike(int postId, int newLike) =>
      dataBaseHelper.updatePostLike(postId, newLike);
}


class RepositoryComment {
  DataBaseHelper dataBaseHelper = DataBaseHelper();

  Future<int> saveComment(CommentModel data) => dataBaseHelper.saveComment(data);
  // Future<int> deleteComment(int id) => dataBaseHelper.deleteComment(id);
  Future<List<CommentModel>> getAllComment() => dataBaseHelper.getComment();
}
