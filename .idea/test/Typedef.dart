void useTypedef() {
  SortedCollection coll = SortedCollection(sort);
  print("coll.compare is Function : ${coll.compare is Function}");
  print("coll.compare is Compare : ${coll.compare is Compare}");
  print("coll.compare is Compare<int> : ${coll.compare is Compare<int>}");
}

int sort(Object a, Object b) => 0;

typedef Compare<T> = T Function(Object a, Object b);

class SortedCollection {
  Compare compare;
  SortedCollection(this.compare);
}