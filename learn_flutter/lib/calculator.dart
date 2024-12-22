import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black54,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _num1Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your Number 1",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _num2Controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter your Number 2",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    color: Colors.purpleAccent,
                    hoverColor: Colors.grey,
                    onPressed: () {
                      _answerController.text =
                          (double.parse(_num1Controller.text) +
                                  double.parse(_num2Controller.text))
                              .toString();
                    },
                    icon: const Icon(Icons.add),
                  ),
                  IconButton(
                    color: Colors.purpleAccent,
                    hoverColor: Colors.grey,
                    onPressed: () {},
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    color: Colors.purpleAccent,
                    hoverColor: Colors.grey,
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                  IconButton(
                    color: Colors.purpleAccent,
                    hoverColor: Colors.grey,
                    onPressed: () {},
                    icon: const Icon(Icons.star),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _answerController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Answer",
                ),
                enabled: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
