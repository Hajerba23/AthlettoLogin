import 'package:athletto_login/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ required this.toggleView });
  
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  
  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
        title: Center(
          child: Text(
            'ATHLETTO',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.grey[500],
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),

      body: Padding(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 80,
              left: 70,
              child: Container(
                height: 250,
                width: 350,
                color: Colors.grey[400],
                // padding: EdgeInsets.fromLTRB(10, 0, 10, 0)
                child: Center(
                  child: Container(
                    color: Colors.grey[200],
                    height: 160,
                    width: 300,
                    child: Stack(
                      children: <Widget>[

                        Positioned.fromRect(
                          rect: Rect.fromCenter(center: Offset(150, 45), width: 250, height: 60),
                          child: Container(
                            width: 50, 
                            height: 100, 
                            color: Colors.blue[100],
                            padding: EdgeInsets.all(10),
                            child: TextFormField(                                 
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.mail),
                                    //border: OutlineInputBorder(),
                                    //hintText: 'Enter your E-mail address',
                                    //labelText: 'E-mail :',
                                  ),                           
                                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                                  onChanged: (val) {
                                  setState(() => email = val);
                                      },
                                    ),
                          ),
                        ),

                        Positioned.fromRect(
                          rect: Rect.fromCenter(center: Offset(150, 115), width: 250, height: 60),
                          child: Container(
                            width: 50, 
                            height: 100, 
                            color: Colors.blue[100],
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                                    decoration: const InputDecoration(
                                      icon: Icon(Icons.lock_open),
                                      //border: OutlineInputBorder(),
                                      //hintText: 'Enter your password',
                                      //labelText: 'Password :',
                                      ),
                                     obscureText: true,
                                     validator: (val) => val!.length < 6 ? 'Enter a password 6+ chars' : null,
                                     onChanged: (val) {
                                     setState(() => password = val);
                                      },
                                    ),                     
                              ),
                            ),

                      ],
                    ),
                                
                  ),
                ),
              ),
            ),

            Positioned(
              top: 360,
              left: 120,
              child: Container(
                //lezem yemchi a droite akther
                height: 40,
                width: 250,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: RaisedButton(
                  textColor: Colors.black,
                  color: Colors.grey[350],
                  child: Text('Sign in'),
                  onPressed: () async {
                  if(_formKey.currentState!.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'Could not sign in with those credentials';
                      });
                    }
                  }                 
                  }
                ),
              ),
            ),

            Positioned(
              top: 420,
              left: 115,
              child: Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
              ),
 
          ],
      ),
      ),
      ),
 
    );
  }
}