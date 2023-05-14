import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelber{
  static Dio dio = Dio();

  static init()
  {
    dio = Dio(
        BaseOptions(
            baseUrl: 'https://newsapi.org/',
          receiveDataWhenStatusError: true,
         /* validateStatus: (statusCode){
            if(statusCode == null){
              return false;
            }
            if(statusCode >= 100 ){ // your http status code
              return true;
            }else{
              return statusCode >= 20 && statusCode < 30;
            }
          },*/
        )
    );
  }
 static  Future<Response> GetData({
  required String url,
    required Map<String,dynamic> query
}) async {
   return await dio.get(
       url,
     queryParameters: query
   );
}
}
