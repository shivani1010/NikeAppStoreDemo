import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var valueCheck=false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children:  [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(
            LineIcons.times,
              color: Colors.black,
              size: 30,
            ),
                    iconSize: 50,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: _iconThumbnail(),
                ),
                Text(
                  "YOUR ACCOUNT FOR EVERYTHING NIKE",
                  style: TextStyle(fontSize:20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20  , // <-- SEE HERE
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Email address",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 10  , // <-- SEE HERE
                ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password.';
                  }
                  return null;
                },
              ),
            ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Center(child: Row(
                      children: [
                        Checkbox(
                          value: valueCheck,
                          onChanged: (bool? value) {
                            setState(() {
                              valueCheck = value!;
                            });
                          },
                        ),
                        Flexible(child: Text('Keep me signed in')),
                      ],
                    ))),
                    VerticalDivider(width: 1.0),
                    Expanded(child: Center(child: Text('Forgotten your password'))),
                  ],
                ),


                SizedBox(
                  height: 14, // <-- SEE HERE
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0,right: 12.0),
                child:  RichText(
                      text: TextSpan(
                          text: "By logging in, you agree to Nike\'s ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(text: 'Privacy Policy', style: TextStyle(decoration: TextDecoration.underline,)),
                            TextSpan(text: ' and '),
                            TextSpan(text: 'Terms of Use', style: TextStyle(decoration: TextDecoration.underline,)),
                          ],
                            ),
                            ),


                      ),


                SizedBox(
                  height: 24,
                ),
                Container(
                    height: 48,
                    width: 250,
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: ElevatedButton(
                      child: const Text('SIGN IN'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // Background color
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                    )
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Not a member ? Join Us'),
                ),

             ] ),
          ),
    ),
      ),
    );
  }

  Image _iconThumbnail() {
    return Image.asset(
      'assets/images/nike_logo.png',
      width: 100,
      height: 100,
    );
  }
}