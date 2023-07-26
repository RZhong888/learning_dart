void useVariables() {
  //使用变量
  var name = 'Bob';
  print("name: $name");
  name = "James";
  print("name: $name");
  int value = 1;
  print("int value: $value");

  //初始化以及可空类型的变量拥有一个默认的初始化值null
  int? default1;
  print("default1: $default1");

  //常量的使用
  final String finalValue = "123";
  print("finalValue: $finalValue");
  // finalValue = "234";
  print("finalValue: $finalValue");

  //const与final的区别
  final List<int> list1 = [12, 13, 14];
  const List<int> list2 = [12, 13, 14];
  print("list1: $list1");
  print("list2: $list2");
  list1[0] = 15; //可以编译通过并使用，const所修饰的常量处理引用指定的地址不能被修改外，内部的子引用所指定的地址是可以改变的。
  // list2[0] = 15; //会报错！const所修饰的常量处理引用指定的地址s不能被修改外，内部的子引用所指定的地址是可以改变的。
  print("list1: $list1");
  print("list2: $list2");
  final list3 = [];
  list3.add("one");
  list3.add("two");
  list3.add("three");
  print("list3: $list3");

  //延迟赋值
  late int lateValue;
  // print("lateValue: $lateValue"); //会报错！由于延迟加载的变量为进行赋值，直接使用会报错。
  lateValue = 11;
  print("lateValue: $lateValue");
  late int lateValue2 = getLateValue();
  print("lateValue2: $lateValue2"); //需要注意的是，lateValue2是在被使用的时候才会进行初始化，也就是说getLateValue()这个函数是在这语句才执行!

  //小实验
  final List<String> testList = ["1", "2", "3"]; //需要注意的是，如果这里的testList是使用const进行修饰的话，则无法通过copyList对集合的内容进行修改。
  List<String> copyList = testList;
  copyList[0] = "abd";
  print("copyList: $copyList");
  print("testList: $testList");
}

int getLateValue() => 10;