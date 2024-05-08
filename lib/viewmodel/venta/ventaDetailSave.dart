import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../constants.dart';

class VentaDetailSave{
  Future<int?> SaveDetailDatosVentas(String combos, String products, String sucursals, String cantidads, String precios, String subtotals, ganancias, detalles, totales, gananciatotal, id) async {
    var dato;
    try {
      // final result = await InternetAddress.lookup('google.com');
      //if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      var response = await http.post(
          Uri.parse(
              "https://citadino.vlinesys.com/app/controlador/venta.agregar.detalle.php"),
          body: {"combos": combos, "products":products, "sucursals": sucursals,"cantidads": cantidads, "precios": precios, "subtotals": subtotals, "ganancias": ganancias, "detalles": detalles, "totales": totales, "gananciatotal": gananciatotal, "id": id});
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