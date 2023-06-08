import 'package:image_picker/image_picker.dart';



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