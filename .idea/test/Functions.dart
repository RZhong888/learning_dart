void useFunctions() {
  //函数的定义及其使用
  print(_checkFun1(1));
  print(_checkFun11(0));
  print(_checkFun2(1));
  print(_checkFun22(0));

  //函数内命名参数的声明与使用（注意只有声明为命名参数的方式才可以这样子使用）
  _checkFun3();//在运行时会对没有被赋予默认值的可空类型命令参数赋予null值
  _checkFun3(num1: 1, num2: 2);
  // _checkFun3(1, 2);//会报错！因为该函数使用了命名参数的形式使用函数参数。

  //命名参数的实验
  _checkFun4(num1: 1);//命名参数是允许设置默认值的

  //函数参数预设默认值
  _checkFun5(num1: 2, num2: 4);

  //强制命名参数必须要赋值
  _checkFun6(num1: 2);
  _checkFun6(num1: 2, num2: 3);

  //可选参数的使用（可空版）
  _checkFun7(1, 2, 3);
  _checkFun8(2, 8);
  _checkFun8(2, 8, 1);

  //使用函数对象 - 1
  var list123 = const[1, 2, 3];
  void Function(int) fun1 = printFunction;
  list123.forEach(fun1);
  testFunction(2, fun1);

  //使用闭包语法的函数
  final addFunc = makeAdder(2);
  print("addby: ${addFunc(3)}");

  //测试函数的默认返回值
  print("foo return type: ${foo()}");
}

//函数体只有一个表达式的写法
bool _checkFun1(int num) => num == 0;
//上面的写法与下面的写法是等效的
bool _checkFun11(int num) {
  return num == 0;
}

//函数体只有一个表达式的写法：比如条件表达式（但是如果使用if-else语句，是不允许使用箭头写法）
bool _checkFun2(int num) => num == 0 ? true : false;
//上面的写法与下面的写法是等效的
bool _checkFun22(int num) {
  return num == 0 ? true : false;
}

//声明附带命名参数的函数
void _checkFun3({int? num1, int? num2}) {
  if(num1 == null || num2 == null) {
    print("函数参数其中一个为null");
  } else {
    print("num1 >= num2: ${num1 >= num2}");
  }
}

//命名参数的实验
void _checkFun4({int? num1, int? num2 = 4}) {
  if(num1 == null || num2 == null) {
    print("函数参数其中一个为null");
  } else {
    print("num1 >= num2: ${num1 >= num2}");
  }
}


//命名参数预先设置默认值（注意：非命名参数无法使用默认值）
void _checkFun5({int num1 = 1, int num2 = 2}) {
  print("num1 + num2 = ${num1 + num2}");
}

//强制命名参数必须要赋值（需要注意的是强制赋值的参数不允许使用默认值）
void _checkFun6({required int num1, int num2 = 2}) {
  print("num1 + num2 = ${num1 + num2}");
}

//可选参数的使用（可空版）
void _checkFun7(int num1, int num2, [int? num3]) {
  if(num3 != null) {
    print("_checkFun7 - num1 + num2 + num3 = ${num1 + num2 + num3}");
  } else {
    print("_checkFun7 - num1 + num2 = ${num1 + num2}");
  }
}

//可选参数关于默认值的使用
void _checkFun8(int num1, int num2, [int num3 = 8]) {
  print("_checkFun8 - num1 + num2 + num3 = ${num1 + num2 + num3}");
}

//函数对象的使用
void printFunction(int element) {
  print(element);
}

//定义函数对象作为函数参数进行使用
void testFunction(int num1, void Function(int) func) {
  func(num1 + 1);
}

//定义语法闭包的函数
//闭包既一个函数对象，即使函数对象的调用在它原始作用域之外，依然能够访问在它语法作用域内的变量。函数可以封闭定义到它的作用域内的变量。
Function makeAdder(int addBy) => (int i) => addBy + i;

//测试函数默认返回值，在Dart中，所有的函数都有返回值。没有显式返回语句的函数最后一行默认为执行 return null;
foo() {}