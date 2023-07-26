void testNumbers() {
  //使用整形，在Dart中是没有长整形的概念，Dart的整形就是64位数。
  var y = 2;
  int x = 1;
  int hex = 0xDEADBEEF;
  print("y: $y");
  print("x: $x");
  print("hex: $hex");

  //使用浮点型，在Dart中是没有单浮点数的概念，Dart的浮点数就是64位数。
  var a = 1.1;
  double b = 1.2;
  double hexF = 1.42e5;
  print("a: $a");
  print("b: $b");
  print("hexF: $hexF");

  //整形与浮点数之间的转换
  int testInt = 1;
  double testDouble = 1.5;
  int value1 = testDouble.toInt();
  double value2 = testInt.toDouble();
  var value3 = testInt + testDouble; //从结果看出，在Dart中整形与浮点数一起进行运算过后，元算的过程中会将整形先转化成浮点数，运算之后的结果是浮点数。
  print("value1: $value1");
  print("value2: $value2");
  print("value3 check: ${value3 is int}");
  print("value3 check: ${value3 is double}");

  //num类型的使用，num在dart中比较特殊，它既可以表示为int，也可以表示为double
  num numX = 1;
  print("numX-int: $numX");
  numX += 2.5;
  print("numX-double: $numX");
}