import 'package:dio/dio.dart';
import 'dart:async';

import '../config.dart';


/**
 * 封装一层http请求
 */
class HttpUtils{
  static Dio dio;

  /*http request options*/
  static const String ENV = Config.ENV;//环境
  static const String BASEURL = Config.BASEURL;//host
  static const String VERSION = Config.VERSION;//版本号
  static const int CONNECT_TIMEOUT = 10000;
  static const int RECEIVE_TIMEOUT = 3000;


  /// http request methods
  static const String GET = 'get';
  static const String POST = 'post';


  /**
   * request 请求方法
   */
  static Future<Map> request(url, { data,method }) async {
    data = data ?? {};
    method = method ?? "GET";

    Dio dio = createInstance();

    var result;

    try {
      Response response = await dio.request(url, data: data, options: new Options(method: method));

      result = response.data;

      /// 打印响应相关信息
      print('响应数据：' + response.toString());
    } on DioError catch (e) {
      /// 打印请求失败相关信息
      print('请求出错：' + e.toString());
    }

    return result;

  }

  /**
   * 创建dio对象
   */
  static Dio createInstance(){
    if(dio == null){

      BaseOptions options = new BaseOptions(
        baseUrl: BASEURL + '/' + VERSION,
        connectTimeout: CONNECT_TIMEOUT,
        receiveTimeout: RECEIVE_TIMEOUT
      );

      dio = new Dio(options);
      dio.options.headers['Content-Type'] = "application/json;charset=UTF-8";
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          return 'PROXY 192.168.102.189:8888';
        };
      };
    }

    return dio;
  }


}