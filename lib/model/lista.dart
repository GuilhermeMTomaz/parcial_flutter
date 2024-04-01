import 'item.dart';

class Lista {
  String nome;
  List<Item> lista;
  bool? concluido = false;
  Lista(this.nome, this.lista, this.concluido); 
}