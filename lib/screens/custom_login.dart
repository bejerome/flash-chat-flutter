import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';


class CustomeLoginScreen extends StatefulWidget {
  static const String id = 'custom_login_screen';
  @override
  _CustomeLoginScreenState createState() => _CustomeLoginScreenState();
}

class _CustomeLoginScreenState extends State<CustomeLoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);
  final _auth = FirebaseAuth.instance;
  Future loginToFirebase(data) async {
    try {
      final newUser = await _auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      if (newUser != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      print('error after login $e');
    }
  }

  Future registerUser(data) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: data.name, password: data.password);
      if (newUser != null) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      print('error failed to register $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // final auth = Provider.of<Auth>(context, listen: false);
    final inputBorder = BorderRadius.vertical(
      bottom: Radius.circular(10.0),
      top: Radius.circular(20.0),
    );

    return FlutterLogin(
      title: 'Flash Chat',
      // logo: 'assets/images/ecorp-lightgreen.png',
      onLogin: (loginData) => loginToFirebase(loginData),
      onSignup: (loginData) => registerUser(loginData),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ChatScreen(),
        ));
      },
      onRecoverPassword: (_) => Future(null),
      theme: LoginTheme(
        primaryColor: Colors.blueGrey,
        accentColor: Colors.white38,
        errorColor: Colors.redAccent,
        titleStyle: TextStyle(
          color: Colors.yellowAccent,
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.w100,
          letterSpacing: 4,
        ),
        bodyStyle: TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: TextStyle(
          color: Colors.blueGrey,
          shadows: [Shadow(color: Colors.black54, blurRadius: 2)],
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.yellow[100],
        ),
        cardTheme: CardTheme(
          color: Colors.lightBlue[50],
          elevation: 7,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.black.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            backgroundColor: Colors.white70,
            color: Colors.white,
          ),
          labelStyle: TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellowAccent, width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.redAccent.shade400, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400], width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.black,
          backgroundColor: Colors.pinkAccent,
          highlightColor: Colors.lightGreen,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
        ),
      ),
    );
  }
}
