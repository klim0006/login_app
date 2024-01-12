import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  String operator = "?";
  String result = "";

  void calculate() {
    setState(() {
      if (firstNumberController.text.isNotEmpty && secondNumberController.text.isNotEmpty) {
        final int firstNumber = int.parse(firstNumberController.text);
        final int secondNumber = int.parse(secondNumberController.text);
        if (operator == "+") {
          final int value = firstNumber + secondNumber;
          result = "$value";
        } else if (operator == "-") {
          final int value = firstNumber - secondNumber;
          result = "$value";
        } else if (operator == "x") {
          final int value = firstNumber + secondNumber;
          result = "$value";
        } else if (operator == "/") {
          final double value = firstNumber / secondNumber;
          result = "$value";
        } else {
          result = "0";
        }
      } else {
        result = "0";
      }
    });
  }

  void operatorTapped(value) {
    setState(() {
      operator = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 80,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: firstNumberController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'First number',
                        labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                  Text(operator, style: const TextStyle(fontSize: 18)),
                  Container(
                    width: 140,
                    height: 80,
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: secondNumberController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Second number',
                        labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('+'),
                      onPressed: () {
                        operatorTapped("+");
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('-'),
                      onPressed: () {
                        operatorTapped("-");
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('x'),
                      onPressed: () {
                        operatorTapped("x");
                      },
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('/'),
                      onPressed: () {
                        operatorTapped("/");
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, foregroundColor: Colors.green),
                  child: const Text('='),
                  onPressed: () {
                    calculate();
                  },
                ),
              ),
              const SizedBox(height: 35),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Result is  ",
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                    TextSpan(
                      text: result,
                      style: const TextStyle(fontSize: 30, color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
