// ignore_for_file: use_build_context_synchronously

import 'package:dentalapp/util/api_services.dart';
import 'package:dentalapp/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'manage_profile_6.dart';

class ManageProfile5 extends StatefulWidget {
  const ManageProfile5({Key? key}) : super(key: key);

  @override
  State<ManageProfile5> createState() => _ManageProfile5State();
}

class _ManageProfile5State extends State<ManageProfile5> {
  TextEditingController descriptionController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: SafeArea(
          child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      height: height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/image/01.png"),
                              fit: BoxFit.fill)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Image(
                                  image: AssetImage("assets/image/left.png"),
                                  fit: BoxFit.fill),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Container(
                              alignment: Alignment.center,
                              height: width * 0.18,
                              width: width * 0.18,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(Utils.getProfileImage()),
                                      fit: BoxFit.fill)),
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
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "5/",
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
                            height: 10,
                          ),
                          Text(
                            "About Lab",
                            style: GoogleFonts.lato(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            textAlign: TextAlign.start,
                            controller: descriptionController,
                            keyboardType: TextInputType.multiline,
                            minLines: 2,
                            maxLines: 6,
                            textAlignVertical: TextAlignVertical.top,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Description';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Color(0xFF707070))),
                              labelText: 'Description',
                              labelStyle: const TextStyle(
                                fontSize: 14,
                              ),
                              hintText: 'Description',
                              hintStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF707070),
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 18, top: 16, bottom: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.057,
                            vertical: height * 0.027),
                        child: Container(
                          height: height * 0.064,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFF116D6E)
                                  // descriptionController.text.isNotEmpty
                                  // ? 0xFF116D6E
                                  // : 0xFFA0A0A0)
                          ),
                          child: TextButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  manageProfile5();
                                } else {
                                  autoValidate = AutovalidateMode.always;
                                }
                              },
                              child: Text("Continue",
                                  style: GoogleFonts.lato(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white))),
                        )),
                    SizedBox(
                      height: height * 0.025,
                    ),
                  ],
                ),
              ))),
    );
  }

  manageProfile5() async {
    Utils.showLoadingDialog(context);
    var postUri = Uri.parse(ApiServices.manageProfile5Api);
    var bodyData = {
      "description": descriptionController.text.toString(),
    };
    var response = await http.post(
      postUri,
      body: jsonEncode(bodyData),
      headers: Utils.apiHeader,
    );
    Utils.logAPIResponse(
        body: bodyData,
        response: response,
        apiName: ApiServices.manageProfile5Api,
        function: "manageProfile5");
    Navigator.pop(context);
    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      if (map["status"] == 200) {
        Utils.setScreenStatus("6");
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ManageProfile6(),
            ));
        Utils.showErrorToast(map['message']);
      } else {
        Utils.showErrorToast(map['message']);
      }
    } else if (response.statusCode == 401) {
      Utils.logout(context);
    } else {
      Utils.showErrorToast(jsonDecode(response.body)['message']);
    }
  }
}
