import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState(){

    super.initState();
    _animationController=new AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _animation=CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut
    );
    _animation.addListener(()=>this.setState((){}));
    _animationController.forward();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
      children: <Widget>[
      Image(
        image: AssetImage('assets/girl.jpg'),
        fit: BoxFit.cover,
        color: Colors.black87,
        colorBlendMode: BlendMode.darken,
      ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: _animation.value*100,
            ),

            Form(
              child: Theme(
                data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    )
                  )
                ),
                child: Container(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(

                        decoration: InputDecoration(
                          labelText: "Enter E-mail",

                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(

                        decoration: InputDecoration(
                          labelText: "Enter Password",
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                      ),
                      MaterialButton(
                        height: 40,
                        minWidth: 100,
                        color: Colors.teal,
                        child: Text("Login"),
                        onPressed: (){},
                        splashColor: Colors.redAccent,

                      )
                    ],
                  ),
                ),
              ),


            )

          ],
        )

      ],

      ),

    );
  }
}

