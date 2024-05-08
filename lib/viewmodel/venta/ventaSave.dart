import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class VentaSave{
  Future<List?> SaveDatosVentas(String fecha, String mesa, String usuario, String hora, String letras) async {
    var dato;
    var estado;
    List rpta = [];
    try {
      // final result = await InternetAddress.lookup('google.com');
      //if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "https://citadino.vlinesys.com/app/controlador/venta.registrar.php"),
          body: {"action": "save","txtfecha": fecha, "txtusuario":usuario, "cbomesa": mesa,"txthora": hora, "txtletras": letras});
      // if (mounted) {
      var extraerData = json.decode(response.body);
      estado = extraerData["estado"];
      dato = extraerData["datos"];
      //}

      var objeto = {
        "DATO":dato,
        "ESTADO": estado
      };
      rpta.add(objeto);

      return rpta;
      //Navigator.pop(context);
    } on SocketException catch (_) {
      print("error1");
    }
  }
}