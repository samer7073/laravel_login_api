import 'package:flutter_application_api_larvel/models/data.dart';

class LoginSuccess {
  final bool success;
  final String message;
  final DataReq data;

  LoginSuccess({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginSuccess.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('success') &&
        json.containsKey('message') &&
        json.containsKey('data')) {
      // Extraire les valeurs du JSON
      bool success = json['success'];
      String message = json['message'];
      DataReq data = DataReq.fromJson(json['data']);

      // Retourner une nouvelle instance de LoginSuccess initialisée avec les valeurs extraites
      return LoginSuccess(
        success: success,
        message: message,
        data: data,
      );
    } else {
      // Si des clés sont manquantes, lancer une exception
      throw FormatException('Failed to load user. Required keys are missing.');
    }
  }
}
