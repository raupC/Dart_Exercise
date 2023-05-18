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
    
    int result;
  for (var i = 0; i < datas.length; i++) {
    switch (datas[i]) {
      case '+':
        print('+');
        if(stack.length < 2) throw Exception('Stack empty');
        if (stack.length >= 2 ) {
          result = stack[stack.length - 2] +
              stack[stack.length - 1];
          stack.removeAt(stack.length - 1);
          stack.removeAt(stack.length - 1);
          stack.add(result);
        } else {
          print('El stack no tiene suficiente datos');
        }
        break;
      case '-':
        print('-');
        if(stack.length < 2) throw Exception('Stack empty');
        if (stack.length >= 2) {
          result = stack[stack.length - 2] -
              stack[stack.length - 1];
          stack.removeAt(stack.length - 1);
          stack.removeAt(stack.length - 1);
          stack.add(result);
        } else {
          print('El stack no tiene suficiente datos');
        }
        break;
      case '/':
        print('/');
        if(stack.length < 2) throw Exception('Stack empty');
        if(stack[stack.length - 1] == 0) throw Exception('Division by zero');
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
        if(stack.length < 2) throw Exception('Stack empty');
        if (stack.length >= 2) {
          result = stack[stack.length - 2] *
              stack[stack.length - 1];
          stack.removeAt(stack.length - 1);
          stack.removeAt(stack.length - 1);
          stack.add(result);
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
        stack.add(int.parse(datas[i])); // añade el numero al stack
        print('Stack ${stack}');
        break;
    }
  }
  print('Stack ${stack}');
  }
}
void main(List<String> args) {
  // ignore: unused_local_variable
  Forth forth = new Forth();
  forth.evaluate('+');
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
