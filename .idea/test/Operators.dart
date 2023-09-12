void useOperators() {
  //使用赋值运算符
  int value1 = 1;
  print("value1 : $value1");
  value1 = 2;
  print("value1 : $value1");

  // ??: => Assign value to b if b is null; otherwise, b stays the same
  int? value2 = null;
  value2 ??= 2;
  print("value2 : $value2");
  // value2 ??= 3; //这一句在执行的时候会出现警告，原因是value2已经进行了赋值且不为null，如果继续使用??=的话会体现相关警告并提示使用=运算符。
  value2 = 3;
  print("value2 : $value2");

  //使用条件表达式1
  bool isRun = true;
  // isRun = false;
  print("run value: ${isRun ? 1 : 2}");

  //使用条件表达式2
  int? value3 = null;
  // value3 = 3;
  print("value3: ${value3 ?? 2}");

  //使用级联运算符 (..)
  Person()
    ..setName("mike")
    ..setAge(12)
    ..printInfo()
    ..setAge(13)
    ..printInfo();

  //使用忌廉运算符 (?..)
  Person? person = null;
  // person = Person();
  person
    ?..setName("mike")
    ..setAge(12)
    ..printInfo()
    ..setAge(13)
    ..printInfo();
}

class Person {
  String? _name = null;
  int? _age = null;

  String setName(String name) => _name = name;

  int setAge(int age) => _age = age;

  void printInfo() {
    print("Person name: $_name age: $_age");
  }
}