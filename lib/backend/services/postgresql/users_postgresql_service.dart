import '../../models/user.dart';
import '../../repositories/user_repository.dart';

class UserPostgreSQLService implements UserRepository {
  
  

  @override
  User add(User newUser) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  User find(int userId) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  List<User> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  List<User> findByComment(int commentId) {
    // TODO: implement findByComment
    throw UnimplementedError();
  }

  @override
  List<User> findByFollower(int userId) {
    // TODO: implement findByFollower
    throw UnimplementedError();
  }

  @override
  List<User> findByLike(int likeId) {
    // TODO: implement findByLike
    throw UnimplementedError();
  }

  @override
  List<User> findByPost(int postId) {
    // TODO: implement findByPost
    throw UnimplementedError();
  }

  @override
  List<User> findFollowers() {
    // TODO: implement findFollowers
    throw UnimplementedError();
  }

  @override
  bool remove(int userId) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  User update(User userToUpdate) {
    // TODO: implement update
    throw UnimplementedError();
  }

}