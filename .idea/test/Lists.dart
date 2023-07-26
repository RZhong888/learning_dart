void useLists() {
  //List的声明及其使用
  var l1 = [1, 2, 3];
  print("l1: $l1");

  //获取List的长度，以及游标操作List
  print("l1 length: ${l1.length}");
  l1[0] = 8;
  print("l1: $l1");

  //使用const修饰的list字面量会使得list变成编译时常量
  var l2 = const[2, 4, 6];
  print("l2: $l2");
  // l2[0] = 8; //会报错！因为l2锁只想的内存list为编译时常量，其内容是无法被修改的。

  //使用扩展操作服 ... 来进行集合与集合之间的插值
  var l3 = [0, ...l2];
  print("l3: $l3");

  //使用空感知扩展操作符 ...? 来进行判断插值
  List<int>? l4 = null;
  var l5 = [0, ...?l4];
  print("l5: $l5");
  l4 = const[1, 3, 5];
  // var l6 = [0, ...?l4]; //运行这句代码的时候会出现一个警告，因为l4已经被明确赋值，编译器会认为它不可能为null，所以走到这一步的时候编译器会建议使用扩展操作符 ...
  // print("l6: $l6");

  //在集合中使用if语句
  bool isAdd = true;
  var l7 = [0, if(isAdd) 112];
  print("l7: $l7");
  isAdd = false;
  l7 = [0, if(isAdd) 112];
  print("l7: $l7");

  //在集合中使用for语句并进行类型转换
  var l8 = ["1", "2", "3", "4"];
  var l9 = [0, for (var indexValue in l8) int.parse(indexValue)];
  print("l9: $l9");
}