import 'package:flutter/material.dart';

//create main function
void main() {
  //Declare variables using: int, double, String, bool.
  int age = 22;
  int height = 182;
  String name = "Phuc Quynh";
  bool isStudent = true;
  //print values
  print("Name: $name");
  print("Age: $age");
  print("Height: $height m");
  print("Is student: $isStudent");
  // String interpolation with an expression
  print("Next year age: ${age + 1}");
  exercise2();
  exercise3();
  exercise4();
  exercise5();
}

// Exercise 4: Intro to OOP

class Car {
  String brand;

  // Normal constructor
  Car(this.brand);

  // Named constructor
  Car.defaultCar() : brand = "Toyota";

  // Method
  void drive() {
    print("$brand is driving.");
  }
}

// Child class
class ElectricCar extends Car {
  ElectricCar(String brand) : super(brand);

  // Override the method
  @override
  void drive() {
    print("$brand electric car is driving silently.");
  }
}

void exercise4() {
  // Create object using normal constructor
  Car car1 = Car("Honda");

  // Create object using named constructor
  Car car2 = Car.defaultCar();

  // Create object of subclass
  ElectricCar car3 = ElectricCar("Tesla");

  // Call methods
  car1.drive();
  car2.drive();
  car3.drive();
}
void exercise2() {
  //Create a List of integers
  List<int> number = [1, 2, 3, 4];
  //Use arithmetic & comparison operators
  int a = 10;
  int b = 5;

  print("a + b = ${a + b}");
  print("a - b = ${a - b}");
  print("a == b: ${a == b}");
  //Create a Set (unique values)
  Set<int> uniqueNumbers = {1, 2, 3, 3, 4};
  print("Set: $uniqueNumbers");
  // Create a List
  List<int> numbers = [10, 20, 30, 40];
  // 1. Indexing
  print("First number: ${numbers[0]}");
  // 2. add()
  numbers.add(50);
  print("After add: $numbers");
  // 3. remove()
  numbers.remove(20);
  print("After remove: $numbers");
  //Create a Map (key-value)
  Map<String, int> scores = {"Math": 90, "English": 85, "Programming": 95};
  //map access
  print("Scores: $scores");
  print("Programming score: ${scores["Programming"]}");
}

void exercise3() {
  // Exercise 3: Control Flow & Functions
  int score = 85;
  // if / else
  if (score >= 50) {
    print("Result: Pass");
  } else {
    print("Result: Fail");
  }
  // switch case
  int day = 2;
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    case 3:
      print("Wednesday");
      break;
    default:
      print("Other day");
  }
  // List for loops
  List<String> subjects = [
    "Math",
    "English",
    "Programming"
  ];
  // Normal for loop
  print("Using for:");
  for (int i = 0; i < subjects.length; i++) {
    print(subjects[i]);
  }
  // for-in loop
  print("Using for-in:");
  for (String subject in subjects) {
    print(subject);
  }
  // forEach()
  print("Using forEach:");
  subjects.forEach((subject) {
    print(subject);
  });
  // Normal function
  int add(int a, int b) {
    return a + b;
  }
  print("5 + 3 = ${add(5, 3)}");
  // Arrow function
  int multiply(int a, int b) => a * b;
  print("5 * 3 = ${multiply(5, 3)}");
}

// Exercise 5: Async, Future, Null Safety & Streams

// Async function
Future<String> loadData() async {
  // Simulate loading for 2 seconds
  await Future.delayed(Duration(seconds: 2));

  return "Data loaded successfully";
}

Future<void> exercise5() async {
  // Call async function using await
  print("Loading data...");

  String result = await loadData();

  print(result);

  // Null safety
  String? name;

  // ?? provides a default value when name is null
  print("Name: ${name ?? "Unknown"}");

  // Assign a value
  name = "Phuc Quynh";

  print("Name: $name");

  // ! tells Dart that the value is definitely not null
  print("Name length: ${name!.length}");

  // Stream of integers
  Stream<int> numberStream =
  Stream<int>.fromIterable([1, 2, 3, 4, 5]);

  print("Stream values:");

  await for (int number in numberStream) {
    print(number);
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
