
import './postgresql_connection_wrapper.dart';
import '../../models/comment.dart';
import '../../repositories/comment_repository.dart';

class CommentPostgreSQLService implements CommentRepository {

  // Attributes
  PostgreSQLConnectionWrapper _connectionWrapper;

  // Constructor
  CommentPostgreSQLService(PostgreSQLConnectionWrapper this._connectionWrapper);

  @override
  Future<Comment> add(Comment newComment) async {
    if(newComment.commentDate == null || newComment.content == null || newComment.postId == null || newComment.userId == null) {
      throw new Exception("This comment contains null information on it");
    }

    var result = await _connectionWrapper.connection.query("SELECT posts.id, users.id FROM posts, users WHERE posts.id = ${newComment.postId} AND users.id = ${newComment.userId}");
    if(result.first.elementAt(0) == null || result.first.elementAt(1) == null) {
      throw new Exception("User or post does not exists");
    }

    await _connectionWrapper.connection.query("INSERT INTO comments (user_id, comment_date, content, post_id) VALUES (@userId, @commentDate, @content, @postId)", substitutionValues: {
      "userId" : newComment.userId,
      "commentDate" : newComment.commentDate,
      "content" : newComment.content,
      "postId" : newComment.postId
    });

    result = await _connectionWrapper.connection.query("SELECT id FROM comments WHERE user_id = @userId AND comment_date = @commentDate, content = @content, post_id = @postId", substitutionValues: {
      "userId" : newComment.userId,
      "commentDate" : newComment.commentDate,
      "content" : newComment.content,
      "postId" : newComment.postId
    });    

    int newId = result.first.elementAt(0);
    return Comment.fromNewComment(newId, newComment);
  }

  @override
  Future<Comment> find(int commentId) async {    

    var result = await _connectionWrapper.connection.query("SELECT user_id, comment_date, content, post_id FROM comments WHERE user_id = $commentId");
    var comment = new Comment();
    comment.id = commentId;
    comment.userId = result.first.elementAt(0);
    comment.commentDate = result.first.elementAt(1);
    comment.content = result.first.elementAt(2);
    comment.postId = result.first.elementAt(3);

    return comment;
  }

  @override
  Future<List<Comment>> findAll() async {
    
    List<Comment> comments = [];
    var rows = await _connectionWrapper.connection.query("SELECT id, user_id, comment_date, content, post_id FROM comments");
    
    for(var row in rows) {
      var comment = new Comment();
      comment.id = row.elementAt(0);
      comment.userId = row.elementAt(1);
      comment.commentDate = row.elementAt(2);
      comment.content = row.elementAt(3);
      comment.postId = row.elementAt(4);
      comments.add(comment);
    }

    return comments;
  }

  @override
  Future<List<Comment>> findByPostId(int postId) async {
    List<Comment> comments = [];
    var rows = await _connectionWrapper.connection.query("SELECT id, user_id, comment_date, content FROM comments WHERE post_id = $postId");

    for(var row in rows) {
      var comment = new Comment();
      comment.id = row.elementAt(0);
      comment.userId = row.elementAt(1);
      comment.commentDate = row.elementAt(2);
      comment.content = row.elementAt(3);
      comment.postId = postId;
      comments.add(comment);
    }

    return comments;
  }

  @override
  Future<void> remove(int commentId) async {    
    await _connectionWrapper.connection.query("DELETE FROM comments WHERE id = $commentId");
    await _connectionWrapper.connection.query("DELETE FROM comments_likes WHERE comment_id = $commentId");
  }

  @override
  Future<Comment> update(Comment commentToUpdate) async {
    if(commentToUpdate.id != null || commentToUpdate.commentDate == null || commentToUpdate.content == null || commentToUpdate.postId == null || commentToUpdate.userId == null) {
      throw new Exception("This comment contains null information on it");
    }

    var result = await _connectionWrapper.connection.query("SELECT posts.id, users.id FROM posts, users WHERE posts.id = ${commentToUpdate.postId} AND users.id = ${commentToUpdate.userId}");
    if(result.first.elementAt(0) == null || result.first.elementAt(1) == null) {
      throw new Exception("User or post does not exists");
    }

    await _connectionWrapper.connection.query("UPDATE comments SET user_id = @userId, comment_date = @commentDate, content = @content, post_id = @postId)", substitutionValues: {
      "userId" : commentToUpdate.userId,
      "commentDate" : commentToUpdate.commentDate,
      "content" : commentToUpdate.content,
      "postId" : commentToUpdate.postId
    });
  }
}