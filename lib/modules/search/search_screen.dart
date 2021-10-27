import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todaynews/layout/News_app/cubit/cubit.dart';
import 'package:todaynews/layout/News_app/cubit/states.dart';
import 'package:todaynews/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  //const SearchScreen({Key? key}) : super(key: key);
  var searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            title: Text('Search'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  keyboardType: TextInputType.text,
                  onChanged: (String value) {
                    NewsCubit.get(context).getSearch(value);
                  },
                  controller: searchControler,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "search..",
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
              Expanded(child: buildArticalItem(list, context, isSearch: true)),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
