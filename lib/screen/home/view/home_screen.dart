import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gemini/util/theme_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());
  TextEditingController txtSearch = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gemini"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Theme"),
                      const Spacer(),
                      Obx(
                        () => Switch(
                          value: controller.theme.value,
                          onChanged: (value) {
                            controller.theme.value = value;
                            Helper.helper.setTheme(controller.theme.value);
                            print(controller.theme.value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                // reverse: true,
                child: ListView.builder(
                  itemCount: controller.geminiList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? Container(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Obx(
                                () => Text(
                                  controller.geminiList[index],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Obx(
                              () => AnimatedTextKit(
                                animatedTexts: [
                                  TyperAnimatedText(controller.geminiList[index],  speed: const Duration(milliseconds: 12),),
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60,
                      width: MediaQuery.sizeOf(context).width * 0.67,
                      child: TextFormField(
                        controller: txtSearch,
                        decoration: const InputDecoration(
                          hintText: "enter meg",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty)
                            {
                              return "Enter message";
                            }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: IconButton(
                        onPressed: () {
                         if(formKey.currentState!.validate())
                           {
                             controller.geminiList.add(txtSearch.text);
                             controller.getGeminiAPI(txtSearch.text);
                             print(txtSearch.text);
                             txtSearch.clear();
                           }
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
