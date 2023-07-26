void useStrings() {
  //普通字符串的使用
  String s1 = '你好！';
  String s2 = "你好呀！";
  print("s1: $s1");
  print("s2: $s2");

  //字符串中使用表达式
  int i1 = 1;
  int i2 = 2;
  print("i1: $i1");
  print("sum: ${i1 + i2}");

  //使用+运算符或并列放置多个字符串来连接字符串
  String s3 = "hello " + "world!";
  String s4 = "hello " "world!" " I am " "Dart's Dev";
  print("s3: $s3");
  print("s4: $s4");

  //使用三个单引号或者三个双引号也能创建多行字符串：
  String s5 = '''
  hello:
    This is a test messsage1.
  ''';
  String s6 = """
  hello:
    This is a test messsage2.
  """;
  print("s5: $s5");
  print("s6: $s6");

  //字符串前加上r作为前缀创建 “raw” 字符串
  String s7 = "在 raw 字符串中，转义字符串 \n 会直接输出 “\n” 而不是转义为换行。";
  String s8 = r"在 raw 字符串中，转义字符串 \n 会直接输出 “\n” 而不是转义为换行。";
  print("s7: $s7");
  print("s8: $s8");
}