import 'package:athletto_login/screens/authenticate/authenticate.dart';
import 'package:athletto_login/screens/home/home.dart';
import 'package:flutter/material.dart' ;
import 'package:athletto_login/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
      return Home();
    }
  }
}