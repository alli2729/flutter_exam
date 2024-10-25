class RegisterDto {
  final String name;
  final String password;

  RegisterDto({required this.name, required this.password});

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
      };
}
