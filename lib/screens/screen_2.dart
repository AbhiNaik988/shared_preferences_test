import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 2"),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, "/screen3");
        }, child: const Text("To screen 3")),
      ),
    );
  }
}