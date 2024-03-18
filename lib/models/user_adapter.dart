import 'package:hive/hive.dart';

part 'user_adapter.g.dart';

@HiveType(typeId: 3)
class User {
  User(
      {required this.username,
      required this.email,
      required this.dob,
      required this.password});

  @HiveField(0)
  String username;

  @HiveField(1)
  String email;

  @HiveField(2)
  String dob;

  @HiveField(3)
  String password;
}
