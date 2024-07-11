import '../database/database_helper.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  String _hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<bool> signUp(String name, String email, String password) async {
    try {
      final hashedPassword = _hashPassword(password);
      final user = {
        'name': name,
        'email': email,
        'password': hashedPassword,
      };
      final id = await _dbHelper.insertUser(user);
      return id > 0;
    } catch (e) {
      print('Error during sign up: $e');
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final user = await _dbHelper.getUser(email);
      if (user != null) {
        final hashedPassword = _hashPassword(password);
        return user['password'] == hashedPassword;
      }
      return false;
    } catch (e) {
      print('Error during login: $e');
      return false;
    }
  }

  Future<bool> isFirstLogin(String email) async {
    final user = await _dbHelper.getUser(email);
    // Supposons que nous avons un champ 'profile_completed' dans la table users
    return user != null && user['profile_completed'] == 0;
  }
}
