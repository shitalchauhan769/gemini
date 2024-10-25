import 'package:flutter/material.dart';
import 'package:gemini/util/helper/db_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/controller/home_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.readDbData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HistoryScr"),
      ),
      body: ListView.builder(
        itemCount: controller.historyList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                      title: "Delete",
                      content: const Text("Delete message"),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            DBHelper.helper.deleteDb(
                              controller.historyList[index].id!,
                            );
                            controller.readDbData();
                            Get.back();
                          },
                          child: const Text("Yes"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("No"),
                        )
                      ]);
                },
                child: Container(
                  alignment: controller.historyList[index].status == 0
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: controller.historyList[index].status == 0
                          ? Colors.grey
                          : controller.theme.value == true
                              ? Colors.green
                              : Colors.green,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Text(
                      "${controller.historyList[index].search}",
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
