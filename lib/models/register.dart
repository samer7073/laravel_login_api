// ignore_for_file: non_constant_identifier_names

class Register {
  final String name;
  final String email;
  final String password;
  final String c_password;
  Register(
      {required this.name,
      required this.email,
      required this.password,
      required this.c_password});
/*
  factory Register.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'name': String name,
        'email': String email,
        'password': String password,
        'c_password': String c_password,
      } =>
        Register(
            name: name,
            email: email,
            password: password,
            c_password: c_password),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
  */
}
