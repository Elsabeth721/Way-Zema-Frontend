import 'dart:async';
import 'dart:io';

class Calculator {
  void display() {
    print('hello this is simple calculator enjoy your worke');
    print('***********************CACULATER***********************');
  }

  double add(a, b) => a + b;
  double subtract(a, b) => a - b;
  double multiplay(a, b) => a * b;
  double divid(a, b) {
    try {
      return a / b;
// ignore: deprecated_member_use_from_same_package
    } on IntegerDivisionByZeroException {
      print('Cannot divide by zero');
      return 0.0;
    }
  }
}

Future<void> main() async {
  final calculators = Calculator();
  double? result;
  calculators.display();
  print('Enter first numbers?');
  final a = double.tryParse(stdin.readLineSync()!.trim());
  print('Enter second numbers?');
  final b = double.tryParse(stdin.readLineSync()!.trim());
  print('choose one operator from + - * / ');

  final operator = stdin.readLineSync()?.trim();
  if (a != null && b != null && operator != null) {
    switch (operator) {
      case '+':
        result = calculators.add(a, b);
        print('The sum is:');
        break;
      case '-':
        result = calculators.subtract(a, b);
        print('the diffience is');
        break;
      case '*':
        result = calculators.multiplay(a, b);
        print('The product is:');
        break;
      case '/':
        result = calculators.divid(a, b);
        print('theqoutiont is');
        break;
      default:
        print('INVALIDE OERTATOR');
        return;
    }
  } else {
    print('invalid input');
  }
  await Future.delayed(const Duration(seconds: 5));
  print('Result: $result');
}
