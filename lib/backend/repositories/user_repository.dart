import 'package:flutter_instagram_app/backend/models/user.dart';

abstract class UserRepository{
User add(User newUser);
User update(User userToUpdate);
bool remove(int USERtId);
List<User> finalAll;
List<User> findByFollower(int userId);
List<User> findByLike(int likeId);
List<User> findByComment(int commentId);
List<User> findByPost(int postId);
List<User> findFollowers();
}