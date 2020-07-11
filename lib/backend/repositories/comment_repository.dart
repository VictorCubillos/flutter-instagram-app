import '../models/comment.dart';

abstract class CommentRepository {
  Future<Comment> add(Comment newComment);
  Future<Comment> update(Comment commentToUpdate);
  Future<void> remove(int commentId);
  Future<Comment> find(int commentId);
  Future<List<Comment>> findAll();
  Future<List<Comment>> findByPostId(int postId);  
}