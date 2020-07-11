class Comment {
  int id;
  int userId;
  DateTime commentDate;
  String content;
  int postId;


  static Comment fromNewComment(int id, Comment otherComment) {
    var comment = new Comment();
    comment.userId = otherComment.userId;
    comment.commentDate = otherComment.commentDate;
    comment.content = otherComment.content;
    comment.postId = otherComment.postId;
    comment.id = id;
    return comment;
  }
  
}