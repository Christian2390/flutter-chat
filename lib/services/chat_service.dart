import 'package:chat/global/environment.dart';
import 'package:chat/models/mensajes_response.dart';
import 'package:chat/models/usuario.dart';
import 'package:chat/services/auth_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;

  Future<List<Mensaje>> getChat(String usuarioId) async {
    final url = Uri.parse('${Environment.apiUrl}/mensajes/$usuarioId');
    final resp = await http.get(
      url,
      headers: {
        'Content-type': 'application/json',
        'x-token': await AuthService.getToken(),
      },
    );

    final mensajeResp = mensajesResponseFromJson(resp.body);

    return mensajeResp.mensajes;
  }
}
