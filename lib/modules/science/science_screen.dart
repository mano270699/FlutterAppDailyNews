import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:todaynews/layout/News_app/cubit/cubit.dart';
import 'package:todaynews/layout/News_app/cubit/states.dart';
import 'package:todaynews/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var articalList = NewsCubit.get(context).science;
        return buildArticalItem(articalList, context);
      },
      listener: (context, state) {},
    );
  }
}
