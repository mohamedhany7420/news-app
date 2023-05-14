import 'package:untitled10/layout/newslayout.dart';

abstract class newsstates{}

class initialState extends newsstates{}

class navBarState extends newsstates{}
class loadingstate extends newsstates{}
class  businessstatesuccess extends newsstates{}
class businessstateerror extends newsstates{
  final String error;
  businessstateerror(this.error);
}
class  sciencestatesuccess extends newsstates{}
class sciencestateerror extends newsstates{
  final String error;
  sciencestateerror(this.error);
}
class  sportsstatesuccess extends newsstates{}
class sportsstateerror extends newsstates{
  final String error;
  sportsstateerror(this.error);
}
class  searchstatesuccess extends newsstates{}
class searchstateerror extends newsstates{
  final String error;
  searchstateerror(this.error);
}
class  changeModeState extends newsstates{}