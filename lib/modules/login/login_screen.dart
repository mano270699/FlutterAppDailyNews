import 'package:flutter/material.dart';
import 'package:todaynews/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  // const LoginScreen();

  var email = TextEditingController();
  var password = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    labelText: 'Email Address',
                    prefixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 15.0,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)),
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                    prefixIcon: Icon(Icons.lock)),
              ),
              SizedBox(
                height: 15.0,
              ),
              defaultButton(
                  function: () {
                    print(email.text);
                    print(password.text);
                  },
                  text: 'Login',
                  color: Colors.blue,
                  width: double.infinity),
              // Container(
              //   width: double.infinity,
              //   height: 50,
              //   //margin: const EdgeInsetsDirectional.only(start: 70, end: 70),
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(10)),
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   child: MaterialButton(
              //     color: Colors.blue,
              //     onPressed: () {
              //       print(email.text);
              //       print(password.text);
              //     },
              //     child: Text(
              //       'LOGIN',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  TextButton(onPressed: () {}, child: Text('Sign Up')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
