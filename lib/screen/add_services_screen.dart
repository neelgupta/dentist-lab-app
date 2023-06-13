import 'dart:io';
import 'package:dentalapp/screen/services_%20screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class AddServicesScreen extends StatefulWidget {
  const AddServicesScreen({Key? key}) : super(key: key);

  @override
  State<AddServicesScreen> createState() => _AddServicesScreenState();
}

class _AddServicesScreenState extends State<AddServicesScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController servicePriceController = TextEditingController();


  bool showPickOption = true;
  File? serviceImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(pickedImage != null){
        serviceImage = File(pickedImage.path);
        showPickOption = false;
      }
      // imageFile = pickedImage;
    });
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height*0.24,
                    decoration: const BoxDecoration(
                        color: Color(0xFF116D6E),
                        image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                            fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                    ),
                    child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 15,top: height*0.040),
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                            ),
                            SizedBox(height: height*0.05,),
                            Text("Add Services",style: GoogleFonts.lato(fontSize: 32,fontWeight: FontWeight.w600,color: Colors.white,),),
                          ],
                        ))
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.035,vertical: height*0.027),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      SizedBox(height: height*0.020 ,),
                      Text("Services",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,),),
                      SizedBox(height: height*0.020,),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: titleController,
                        // validator: (value) {
                        //   if(value == null || value.isEmpty){
                        //     return 'Please Enter Lab Name';
                        //   }
                        //   return null;
                        // },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF707070))
                          ),
                          labelText: 'Title',
                          hintText: 'Enter Title',
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                          contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                        ),
                      ),
                      SizedBox(height: height*0.020,),
                      TextFormField(
                        textAlign: TextAlign.start,
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        minLines: 2,//Normal textInputField will be displayed
                        maxLines: 6,
                        textAlignVertical: TextAlignVertical.top,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please Enter Description';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF707070))
                          ),
                          labelText: 'Description',
                          labelStyle: TextStyle(fontSize: 14,),
                          hintText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                              'when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          hintStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070),),
                          contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16,right: 5),
                        ),
                      ),
                      SizedBox(height: height*0.020,),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF707070)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Text("AED",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070),),),
                              SizedBox(width: 5,),
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: VerticalDivider(
                                  thickness: 1,
                                  width: 5,
                                  color: Color(0xFF707070),
                                ),
                              ),
                              SizedBox(width: 5,),
                              Expanded(
                                child: Container(
                                  child: TextFormField(
                                    maxLength: 10,
                                    controller: servicePriceController,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Sevice Price",
                                        counterText: "",
                                        contentPadding: EdgeInsets.only(bottom: 13,top: 5,left: 5)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.020,),
                      Divider(height: 5,thickness: 1,color: Color(0xFFE7E7E7),),
                      SizedBox(height: height*0.020,),
                      Text("Services Images",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,),),
                      SizedBox(height: height*0.020,),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: [3, 3, 3],
                        radius: Radius.circular(12),
                        color: Color(0xFF116D6E),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: height*0.13,
                            width: MediaQuery.of(context).size.width,
                            color: Color(0xFFF5F7F7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (serviceImage != null)
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Container(
                                        width: 100,
                                        height: 80,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(image: FileImage(serviceImage!),fit: BoxFit.fill),
                                            borderRadius: BorderRadius.circular(12)
                                        ),
                                      ),
                                    ),
                                  ),
                                if (showPickOption)
                                  InkWell(
                                    onTap: () {
                                      _pickImage();
                                    },
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: Colors.white,
                                                image: DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text("Upload Services Image",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)))
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.020),
                  child: Container(
                    height: height*0.064,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF116D6E)
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesScreen(),));
                        },
                        child: Text("Save",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                  ),
                ),
                SizedBox(height: height*0.025,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
