Future<int> calcAsync() async {
  print('calcAsync called: ${DateTime.now()}');
  return 10;
}

int calc() {
  //print('calc called: ${DateTime.now()}');
  return 42;
}

Future<int> getFuture() async {
  return Future<int>.delayed(Duration(seconds: 3), () => 57);
}
