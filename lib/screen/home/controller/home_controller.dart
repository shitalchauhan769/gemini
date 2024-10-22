import 'package:gemini/screen/home/model/home_model.dart';
import 'package:gemini/util/gemini_api_helper.dart';
import 'package:get/get.dart';

import '../../../util/theme_helper.dart';

class HomeController extends GetxController
{
  GeminiModel? model;
  RxBool theme = false.obs;
  RxList<String> geminiList =<String>[].obs;

  Future<void> getGeminiAPI(String search)
  async {
   model = await APIHelper.helper.geminiAPI(search);
   geminiList.add("${model!.candidates![0].content!.parts![0].text}");
  }
  void getThemeData() async {
    bool? themeName = await Helper.helper.getTheme();
    theme.value = themeName ?? false;

  }
}