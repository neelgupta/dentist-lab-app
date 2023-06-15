import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarterPageScreen extends StatefulWidget {
  const StarterPageScreen({Key? key}) : super(key: key);

  @override
  State<StarterPageScreen> createState() => _StarterPageScreenState();
}

class _StarterPageScreenState extends State<StarterPageScreen> {

  bool isGalleryVisible= false;

  void showGallery() {
    setState(() {
      isGalleryVisible = !isGalleryVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width  = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: SizedBox(
              height:MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: height*0.33,
                      decoration: const BoxDecoration(
                          color: Color(0xFF116D6E),
                          image: DecorationImage(image: AssetImage("assets/image/StartPage.png"),
                              fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                      ),
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 15,top: 40),
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                              ),
                            ],
                          ))
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dental Prosthetics",style: GoogleFonts.lato(fontSize: 19,fontWeight: FontWeight.w700,),),
                          SizedBox(height: 5,),
                          Text("AED 800",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFFA0A0A0)),),
                          SizedBox(height: height*0.020,),
                          Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                          SizedBox(height: height*0.020,),
                          Text("Desription",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,),),
                          SizedBox(height: height*0.020,),
                          isGalleryVisible ? Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                              "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                              " It has survived not only five centuries, but also the leap into electronic typesetting, "
                              "remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, "
                              "and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF707070)),maxLines: 12,overflow: TextOverflow.ellipsis,)
                              : Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                              "when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                            style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF707070)),maxLines: 12,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: height*0.020,),
                          Visibility(
                            visible: isGalleryVisible,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                                SizedBox(height: height*0.020,),
                                Text("Gallery",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,),),
                                SizedBox(height: height*0.020,),
                                SizedBox(
                                  height: height*0.17,
                                  child: ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: height*0.20,
                                          width: width*0.37,
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(image: AssetImage("assets/image/gallery1.png"),fit: BoxFit.fill)
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) {
                                      return SizedBox(width: width*0.025,);
                                      },
                                      itemCount: 6),
                                ),
                                SizedBox(height: height*0.030,),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showGallery();
                            },
                            child: isGalleryVisible ? Container(
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Color(0xFF116D6E))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("View Less",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xFF116D6E)),),
                                    SizedBox(width: 15,),
                                    Icon(Icons.expand_less_rounded,color: Color(0xFF116D6E),)
                                  ],
                                ),
                              ),
                            )
                                : Container(
                              decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Color(0xFF116D6E))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("View More Desription",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700,color: Color(0xFF116D6E)),),
                                    SizedBox(width: 15,),
                                    Icon(Icons.expand_more_rounded,color: Color(0xFF116D6E),)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.020,),
                          Divider(thickness: 1,color: Color(0xFFE7E7E7),),
                          SizedBox(height: height*0.020,),
                          Text("You May Like",style: GoogleFonts.lato(fontSize: 17,fontWeight: FontWeight.w600,),),
                          SizedBox(height: height*0.020,),
                          SizedBox(
                            height: height*0.25,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 85,
                                        width: 85,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8),
                                            image: DecorationImage(image: AssetImage("assets/image/gallery3.png"),fit: BoxFit.cover)
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Text("Orthodontic\nAppliances",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(width: width*0.030,);
                                },
                                itemCount: 5),
                          ),
                          Row(
                            children: [
                              Container(
                                height: height*0.062,
                                width: width*0.17,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Color(0xFF116D6E)),
                                ),
                                child: Center(child: Image(height: 20,image: AssetImage("assets/image/Edit icon.png"))),
                              ),
                              SizedBox(width: width*0.030,),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF116D6E),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Color(0xFF116D6E)),
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                      },
                                      child: Text("Contact Now",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.white),textAlign: TextAlign.center,)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: height*0.030,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
