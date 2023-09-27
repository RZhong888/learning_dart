import 'dart:isolate';
import 'dart:io';
import 'dart:core';
import 'dart:convert';

var path = '/Users/rzhong/IdeaProjects/learning_dart_git/data.txt';

void useStream() async {
  // _forEach();
  // _common();
  // _awaitFor();
  // _streamTransform();
  _createStream();
}

//可以通过 Stream 的 forEach() 函数，立刻进行订阅输出
void _forEach() {
  var fileStream = File(path).openRead();
  fileStream.forEach((element) {
    print(element);
  });
}

//Stream API 的基础使用
void _common() {
  var fileStream = File(path).openRead();
  fileStream
      .listen((event) {
        print(event);
      },
      onDone: () {
        print("Read file finished!");
      },
      onError: (exception) {
        print("Read file throws some error: $exception !");
      });
}

//语法糖await for的使用
void _awaitFor() async {
  var fileStream = File(path).openRead();
  //注意使用 await for 和 await 一样，需要所使用的函数被定义为 async 函数。
  await for(var value in fileStream) {
    print(value);
  }
}

//Stream的转换
void _streamTransform() async {
  var fileStream = File(path).openRead();
  var linse = fileStream.transform(utf8.decoder).transform(LineSplitter());
  await for(var line in linse) {
    print(line);
  }
}

//通过 async* 函数创建 Stream，除此之外我们还可以通过 StreamController 的方式创建Stream，但是官方并不是很推荐使用。
void _createStream() async {
  _generateStream(Duration(seconds: 3))
      .listen((value) {
        print(value);
       });
}

Stream<int> _generateStream(Duration interval, [int maxCount = 10]) async* {
  int index = 0;
  while(true) {
    await Future.delayed(interval);
    yield index++; //使用 async* 函数构建 Stream的时候，是使用 yield/yield* 将事件进行发射
    if(index == maxCount) break; //当 async* 函数执行结束的使用，Stream生命周期结束
  }
}
