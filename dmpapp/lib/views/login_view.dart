import 'package:dmpapp/views/products_view.dart';
import 'package:flutter/material.dart';
import '../libraries/data_lib.dart' as data_lib;

class LoginView extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  LoginView({super.key});

  void onLoginButtonPressed(context) {
    String mail = email.text;
    String password = this.password.text;

    data_lib.dataContext.loginUser(context, mail, password).then((response) => {
          if (response.statusCode == 200)
            {
              data_lib.usersDB.insertUserToken(token: response.body),

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProductView()))
            }
          else
            {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  builder: ((context) {
                    return SizedBox(
                      height: 300,
                      child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.logout_outlined,
                          size: 60,),
                          Text(
                            "Bad Credentials",
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      )),
                    );
                  }))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    
    data_lib.usersDB.validateTokenDate().then(
      (value){
        if(value){
          Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const ProductView()));
        }
      }
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Products App",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          TextField(
            controller: email,
            decoration: const InputDecoration(
                labelText: "E-mail", prefixIcon: Icon(Icons.email)),
          ),
          TextField(
            controller: password,
            obscureText: true,
            decoration: const InputDecoration(
                labelText: "Password", prefixIcon: Icon(Icons.key)),
          ),
          ElevatedButton(
              onPressed: () {
                onLoginButtonPressed(context);
              },
              child: const Text("Log in"))
        ],
      ),
    );
  }
}
