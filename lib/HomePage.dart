import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_test/DetailsPage.dart';
import 'package:http_test/UserService.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final items  = List.generate(50, (i) => i);
  late Future<List<User>> futureUsers;
  @override
  void initState() {
    super.initState();
    futureUsers = UserService().getUser();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('people'),
          ),
          body: Center(
            child: FutureBuilder<List<User>>(future: futureUsers,
              builder: ( context, AsyncSnapshot snapshot) {
              if (snapshot.hasData){
                return ListView.separated(
                    itemBuilder: (context, index) {
                      User user = snapshot.data?[index];
                      return ListTile(
                        title: Text(user.email),
                        subtitle: Text(user.name.first),
                        trailing: Icon(Icons.chevron_right_outlined),
                        onTap: ()=> openPage(context, user),
                      );
                    }, separatorBuilder
                    : (context, index){
                     return Divider(color: Colors.black26,);
                },
                    itemCount: snapshot.data!.length);
              } else if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              }
              return const CircularProgressIndicator();
              },

            ),
          )
      ),
    );
  }
}
  openPage(context, User user){
   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(user: user,)));
  }

// ListView.builder(
// itemCount: items.length,
// itemBuilder: (context, index){
// final item = items[index];
// return ListTile(
// title: Text('Item $item') ,
// subtitle: Text('my Subtitle'),
// onTap: ()=> openPage(context),
// trailing: Icon(Icons.chevron_right_outlined),
// );
// })