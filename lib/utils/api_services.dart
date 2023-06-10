

class ApiServices {
  static String baseUrl = "https://energetic-kit-dove.cyclic.app/api/v1/";

  // Authorization apis

  static String signInApi = "${baseUrl}auth/signin";



  ///Clinic
  static String addClinicDetails = "${baseUrl}clinic/addClinicDetails";
  static String addaditionalClinicDetails = "${baseUrl}clinic/addaditionalClinicDetails";
  static String addClinicMangerDetails = "${baseUrl}clinic/addClinicMangerDetails";
  static String signUpApi = "${baseUrl}auth/signup";
  static String forgotPasswordApi = "${baseUrl}auth/forgotPassword";
  static String verifyOtpApi = "${baseUrl}auth/verifyOtp";
  static String resetPasswordApi = "${baseUrl}auth/resetPassword";


  // Lab APIs

  static String manageProfile1Api = "${baseUrl}lab/addLabDetails";
  static String manageProfile2Api = "${baseUrl}lab/labadditionalDetails";
  static String manageProfile3Api = "${baseUrl}lab/addLabMangersDetails";
  static String manageProfile5Api = "${baseUrl}lab/addAboutLab";
  static String manageProfile6Api = "${baseUrl}lab/labPaymentMethods";
}
