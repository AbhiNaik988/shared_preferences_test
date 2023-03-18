import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Shared Preferences Test"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.supervised_user_circle),
                    contentPadding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
                    labelText: "Name",
                    hintText: "Enter name...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.remove_red_eye_outlined),
                    contentPadding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
                    labelText: "Password",
                    hintText: "Enter password...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                Row(
                  children: [
                    Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          print("remember me! $value");
                          setState(() {
                            _isChecked = value!;
                          });
                        }),
                    const SizedBox(width: 10),
                    const Text("Remember me!")
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ElevatedButton(
                    onPressed: () => () {}, child: const Text("Submit")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
