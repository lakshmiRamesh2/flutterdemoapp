import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/utils/my_shared_pref.dart';


abstract class LocalDataSource {

}

class LocalDataSourceImpl extends LocalDataSource {

  final MySharedPref mySharedPref;

  LocalDataSourceImpl({@required this.mySharedPref});
}