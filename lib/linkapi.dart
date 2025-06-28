



class AppLink {

  static const String server = "http://bessemhasni.tn/mealexpress";

  static const String imagestatic = "http://bessemhasni.tn/mealexpress/upload";

//========================== Image ============================
  static const String imageCategories = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";



  //===============Auth================//

  static const String signUp = "$server/delivery/auth/signup.php";
  static const String verifycodessignup = "$server/delivery/auth/verfiycode.php";
  static const String login = "$server/delivery/auth/login.php";
  static const String resend = "$server/delivery/auth/resend.php";



  //===============ForgetPassword================//

  static const String checkEmail = "$server/delivery/forgetpassword/checkemail.php";
  static const String resetPassword = "$server/delivery/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/delivery/forgetpassword/verifycode.php";

//===============orders======================//

  static const String viewpendingorders = "$server/delivery/orders/pending.php";
  static const String viewordersaccepted = "$server/delivery/orders/accepted.php";
  static const String ordersarchive = "$server/delivery/orders/archive.php";
  static const String ordersapprove = "$server/delivery/orders/approve.php";
  static const String ordersdone = "$server/delivery/orders/done.php";
  static const String ordersdetails = "$server/delivery/orders/details.php";








}