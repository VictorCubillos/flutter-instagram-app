import 'package:postgres/postgres.dart';

class PostgreSQLConnectionWrapper {

  PostgreSQLConnection _connection;

  PostgreSQLConnectionWrapper({
    String host = "flutter-instagram.c2q8isndyq9z.us-east-2.rds.amazonaws.com",
    int port = 5432,
    String db = "flutter_instagram",
    String username = "postgres",
    String password = "hwTFmdrRj1x3DzUlNhwN",
  }) {
    _connection = new PostgreSQLConnection(host, port, db, username: username, password: password);
  }

  PostgreSQLConnection get connection {
    
    return _connection;    
  }

}