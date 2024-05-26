import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class VentaDetailDelete{
  Future<int?> DeleteDetailDatosVentas(String id, String item, String codigo, String subtotal, String ganancia) async {
    var dato;
    try {
      // final result = await InternetAddress.lookup('google.com');
      //if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "https://citadino.vlinesys.com/app/controlador/venta.detalle.eliminar.php"),
          body: {"id": id,"item": item,"codigo": codigo, "subtotal": subtotal, "ganancia": ganancia});
      // if (mounted) {
      var extraerData = json.decode(response.body);
      dato = extraerData["estado"];
      //}

      return dato;
      //Navigator.pop(context);
    } on SocketException catch (_) {
      print("error1");
    }
  }
}