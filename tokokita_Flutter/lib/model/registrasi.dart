class Registrasi {
  int? code;
  bool? status;
  Map<String, dynamic>? user; 

  Registrasi({this.code, this.status, this.user});

  factory Registrasi.fromJson(Map<String, dynamic> obj) {
    return Registrasi(
      code: obj['code'],
      status: obj['status'],
      user: obj['user'], 
    );
  }
}
