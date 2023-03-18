import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Screen 2"),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "/screen3");
          }, child: const Text("To screen 3")),
        ],
      ),
    );
  }
}