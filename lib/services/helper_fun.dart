import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';



class helperFun{
  static Future<String> pickImage(ImageSource imageSource)async{
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: imageSource);
    if(file != null){
      return file.path;
    }else{
      return  "";
    }
  }
}
class ApiHelper{
  static SharedPreferences? prefs;

  static setToken(String token){
    prefs!.setString('token', token);
  }

  static getToken() {
    return prefs!.getString('token');
  }

  static setUserType(type) {
    prefs!.setString('userType', type);
  }

  static getUserType(type) {
    return prefs!.getString('userType');
  }
}