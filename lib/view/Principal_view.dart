// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../model/item.dart';
import '../model/lista.dart';
import '../model/usuario.dart';
import 'lista_view.dart';

class PrincipalView extends StatefulWidget {
  final List<Usuario> users;
  final int index;
  const PrincipalView(this.users, this.index, {super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  var txtNome = TextEditingController();
  bool flag = false;
  @override
  void initState() {
    // lista = Lista.gerarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem vindo ${widget.users[widget.index].nome}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: widget.users[widget.index].mainList.length,
          itemBuilder: (context, indexLista) {
            return Card(
              color: Colors.black,
              child: ListTile(
                title: Text(widget.users[widget.index].mainList[indexLista].nome,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                hoverColor: Colors.blue.shade900,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaView(widget.users, widget.index, indexLista),
                    ),
                  );
                },
                leading: Checkbox(
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  value: widget.users[widget.index].mainList[indexLista].concluido,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.users[widget.index].mainList[indexLista].concluido = value;
                    });
                  },
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,                        
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext bc) {
                            return Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text("Editar lista"),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: 'nome'),
                                    controller: TextEditingController(text: widget.users[widget.index].mainList[indexLista].nome),
                                    onChanged: (text) {
                                      widget.users[widget.index].mainList[indexLista].nome = text;
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          minimumSize: Size(100, 40),
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'Cancelar',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          minimumSize: Size(100, 40),
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                          ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => PrincipalView(widget.users, widget.index),
                                            ),
                                          );
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.users[widget.index].mainList.removeAt(indexLista);
                        });
                      },
                    ),
                  ],
                ),
              ),
              
            );
          },
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,  
        onPressed: () {
            
          showModalBottomSheet(
            context: context,
            builder: (BuildContext bc) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Informe um nome para a lista'),
                    TextField(
                      decoration: InputDecoration(labelText: 'Nome'),
                      controller: txtNome,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                         OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(width: 10),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            minimumSize: Size(100, 40),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            List<Item> temp = [];
                            widget.users[widget.index].mainList.add(Lista(txtNome.text, temp, false));
                            txtNome.clear();
                            Navigator.pop(context);                              Navigator.pop(context);
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrincipalView(widget.users, widget.index),
                              ),
                            );                                
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add,
        color: Colors.white,),
      ),
    );
  }
}