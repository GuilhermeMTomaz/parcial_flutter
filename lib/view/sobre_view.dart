// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SobreView extends StatefulWidget {
  const SobreView({super.key});

  @override
  State<SobreView> createState() => _SobreViewState();
}
class _SobreViewState extends State<SobreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre o desenvolvedor'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 280,
                      child: Image.asset(
                        'lib/images/img2.jpeg',
                        fit: BoxFit.fill,
                        ),
                    ),
                    SizedBox(height: 10,),
                    Text('O objetivo deste projeto é facilitar a'),
                    Text('organização e criação de listas de'),
                    Text('compras'),
                    SizedBox(height: 40,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Feito por: Guilherme Mantovani Tomaz'),
                        Text('Código: 835711'),
                      ],
                    ),
                    SizedBox(height: 70,),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(200, 60),
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'login');
                      },
                      child: Text('Voltar'),
                    ),
                  ],
                ),
              ],
            )
          ),
        )
      ),
    );
  }
}
