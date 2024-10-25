import 'package:flutter/cupertino.dart';
import 'package:gemini/screen/history/view/history_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String,WidgetBuilder>app_routes={
  "/":(c1)=>const HomeScreen(),
  "/history":(c1)=>const HistoryScreen(),
};