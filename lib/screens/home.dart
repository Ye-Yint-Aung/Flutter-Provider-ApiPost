import 'package:flutter/material.dart';
import 'package:flutter_provider_api_post/providers/user_provider.dart';
import 'package:flutter_provider_api_post/screens/add_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserProvider userListProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userListProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = userListProvider.getAllUser();
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Consumer<UserProvider>(
        builder: (context, value, child) => Provider.value(
          value: userProvider,
          child: ListView.builder(
            itemCount: value.userList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      SizedBox(child: Text(value.userList[index].userId.toString())),
                      SizedBox(
                        width: 200,
                        child: Text(
                          value.userList[index].title.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]),
                    Column(children: [
                      IconButton(icon: Icon(Icons.edit), onPressed: () => {}),
                      IconButton(icon: Icon(Icons.delete), onPressed: () => {}),
                    ])
                  ]),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => UserAddScreen()))},
        child: Icon(Icons.add),
      ),
    );
  }
}
