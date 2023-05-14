import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/components/components.dart';
import 'package:untitled10/cupit/cupit.dart';
import 'package:untitled10/cupit/states.dart';
import 'package:untitled10/modules/search.dart';

class newsapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newscupit()..getbusiness()..getsience()..getsports()..changeMode(),
      child: BlocConsumer<newscupit, newsstates>(
        listener:(context, state) {} ,
        builder: (context, state) {
          var cupit = newscupit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  'News app'
              ),
              actions: [
                IconButton(
                    icon: Icon(
                    Icons.brightness_2_outlined,
                ),
                  onPressed: (){
                    newscupit.get(context).changeMode();
                    print(newscupit.get(context).isdark.toString());
                  }
                ),
                IconButton(
                    onPressed: () {
                      navigateTo(context, searchScreen());
                    },
                    icon: Icon(
                      Icons.search
                    )
                )
              ],
            ),
            body: cupit.screens[cupit.tappedIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: cupit.tappedIndex,
              onTap: (index) {
                cupit.changeindex(index);
              },
              items: cupit.bottomitems
              ,
            ),
          );
        },
      ),
    );
  }
}
