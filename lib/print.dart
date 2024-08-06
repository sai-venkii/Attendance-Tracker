import 'package:flutter/foundation.dart';

void myDebugPrint(message){
  if(kDebugMode){
    print(message);
  }
}