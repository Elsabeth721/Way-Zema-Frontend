//1.Write a dart program to create a class Laptop with properties [ id , name , ram ] and create 3 objects of it and print all details.

//2. Write a dart program to create a class Animal with properties [ id, name , color ].
//Create another class called Cat and extends it from Animal. Add new properties sound in String .
//Create an object of a Cat and print all details.

class Laptop {
  String? name;
  int? id;
  String? ram;
  Laptop(this.name, this.id, this.ram);
}

class Animal {
  int? id;
  String? name;
  String? color;
  Animal(this.id, this.name, this.color);
}

class Cat extends Animal {
  String? sound;
  Cat(id, name, color, sound) : super(id, name, color);
}

void main() {
  Laptop laptop1 = Laptop('hp', 1, '8g');
  Laptop laptop2 = Laptop('lenovo', 2, '8g');
  Laptop laptop3 = Laptop('dell', 3, '8g');
  print('${laptop1.name} ${laptop1.id} ${laptop1.ram}');
  print('${laptop2.name} ${laptop2.id} ${laptop2.ram}');
  print('${laptop3.name} ${laptop3.id} ${laptop3.ram}');
  Cat cat1 = Cat(1, 'catty', 'white', 'miaww');
  print('${cat1.name} ${cat1.id} ${cat1.sound} ${cat1.color}');
}
