import 'package:firebase_auth/firebase_auth.dart';
import 'package:firecars/views/home/homeAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<User?>(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeAppBar(user : _user)
          ],
        ),
      )
    );
  }
}
