import 'dart:convert';

import 'package:dentalapp/services/lab_service/lab_quote_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../models/accept_labQuote_model.dart';
import '../models/labQuote_comment_model.dart';
import '../util/utils.dart';


class AcceptedQuoteDetailsScreen extends StatefulWidget {
  final String quoteId;
   const AcceptedQuoteDetailsScreen({Key? key,this.quoteId = ""}) : super(key: key);

  @override
  State<AcceptedQuoteDetailsScreen> createState() => _AcceptedQuoteDetailsScreenState();
}

class _AcceptedQuoteDetailsScreenState extends State<AcceptedQuoteDetailsScreen> {

  String titleComment = "";
  String description = "";
  bool isLoading = true;

  QuoteComments? quoteComments;
  List<CommentData> commentList = [];

  List<QuoteDatum> getAcceptQuote = [];
  AcceptLabQuoteModel? acceptLabQuoteModel;

  bool isCommentVisible= false;
  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void showComment() {
    setState(() {
      isCommentVisible = !isCommentVisible;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuoteDetail();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          body: !isLoading ? SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                      height: height*0.15,
                      decoration: const BoxDecoration(
                          color: Color(0xFF116D6E),
                          image: DecorationImage(image: AssetImage("assets/image/Group 12305.png"),
                              fit: BoxFit.fitWidth,alignment: Alignment.bottomCenter,opacity: 0.3)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width*0.020),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.keyboard_backspace,color: Colors.white,)),
                            ),
                            Spacer(),
                            Text("Quote Detail",style: GoogleFonts.lato(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.white,)),
                            Spacer(),
                            SizedBox(height: height*0.050,width: width*0.050),
                          ],
                        ),
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: height*0.03,horizontal: width*0.055),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("${getAcceptQuote[0].title}",style: GoogleFonts.lato(fontSize: 16,fontWeight: FontWeight.w600 )),
                                Spacer(),
                                if(getAcceptQuote[0].quoteStatus!.first.labStatus=="deliveryRejected")
                                Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF414141),
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(vertical: height*0.0061,horizontal: width*0.025),
                                      child: Text("${getAcceptQuote[0].quoteStatus!.first.labStatus}",style: GoogleFonts.lato(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.white)),
                                    )),
                                if(getAcceptQuote[0].quoteStatus!.first.labStatus=="workStarted")
                                  Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFFD059),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: height*0.0065,horizontal: width*0.032),
                                        child: Text("${getAcceptQuote[0].quoteStatus!.first.labStatus}",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400)),
                                      )),
                              ],
                            ),
                            SizedBox(height: height*0.010,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: width*0.7,
                                  child: Text("${getAcceptQuote[0].description}",
                                      style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(width: width*0.020,),

                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            const Divider(
                              thickness: 1,
                              color: Color(0xFFE7E7E7),
                            ),
                            SizedBox(height: height*0.020,),
                            Row(
                              children: [
                                Text("Subtotal :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                                Spacer(),
                                Text("AED ${getAcceptQuote[0].orderDetails!.first.totalAmount}",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),

                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Row(
                              children: [
                                Text("Advance 30% (Paid)",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                                Spacer(),
                                Text("AED ${getAcceptQuote[0].orderDetails!.first.advanceAmount}",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),
                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Row(
                              children: [
                                Text("Priority :",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF707070))),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xFF707070),
                                    borderRadius: BorderRadius.circular(5)
                                  ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.006),
                                      child: Text("${getAcceptQuote[0].priority}",style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.white),textAlign: TextAlign.center),
                                    )),
                              ],
                            ),
                            SizedBox(height: height*0.022,),
                            Row(
                              children: [
                                Text("Clinic Name ",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,)),
                                Spacer(),
                                Text("${getAcceptQuote[0].clinicDetails!.first.clinicName}",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w600,)),
                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Image(image: AssetImage("assets/image/finalLocation.png")),
                                    SizedBox(width: width*0.015,),
                                    Text("${getAcceptQuote[0].clinicDetails!.first.country}",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                                  ],
                                ),
                                SizedBox(width: width*0.030,),
                                Row(
                                  children: [
                                    Image(image: AssetImage("assets/image/phone.png")),
                                    SizedBox(width: width*0.015,),
                                    Text("${getAcceptQuote[0].clinicDetails!.first.countryCode} ${getAcceptQuote[0].clinicDetails!.first.mobileNumber}  ",style: GoogleFonts.lato(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xFF116D6E))),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: height*0.020,),
                            Text("Toronto. DE 63324",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Color(0xFF252525))),
                            isCommentVisible ? SizedBox(height: height*0.022,) : SizedBox(height: height*0.2,),
                            Container(
                              height: height*0.064,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Color(0xFF116D6E)
                              ),
                              child: TextButton(
                                  onPressed: () {
                                    showCommentBox(context);
                                  },
                                  child: Text("Share Comment",style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w500,color: Colors.white))),
                            ),
                            SizedBox(height: height*0.025,),
                            InkWell(
                              onTap: () {
                                showComment();
                              },
                              child: Row(
                                children: [
                                  Text("Comments",style: GoogleFonts.lato(fontSize: 18,fontWeight: FontWeight.w600 )),
                                  Spacer(),
                                  !isCommentVisible ? Icon(Icons.expand_more_rounded) : Icon(Icons.expand_less_rounded)
                                ],
                              ),
                            ),
                            SizedBox(height: height*0.010,),
                            Visibility(
                              visible: isCommentVisible,
                              child: Container(
                                width: width,
                                height: height*0.5,
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Divider(
                                            thickness: 1,
                                            color: Color(0xFFE7E7E7),
                                          ),
                                          SizedBox(height: height*0.010,),
                                          Text(commentList[index].isMessage=="lab"? commentList[index].clinicDetails!.first.clinicName ?? "" :  commentList[index].labDetails!.first.labName ?? "",
                                              style: GoogleFonts.lato(fontSize: 15,fontWeight: FontWeight.w700 )),
                                          SizedBox(height: height*0.010,),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                width: width*0.7,
                                                child: Text("${commentList[index].comment}",
                                                    style: GoogleFonts.lato(fontSize: 13,fontWeight: FontWeight.w400,),maxLines: 2,overflow: TextOverflow.ellipsis),
                                              ),
                                              SizedBox(width: width*0.020,),
                                            ],
                                          ),
                                          SizedBox(height: height*0.010,),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return SizedBox(height: height*0.010,);
                                    },
                                    itemCount: commentList.length),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ) : Center(child: CircularProgressIndicator(),),
        ));
  }
  void showCommentBox(BuildContext context){
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Form(
                key: formKey,
                autovalidateMode: autoValidate,
                child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: titleController,
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please Enter Title';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF707070), ),
                        ),

                        labelText: 'Title',labelStyle: const TextStyle(color: Color(0xff707070)),
                        hintText: 'Title',
                        hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                        contentPadding:  EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.03),
                      ),
                    ),
                    SizedBox(height: height*0.015,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: descriptionController,
                      keyboardType: TextInputType.name,
                      maxLines: 3,
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return 'Please Enter Comment';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF707070)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF707070), ),
                        ),
                        labelText: 'Comment',labelStyle: const TextStyle(color: Color(0xff707070)),
                        hintText: 'Comment',
                        hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color(0xFF707070)),
                        contentPadding:  EdgeInsets.symmetric(vertical: height*0.02,horizontal: width*0.03),
                      ),
                    ),
                    SizedBox(height: height*0.02,),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Color(0xFF116D6E)),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: width*0.1, vertical:height*0.02)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            addQuoteComments();
                          } else {
                            autoValidate = AutovalidateMode.always;
                          }
                        },
                        child: Text("Share Comment",
                            style: GoogleFonts.lato(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ))),
                  ],
                ),
              ),
            )
        );
      },
    );
  }



  addQuoteComments() async {
    Utils.showLoadingDialog(context);
    var body = {
      "quoteId": widget.quoteId,
      "title": titleController.text,
      "comment": descriptionController.text
    };
    Response response = await GetLabQuote.addQuoteComment(body: body);
    Navigator.pop(context);
    if(response.statusCode == 200) {
      titleController.text = "";
      descriptionController.text = "";
      Navigator.pop(context);
      getQuoteComments();
      Utils.showSuccessToast(jsonDecode(response.body)['message']);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }

  getQuoteComments() async {
    commentList.clear();
    var body = {
      "quoteId": widget.quoteId,
    };
    Response response = await GetLabQuote.getQuoteComment(body: body);
    if(response.statusCode == 200) {
      quoteComments = QuoteComments.fromJson(jsonDecode(response.body));
      commentList.addAll(quoteComments!.commentData ?? []);
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    setState(() {});
  }


  getQuoteDetail() async {
    var body = {
      "quoteId": widget.quoteId,
    };
    Response response = await GetLabQuote.getAcceptQuotes(body: body);
    if(response.statusCode == 200) {
      AcceptLabQuoteModel acceptLabQuoteModel = AcceptLabQuoteModel.fromJson(jsonDecode(response.body));

      if(acceptLabQuoteModel.success == true && acceptLabQuoteModel.quoteData != null){
        getAcceptQuote.addAll(acceptLabQuoteModel.quoteData ?? []);
      }

    } else if (response.statusCode == 401) {
      Utils.logout(context);
    }
    isLoading = false;
    setState(() {});
  }


}

