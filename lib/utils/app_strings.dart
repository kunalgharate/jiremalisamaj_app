

class AppStrings
{
  static List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  static var APP_NAME="LoveWorldSAT";
  static String imageBasePath = "assets/images/";
  static String base_url = "http://lwn.alphamobi.co/";
  static String api_url = "http://lwn.alphamobi.co/api/";

  //API's
  static String bannerapi = "ADSliderGetByAll";
  static String recentlyAddedShows = "ADVideoUrlGetOnly10";
  static String getAllComments = "ADGetAllCommentWithPagi";
  static String addComment = "ADCommentSaveUpdate";
  static String liveTv = "ADGetAllLiveUrlWithPagi";
  static String tvGuideListByDay = "ADTVGuide1GetByDay";
  static String getAllCategories = "ADGetAllCategoryWithPagi";
  static String getAllBookmarks = "ADBooKMarkGetByUserId";
  static String loginWithEmail = "ADUserCheckLoginByEmail";
  static String loginWithMobile = "ADUserCheckLogin";
  static String getVideosByCategorieId = "ADVideoUrlGetByCategoryId";
  static String getOtponMobile = "UIGetOtp";
  static String getOtpOnEmail = "UIGetOtpOnEmail";
  static String otpMatch = "adOtpMatch";
  static String createUser = "ADUserSave";
  static String updateUser = "ADUserUpdate";
  static var getVideById="ADVideoUrlGetById";
  static var addToBookmark="ADBookMarkSave";
  static var getUser="ADUserGetById";
//  static var getVideosByLanguage="ADVideoUrlGetByLanguageId";
  static var getVideosByLanguage="ADVideoGetByLanguageIdwithPagi";
 // static var notifications="ADNotificationGetByAll";
  static var notifications="ADGetAllNotificationWithPagi";
 // static var getVideosByTagId="ADVideoUrlGetByTagId";
  static var getVideosByTagId="ADVideoGetByTagIdwithPagi";
  //static var token="Bearer FeHLZRfCRIrlfvLSq05n12KvDWh80l9vw-yp5pDvaMIGETSBso4GOF8UY6kT3HLXow5LY_uRYKbEu3uve8dmAJ5RGQulv-A01e3tbvKSTlumYOgjNOvIKNH1HjCfXFxmDgp7sYffU5TG6fQf__npU59ZtfX0CLuVxccPNBwi5uGToqF3dBo1FS7H3X7ChSYpWYvPObmt5BWhpxN415ybdlCCx9s4YL9YSdNKFXDT99LfrIIre3BnF67JbWXAIp0WpXd_EDrldVctU0mEY0sKM2zSd3yhENPIVdvYvFsYK-CgXRzsH1IkMYBZlqMzA9Gz";
  static getImage(String? filename)
  {
    return imageBasePath+filename!;
  }
  static getNetworkImage(String? path)
  {
    if(path==null) {
      return null;
    }else {
      return base_url+path;
    }
  }


}