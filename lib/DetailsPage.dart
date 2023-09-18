
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UserService.dart';

class DetailsPage extends StatelessWidget {
  final User user;
  const DetailsPage({Key? key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name.first} ${user.name.last}'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.network(user.picture),
            SizedBox(
              height: 30,
            ),
            Text(user.email),
          ],
        ),
      ),
    );
  }
  goback( context){
    Navigator.pop(context);
  }
}
