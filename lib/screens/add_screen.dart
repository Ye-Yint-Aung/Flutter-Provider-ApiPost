import 'package:flutter/material.dart';
import 'package:flutter_provider_api_post/providers/user_provider.dart';

class UserAddScreen extends StatefulWidget {
  const UserAddScreen({super.key});

  @override
  State<UserAddScreen> createState() => _UserAddScreenState();
}

class _UserAddScreenState extends State<UserAddScreen> {
  final userprovider = UserProvider();
  TextEditingController titleTextController = TextEditingController();
  TextEditingController userIdTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add User")),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            controller: userIdTextController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            controller: titleTextController,
          ),
        ),
        ElevatedButton(
          child: Text("Add"),
          onPressed: () => {UserProvider().addUser(titleTextController.text.toString(), int.parse(userIdTextController.text.toString()))},
        )
      ]),
    );
  }
}
