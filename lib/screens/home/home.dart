import 'package:flutter/material.dart' ;
import 'package:athletto_login/services/auth.dart';

 class Home extends StatelessWidget {
  //const Home({ Key? key }) : super(key: key);

  final AuthService _auth = AuthService();

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
            label: Text('logout'),          
            onPressed: () async {
                await _auth.signOut();
              },          
          ),
        ],
      ),
    
    );
  }
} 

// this home page is complete in Hichem's part