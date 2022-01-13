import 'package:flutter/material.dart';
import 'package:athletto_login/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/async_provider.dart';
import 'package:athletto_login/services/auth.dart';
import 'package:athletto_login/models/user.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: const FirebaseOptions(
      apiKey: "AIzaSyBj0T6XfOX4lxYJY0MuK-AqdSUXYj7lA8s",
      appId: "1:446721117599:android:f8abb815f7c57d908f41aa",
      messagingSenderId: "446721117599",
      projectId: "athlettologin",
    ),
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

