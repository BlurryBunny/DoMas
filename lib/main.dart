import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_mas/pages/login_page.dart';
import 'package:do_mas/auth/main_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Do Mas',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final doc  = db.doc('/users/ry3zrvrZ9yiIf6g7gZPq');
     return MaterialApp(
      // home: Scaffold(
      //   body: Center(
      //     child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      //       stream: doc.snapshots(),
      //       builder: (context, snapshot) {
      //         if(!snapshot.hasData){
      //           return const CircularProgressIndicator();
      //         }
      //         final docsnap = snapshot.data!;
      //         return Text(docsnap['surname'] ?? 'sin nombre');
      //       }
      //     )
      //     ),
      // ),

      title: 'Do Mas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
     );
  }
}
