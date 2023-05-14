import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/components/components.dart';
import 'package:untitled10/cupit/cupit.dart';
import 'package:untitled10/cupit/states.dart';

class searchScreen extends StatelessWidget {
TextEditingController searchControl= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newscupit,newsstates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = newscupit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: textForm(
                    control: searchControl,
                    textType: TextInputType.text,
                    Ltext: 'Search',
                    r:9.0,
                    pre: Icon(
                        Icons.search,
                      color: Colors.grey,
                    ),
                    ontap:
                     (value)
                    {
                      newscupit.get(context).getsearch(value);
                    },
                    valid: ( value)
                    {
                      if(value.toString().isEmpty)
                      {
                        return'search must not be empty';
                      }
                      return null;
                    },
                  ),
                ),
             Expanded(
               child: ListView.separated(
                  itemBuilder: (context, index) => item(list[index],context),
                  separatorBuilder: (context, index) => divider(),
                  itemCount: list.length,
               ),
             ),
              ],
            ),
          ),
        );
      },
    );
  }
}
