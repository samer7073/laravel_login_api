class RegisterSuccess {
  final bool success;
  final String message;

  RegisterSuccess({
    required this.success,
    required this.message,
  });

  factory RegisterSuccess.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('success') && json.containsKey('message')) {
      // Extraire les valeurs du JSON
      bool success = json['success'];
      String message = json['message'];

      // Retourner une nouvelle instance de RegisterSuccess initialisée avec les valeurs extraites
      return RegisterSuccess(
        success: success,
        message: message,
      );
    } else {
      // Si des clés sont manquantes, lancer une exception
      throw FormatException('Failed to load user. Required keys are missing.');
    }
  }
}
