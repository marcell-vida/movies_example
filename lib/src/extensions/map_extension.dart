import 'package:flutter/cupertino.dart';

extension MapExtension on Map<String, dynamic> {
  T? get<T>(String key, {T? defaultValue}) {
    if(containsKey(key)){
      try {
        T t = this[key] as T;
        return t;
      } catch (e) {
        debugPrint('Error casting $key to type $T');
      }
    }
    return defaultValue;
  }
}