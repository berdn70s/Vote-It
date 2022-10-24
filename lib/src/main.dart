
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '',
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {


  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
final  _textController = TextEditingController();
  var isBelowVisible = false;
  var songList = ['Iron Maiden-Wasting Love'];

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(


        title:  Text('VoteIt', style: GoogleFonts.inspiration(
        textStyle: Theme.of(context).textTheme.headline2, color: Colors.black,), ),
        backgroundColor: Colors.brown,
      ),
      body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  <Widget>[
                Container(
                  color: Colors.blueGrey,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 90,
                        color: Colors.brown,
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isBelowVisible = !isBelowVisible;
                                    songList.add('Metallica-Nothing Else Matters');
                                  });
                                },
                                child:
                                Text("add music",
                                style: GoogleFonts.arya(
                                  color: Colors.black,
                                  fontSize: 22, ),),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                if(isBelowVisible)
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Container(color: Colors.blueGrey,
                      child:  TextField(
                      controller: _textController,
                      decoration: InputDecoration(hintText: 'URL of desired song',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed:() {
                          _textController.clear();

                        },
                        icon:  Icon(Icons.clear_rounded),
                      )),
                      ) ,
                      ),
                  ),
              ],
            ),
      ),
    );
  }
}
