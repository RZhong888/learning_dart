import 'dart:convert';

class Person {
  static final SEX_NONE = 0;
  static final SEX_MAN = 1;
  static final SEX_WOMAN = 2;

  var name = "null";
  var age = 0;

  //这里会报错，因为在Dart里面是允许重名的方式重载构造函数
  // Person(this.name) {
  //   print("person name: $name age: $age");
  // }

  Person(this.name, this.age) {
    print("person name: $name age: $age");
  }

  //以命名构造函数的方式构建多个构建函数
  Person.fromJson(String json) {
    var jsonObj = jsonDecode(json);
    name = jsonObj['name'];
    age = jsonObj['age'];
    print("person name: $name age: $age");
  }

  //在Dart中，我们可以在构造函数执行前进行列表初始化的操作
  Person.perInit(): name = "perInit" {
    age = 11;
    print("person name: $name age: $age");
  }

  //构造函数的重定向，需要注意的是构造函数的重定向是不能具备函数体的。
  Person.redirect(String name): this(name, 18);
}

class Man extends Person {
  var sex = Person.SEX_NONE;

  Man.fromJson(String json) : super.fromJson(json) {
    sex = Person.SEX_MAN;
    print("person sex: $sex");
    print("person name: ${super.name}");
  }
}

class Woman extends Person {
  var sex = Person.SEX_NONE;

  Woman.fromJson(String json) : super.fromJson(json) {
    sex = Person.SEX_WOMAN;
    print("person sex: $sex");
  }
}

//常量构造构造函数的声明，他的使用场景是如果需要一个类生成的对象是固定不变的（内存地址不变），就可以使用常量构造函数，使用的时候需要将该类内部的变量变成常量
class Test {
  final num x, y;
  const Test(this.x, this.y);
}

//在Dart中有一点和Kotlin很不一样，因为Kotlin是否为Null的变量类型限制比较大，但是在Dart却允许这种特殊的使用方式，声明的类型为非Null却可能存在Null值的情况。
class Test2 {
  num x = 1; // 声明示例变量 x，初始值为 Null。但是在最新版本额Dart中引入了与Kotlin一样的特性就是，非空变量在初始化的时候必须赋值
  num y = 2; // 与 Kotlin 一样，所有的变量都会隐式的实现了Getter和Setter方法，常量则隐式的实现了Setter方法。
  num z = 0; // 声明示例变量 z，初始值为 0 。
}

//工厂构造函数的使用。工厂构造函数的使用场景为工厂模式的构造函数版本，该构造函数并不总是创建这个累的一个新实例，而是返回一个从cache中的实例，或者它的子类
// class Logger {
//   final String name;
//   bool mute = false;
//
//   // 从命名的 _ 可以知，
//   // _cache 是私有属性。
//   static final Map<String, Logger> _cache =
//   <String, Logger>{};
//
//   factory Logger(String name) {
//     if (_cache.containsKey(name)) {
//       return _cache[name];
//     } else {
//       final logger = Logger._internal(name);
//       _cache[name] = logger;
//       return logger;
//     }
//   }
//
//   Logger._internal(this.name);
//
//   void log(String msg) {
//     if (!mute) print(msg);
//   }
// }

//Getter 和 Setter 函数的使用。 使用 get 和 set 关键字实现 Getter 和 Setter ，能够为实例创建额外的属性。
class Rect {
  num left, top, width, height;

  Rect(this.left, this.top, this.width, this.height);

  //定义right、bottom两个属性并修改它的默认get/set函数
  num get right => left + width;
  set right(num value) => width = value - left;

  num get bottom => top + height;
  set bottom(num value) => height = value - top;
}

//抽象类的定义与使用，需要注意的是在Dart中，只有抽象类才可以定义抽象方法
abstract class Doer {
  void doSomething();
}

abstract class DoerTwo {
  void doSome() {
    print("Do Some!");
  }

  void doSomething();
}

//抽象类的集成
class EffectiveDoer extends DoerTwo {
  void doSomething() {
    print("Do Something!");
  }
}

void useClazz() {
  //构造函数的定义及其使用

  //这里会报错，因为在Dart里面是允许重名的方式重载构造函数
  // var p0 = Person("rzhong");
  // print(p0.toString());

  var p1 = Person("rzhong", 32);
  print(p1.toString());

  var p2 = Person.fromJson("""{"name":"John Wake", "age":33}""");
  print(p2.toString());

  //常量类，在Dart中以const修饰的类对象，在编译器中会以编译时常量来存储所以两个相同声明的类对象会被认为是同一个对象（同一个内存地址）
  var p3 = const Test(31, 32);
  var p4 = const Test(31, 32);
  print("p3 == p4 ? result: ${identical(p3, p3)}");

  //与Kotlin一样，同样可以对Null Object使用?.进行类操作的Null检测。
  // Person? p5 = null;
  Person? p5 = Person("Test", 100);
  print(p5.toString());

  //获取对象类型。在Dart中，可以使用对象的runtimeType属性返回的Type对象来判断当前对象的类型。
  print("p3 typed: ${p3.runtimeType}");
  print("p5 typed: ${p5.runtimeType}"); //如果p5是赋值为Null，则该类型为Null。

  //类内变量的使用
  var t2 = Test2();
  print("1. t2 x: ${t2.x}");
  t2.x = 10;
  print("2. t2 x: ${t2.x}");

  //使用类的集成并且类的内部调用父类非默认构造函数
  var m1 = Man.fromJson("""{"name":"Test Man", "age":21}""");
  var w1 = Woman.fromJson("""{"name":"Test Woman", "age":20}""");
  print(m1.toString());
  print(w1.toString());

  //测试在构造执行之前，对列表的初始化
  var p6 = Person.perInit();
  print("p6: $p6");

  //测试使用构造函数的重定向
  var p7 = Person.redirect("Jack");
  print("p7: $p7");

  //工厂构造函数的使用
  //最新的Dart3这个代码不运行，原因是Map返回的对象是可空对象，但是工厂构造函数要求返回的是不可空对象。
  // var logger = Logger('UI');
  // logger.log('Button clicked');

  //Getter 和 Setter 函数的使用。
  var rect = Rect(3, 4, 20, 15);
  print("rect's left: ${rect.left}");
  print("rect's top: ${rect.top}");
  print("rect's right: ${rect.right}");
  print("rect's bottom: ${rect.bottom}");
  print("rect's width: ${rect.width}");
  print("rect's height: ${rect.height}");
  rect.right = 12;
  rect.bottom = 12;
  print("rect's left: ${rect.left}");
  print("rect's top: ${rect.top}");
  print("rect's right: ${rect.right}");
  print("rect's bottom: ${rect.bottom}");
  print("rect's width: ${rect.width}");
  print("rect's height: ${rect.height}");

  //抽象类的使用
  var ve = EffectiveDoer();
  ve.doSomething();
  ve.doSome();
}

