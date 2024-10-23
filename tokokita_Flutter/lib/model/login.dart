class Login {
  String? token;
  int? id;
  String? message;

  Login({this.message ,this.token, this.id,});

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
        id: obj['id'],
        message: obj['message'],
        token: obj['token'],
       );
  }
}
