import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'manage_profile_6.dart';

class ManageProfile5 extends StatefulWidget {
  const ManageProfile5({Key? key}) : super(key: key);

  @override
  State<ManageProfile5> createState() => _ManageProfile5State();
}

class _ManageProfile5State extends State<ManageProfile5> {
  TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
        child:Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  height: height*0.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/image/01.png"),fit: BoxFit.fill)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Image(image: AssetImage("assets/image/left.png"),fit: BoxFit.fill),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.white,width: 1),
                              image: DecorationImage(image: AssetImage("assets/image/Ellipse 108.png"),fit: BoxFit.fill)
                          ),
                          child: Text("N",style: GoogleFonts.lato(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("5/",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600),),
                          Text("6",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,color: Color(0xFFA0A0A0)),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("About Lab",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600),),
                      SizedBox(height: 20,),
                      TextFormField(
                        textAlign: TextAlign.start,
                        controller: descriptionController,
                        keyboardType: TextInputType.multiline,
                        minLines: 2,//Normal textInputField will be displayed
                        maxLines: 6,
                        textAlignVertical: TextAlignVertical.top,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xFF707070))
                          ),
                          labelText: 'Description',
                          labelStyle: TextStyle(fontSize: 14,),
                          hintText: 'Description',
                          hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070),),
                          contentPadding: EdgeInsets.only(left: 18,top: 16,bottom: 16),
                        ),
                      ),
                    ],),
                ),
                Spacer(),
                Padding(
                  padding:EdgeInsets.symmetric(horizontal: width*0.057,vertical: height*0.027),
                  child: descriptionController.text.isNotEmpty ?  Container(
                    height: height*0.064,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFF116D6E)
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile6(),));
                        },
                        child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                  ) :
                  Container(
                    height: height*0.064,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFA0A0A0)
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ManageProfile6(),));
                        },
                        child: Text("Continue",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                  )
                ),
                SizedBox(height: height*0.025,),
              ],
            ),
          ),
        ));
  }
}
