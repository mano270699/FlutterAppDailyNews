import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSceeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20),
                  )),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://pbs.twimg.com/profile_images/883859744498176000/pjEHfbdn.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.6),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "White flower",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    bottomEnd: Radius.circular(20),
                  )),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://pbs.twimg.com/profile_images/883859744498176000/pjEHfbdn.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.6),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "White flower",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(20),
                    bottomStart: Radius.circular(20),
                  )),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://pbs.twimg.com/profile_images/883859744498176000/pjEHfbdn.jpg'),
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.black.withOpacity(0.6),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "White flower",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
