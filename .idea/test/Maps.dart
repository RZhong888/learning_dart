void useMaps() {
  //在Dart中声明和使用Map
  var m1 = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var m2 = Map<String, String>();
  m2["first"] = "partridge";
  m2["second"] = "turtledoves";
  m2["fifth"] = "golden rings";
  
  print("m1: $m1");
  print("m2: $m2");

  //使用.lenght读取Map的长度
  m2["fifth"] = "partridge";
  m2["third"] = "golden rings";
  print("m1 length: ${m1.length}");
  print("m2 length: ${m2.length}");

  //在一个 Map 字面量前添加 const 关键字可以创建一个 Map 编译时常量
  final constMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon'
  };
  // constantMap[2] = 'Helium'; // 这里会报错！原因是所修改的Map为编译时常量。

  /**Map 可以像 List 一样支持使用扩展操作符（ ... 和 ...? ）以及 Collection if 和 for 操作。*/
}