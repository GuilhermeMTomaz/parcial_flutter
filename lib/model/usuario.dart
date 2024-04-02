import '/model/lista.dart';
import 'item.dart';

class Usuario {
  final String nome;
  final String email;
  final String senha;
  final List<Lista> mainList;

  Usuario(this.nome, this.email, this.senha, this.mainList);
  static List<Usuario> addUser(String nome, String email, String senha) {
    List<Usuario> users = [];
    users.add(Usuario(nome, email, senha, []));
    return users;
  }

  static List<Usuario> gerarLista() {
    List<Usuario> lista = [];
    List<Lista> temp = [];
    List<Item> aaaaa = [];
    aaaaa.add(Item('item 1', '1 kg', false));
    aaaaa.add(Item('item 2', '2 pacotes', false));
    aaaaa.add(Item('item 3', '3 latas', false));
    temp.add(Lista('Lista 1', aaaaa, false));
    aaaaa.clear();
    aaaaa.add(Item('item 1', '3 kg', false));
    aaaaa.add(Item('item 2', '2 pacotes', false));
    aaaaa.add(Item('item 3', '1 latas', false));
    temp.add(Lista('Lista 2', aaaaa, false));
    lista.add(Usuario('Admin', 'admin', 'admin', temp));
    return lista;
  }
}
