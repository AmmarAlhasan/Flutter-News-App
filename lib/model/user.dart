class FileOperationHistory {
  final int id;
  final String fileName;
  final int userId;
  final String operation;
  final DateTime date;
  final User user;

  FileOperationHistory({
    required this.id,
    required this.fileName,
    required this.userId,
    required this.operation,
    required this.date,
    required this.user,
  });

  factory FileOperationHistory.fromJson(Map<String, dynamic> json) {
    return FileOperationHistory(
      id: json['id'],
      fileName: json['file_name'],
      userId: json['user_id'],
      operation: json['operation'],
      date: DateTime.parse(json['date']),
      user: User.fromJson(json['user']),
    );
  }
}

class FileOperationsHistory {
  final List<FileOperationHistory> operationList;

  FileOperationsHistory({required this.operationList});

  factory FileOperationsHistory.fromJson(Map<String, dynamic> jsonData) {
    List<FileOperationHistory> fileOperationsHistory =
        List<FileOperationHistory>.from(jsonData['history']
            .map((history) => FileOperationHistory.fromJson(history)));
    return FileOperationsHistory(operationList: fileOperationsHistory);
  }
}

class User {
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;

  User({
    this.id,
    this.createdAt,
    this.updatedAt,
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      userName: json['username'],
      email: json['email'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      password: '',
      confirmPassword: '',
    );
  }
}

class Users {
  final List<dynamic> userList;

  Users({required this.userList});

  factory Users.fromJson(Map<String, dynamic> jsonData) {
    List<User> users =
        List<User>.from(jsonData['users'].map((user) => User.fromJson(user)));

    return Users(userList: users);
  }
}
