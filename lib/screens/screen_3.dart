import 'package:flutter/material.dart';
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 3"),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, "/signIn");
        }, child: const Text("To SignIn")),
      ),
    );
  }
}
