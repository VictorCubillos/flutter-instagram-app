import '../models/user.dart';

abstract class UserRepository {
  User add(User newUser);
  User update(User userToUpdate);
  bool remove(int userId);
  User find(int userId);
  List<User> findAll();
  List<User> findByFollower(int userId);
  List<User> findByLike(int likeId);
  List<User> findByComment(int commentId);
  List<User> findByPost(int postId);
  List<User> findFollowers();
}