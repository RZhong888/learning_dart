import 'dart:isolate';
import 'dart:io';
import 'dart:core';
import 'dart:convert';
import 'dart:async';

void useGenerator() async {
  // _createSynchronous();
  // _createAsynchronous();
  // _useNaturalsDownSynchronous();
  // _useNaturalsDownAsynchronous();
}

//构建与使用同步生成器
void _createSynchronous() {
  print("Start of the synchronous!");
  _genereateSynchronous().forEach((element) {
    print(element);
  });
  print("End of the synchronous!");
}

Iterable<int> _genereateSynchronous() sync* {
  int index = 0;
  while(index < 10) yield index++; //与上一章节一样，使用 yield 表达式发射事件
}

//构建与使用异步生成器
void _createAsynchronous() {
  print("Start of the asynchronous!");
  _generateAsynchronous().forEach((element) {
    print(element);
  });
  print("Start of the asynchronous!");
}

Stream<int> _generateAsynchronous() async* {
  int index = 0;
  while(index < 10) yield index++; //与上一章节一样，使用 yield 表达式发射事件
}

//同步递归的使用 - 如果生成器是递归的，可以使用 yield* 来提高其性能
void _useNaturalsDownSynchronous() {
  print("Start of the synchronous!");
  _genereateNaturalsDownSynchronous().forEach((element) {
    print(element);
  });
  print("End of the synchronous!");
}

Iterable<int> _genereateNaturalsDownSynchronous([int number = 10]) sync* {
  if(number > 0) {
    yield number;
    yield* _genereateNaturalsDownSynchronous(number - 1);
  }
}

//异步递归的使用 - 如果生成器是递归的，可以使用 yield* 来提高其性能
void _useNaturalsDownAsynchronous() {
  print("Start of the asynchronous!");
  _genereateNaturalsDownAsynchronous().forEach((element) {
    print(element);
  });
  print("End of the asynchronous!");
}

Stream<int> _genereateNaturalsDownAsynchronous([int number = 10]) async* {
  if(number > 0) {
    yield number;
    yield* _genereateNaturalsDownAsynchronous(number - 1);
  }
}