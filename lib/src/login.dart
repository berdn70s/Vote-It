import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VoteIt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const MyHomePage(title: 'VoteIt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Login()
          ],
        ),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login( {Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController=TextEditingController();
  final passwordController= TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {
      });
    });

    passwordController.addListener(() {
      print('controller2 listener');
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 20,
            bottom: 40,

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                style: TextStyle(color: Colors.black),
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  hintText: "Enter a valid email."
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                    hintText: "Enter a valid password."
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  //Navigated to forgot password.
                  //   passwordController.text = '';
                  // setState(() {
                  // });
                  passwordController.selection = TextSelection.collapsed(offset: 0);
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              ElevatedButton(
                onPressed: emailController.text.isEmpty|| passwordController.text.isEmpty ? null : () {
                  //Navigated to homepage.
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
              Text('Create an Account',
              style: TextStyle(color: Colors.grey,fontSize: 15))
            ],
          ),
        ),
      );
  }
}


/*class Counter extends StatefulWidget {
  final int _counter;
  const Counter(this._counter,{Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int _counter2;

  @override
  void initState() {
    super.initState();
    _counter2=widget._counter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children:<Widget>[
        Text("Counter= $_counter2"),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter2++;
            });
          },
          child: Text(
              "Increment counter."
          ),
        ),

      ],

    );
  }
}*/
