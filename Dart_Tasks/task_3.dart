import 'dart:io';
import 'dart:async';
class Calculator {
  void addition(num a, num b) {
    print(a + b);
  }

  void subtraction(num a, num b) {
    print(a - b);
  }

  void multiplication(num a, num b) {
    print(a * b);
  }

  void division(num a, num b) {
    try {
      print(a / b);
    } catch (err) {
      print(err);
    }
  }
}

void main() async{
  
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
        var addi = calc1.addition(a, b);
        Future.delayed(Duration(seconds: 5), () =>addi );
        break;
      }
    case '-':
      {
        print('$a - $b is equal to: ');
        var sub = calc1.subtraction(a, b);
        Future.delayed(Duration(seconds: 5), () => sub);
        break;
      }
    case '*':
      {
        print('$a * $b is equal to: ');
        var mult = calc1.multiplication(a, b);
        Future.delayed(Duration(seconds: 5), () => mult);
        break;
      }
    case '/':
      {
        print('$a / $b is equal to: ');
        var div = calc1.division(a, b);
        Future.delayed(Duration(seconds: 5), () => div);
        break;
      }
      default: {
        print('Invalid operation');
      }
  }
}
