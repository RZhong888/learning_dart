import 'Variables.dart';
import 'Numbers.dart';
import 'Strings.dart';
import 'Booleans.dart';
import 'Lists.dart';
import 'Sets.dart';
import 'Maps.dart';
import 'Functions.dart';
import 'Operators.dart';
import 'Clazz.dart';
import 'Generics.dart';
import 'dart:io';
import 'dart:isolate';
import 'Asynchronous.dart';
import 'Streams.dart';
import 'Generater.dart';
import 'Isolates.dart';

void main() {
  // const number = 31;
  // print("Hello World! ${plusNumber()}");

  //测试使用变量
  // useVariables();

  //Number的使用
  // testNumbers();

  //String的使用
  // useStrings();

  //boolean的使用
  // useBooleans();

  //List的使用
  // useLists();

  //Set的使用
  // useSets();

  //Map的使用
  // useMaps();

  //函数的使用
  // useFunctions();

  //使用表达式
  // useOperators();

  //使用类
  //useClazz();

  //使用泛型
  //useGenerics();

  //使用异步 - Future
  //useAsynchronous();

  //使用异步 - Stream
  //useStream();

  //使用生成器
  //useGenerator();

  //使用Isolate
  useIsolate();
}

int plusNumber() {
  return 1 + 2;
}

//测试使用事件队列机制，IO事件为宏任务，Future为微任务，在Dart的定义中微任务的执行优先级别高于宏任务。
// void main() {
//   print('Start');
//
//   // 添加一个 IO 事件
//   File('/Users/rzhong/IdeaProjects/learning_dart_git/data.txt').readAsString().then((data) {
//     print('IO event: $data');
//   });
//
//   // 添加一个异步任务
//   fetchData().then((result) {
//     print('Async event: $result');
//   });
//
//   print('End');
// }
//
// Future<String> fetchData() {
//   return Future.delayed(Duration(seconds: 1), () => 'Data loaded');
// }

//测试事件队列机制2
// void main() {
//   var receivePort = ReceivePort();
//   receivePort.listen((message) {
//     print(message);
//   });
//
//   Future.microtask(() {
//     print("微任务执行 -- 1");
//   });
//
//   print("逻辑执行 -- 1");
//
//   receivePort.sendPort.send("宏任务执行  -- 1");
//
//   Future.microtask(() {
//     print("微任务执行 -- 2");
//   });
//
//   receivePort.sendPort.send("宏任务执行  -- 2");
//
//   print("逻辑执行 -- 2");
//
//   Future.microtask(() {
//     print("微任务执行 -- 3");
//   });
//
//   receivePort.sendPort.send("宏任务执行  -- 3");
//
//   print("逻辑执行 -- 3");
// }

//测试异步的链式调用方法
// void main() {
//   //链式执行
//   Future
//       .delayed(Duration(seconds: 2), () => "John Wick")
//       .then((String value) {
//         print("then 1 value: $value");
//         return 10;
//       })
//       .then((int value) {
//         print("then 2 value: $value");
//       });
//
//   //等待一系列异步执行后，统一执行后续操作，类似RxJava的Merge和Zip
//   var f1 = Future.delayed(Duration(seconds: 1), () => "Allen Wick");
//   var f2 = Future.delayed(Duration(seconds: 1), () => "John Wick");
//   var f3 = Future.delayed(Duration(seconds: 1), () => 10);
//
//   Future
//       .wait([f1, f2, f3])
//       .then((value) {
//         value.forEach((element) {
//           if(element is int) {
//             print("wait int result: $element");
//           } else if(element is String) {
//             print("wait String result: $element");
//           } else {
//             print("wait result: unknown");
//           }
//         });
//       });
// }

