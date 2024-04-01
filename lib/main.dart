// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'view/cadastro_view.dart';
import 'view/login_view.dart';
import 'view/sobre_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

//
// MainApp
//
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Navegação',
        //
        // rota navegação
        //
        initialRoute: 'login',
        routes: {
          'login': (context) => (LoginView()),
          'cadastro': (context) => (CadastroView()),
          'sobre': (context) => (SobreView()),
        });
  }
}
