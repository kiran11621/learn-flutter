import 'package:flutter/material.dart';
import 'package:learn_flutter/main.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons and DialogBox'),
        backgroundColor: Colors.black45,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Printing On Press');
                    showAlertDialog(context);
                  },
                  child: const Text(
                    'Button',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    print('Printing On Press');
                    Navigator.pushNamed(context, Routes.calculatorRoute);
                  },
                  child: const Text(
                    'Button',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    print('Printing On Press');
                  },
                  child: const Icon(Icons.download),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    print('Printing On Press');
                  },
                  label: const Text('Upload'),
                  icon: const Icon(Icons.upload),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: (value) {
          print('value $value');
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: "Search",
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Text('This is a Dialog Box'),
      content: const Text('This is my body'),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'ok',
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
