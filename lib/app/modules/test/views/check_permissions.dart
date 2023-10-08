import 'package:permission_handler/permission_handler.dart';

class CheckPermission {

  Future <bool> isStoragePermission ()async{
    var isStorage = await Permission.storage.status ;
    var isAccessLo = await Permission.accessMediaLocation.status ;
    var isAccessEx = await Permission.manageExternalStorage.status ;

    if (!isStorage.isGranted || !isAccessLo.isGranted || !isAccessEx.isGranted){
      await Permission.storage.request() ;
      await Permission.accessMediaLocation.request();
      await Permission.manageExternalStorage.request();

      if (!isStorage.isGranted || !isAccessLo.isGranted || !isAccessEx.isGranted){
        return false ;
      }else {
        return true ;
      }
    }else {
      return true ;
    }
  }
}