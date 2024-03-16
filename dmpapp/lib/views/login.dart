import 'package:dmpapp/views/products.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Products App",style: Theme.of(context).textTheme.titleLarge,),
          TextField(
            decoration: InputDecoration(labelText: "E-mail", prefixIcon: Icon(Icons.email)),),
          TextField(
            obscureText: true, 
            decoration: InputDecoration(labelText: "Password", prefixIcon: Icon(Icons.key)),),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductView()));
          }, child: const Text("Log in"))
        ],
      ),
    );
  }
}

