import '../config.dart';

class Utils{
  static String getBaseUrl(){
    return "${Config.BASEURL}:${Config.PORT}";
  }
}