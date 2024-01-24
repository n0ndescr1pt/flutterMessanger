import 'package:flutter/material.dart';
import 'package:flutter_messnger/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void signOut() async {
    // get the auth services
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signOut();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dcffgfg"),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
        ),
    );
  }
}
