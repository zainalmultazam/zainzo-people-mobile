import 'package:mysql1/mysql1.dart';

// Future main() async {
//   // Open a connection (testdb should already exist)
//   final conn = await MySqlConnection.connect(ConnectionSettings(
//       host: 'localhost',
//       port: 3306,
//       user: 'python',
//       db: 'mahasiswa',
//       password: 'KaliLinux'));

//   // Create a table
//   await conn.query(
//       'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');

//   // Insert some data
//   var result = await conn.query(
//       'insert into users (name, email, age) values (?, ?, ?)',
//       ['Bob', 'bob@bob.com', 25]);
//   print('Inserted row id=${result.insertId}');

//   // Query the database using a parameterized query
//   var results = await conn.query(
//       'select name, email, age from users where id = ?', [result.insertId]);
//   for (var row in results) {
//     print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
//   }

//   // Update some data
//   await conn.query('update users set age=? where name=?', [26, 'Bob']);

//   // Query again database using a parameterized query
//   var results2 = await conn.query(
//       'select name, email, age from users where id = ?', [result.insertId]);
//   for (var row in results2) {
//     print('Name: ${row[0]}, email: ${row[1]} age: ${row[2]}');
//   }

//   // Finally, close the connection
//   await conn.close();
// }

class MySql {
  static String host = 'localhost',
      username = 'python',
      password = 'KaliLinux',
      database = 'mahasiswa';

  static int port = 3306;

  MySql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host,
        port: port,
        db: database,
        password: password,
        user: username);

    return MySqlConnection.connect(settings);
  }
}
