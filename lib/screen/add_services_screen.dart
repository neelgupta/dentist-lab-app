import 'dart:convert';
import 'dart:io';
import 'package:dentalapp/screen/services_%20screen.dart';
import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
  var images;

  void removeImage(int index) {
    if (images.isNotEmpty && index < images.length) { 
      setState(() {
        images.removeAt(index);
        if(images.isEmpty){
          showPickOption = true;
        }
      });
    }
  }


  Future<void> pickImages() async {
    List<XFile> pickedImages = [];
    try {
      pickedImages = await ImagePicker().pickMultiImage();
    } catch (e) {
      print(e);
    }
    setState(() {
      images = pickedImages.map((XFile image) => File(image.path)).toList();
      showPickOption = false;
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
                                  child: const Icon(Icons.keyboard_backspace,color: Colors.white,)),
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
                              borderSide: const BorderSide(color: Color(0xFF707070))
                          ),
                          labelText: 'Title',
                          hintText: 'Enter Title',
                          hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                          contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
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
                              borderSide: const BorderSide(color: Color(0xFF707070))
                          ),
                          labelText: 'Description',
                          labelStyle: const TextStyle(fontSize: 14,),
                          hintText: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                              'when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070),),
                          contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16,right: 5),
                        ),
                      ),
                      SizedBox(height: height*0.020,),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF707070)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Row(
                            children: [
                              Text("AED",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF707070),),),
                              const SizedBox(width: 5,),
                              const Padding(
                                padding: EdgeInsets.all(5),
                                child: VerticalDivider(
                                  thickness: 1,
                                  width: 5,
                                  color: Color(0xFF707070),
                                ),
                              ),
                              const SizedBox(width: 5,),
                              Expanded(
                                child: TextFormField(
                                  maxLength: 10,
                                  controller: servicePriceController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Service Price",
                                      counterText: "",
                                      contentPadding: EdgeInsets.only(bottom: 13,top: 5,left: 5)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.020,),
                      const Divider(height: 5,thickness: 1,color: Color(0xFFE7E7E7),),
                      SizedBox(height: height*0.020,),
                      Text("Services Images",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600,),),
                      SizedBox(height: height*0.020,),
                      DottedBorder(
                        borderType: BorderType.RRect,
                        dashPattern: const [3, 3, 3],
                        radius: const Radius.circular(12),
                        color: const Color(0xFF116D6E),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: height*0.14,
                            width: MediaQuery.of(context).size.width,
                            color: const Color(0xFFF5F7F7),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (images != null)
                                  Visibility(
                                    visible: !showPickOption,
                                    child: SizedBox(
                                      height: height*0.13,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(left: width*0.020),
                                                child: Row(
                                                  children: [
                                                    Stack(
                                                      alignment: Alignment.topRight,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.symmetric(vertical: height*0.08,horizontal: width*0.08),
                                                          width: width*0.30,
                                                          height: height*0.15,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(12)
                                                          ),
                                                          child: Image.file(images[index],fit: BoxFit.fill,),
                                                        ),
                                                        Positioned(
                                                          right: width*0.012,
                                                          top: height*0.002,
                                                          child: InkWell(
                                                            onTap: () {
                                                              removeImage(index);
                                                            },
                                                            child: Container(
                                                              width: 23,
                                                              height: 23,
                                                              decoration: const BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  color: Colors.white,
                                                                  image: DecorationImage(image: AssetImage("assets/image/DeleteIcon.png")),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    // InkWell(
                                                    //   onTap: () {
                                                    //     pickImages();
                                                    //   },
                                                    //   child: Container(
                                                    //     padding: EdgeInsets.all(8),
                                                    //     width: width*0.30,
                                                    //     height: height*0.15,
                                                    //     decoration: BoxDecoration(
                                                    //       border: Border.all(color: Color(0xFF116D6E)),
                                                    //         image: DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none),
                                                    //         borderRadius: BorderRadius.circular(12)
                                                    //     ),
                                                    //   ),
                                                    // )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder: (context, index) {
                                            return SizedBox(width: width*0.005,);
                                          },
                                          itemCount: images.length ),
                                    ),
                                  ),
                                if (showPickOption)
                                  InkWell(
                                    onTap: () {
                                      pickImages();
                                    },
                                    child: Visibility(
                                      visible: showPickOption,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: Colors.white,
                                                image: const DecorationImage(image: AssetImage("assets/image/camera.png"),fit: BoxFit.none)
                                            ),
                                          ),
                                          const SizedBox(height: 5,),
                                          Text("Upload File",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFF707070)))
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
                        color: const Color(0xFF116D6E)
                    ),
                    child: TextButton(
                        onPressed: () {
                          setState(() {

                          });
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicesScreen(),));
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




