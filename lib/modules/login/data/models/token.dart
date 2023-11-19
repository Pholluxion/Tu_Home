class Token {
  String accessToken;

  Token({required this.accessToken});

  factory Token.fromJson(Map<String, dynamic> json) =>
      Token(accessToken: json["accessToken"]);

  Map<String, dynamic> toJson() => {"accessToken": accessToken};
}
