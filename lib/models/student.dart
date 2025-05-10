class LoginResponse {
  final int statusCode;
  final String status;
  final String message;
  final Data data;

  LoginResponse({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      statusCode: json['statusCode'],
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}

class Data {
  final String token;
  final User user;

  Data({
    required this.token,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user.toJson(),
      };
}

class User {
  final List<dynamic> seenBy;
  final String id;
  final String name;
  final String email;
  final String password;
  final String role;
  final List<dynamic> studySessions;
  final List<dynamic> subjects;
  final List<dynamic> mentors;
  final List<dynamic> tests;
  final int v;
  final String imageUrl;

  User({
    required this.seenBy,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.studySessions,
    required this.subjects,
    required this.mentors,
    required this.tests,
    required this.v,
    required this.imageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      seenBy: json['seenBy'] ?? [],
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      studySessions: json['studySessions'] ?? [],
      subjects: json['subjects'] ?? [],
      mentors: json['mentors'] ?? [],
      tests: json['tests'] ?? [],
      v: json['__v'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() => {
        'seenBy': seenBy,
        '_id': id,
        'name': name,
        'email': email,
        'password': password,
        'role': role,
        'studySessions': studySessions,
        'subjects': subjects,
        'mentors': mentors,
        'tests': tests,
        '__v': v,
        'image_url': imageUrl,
      };
}
