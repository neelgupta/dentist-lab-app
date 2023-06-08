import 'package:dentalapp/screen/manage_profile_3.dart';
import 'package:dentalapp/services/helper_fun.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ManageProfile2 extends StatefulWidget {
  const ManageProfile2({Key? key}) : super(key: key);

  @override
  State<ManageProfile2> createState() => _ManageProfile2State();
}

class _ManageProfile2State extends State<ManageProfile2> {
  TextEditingController medicalLicenseController = TextEditingController();
  TextEditingController tradeLicenseController = TextEditingController();
  TextEditingController trnNumberController = TextEditingController();
  TextEditingController totalDeviceController = TextEditingController();

  String? profile;
  PickedFile? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/01.png"),
                        fit: BoxFit.fill)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image(
                                image: AssetImage("assets/image/left.png"),
                                fit: BoxFit.fill)),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.center,
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.white, width: 1),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/image/Ellipse 108.png"),
                                fit: BoxFit.fill)),
                        child: Text(
                          "N",
                          style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.057, vertical: height * 0.027),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2/",
                          style: GoogleFonts.lato(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "6",
                          style: GoogleFonts.lato(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFA0A0A0)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Additional",
                      style: GoogleFonts.lato(
                          fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLength: 15,
                      textInputAction: TextInputAction.next,
                      controller: medicalLicenseController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color(0xFF707070))),
                        labelText: 'Medical License Number',
                        hintText: '123456789',
                        counterText: "",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF707070)),
                        contentPadding: const EdgeInsets.only(
                            left: 18, top: 16, bottom: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [3, 3, 3],
                      radius: Radius.circular(12),
                      color: Color(0xFF116D6E),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: height * 0.13,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFFF5F7F7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  openBottonSheet();
                                },
                                child: Container(
                                  height: height * 0.065,
                                  width: width * 0.15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image/camera.png"),
                                          fit: BoxFit.none)),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text("Upload file",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLength: 10,
                      textInputAction: TextInputAction.next,
                      controller: tradeLicenseController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color(0xFF707070))),
                        labelText: 'Trade License Number',
                        hintText: '123456789',
                        counterText: "",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF707070)),
                        contentPadding: const EdgeInsets.only(
                            left: 18, top: 16, bottom: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [3, 3, 3],
                      radius: Radius.circular(12),
                      color: Color(0xFF116D6E),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: height * 0.13,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFFF5F7F7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Container(
                                  height: 42,
                                  width: 42,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image/camera.png"),
                                          fit: BoxFit.none)),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text("Upload file",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLength: 17,
                      textInputAction: TextInputAction.next,
                      controller: trnNumberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color(0xFF707070))),
                        labelText: 'TRN Number',
                        hintText: '123456789',
                        counterText: "",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF707070)),
                        contentPadding: const EdgeInsets.only(
                            left: 18, top: 16, bottom: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [3, 3, 3],
                      radius: Radius.circular(12),
                      color: Color(0xFF116D6E),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: height * 0.13,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFFF5F7F7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Container(
                                  height: height * 0.065,
                                  width: width * 0.15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image/camera.png"),
                                          fit: BoxFit.none)),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text("Upload file",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      maxLength: 10,
                      textInputAction: TextInputAction.next,
                      controller: totalDeviceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                const BorderSide(color: Color(0xFF707070))),
                        labelText: 'Total Number of devices used',
                        hintText: '123456789',
                        counterText: "",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF707070)),
                        contentPadding: const EdgeInsets.only(
                            left: 18, top: 16, bottom: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [3, 3, 3],
                      radius: Radius.circular(12),
                      color: Color(0xFF116D6E),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: height * 0.13,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xFFF5F7F7),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  _pickImage();
                                },
                                child: Container(
                                  height: height * 0.065,
                                  width: width * 0.15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/image/camera.png"),
                                          fit: BoxFit.none)),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text("Upload file",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF707070)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.065,
                    ),
                    Container(
                      height: height * 0.064,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFFA0A0A0)),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ManageProfile3(),
                                ));
                          },
                          child: Text("Continue",
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white))),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  openBottonSheet() {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_camera,
                      color: Color(0xFF116D6E),
                      size: 38,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                          String chooseimage =
                              await helperFun.pickImage(ImageSource.camera);
                          if (chooseimage.isNotEmpty) {
                            setState(() {
                              profile = chooseimage;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.2))),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            child: Text("Camera",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 12)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.photo_camera_back,
                      color: Color(0xFF116D6E),
                      size: 38,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: InkWell(
                        onTap: () async {
                          Navigator.pop(context);
                          String? takeimage =
                              await helperFun.pickImage(ImageSource.gallery);
                          setState(() {
                            profile = takeimage;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.1))),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 8),
                            child: Text("Gallery",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 12)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
