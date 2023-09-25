//泛型的使用
class UseGenerics {
  T findFirst<T>(List<T> list) => list[0];
}

//限制泛型类型。需要注意的是，在Dart中只运行设置泛型的上节，不允许设置下界。
class GenericsParent {}
class GenericsChild extends GenericsParent {}

class GenericsTest<T extends GenericsParent> {
  String toString() => "Instance of 'GenericsTest<$T>'";
}

void useGenerics() {
  //泛型的使用
  var ug1 = UseGenerics();
  print("find: ${ug1.findFirst(["one", "two", "three"])}");
  print("find: ${ug1.findFirst([1, 2, 3])}");

  //限制泛型类型
  var gt1 = GenericsTest<GenericsParent>();
  var gt2 = GenericsTest<GenericsChild>();
  print("$gt1");
  print("$gt2");
}