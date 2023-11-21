import 'dart:convert';

class RegisterRequest {
  String name;
  String surname;
  String email;
  String password;
  String documentNumber;

  RegisterRequest({
    required this.name,
    required this.surname,
    required this.email,
    required this.password,
    required this.documentNumber,
  });

  RegisterRequest copyWith({
    String? name,
    String? surname,
    String? email,
    String? password,
    String? documentNumber,
  }) {
    return RegisterRequest(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      password: password ?? this.password,
      documentNumber: documentNumber ?? this.documentNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
      'documentNumber': documentNumber,
    };
  }

  factory RegisterRequest.fromMap(Map<String, dynamic> map) {
    return RegisterRequest(
      name: map['name'],
      surname: map['surname'],
      email: map['email'],
      password: map['password'],
      documentNumber: map['documentNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterRequest.fromJson(String source) =>
      RegisterRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RegisterRequest(name: $name, surname: $surname, email: $email, password: $password, documentNumber: $documentNumber)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterRequest &&
        other.name == name &&
        other.surname == surname &&
        other.email == email &&
        other.password == password &&
        other.documentNumber == documentNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        surname.hashCode ^
        email.hashCode ^
        password.hashCode ^
        documentNumber.hashCode;
  }
}
