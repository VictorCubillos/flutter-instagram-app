import 'package:flutter_instagram_app/backend/models/post.dart';
import 'package:flutter_instagram_app/backend/repositories/post_repository.dart';

class PostPostgreSQLService implements PostRepository {
  @override
  Post add(Post newPost) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Post find(int postId) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  List<Post> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  List<Post> findByCommentId(int commentId) {
    // TODO: implement findByCommentId
    throw UnimplementedError();
  }

  @override
  List<Post> findByLikeId(int likeId) {
    // TODO: implement findByLikeId
    throw UnimplementedError();
  }

  @override
  List<Post> findByUserId(int userId) {
    // TODO: implement findByUserId
    throw UnimplementedError();
  }

  @override
  bool remove(int postId) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Post update(Post postToUpdate) {
    // TODO: implement update
    throw UnimplementedError();
  }

}