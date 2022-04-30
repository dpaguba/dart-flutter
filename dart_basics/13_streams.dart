import 'dart:async';

void main(List<String> args) {
  // only one subscription is possible
  // NumberGenerator numberGenerator = NumberGenerator();

  // StreamSubscription subscription = numberGenerator.getStream.listen((counter) {
  //   print(counter);
  // }, onError: (error) {
  //   // handle error
  //   print("error");
  // }, onDone: () {
  //   print("done");
  // }, cancelOnError: false);

  // many active subscriptions are possible
  Stream numberGenerator = NumberGenerator().getStream.asBroadcastStream();
  StreamSubscription sub1 = numberGenerator.listen((event) {
    print(event);
  });

  StreamSubscription sub2 = numberGenerator.listen((event) {
    print("sub2 : " + event.toString());
  });

  // usage of subscriptions
  // sub1.pause();
  // sub1.resume();
  // sub1.cancel();
}

class NumberGenerator {
  int _counter = 0;

  StreamController<int> _controller = StreamController<int>();

  Stream<int> get getStream {
    return _controller.stream;
  }

  NumberGenerator() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      _controller.sink.add(_counter);
      _counter++;
    });
  }
}
