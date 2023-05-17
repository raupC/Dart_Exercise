class Forth {
  late List<int> stack; // datas
  late List<String> definitions; // funcitons

  Forth() {
    this.stack = [];
    this.definitions = [];
  }
  // Put your code here
  void evaluate(String stack) {}
}

void main() {
  /**
   * Crear el objero stack
   */
  // ignore: unused_local_variable
  Forth forth = new Forth();
  // ignore: unused_local_variable
  //List<String> stack = [];
  // ignore: unused_local_variable
  String input = '1 2 +'; // input'datas of stack
  // ignore: unused_local_variable
  List<String> datas = input.split(' ');

  print(datas);

  /**
   * comprobar cada dato
   */
  int result;
  for (var i = datas.length; i > 0; i--) {
    switch (datas[i - 1]) {
      case '+':
        print('+');

        if (forth.stack.length >= 2) {
          result = forth.stack[forth.stack.length - 2] +
              forth.stack[forth.stack.length - 1];
          forth.stack.removeAt(forth.stack.length - 1);
          forth.stack.removeAt(forth.stack.length - 1);
          forth.stack.add(result);
        } else {
          print('El stack no tiene suficiente datos');
        }
        break;
      case '-':
        print('-');

        if (forth.stack.length >= 2) {
          result = forth.stack[forth.stack.length - 2] -
              forth.stack[forth.stack.length - 1];
          forth.stack.removeAt(forth.stack.length - 1);
          forth.stack.removeAt(forth.stack.length - 1);
          forth.stack.add(result);
        } else {
          print('El stack no tiene suficiente datos');
        }
        break;
      case '/':
        print('/');

        if (forth.stack.length >= 2) {
          result = int.fromEnvironment((forth.stack[forth.stack.length - 2] /
                  forth.stack[forth.stack.length - 1])
              .toString());
          forth.stack.removeAt(forth.stack.length - 1);
          forth.stack.removeAt(forth.stack.length - 1);
        }
        break;
      case '*':
        print('*');

        if (forth.stack.length >= 2) {
          result = forth.stack[forth.stack.length - 2] *
              forth.stack[forth.stack.length - 1];
          forth.stack.removeAt(forth.stack.length - 1);
          forth.stack.removeAt(forth.stack.length - 1);
          forth.stack.add(result);
        } else {
          print('El stack no tiene suficiente datos');
        }
        break;
      case 'dut':
        print('dut');
        break;
      case 'over':
        print('over');
        break;
      case 'swap':
        print('swap');
        break;
      case 'drop':
        print('drop');
        break;
      default:
        forth.stack.add(int.parse(datas[i - 1])); // añade el numero al stack
        print('Stack ${forth.stack}');
        break;
    }
  }
}
