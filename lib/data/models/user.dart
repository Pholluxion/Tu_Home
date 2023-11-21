class UserRequest {
  final String name;
  final String surname;
  final String email;
  final String password;
  final String documentNumber;
  final int role;
  final int documentType;

  UserRequest({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.documentNumber,
    required this.role,
    required this.documentType,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'documentNumber': documentNumber,
      'role': role,
      'documentType': documentType,
    };
  }
}

class UserResponse {
  final int id;
  final String name;
  final String surname;
  final String email;
  final String documentNumber;
  final int role;
  final int documentType;

  UserResponse({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.documentNumber,
    required this.role,
    required this.documentType,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      documentNumber: json['documentNumber'],
      role: json['role'],
      documentType: json['documentType'],
    );
  }
}
