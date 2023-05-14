import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/cupit/states.dart';
import 'package:untitled10/layout/newslayout.dart';
import 'package:untitled10/network/remote/cachhelper.dart';
import 'components/themes.dart';
import 'cupit/cupit.dart';
import 'network/remote/diohelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelber.init();
  await cashHelper.init();
  bool isdark = cashHelper?.getBool(key: 'isdark')?? true;
  runApp( MyApp(isdark!));
}

class MyApp extends StatelessWidget {

  final bool isdark;
  MyApp(this.isdark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (BuildContext context) => newscupit()..changeMode(
            shared: isdark
        ),
        child: BlocConsumer<newscupit, newsstates>(
          listener:(context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: light,
              darkTheme: dark,
              themeMode: newscupit.get(context).isdark? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: newsapp(),
            );
          },
        ),
      );
  }
}
