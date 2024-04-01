// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/usuario.dart';
import 'Principal_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int Verify() {
    for (int i = 0; i < users.length; i++) {
      if (users[i].email == txtValor1.text &&
          users[i].senha == txtValor2.text) {
        return i;
      }
    }
    return -1;
  }

  int index = 0;
  var formKey = GlobalKey<FormState>();
  var status = false;

  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();

  List<Usuario> users = [];

  @override
  void initState() {
    users = Usuario.gerarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      users = ModalRoute.of(context)!.settings.arguments as List<Usuario>;
    }
      
    txtValor1.clear();
    txtValor2.clear();

    bool isEmailRegistered(String email) {
      return users.any((user) => user.email == email);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('List-app'),
        //desativa botao volta
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                //
                //imagem
                //
                Icon(Icons.login,
                  size: 100,
                  color: Colors.black,
                  ),

                SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      'Login',
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

                  //
                  // Validação
                  //
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe um usuario vallido';
                    } else if (!isEmailRegistered(txtValor1.text)) {
                      return 'Informe um usuario valido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Text(
                      'Senha',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: txtValor2,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),

                  //
                  // Validação
                  //
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe uma senha valida';
                    } else if (!isEmailRegistered(txtValor1.text)) {
                      return 'Informe um usuario valido';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Ainda não tem login? ',
                    ),
                    TextButton(
                      style: (TextButton.styleFrom(foregroundColor: Colors.blue.shade900)),
                      onPressed: () {
                        //
                        // Executar o processo de VALIDAÇÃO
                        //
                        //Validação com sucesso
                        setState(() {
                          Navigator.pushNamed(context, 'cadastro',
                              arguments: users);
                        });
                      },
                      child: Text(
                        'Cadastre-se',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    //
                    // Executar o processo de VALIDAÇÃO
                    //
                    if (formKey.currentState!.validate()) {
                      //Validação com sucesso
                      setState(() {
                        if ((index = Verify()) != -1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PrincipalView(users, index),
                            ),
                          );

                          /*Navigator.pushNamed(context, 'principal',
                              arguments: {users, index});*/
                        }
                      });
                    } else {
                      //Erro na Validação
                    }
                  },
                  child: Text(
                    'Entrar',
                  ),
                ),
                SizedBox(height: 10,),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(200, 60),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    //
                    // Executar o processo de VALIDAÇÃO
                    //
                    Navigator.pushNamed(context, 'sobre',);
                  },
                  child: Text(
                    'Sobre',
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
