import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:core';

void useIsolate() {
  // print("Before run _common!");
  // _common();
  // print("End of run _common!");

  //测试Isolate的运行机制
  _queueIsolate();

  //使用Isolate之间的通讯
  // _communicate();
}

//Isolate的基础使用
void _common() async {
  print("Before run Isolate!");
  var result = await Isolate.run(() => _doSomething());
  print("End of run Isolate!");
}

String _doSomething() {
  print("Invoke _doSomething()!");
  return "Do Something!";
}

//Isolate的运行机制
void _queueIsolate() {
  var receivePort = ReceivePort();
  receivePort.listen((message) {
    print(message);
  });

  //执行 Isolate
  _runQueueIsolate1();

  //发送一个宏任务
  receivePort.sendPort.send("宏任务执行  -- 1");

  //执行 Isolate
  _runQueueIsolate2();

  //发送一个宏任务
  receivePort.sendPort.send("宏任务执行  -- 2");
}

void _runQueueIsolate1() async {
  var receivePort = ReceivePort();
  receivePort.listen((message) {
    print(message);
  });

  //发送一个宏任务
  receivePort.sendPort.send("宏任务执行  -- 3");

  //执行一个Isolate
  var result = await Isolate.run(() => _doSomething2());
  print("Return1 Result: $result");

  //发送一个宏任务
  receivePort.sendPort.send("宏任务执行  -- 4");
}

void _runQueueIsolate2() async {
  var receivePort = ReceivePort();
  receivePort.listen((message) {
    print(message);
  });

  //发送一个宏任务
  receivePort.sendPort.send("宏任务执行  -- 5");

  //执行一个Isolate
  var result = await Isolate.run(() => _doSomething2());
  print("Return2 Result: $result");

  //发送一个宏任务
  receivePort.sendPort.send("宏任务执行  -- 6");
}

Future<String> _doSomething2() =>
  Future.delayed(Duration(seconds: 5), () {
    print("Invoke _doSomething()!");
    return "Do Something!";
  });

void _communicate() async {
  await for(final message in _sendAndReceive()) {
    print("communicate result: $message");
  }
}

Stream<String> _sendAndReceive() async* {
  final port = ReceivePort();
  await Isolate.spawn(_runOnWorker, port.sendPort);

  SendPort? sendPort = null;
  await for(final message in port) {
    if(message is SendPort) {
      print("This is a message for get the sendPort from Worker!");
      sendPort = message;
      sendPort.send("This is a message from Source!");
    } else if(message is String) {
      print("Let the Worker should finish theirs Jobs!");
      yield message;
      sendPort?.send(null);
      break;
    }
  }

  print("Stream Finished!");
}

Future<void> _runOnWorker(SendPort sourcePort) async {
  print('Worker isolate started!');

  final port = ReceivePort();
  sourcePort.send(port.sendPort);

  await for (final message in port) {
    if(message is String) {
      sourcePort.send("This is a message from Workder");
    } else {
      break;
    }
  }

  print('Worker isolate finished!');
  Isolate.exit();
}
