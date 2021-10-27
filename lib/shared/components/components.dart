import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:todaynews/modules/web_view/web_view_screen.dart';
import 'package:todaynews/shared/components/shammer.dart';
import 'package:todaynews/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color color = Colors.blue,
  required String text,
  required Function function,
}) =>
    Container(
      width: width,

      //margin: const EdgeInsetsDirectional.only(start: 70, end: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: function(),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

Widget defaultFormText({
  required TextEditingController controller,
  IconData? suffixicon,
  required TextInputType type,
  required String lable,
  bool isPassword = false,
  VoidCallback? onTap,
  VoidCallback? onChange,
  required IconData prefixIcon,
}) =>
    TextFormField(
      keyboardType: type,
      obscureText: isPassword,
      controller: controller,
      validator: (text) {
        if (text == null || text.isEmpty) {
          return 'Text is empty';
        }
        return null;
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: lable,
          suffixIcon: Icon(suffixicon),
          prefixIcon: Icon(prefixIcon)),
      onTap: onTap,
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key('${model['id']}'),
      onDismissed: (direction) {
        TodoCubit.get(context).deleteStatus(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text('${model['time']}'),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                TodoCubit.get(context).updatestatus(
                  status: "done",
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                TodoCubit.get(context).updatestatus(
                  status: "archive",
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.archive,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

Widget buildNewsBusinessItem(articals, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(url: articals['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage('${articals['urlToImage']}'),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 140.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${articals['title']}",
                        style: Theme.of(context).textTheme.bodyText1,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Text(
                      "${articals['publishedAt']}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.blue,
      ),
    );
Widget buildArticalItem(list, context, {isSearch = false}) =>
    Conditional.single(
        context: context,
        conditionBuilder: (context) => list.length > 0,
        widgetBuilder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildNewsBusinessItem(list[index], context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length),
        fallbackBuilder: (context) => isSearch ? Container() : ShimmerList());

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));
