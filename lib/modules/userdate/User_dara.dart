import 'package:flutter/material.dart';
import 'package:todaynews/models/user.dart';

class UserScreen extends StatelessWidget {
  //const UserScreen({Key? key}) : super(key: key);
  List<UserModel> user = [
    UserModel(id: 1, name: "Ahmed mAnO", phone: "+20102566225"),
    UserModel(id: 2, name: "Ahmed Emad", phone: "+201089655454"),
    UserModel(id: 3, name: "Ahmed Ali", phone: "+2010255661455"),
    UserModel(id: 4, name: "Aya Mostafa", phone: "+2010582648525"),
    UserModel(id: 5, name: "Ebrahim Osama", phone: "+20116562566"),
    UserModel(id: 6, name: "Asmaa Moh", phone: "+20104556225"),
    UserModel(id: 7, name: "Asmaa Amr", phone: "+20104556225"),
    UserModel(id: 8, name: "Asmaa MAnO", phone: "+20104556225"),
    UserModel(id: 9, name: "Ali Moh", phone: "+20104556225"),
    UserModel(id: 10, name: "Ali Hisham", phone: "+20104556225"),
    UserModel(id: 11, name: "Ebrihim Moh", phone: "+20104556225"),
    UserModel(id: 12, name: "Osama Moh", phone: "+20104556225"),
    UserModel(id: 13, name: "Ma Moh", phone: "+20104556225"),
    UserModel(id: 14, name: "nana Moh", phone: "+20104556225"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
        itemBuilder: (_, index) => buildUserItem(user[index]),
        separatorBuilder: (_, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 30),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: user.length,
      ),
    );
  }

  Widget buildUserItem(UserModel users) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                '${users.id}',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${users.name}',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${users.phone}',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
