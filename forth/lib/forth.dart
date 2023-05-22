class Forth {
  late List<int> stack; // datas
  late List<String> definitions; // funcitons
  static RegExp regexDefin = RegExp(r'^:\s(.+\s+)+;$');
  static RegExp regexNum = RegExp(r'\d+');

  Forth() {
    this.stack = [];
    this.definitions = [];
  }
  // Put your code here
  void evaluate(String input) {
    // ignore: unused_local_variable
    List<String> datas = input.split(' ');

    if (regexDefin.hasMatch(input)) {
      // valida la expresion y añade la definicion
      //compramos que no existe y si existe la sobre escribimos
      List<String> def = input.split(' ');
      bool exist = true;

      for (var i = 0; i < definitions.length; i++) {
        List<String> listDef = definitions[i].split(' ');
        if (listDef.contains(def[1])) {
          definitions[i] = input;
          exist = false;
        }
      }

      /**
       * si no ha encontrado definicion, no existe y la crea
       */
      if (exist) {
        definitions.add(input);
      }
    } else {
      checkList(datas);
    }
  }

  void checkList(List<String> datas) {
    int result;
    for (var i = 0; i < datas.length; i++) {
      switch (datas[i]) {
        case '+':
          print('+');
          if (stack.length < 2) throw Exception('Stack empty');
          if (stack.length >= 2) {
            result = stack[stack.length - 2] + stack[stack.length - 1];
            stack.removeAt(stack.length - 1);
            stack.removeAt(stack.length - 1);
            stack.add(result);
          } else {
            print('El stack no tiene suficiente datos');
          }
          break;
        case '-':
          print('-');
          if (stack.length < 2) throw Exception('Stack empty');
          if (stack.length >= 2) {
            result = stack[stack.length - 2] - stack[stack.length - 1];
            stack.removeAt(stack.length - 1);
            stack.removeAt(stack.length - 1);
            stack.add(result);
          } else {
            print('El stack no tiene suficiente datos');
          }
          break;
        case '/':
          print('/');
          if (stack.length < 2) throw Exception('Stack empty');
          if (stack[stack.length - 1] == 0) throw Exception('Division by zero');
          if (stack.length >= 2) {
            result = stack[stack.length - 2] ~/ stack[stack.length - 1];
            print('resul: $result');
            stack.removeAt(stack.length - 1);
            stack.removeAt(stack.length - 1);
            stack.add(result);
          }
          break;
        case '*':
          print('*');
          if (stack.length < 2) throw Exception('Stack empty');
          if (stack.length >= 2) {
            result = stack[stack.length - 2] * stack[stack.length - 1];
            stack.removeAt(stack.length - 1);
            stack.removeAt(stack.length - 1);
            stack.add(result);
          } else {
            print('El stack no tiene suficiente datos');
          }
          break;
        default:
          if (regexNum.hasMatch(datas[i])) {
            stack.add(int.parse(datas[i])); // añade el numero al stack
            print('Stack ${stack}');
          } else {
            //busca en las definiciones

            if (!definitions.isEmpty) {
              for (var j = 0; j < definitions.length; j++) {
                List<String> def = definitions[j].toString().split(' ');

                print('Definition found: ${def.toString()}');
                /**
                 * si encuentra una funcion en la definiciones ejecuta esa y no las por defecto
                 */
                if (def.contains(datas[i]) &&
                    def.indexWhere((element) => element == datas[i]) == 1) {
                  print(def.indexWhere((element) => element == datas[i]) == 1);
                  List<String> defCopy =
                      def.skip(2).take(def.length - 3).toList();
                  // evaluar todos los datos excepto :, nombre_funcion, ;
                  print('Defcopy: $defCopy');
                  /**
                   * re call to itself the mehoth or evaluate the datas of the definition
                   */
                  checkList(defCopy);
                } else {
                  print('"${datas[i]}" this is not in the definitions!');
                  //buscamos si es una funcion definida por el evaluador y si es sobre escribimos

                  // for (var j = 0; j < definitions.length; j++) {
                  //   List<String> listDef = definitions[j].split(' ');
                  //   if (listDef.contains(def[1])) {
                  //     print('La definicion esta sobre escrita');
                  //     noExist = false;
                  //   }
                  // }
                  opSystem(datas[i]);
                }
              }
            }

            //comprobamos si es una funcion del sistema si no existe en la lista de definiciones
            if (definitions.isEmpty) {
              opSystem(datas[i]);
            }
          }
          break;
      }
    }
    print('Stack ${stack}');
  }

  void opSystem(String data) {
    print(
        'No esta sobre escrita voy a comprobar si es una funcion del sistema!');
    switch (data) {
      case 'dup':
        print('dup');
        if (stack.isEmpty) throw Exception('Stack empty');
        int copyNumber = stack.last;
        stack.add(copyNumber);
        break;
      case 'over':
        print('over');
        if (stack.isEmpty) throw Exception('Stack empty');
        if (stack.length < 2) throw Exception('Stack empty');
        int copySecNumer = stack[stack.length - 2];
        stack.add(copySecNumer);
        break;
      case 'swap':
        print('swap');
        if (stack.length < 2) throw Exception('Stack empty');
        int firstNum = stack.last;
        int secNum = stack[stack.length - 2];
        print(firstNum);
        print(secNum);
        stack[stack.length - 2] = firstNum;
        stack.last = secNum;
        break;
      case 'drop':
        print('drop');
        if (stack.isEmpty) throw Exception('Stack empty');
        stack.removeAt(stack.length - 1);

        break;
      default:
    }
  }
}

void main(List<String> args) {
  // ignore: unused_local_variable
  Forth forth = new Forth();

  //forth.evaluate(': foo 12 12 12 ;');
  forth.evaluate(': foo 4 ;');

  print(forth.definitions);
  forth.evaluate('foo');
 
  print(forth.stack);
}
