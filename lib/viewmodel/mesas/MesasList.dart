import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class MesasList{
  Future<List?> RecibirDatosMesas(String fecha) async {
    List montos = [];
    try {
      // final result = await InternetAddress.lookup('google.com');
      //if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "https://citadino.vlinesys.com/app/controlador/estado.mesa.php"),
          body: {"fecha": fecha});
      // if (mounted) {
      var extraerData = json.decode(response.body);
      montos = extraerData["datos"];
      //}

      return montos;
      //Navigator.pop(context);
    } on SocketException catch (_) {
      print("error1");
    }
  }
}