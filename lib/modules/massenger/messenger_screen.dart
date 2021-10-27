import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: CircleAvatar(
        //   backgroundImage: NetworkImage(
        //     'https://scontent.fcai21-4.fna.fbcdn.net/v/t1.6435-9/181194340_1604278383095767_357835043001694819_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGYIQKPMcNmpBB-h9MnwKg3YGTa9FBdpclgZNr0UF2lyYQbA4DEUJHPeVIxz4ozWw7vKt5vmRw-OrqonaMlnI1A&_nc_ohc=I6QcSFy8f8MAX9ZexB2&_nc_ht=scontent.fcai21-4.fna&oh=97f8b7fc234e793ea6018f1f8daa449b&oe=612E15A5',
        //   ),
        //   // child: Image(
        //   //   image: NetworkImage(
        //   //       'https://scontent.fcai21-4.fna.fbcdn.net/v/t1.6435-9/181194340_1604278383095767_357835043001694819_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGYIQKPMcNmpBB-h9MnwKg3YGTa9FBdpclgZNr0UF2lyYQbA4DEUJHPeVIxz4ozWw7vKt5vmRw-OrqonaMlnI1A&_nc_ohc=I6QcSFy8f8MAX9ZexB2&_nc_ht=scontent.fcai21-4.fna&oh=97f8b7fc234e793ea6018f1f8daa449b&oe=612E15A5'),
        //   //   fit: BoxFit.cover
        //   // ),
        // ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://scontent.fcai21-4.fna.fbcdn.net/v/t1.6435-9/181194340_1604278383095767_357835043001694819_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGYIQKPMcNmpBB-h9MnwKg3YGTa9FBdpclgZNr0UF2lyYQbA4DEUJHPeVIxz4ozWw7vKt5vmRw-OrqonaMlnI1A&_nc_ohc=I6QcSFy8f8MAX9ZexB2&_nc_ht=scontent.fcai21-4.fna&oh=97f8b7fc234e793ea6018f1f8daa449b&oe=612E15A5',
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blueGrey),
          ),
          // Icon(Icons.camera_alt),
          // Icon(Icons.edit),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Container(
                    //color: Colors.black,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[900]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white54,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search",
                            style: TextStyle(color: Colors.white54),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildStoryItem(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                    itemCount: 10,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildChatsItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                  itemCount: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildStoryItem() => Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://scontent.fcai21-4.fna.fbcdn.net/v/t1.6435-9/181194340_1604278383095767_357835043001694819_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGYIQKPMcNmpBB-h9MnwKg3YGTa9FBdpclgZNr0UF2lyYQbA4DEUJHPeVIxz4ozWw7vKt5vmRw-OrqonaMlnI1A&_nc_ohc=I6QcSFy8f8MAX9ZexB2&_nc_ht=scontent.fcai21-4.fna&oh=97f8b7fc234e793ea6018f1f8daa449b&oe=612E15A5',
                  ),
                ),
                // CircleAvatar(
                //   radius: 8,
                //   backgroundColor: Colors.white,
                // )
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: 3, end: 2),
                  child: CircleAvatar(
                    radius: 7.5,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Ahmed mAnO Nada ',
              style: TextStyle(
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
  Widget buildChatsItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                  'https://scontent.fcai21-4.fna.fbcdn.net/v/t1.6435-9/181194340_1604278383095767_357835043001694819_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeGYIQKPMcNmpBB-h9MnwKg3YGTa9FBdpclgZNr0UF2lyYQbA4DEUJHPeVIxz4ozWw7vKt5vmRw-OrqonaMlnI1A&_nc_ohc=I6QcSFy8f8MAX9ZexB2&_nc_ht=scontent.fcai21-4.fna&oh=97f8b7fc234e793ea6018f1f8daa449b&oe=612E15A5',
                ),
              ),
              // CircleAvatar(
              //   radius: 8,
              //   backgroundColor: Colors.white,
              // )
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 3, end: 2),
                child: CircleAvatar(
                  radius: 7.5,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed mAnO",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Hi, Ahmed With U I want to tell u some thing about me ? ",
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text("10:40 pm", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
          )
        ],
      );
}
