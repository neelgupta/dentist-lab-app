import 'package:dentalapp/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetSuccessfullScreen extends StatefulWidget {
  const ResetSuccessfullScreen({Key? key}) : super(key: key);

  @override
  State<ResetSuccessfullScreen> createState() => _ResetSuccessfullScreenState();
}

class _ResetSuccessfullScreenState extends State<ResetSuccessfullScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: goBack,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: height * 0.24,
                        decoration: const BoxDecoration(
                            color: Color(0xFF116D6E),
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/image/Group 12305.png"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.bottomCenter,
                                opacity: 0.3)),
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 15, top: 40),
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: const Icon(
                                        Icons.keyboard_backspace,
                                        color: Colors.white,
                                      )),
                                ),
                                SizedBox(
                                  height: height * 0.05,
                                ),
                                Text(
                                  "Reset Password",
                                  style: GoogleFonts.lato(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ))),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.057, vertical: height * 0.027),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.12,
                          ),
                          const Image(
                              height: 150,
                              image:
                                  AssetImage("assets/image/Group 12680.png")),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          Text(
                            "Password Reset Successful",
                            style: GoogleFonts.lato(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You can now sign into your account",
                            style: GoogleFonts.lato(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Container(
                        height: height * 0.065,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFF116D6E)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Text("Sign in Now",
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> goBack() async {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const LoginScreen();
      },
    ), (route) => false);
    return true;
  }
}
