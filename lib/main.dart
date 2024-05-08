import 'dart:io';

import 'package:citadino/view/caja/cajaPedidos.dart';
import 'package:citadino/view/components/ComplexDrawerPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HttpOverrides.global = MyHttpOverrides();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Citadino',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home:  ComplexDrawerPage(menu: [{"alias":"0", "descripcion": "CAJA", "estado": "1", "icono":"https://firebasestorage.googleapis.com/v0/b/gcp-movil.appspot.com/o/LOGO%20ACP_SOBRE%20VERDE%20Y%20BLANCO%202021-10%20(1).png?alt=media&token=68dca214-c9b6-41aa-9c15-27aa473511b0"
      }], selectDrawerItem2: 0,),
    );
  }
}