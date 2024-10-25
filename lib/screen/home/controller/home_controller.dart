import 'package:flutter/cupertino.dart';
import 'package:gemini/screen/home/model/home_model.dart';
import 'package:gemini/util/helper/db_helper.dart';
import 'package:gemini/util/helper/gemini_api_helper.dart';
import 'package:get/get.dart';

import '../../../util/helper/theme_helper.dart';
import '../../history/model/history_model.dart';

class HomeController extends GetxController
{
  GeminiModel? model;
  RxBool theme = false.obs;
  RxList<String> geminiList = <String>[].obs;
  RxList<HistoryModel> historyList = <HistoryModel>[].obs;

  Future<void> getGeminiAPI(String search)
  async {

   model = await APIHelper.helper.geminiAPI(search);
    DBHelper.helper.insertDB(search,0);
    geminiList.add("${model!.candidates![0].content!.parts![0].text}");
    DBHelper.helper.insertDB("${model!.candidates![0].content!.parts![0].text}",1);

  }
  Future<void> readDbData()
  async {
    historyList.value=await DBHelper.helper.readDb();
  }
  void getThemeData() async {
    bool? themeName = await Helper.helper.getTheme();
    theme.value = themeName ?? false;

  }
}