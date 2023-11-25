void main(){
  List<int> numbers=[1,8,3,3,4,45,5,69,10,39,91,10];
  
  //1. Find the maximum number in the list.
  int findMaximum(List<int> numbers){
    int max=numbers[0];
    for(int i=1; i<numbers.length; i++){
      if(max<numbers[i]){
        max=numbers[i];
      }
    }
    return max;
  }
  
  //2. Find the minimum number in the list.
  int findMinimum(List<int>numbers){
    int min=numbers[0];
    for(int i=1; i<numbers.length; i++){
      if(min>numbers[i]){
        min=numbers[i];
      }
    }
    return min;
  }
  
  //3. Calculate the sum of all numbers in the list.
  int calculateSum(List<int>numbers){
    int total=0;
    for(int i=0;i<numbers.length; i++){
      total+=numbers[i];
    }
    return total;
  }
  
  //4. Calculate the average of all numbers in the list.
  double calculateAverage(List<int>numbers){
    int total=calculateSum(numbers);
    int totalNum=numbers.length;
    double average=total/totalNum;
    return average;
  }
  
  //Printing the results
  print("Maximum of the list is: "+ findMaximum(numbers).toString());
  print("Minimum of the list is: "+ findMinimum(numbers).toString());
  print("Sum of the list is: "+ calculateSum(numbers).toString());
  print("Average of the list is: "+ calculateAverage(numbers).toString());
 
}

