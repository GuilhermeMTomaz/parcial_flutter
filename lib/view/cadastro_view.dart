// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/usuario.dart';

class CadastroView extends StatefulWidget {
  const CadastroView({super.key});

  @override
  State<CadastroView> createState() => _CadastroViewState();
}

class _CadastroViewState extends State<CadastroView> {
  var formKey = GlobalKey<FormState>();
  var status = false;

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();
  var txtValor3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final List<Usuario> users =
        ModalRoute.of(context)!.settings.arguments as List<Usuario>;

    bool Verify() {
      for (int i = 0; i < users.length; i++) {
        if (users[i].email == txtValor2.text) {
          return false;
        }
      }
      return true;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Icon(Icons.person_add,
                size: 100,
                color: Colors.black,
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Text(
                      'Nome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: txtValor1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe um nome';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Text(
                      'E-mail',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: txtValor2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe um e-mail';
                    }else if(!Verify()){
                      return 'E-mail já cadastrado';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: const [
                    Text(
                      'Senha',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: txtValor3,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe uma senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        if (Verify()) {
                          users.add(Usuario(
                            txtValor1.text, 
                            txtValor2.text, 
                            txtValor3.text, []
                            ));
                          Navigator.pushNamed(
                            context, 'login',
                            arguments: users
                          );
                        }
                        ;
                      });
                    } else {}
                  },
                  child: Text(
                    'Cadastrar',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
