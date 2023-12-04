import 'dart:io';
import 'dart:async';

class Calculator {
  Future<void> addition(num a, num b) async {
    await Future.delayed(Duration(seconds: 5), () => print(a + b));
  }

  Future<void> subtraction(num a, num b) async {
    await Future.delayed(Duration(seconds: 5), () => print(a - b));
  }

  Future<void> multiplication(num a, num b) async {
    await Future.delayed(Duration(seconds: 5), () => print(a * b));
  }

  Future<void> division(num a, num b) async {
    try {
      await Future.delayed(Duration(seconds: 5), () => print(a / b));
    } catch (err) {
      await Future.delayed(Duration(seconds: 5), () => print(err));
    }
  }
}

Future<void> main() async {
  print('----------------------------------------');
  print('----------------------------------------');
  print('---------------CALCULATOR---------------');
  print('----------------------------------------');
  print('----------------------------------------');
  print('Enter the first number: ');
  num? a = num.parse(stdin.readLineSync()!);
  print('Enter the second number: ');
  num? b = num.parse(stdin.readLineSync()!);
  String? operation;
  Calculator calc1 = Calculator();
  print('Enter the operation you want to do: ');
  operation = stdin.readLineSync();
  switch (operation) {
    case '+':
      {
        print('$a + $b is equal to: ');
        await calc1.addition(a, b);
        break;
      }
    case '-':
      {
        print('$a - $b is equal to: ');
        await calc1.subtraction(a, b);
        break;
      }
    case '*':
      {
        print('$a * $b is equal to: ');
        await calc1.multiplication(a, b);
        break;
      }
    case '/':
      {
        print('$a / $b is equal to: ');
        await calc1.division(a, b);
        break;
      }
    default:
      {
        print('Invalid operation');
      }
  }
}
