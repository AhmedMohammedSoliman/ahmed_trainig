import 'package:connectivity/connectivity.dart';

Future <bool> isConnect ()async{
  var connectivity = await Connectivity().checkConnectivity();
  if (connectivity == ConnectivityResult.mobile || connectivity == ConnectivityResult.wifi){
    return true ;
  }else {
    return false ;
  }
}