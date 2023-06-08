import 'package:dentalapp/clinic_screen/setup_screen/profilesetup_2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

class ProfileSetUopOne extends StatefulWidget {
  const ProfileSetUopOne({Key? key}) : super(key: key);

  @override
  State<ProfileSetUopOne> createState() => _ProfileSetUopOneState();
}

class _ProfileSetUopOneState extends State<ProfileSetUopOne> {
  Position? p;
  bool isVisible = true;
  TextEditingController dateInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: true,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/image/01.png"),fit: BoxFit.fill)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: const [
                            SizedBox(width: 20,),
                            Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            alignment: Alignment.center,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: Colors.white,width: 1),
                                image: const DecorationImage(image: AssetImage("assets/image/Ellipse 108.png"),fit: BoxFit.fill)
                            ),
                            child: Text("N",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("1/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                            Text("3",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: const Color(0xFFA0A0A0)),),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Text("Clinic Details",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 20,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Clinic Name',
                            hintText: 'Clinic Name',
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Mobile Number',
                            hintText: '123456789',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Land Line Number',
                            hintText: '123456789',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Email Address',
                            hintText: 'user@gmail.com',
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          obscureText: isVisible,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Password',
                              hintText: 'Password',
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isVisible = !isVisible;
                                    });
                                  },
                                  child: const Image(image: AssetImage("assets/image/Vector.png")))
                          ),
                        ),
                        const SizedBox(height: 30,),
                        const Divider(
                          color: Color(0xFFE7E7E7),
                          thickness: 1,
                        ),
                        const SizedBox(height: 30,),
                        Text("Clinic Location ",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w600),),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'Country',
                            hintText: 'India',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'City',
                            hintText: 'Surat',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFF707070))
                          ),
                          child: Row(
                            children:  [
                              SizedBox(width: 18,),
                              InkWell(
                                onTap: (){
                                  getCurrentLocation();
                                },child: Image(image: AssetImage("assets/image/location.png"))),
                              Padding( 
                                padding: EdgeInsets.all(10),
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: Color(0xFF707070),
                                ),
                              ),
                              Text("Address",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),)
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF707070))
                            ),
                            labelText: 'P.O.Box',
                            hintText: 'P.O.Box',
                            counterText: "",
                            hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                            contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          maxLength: 10,
                          textInputAction: TextInputAction.next,
                          controller:dateInputController,
                          readOnly: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(color: Color(0xFF707070))
                              ),
                              labelText: 'Date of establishment',
                              hintText: '02/10/2023',
                              counterText: "",
                              hintStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                              contentPadding: const EdgeInsets.only(left: 18,top: 16,bottom: 16),
                              suffixIcon: InkWell(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime(2050));

                                    if (pickedDate != null) {
                                      dateInputController.text =
                                          DateFormat('dd MMMM yyyy').format(pickedDate);
                                    }
                                  },
                                  child: const Image(image: AssetImage("assets/image/date.png")))
                          ),
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xFFA0A0A0)
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const ProfileSetUpSecondScreen();
                                },));
                              },
                              child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                        ),
                        const SizedBox(height: 40,),
                      ],),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // ignore: unrelated_type_equality_checks
    if (!serviceEnabled == LocationPermission.denied) {
      await Geolocator.openLocationSettings();

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');

    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
