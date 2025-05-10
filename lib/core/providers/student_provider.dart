import 'package:flutter/material.dart';
import 'package:vjnucleus/models/student.dart';
import 'package:dio/dio.dart';
import 'package:vjnucleus/utility/constants/constant.dart';

class StudentProvider extends ChangeNotifier {
  Future<LoginResponse?> loginUser(String email, String password) async {
  try {
    final Dio dio = Dio();

    final response = await dio.post(
      '$MAIN_URL/api/auth/signin', // Replace with your actual login endpoint
      data: {
        'email': email,
        'password': password,
      },
      options: Options(
        headers: {'Content-Type': 'application/json'},
      ),
    );

    if (response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    } else {
      print('Login failed: ${response.statusCode} ${response.statusMessage}');
      return null;
    }
  } on DioException catch (e) {
    print('Dio error: ${e.message}');
    if (e.response != null) {
      print('Error data: ${e.response?.data}');
    }
    return null;
  } catch (e) {
    print('Unexpected error: $e');
    return null;
  }
}
}
