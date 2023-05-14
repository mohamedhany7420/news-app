import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/components/components.dart';
import 'package:untitled10/cupit/cupit.dart';
import 'package:untitled10/cupit/states.dart';

class businessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscupit , newsstates>(
        listener: (context, state) {},
        builder: (context, state) {
         var list =newscupit.get(context).business;
          return ConditionalBuilder(
              condition: state is! loadingstate,
              builder: (context) => ListView.separated(
                  itemBuilder: (context, index) => item(list[index],context),
                  separatorBuilder: (context, index) => divider(),
                  itemCount: list.length,
              ),
              fallback:(context) => Center(child: CircularProgressIndicator()),
          );
        } ,
    );
  }
}
