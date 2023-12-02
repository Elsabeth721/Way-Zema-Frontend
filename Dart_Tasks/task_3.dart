import 'dart:io';

class Calculator {
  void addition(int a, int b) {
    print(a + b);
  }

  void subtraction(int a, int b) {
    print(a - b);
  }

  void multiplication(int a, int b) {
    print(a * b);
  }

  void division(int a, int b) {
    try {
      print(a / b);
    } catch (err) {
      print(err);
    }
  }
}

void main() {
  print('Enter the first number');
  int? a = int.parse(stdin.readLineSync()!);
  print('Enter the second number:');
  int? b = int.parse(stdin.readLineSync()!);
  String? operation;
  Calculator calc1 = Calculator();
  print('Enter the operation you want to do: ');
  operation = stdin.readLineSync();
  switch (operation) {
    case '+':
      {
        var add = calc1.addition(a, b);
        Future.delayed(Duration(seconds: 5), () => add);
        break;
      }
    case '-':
      {
        var sub = calc1.subtraction(a, b);
        Future.delayed(Duration(seconds: 5), () => sub);
        break;
      }
    case '*':
      {
        var mult = calc1.multiplication(a, b);
        Future.delayed(Duration(seconds: 5), () => mult);
        break;
      }
    case '/':
      {
        var div = calc1.division(a, b);
        Future.delayed(Duration(seconds: 5), () => div);
        break;
      }
  }
}
