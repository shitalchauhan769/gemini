import 'package:gemini/screen/home/model/home_model.dart';
import 'package:gemini/util/gemini_api_helper.dart';
import 'package:get/get.dart';

import '../../../util/theme_helper.dart';

class HomeController extends GetxController
{
  GeminiModel? model;
  RxBool theme=false.obs;
  Future<void> getGeminiAPI(String search)
  async {
   model = await APIHelper.helper.geminiAPI(search);
  }
  Future<void> getTheme() async {

    bool? themeName=await Helper.helper.getTheme();
    theme.value=themeName??false;

  }
}