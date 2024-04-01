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
    aaaaa.add(Item('item', '1', false));
    temp.add(Lista('admin', aaaaa, false));
    lista.add(Usuario('admin', 'a', 'a', temp));
    return lista;
  }
}
