import 'package:firecars/services/authentification.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool inLoginProcess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage('assets/fire_car.png'),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              Text(
                'Fire Cars',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Découvrez et partager les meilleurs voitures de luxe 2022',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              inLoginProcess
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () => signIn(),
                      child: Text('Connectez-vous avec google'))
            ],
          ),
        ),
      )
    );
  }
  signIn(){
    setState(() {
      inLoginProcess = true;
      AuthService().signInWithGoogle();

    });
  }
}
