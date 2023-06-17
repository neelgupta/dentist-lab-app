import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PraPoSalSLabProfile extends StatefulWidget {
  const PraPoSalSLabProfile({Key? key}) : super(key: key);

  @override
  State<PraPoSalSLabProfile> createState() => _PraPoSalSLabProfileState();
}

class _PraPoSalSLabProfileState extends State<PraPoSalSLabProfile> {
  bool isLabDetails = false;

  void showAboutLab() {
    setState(() {
      isLabDetails = !isLabDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    double width = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.right -
        MediaQuery.of(context).padding.left;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.03,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: height * 0.04,
                        child: Image.asset(
                          "assets/image/Left1.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFEBEFEE)),
                      child: Center(
                          child: Center(
                              child: Text("N",
                                  style: GoogleFonts.lato(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF116D6E))))),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.topCenter,
                      height: height * 0.04,
                      child: Image.asset(
                        color: Colors.transparent,
                        "assets/image/Left1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  "Profile Info",
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: height * 0.025,
                ),
                Text(
                  "First Name",
                  style: GoogleFonts.lato(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF707070)),
                ),
                SizedBox(
                  height: height * 0.007,
                ),
                Text(
                  "John",
                  style: GoogleFonts.lato(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Text(
                  "Last Name",
                  style: GoogleFonts.lato(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF707070)),
                ),
                SizedBox(
                  height: height * 0.007,
                ),
                Text(
                  "Smith",
                  style: GoogleFonts.lato(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Text(
                  "Email",
                  style: GoogleFonts.lato(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF707070)),
                ),
                SizedBox(
                  height: height * 0.007,
                ),
                Text(
                  "user@gmail.com",
                  style: GoogleFonts.lato(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFE7E7E7),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                InkWell(
                  onTap: () {
                    showAboutLab();
                  },
                  child: Row(
                    children: [
                      Text(
                        "About Lab",
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      !isLabDetails
                          ? const Icon(Icons.expand_more_rounded)
                          : const Icon(Icons.expand_less_rounded)
                    ],
                  ),
                ),
                Visibility(
                  visible: isLabDetails,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Text(
                        "Lab Name",
                        style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF707070)),
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Text(
                        "Medical Lab",
                        style: GoogleFonts.lato(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Text(
                        "Mobile Number",
                        style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF707070)),
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Text(
                        "12345 67890",
                        style: GoogleFonts.lato(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Text(
                        "Land Line Number",
                        style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF707070)),
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Text(
                        "12345 67890",
                        style: GoogleFonts.lato(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Text(
                        "Email",
                        style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF707070)),
                      ),
                      SizedBox(
                        height: height * 0.007,
                      ),
                      Text(
                        "user@gmail.com",
                        style: GoogleFonts.lato(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color(0xFFE7E7E7),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                          " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                          " when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          style: GoogleFonts.lato(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF707070)),
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start),
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Row(
                        children: [
                          Text(
                            "Delivery Methods",
                            style: GoogleFonts.lato(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            "COD",
                            style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            "Payment Methods",
                            style: GoogleFonts.lato(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Text(
                            "Online Payment",
                            style: GoogleFonts.lato(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color(0xFFE7E7E7),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      Text(
                        "Working time",
                        style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            "Monday",
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "9:00 - 17:00",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            "Tuesday",
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "9:00 - 17:00",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            "Wednesday",
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "Closed",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            "Thursday",
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "Closed",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            "Friday",
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "Closed",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            "Saturday",
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "Closed",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Row(
                        children: [
                          Text(
                            "Sunday",
                            style: GoogleFonts.lato(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          const Spacer(),
                          Text(
                            "Closed",
                            style: GoogleFonts.lato(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF707070)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xFFE7E7E7),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Text(
                  "Services",
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                SizedBox(
                  height: height * 0.26,
                  child: ListView.builder(
                    itemCount: 6,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.015),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.18,
                                width: width * 0.38,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/image/gallery1.png"),
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(
                                height: height * 0.012,
                              ),
                              Text(
                                "Dental Prosthetics",
                                style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: height * 0.008,
                              ),
                              Text("AED 800",
                                  style: GoogleFonts.lato(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF707070))),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
