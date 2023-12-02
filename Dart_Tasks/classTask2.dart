//1. Write a program to print current time after 5 seconds using Future.delayed()

void main (){
  print("The time is: ");
  getTime();
}
void getTime()async{
  try{
    String date = await currentTime();
    print(date);
  }
  catch(error){
    print('Error $error');
  }
}


Future<String> currentTime(){
   var datenow=DateTime.now();
   var datenowString=datenow.toString();
  return Future.delayed(Duration(seconds: 5), ()=>datenowString);
}