class Forth {
  late List<int> stack; // datas
  late List<String> definitions; // funcitons

  Forth() {
    this.stack = [];
    this.definitions = [];
  }
  // Put your code here
  void evaluate(String input) {
    // ignore: unused_local_variable
    List<String> datas = input.split(' ');
    RegExp regexDefin = RegExp(r'^:\s(\w+\s+)+;$');
    RegExp regexNum = RegExp(r'\d+');

    if (regexDefin.hasMatch(input)) {
      // valida la expresion y añade la definicion
      definitions.add(input);
      
    } else {
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
            if (stack[stack.length - 1] == 0)
              throw Exception('Division by zero');
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
            if (regexNum.hasMatch(datas[i])) {
              stack.add(int.parse(datas[i])); // añade el numero al stack
              print('Stack ${stack}');
            } else {
              print('definition did not found!');
              if (definitions.isEmpty) {
              } else {
                for (var i = 0; i < definitions.length; i++) {
                  List<String> def = definitions[i].toString().split(' ');

                  print('Definition found: ${def.toString()}');

                }
              }
            }
            break;
        }
      }
    }

    print('Stack ${stack}');
  }
}

void main(List<String> args) {
  // ignore: unused_local_variable
  Forth forth = new Forth();
  forth.evaluate(': suma 2 2 2 ;');
  forth.evaluate('suma');
}
// void main() {
//   /**
//    * Crear el objero stack
//    */
//   // ignore: unused_local_variable
//   Forth forth = new Forth();
//   // ignore: unused_local_variable
//   //List<String> stack = [];
//   // ignore: unused_local_variable
//   String input = '2 2 / 2 3 +'; // input'datas of stack
//   // ignore: unused_local_variable
//   List<String> datas = input.split(' ');

//   print(datas);

//   /**
//    * comprobar cada dato
//    */
//   int result;
//   for (var i = 0; i < datas.length; i++) {
//     switch (datas[i]) {
//       case '+':
//         print('+');

//         if (forth.stack.length >= 2) {
//           result = forth.stack[forth.stack.length - 2] +
//               forth.stack[forth.stack.length - 1];
//           forth.stack.removeAt(forth.stack.length - 1);
//           forth.stack.removeAt(forth.stack.length - 1);
//           forth.stack.add(result);
//         } else {
//           print('El stack no tiene suficiente datos');
//         }
//         break;
//       case '-':
//         print('-');

//         if (forth.stack.length >= 2) {
//           result = forth.stack[forth.stack.length - 2] -
//               forth.stack[forth.stack.length - 1];
//           forth.stack.removeAt(forth.stack.length - 1);
//           forth.stack.removeAt(forth.stack.length - 1);
//           forth.stack.add(result);
//         } else {
//           print('El stack no tiene suficiente datos');
//         }
//         break;
//       case '/':
//         print('/');

//         if (forth.stack.length >= 2) {
//           result = forth.stack[forth.stack.length - 2] ~/ forth.stack[forth.stack.length - 1];
//               print('resul: $result');
//           forth.stack.removeAt(forth.stack.length - 1);
//           forth.stack.removeAt(forth.stack.length - 1);
//           forth.stack.add(result);
//         }
//         break;
//       case '*':
//         print('*');

//         if (forth.stack.length >= 2) {
//           result = forth.stack[forth.stack.length - 2] *
//               forth.stack[forth.stack.length - 1];
//           forth.stack.removeAt(forth.stack.length - 1);
//           forth.stack.removeAt(forth.stack.length - 1);
//           forth.stack.add(result);
//         } else {
//           print('El stack no tiene suficiente datos');
//         }
//         break;
//       case 'dut':
//         print('dut');
//         break;
//       case 'over':
//         print('over');
//         break;
//       case 'swap':
//         print('swap');
//         break;
//       case 'drop':
//         print('drop');
//         break;
//       default:
//         forth.stack.add(int.parse(datas[i])); // añade el numero al stack
//         print('Stack ${forth.stack}');
//         break;
//     }
//   }
//   print('Stack ${forth.stack}');
// }
