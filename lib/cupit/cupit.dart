import 'package:flutter/material.dart';
import 'package:untitled10/cupit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/modules/business.dart';
import 'package:untitled10/modules/science.dart';
import 'package:untitled10/modules/settings.dart';
import 'package:untitled10/modules/sports.dart';
import 'package:untitled10/network/remote/cachhelper.dart';
import 'package:untitled10/network/remote/diohelper.dart';
class newscupit extends Cubit<newsstates>
{
  newscupit() : super(initialState());

  static newscupit get(context) => BlocProvider.of(context);
  int tappedIndex= 0;
  bool isdark =true;
  List<BottomNavigationBarItem> bottomitems =
      [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.business_center
            ),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.science_outlined
          ),
          label: 'Science',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.sports_soccer_sharp
          ),
          label: 'Sports',
        ),
      ];
  List<Widget> screens =[
    businessScreen(),
    scienceScreen(),
    sportsScreen(),
  ];
  void changeindex (int index){
    tappedIndex = index;
    emit(navBarState());
  }
  List <dynamic> business=[];
  void getbusiness(){
    emit(loadingstate());
    DioHelber.GetData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category' :'business',
          'apikey' : 'fab0088f39514a6fa4125564f1642a0a'
        }
    ).then((value){
      business=value.data['articles'];
      print(business.toString()) ;
      //print(business);
      emit(businessstatesuccess());
    }).catchError((error){
print(error.toString());
emit(businessstateerror(error.toString()));
    });
  }

  List <dynamic> science=[];
  void getsience(){
    emit(loadingstate());
    DioHelber.GetData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category' :'science',
          'apikey' : 'fab0088f39514a6fa4125564f1642a0a'
        }
    ).then((value){
      science=value.data['articles'];
      print(business.toString()) ;
      emit(sciencestatesuccess());
    }).catchError((error){
      print(error.toString());
      emit(sciencestateerror(error.toString()));
    });
  }

  List <dynamic> sports=[];
  void getsports(){
    emit(loadingstate());
    DioHelber.GetData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category' :'sports',
          'apikey' : 'fab0088f39514a6fa4125564f1642a0a'
        }
    ).then((value){
      sports=value.data['articles'];
      print(sports.toString()) ;
      emit(sportsstatesuccess());
    }).catchError((error){
      print(error.toString());
      emit(sportsstateerror(error.toString()));
    });
  }
  List <dynamic> search=[];
  void getsearch(value){
    emit(loadingstate());
    DioHelber.GetData(
        url: 'v2/everything',
        query: {
          'q' :'$value',
          'apikey' : 'fab0088f39514a6fa4125564f1642a0a'
        }
    ).then((value){
      search=value.data['articles'];
      emit(searchstatesuccess());
    }).catchError((error){
      print(error.toString());
      emit(searchstateerror(error.toString()));
    });
  }
    void changeMode({ bool? shared}){
    if(shared != null)
      isdark= shared;
    else
      isdark = !isdark;
      cashHelper.putBool(key: 'isdark', value: isdark).then((value){
        emit(changeModeState());
      });

  }
}