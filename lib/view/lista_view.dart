// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:parcial/model/item.dart';

import '../model/usuario.dart';

class ListaView extends StatefulWidget {
  final List<Usuario> users;
  final int index;
  final int indexLista;
  const ListaView(this.users, this.index, this.indexLista, {super.key});

  @override
  State<ListaView> createState() => _ListaViewState();
}

class _ListaViewState extends State<ListaView> {
  var txtNome = TextEditingController();
  var txtqtd = TextEditingController();
  @override
  void initState() {
    // lista = Lista.gerarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /* final List supra = ModalRoute.of(context)!.settings.arguments as List;

    final List<Usuario> users = supra[0] as List<Usuario>;
    index = supra[1];*/
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.users[widget.index].mainList[widget.indexLista].nome),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        //
        // ListView
        //
        child: ListView.builder(
          itemCount: widget.users[widget.index].mainList[widget.indexLista].lista.length,
          itemBuilder: (context, indexItem) {
            return Card(
              color: Colors.black,
              child: ListTile(
                leading: Checkbox(
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  value: widget.users[widget.index].mainList[widget.indexLista].lista[indexItem].comprado,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.users[widget.index].mainList[widget.indexLista].lista[indexItem].comprado = value;
                    });
                  },
                ),
                title: Text(widget.users[widget.index].mainList[widget.indexLista].lista[indexItem].nome,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(widget.users[widget.index].mainList[widget.indexLista].lista[indexItem].quantidade,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                hoverColor: Colors.blue.shade900,
                onTap: () {
  
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit,
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
                                  Text("Editar item"),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: 'Nome'),
                                    controller: TextEditingController(text: widget.users[widget.index].mainList[widget.indexLista].lista[indexItem].nome),
                                    onChanged: (text) {
                                      widget.users[widget.index].mainList[widget.indexLista].lista[indexItem].nome = text;
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  TextFormField(
                                    decoration: InputDecoration(labelText: 'Quantidade'),
                                    controller: TextEditingController(text: widget.users[widget.index].mainList[widget.indexLista].lista[indexItem].quantidade),
                                    onChanged: (text) {
                                      widget.users[widget.index].mainList[widget.indexLista].lista[indexItem].quantidade = text;
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
                                              builder: (context) => ListaView(widget.users, widget.index, widget.indexLista),
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
                      icon: Icon(Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.users[widget.index].mainList[widget.indexLista].lista.removeAt(widget.indexLista);
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
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text('Informe um nome para a lista'),
                    TextField(
                      decoration: InputDecoration(labelText: 'Nome'),
                      controller: txtNome,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(labelText: 'Quantidade'),
                      controller: txtqtd,
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
                            widget.users[widget.index].mainList[widget.indexLista].lista.add(Item(txtNome.text, txtqtd.text, false));
                            txtNome.clear();
                            txtqtd.clear();
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ListaView(widget.users, widget.index, widget.indexLista),
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
          color: Colors.white,
        ),
      ),
    );
  }
}
