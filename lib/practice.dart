import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rto/model.dart';
import 'package:http/http.dart' as http;

class Practice extends StatefulWidget {
  const Practice({super.key});

  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  bool isLoading = true;
  List<PracticeTest> practiceTestList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      String url =
          'https://mapi.trycatchtech.com/v1/rto/practice_question_list';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        List responseData = json.decode(res.body);
        practiceTestList =
            responseData.map((item) => PracticeTest.fromJson(item)).toList();

        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  int generateRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(practiceTestList.length);
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    int randomNumber = generateRandomNumber();
    var selectedRadio = 0.obs;
    var c1 = Colors.white.obs;
    var c2 = Colors.white.obs;
    var c3 = Colors.white.obs;
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        title: const Text('Practice',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white)),
        backgroundColor: Colors.red,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GestureDetector(
              onHorizontalDragEnd: (details) {
                setState(() {});
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 0.5),
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: Text(practiceTestList[randomNumber].question!,
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 0.5),
                            borderRadius: BorderRadius.circular(10)),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              color: c1.value,
                              child: RadioListTile(
                                title: Text(
                                    practiceTestList[randomNumber].option1!,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                value: 1,
                                groupValue: selectedRadio.value,
                                onChanged: (value) {
                                  selectedRadio.value = 1;
                                  if (practiceTestList[randomNumber].answer! ==
                                      '1') {
                                    c1.value = Colors.green.shade900;
                                    c2.value = Colors.white;
                                    c3.value = Colors.white;
                                  } else if (practiceTestList[randomNumber]
                                          .answer! ==
                                      '2') {
                                    c1.value = Colors.red.shade900;
                                    c2.value = Colors.green.shade900;
                                    c3.value = Colors.white;
                                  } else if (practiceTestList[randomNumber]
                                          .answer! ==
                                      '3') {
                                    c1.value = Colors.red.shade900;
                                    c2.value = Colors.white;
                                    c3.value = Colors.green.shade900;
                                  }
                                },
                              ),
                            ),
                            Container(
                              color: c2.value,
                              child: RadioListTile(
                                selected:
                                    selectedRadio.value == 2 ? true : false,
                                title: Text(
                                    practiceTestList[randomNumber].option2!,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                value: 2,
                                groupValue: selectedRadio.value,
                                onChanged: (value) {
                                  selectedRadio.value = 2;
                                  if (practiceTestList[randomNumber].answer! ==
                                      '1') {
                                    c1.value = Colors.green.shade900;
                                    c2.value = Colors.red.shade900;
                                    c3.value = Colors.white;
                                  } else if (practiceTestList[randomNumber]
                                          .answer! ==
                                      '2') {
                                    c1.value = Colors.white;
                                    c2.value = Colors.green.shade900;
                                    c3.value = Colors.white;
                                  } else if (practiceTestList[randomNumber]
                                          .answer! ==
                                      '3') {
                                    c1.value = Colors.white;
                                    c2.value = Colors.red.shade900;
                                    c3.value = Colors.green.shade900;
                                  }
                                },
                              ),
                            ),
                            Container(
                              color: c3.value,
                              child: RadioListTile(
                                title: Text(
                                    practiceTestList[randomNumber].option3!,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                value: 3,
                                groupValue: selectedRadio.value,
                                onChanged: (value) {
                                  selectedRadio.value = 3;
                                  if (practiceTestList[randomNumber].answer! ==
                                      '1') {
                                    c1.value = Colors.green.shade900;
                                    c2.value = Colors.white;
                                    c3.value = Colors.red.shade900;
                                  } else if (practiceTestList[randomNumber]
                                          .answer! ==
                                      '2') {
                                    c1.value = Colors.white;
                                    c2.value = Colors.green.shade900;
                                    c3.value = Colors.red.shade900;
                                  } else if (practiceTestList[randomNumber]
                                          .answer! ==
                                      '3') {
                                    c1.value = Colors.white;
                                    c2.value = Colors.white;
                                    c3.value = Colors.green.shade900;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Swipe Right to Next',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[900]),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
