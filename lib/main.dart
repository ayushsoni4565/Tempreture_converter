import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double fahTemp = 0.0, celTemp = 0.0;
  bool isFah = true;
  var fahController = TextEditingController();
  var celController = TextEditingController();

  fahListner() {
    setState(() {
      fahTemp = double.parse(fahController.text);
      celTemp = convert(fahTemp, true);
      if (isFah) celController.text = celTemp.toString();
      isFah = true;
    });
  }

  celListner() {
    setState(() {
      celTemp = double.parse(celController.text);
      fahTemp = convert(celTemp, false);
      if (!isFah) fahController.text = fahTemp.toString();
      isFah = false;
    });
  }

  @override
  initState() {
    fahController.addListener(fahListner);
    celController.addListener(celListner);
  }

  @override
  dispose() {
    fahController.dispose();
    celController.dispose();
  }

  double convert(double temp, bool isF) {
    return isF ? (temp - 32) / (5 / 6) : (temp * 9 / 5) + 32;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff434e6c),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Celcious",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: celController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter Tempreture',
                    hintStyle: TextStyle(
                        color: Colors.amber.shade200,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    suffix: Text(
                      "C",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            Text(
              "Farenhite",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: fahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter Tempreture',
                    hintStyle: TextStyle(
                        color: Colors.amber.shade200,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    suffix: Text(
                      "F",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
