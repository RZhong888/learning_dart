void useSets() {
  //在Dart中声明和使用Set
  Set<String> s1 = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  Iterator<String> iterator = s1.iterator;
  while(iterator.moveNext()) {
    print("set item: ${iterator.current}");
  }

  var s4 = Set<int>();
  Iterator<int> i2 = s4.iterator;
  while(i2.moveNext()) {
    print("i2 item: ${i2.current}");
  }

  //需要注意的如果使用{}进行初始化set时，如果引用的类型没有明确指定时，编译器会认为创建出来的是Map
  var e1 = {};
  print("e1 is set?: ${e1 is Set}");
  print("e1 is map?: ${e1 is Map}");
  var e2 = <String>{}; //当加上<String>，则间接的告诉编译器，所使用的泛型的数量和类型，从而识别成了Set<String>
  print("e2 is set?: ${e2 is Set}");
  print("e2 is map?: ${e2 is Map}");
  var e3 = <String, String>{}; //当加上<String, String>，则间接的告诉编译器，所使用的泛型的数量和类型，从而识别成了Map<String>
  print("e3 is set?: ${e3 is Set}");
  print("e3 is map?: ${e3 is Map}");

  //使用add()方法或addAll()方法向已存在的Set中添加项目
  var s2 = <String>{};
  s2.add("A");
  s2.addAll(<String>{"B", "C"});
  print("s2: $s2");

  //使用.lenght获取set的数量
  print("s2 length: ${s2.length}");

  //可以在 Set 变量前添加const关键字创建一个Set编译时常量
  final s3 = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  // s3.add('helium'); // This line will cause an error.
  print("s3: $s3");

  /**Set 可以像 List 一样支持使用扩展操作符（ ... 和 ...? ）以及 Collection if 和 for 操作。*/
}