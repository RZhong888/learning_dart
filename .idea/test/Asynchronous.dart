import 'dart:isolate';
import 'dart:io';
import 'dart:core';

void useAsynchronous() {
  // _eventQueue();
  // _ioEvent();
  // _linkEvent();
  // _useStream();
  // _streamState();
  // _useBroadcase();
  // _blockRun();
  _defineAsynchronousFunc();
}

//测试使用Dart中的异步底层 - 事件机制。由于Dart是单线程语言，所以Dart中的异步是通过队列机制实现的。
//在Dart的队列机制中存在两种队列，一个是微任务队列，一个是宏任务队列，在Dart的定义中微任务的执行优先级别高于宏任务。
void _eventQueue() {
  var receivePort = ReceivePort();
  receivePort.listen((message) {
    print(message);
  });

  Future.microtask(() {
    print("微任务执行 -- 1");
  });

  print("逻辑执行 -- 1");

  receivePort.sendPort.send("宏任务执行  -- 1");

  Future.microtask(() {
    print("微任务执行 -- 2");
  });

  receivePort.sendPort.send("宏任务执行  -- 2");

  print("逻辑执行 -- 2");

  Future.microtask(() {
    print("微任务执行 -- 3");
  });

  receivePort.sendPort.send("宏任务执行  -- 3");

  print("逻辑执行 -- 3");
}

//Dart中，IO操作属于宏任务，其执行的优先级低于微任务。
void _ioEvent() {
  // 添加一个 IO 事件
  File('/Users/rzhong/IdeaProjects/learning_dart_git/data.txt').readAsString().then((data) {
    print('IO event: $data');
  });

  Future.microtask(() {
    print("微任务执行 -- 1");
  });

  Future.microtask(() {
    print("微任务执行 -- 2");
  });

  Future.microtask(() {
    print("微任务执行 -- 3");
  });
}

//异步的链式调用方法
void _linkEvent() {
  //链式执行
  Future
      .delayed(Duration(seconds: 2), () => "John Wick")
      .then((String value) {
        print("then 1 value: $value");
        return 10;
      })
      .then((int value) {
        print("then 2 value: $value");
      });

  //等待一系列异步执行后，统一执行后续操作，类似RxJava的Merge和Zip
  var f1 = Future.delayed(Duration(seconds: 1), () => "Allen Wick");
  var f2 = Future.delayed(Duration(seconds: 1), () => "John Wick");
  var f3 = Future.delayed(Duration(seconds: 1), () => 10);
  Future
      .wait([f1, f2, f3])
      .then((value) {
        value.forEach((element) {
          if(element is int) {
            print("wait int result: $element");
          } else if(element is String) {
            print("wait String result: $element");
          } else {
            print("wait result: unknown");
          }
        });
      });
}

/**
 * Steam的使用。在Dart中，Future表示稍后获得的一个数据，所有异步的操作返回值均用Future<T>表示。Stream与Future的区别在于，Future表示一次异步获得的数据，
 * Stream表示需要多次异步操作获得的结果。
 * */
void _useStream() {
  var stream = File('/Users/rzhong/IdeaProjects/learning_dart_git/data.txt').openRead();
  stream.listen((message) {
    print("Read Stream!");
    print("$message");
  });
}

//Stream状态回调
void _streamState() {
  var subscription = File('/Users/rzhong/IdeaProjects/learning_dart_git/data.txt')
      .openRead()
      .listen((message) {
        print("Read Stream!");
        print("$message");
      });

  //使用onData，会重置Steam操作
  // subscription.onData((message) {
  //   print("重置listen");
  //   print("Read Stream!");
  //   print("$message");
  // });

  subscription.onDone(() {
    print("结束listen");
  });

  // subscription.pause(); //暂停，如果没有继续则推出
  // subscription.resume();
}

/**
 * Stream 的广播模式:
 * - Stream 的广播模式有两种：单订阅模式和多订阅模式。Stream默认是单订阅模式，即只能有一个订阅着，若有多个订阅着会报错。
 * - 如果我们需要使用多订阅模式，我们需要通过 Stream.asBroadcastStream() 可以将一个单订阅模式的 Stream 转换为一个多订阅模式的 Stream。
 * - 我们可以通过使用 Stream 的 isBroadcast 来判断当前 Stream 所属的模式。
 * */
void _useBroadcase() {
  var stream = File('/Users/rzhong/IdeaProjects/learning_dart_git/data.txt').openRead();
  stream.listen((message) {
    print("Read1 Stream!");
    print("$message");
  });

  //由于默认Stream是使用单订阅模式，所以执行下面的代码会报错。
  // stream.listen((message) {
  //   print("Read2 Stream!");
  //   print("$message");
  // });

  //下面是使用多订阅模式，同时进行多个订阅并不会触发任何异常。
  var stream2 = File('/Users/rzhong/IdeaProjects/learning_dart_git/data.txt')
      .openRead()
      .asBroadcastStream();

  stream2.listen((message) {
      print("Read3 Stream!");
      print("$message");
  });

  stream2.listen((message) {
      print("Read4 Stream!");
      print("$message");
  });
}

//当前进程等待协程的执行结果（blockRun）
void _blockRun() async {
  var f1 = Future.delayed(Duration(seconds: 5), () {
    print("Future.delayed Invoked!");
    return "Future Invoked!";
  });

  print("Run 1");
  var message = await f1;
  print("Run 2, message: $message");
}

//定义异步函数
void _defineAsynchronousFunc() async {
  _returnNull();
  var value = await _returnString();
  print("value : $value");
}

//定义无参数返回的异步函数
Future<Null> _returnNull() =>
    Future(() {
      print("Invoke _returnNull()!");
    });

//定义有参数返回的异步函数
Future<String> _returnString() =>
    Future(() {
      print("Invoke _returnString()!");
      return "Invoke _returnString() value";
    });