import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rto/model.dart';
import 'package:http/http.dart' as http;

var answeredData = [].obs;

class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  State<Exam> createState() => _ExamState();
}

class _ExamState extends State<Exam> {
  bool isLoading = true;
  List<ExamQuestions> examQuestionsList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      String url = 'https://mapi.trycatchtech.com/v1/rto/exam_question_list';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        List responseData = json.decode(res.body);
        examQuestionsList =
            responseData.map((item) => ExamQuestions.fromJson(item)).toList();

        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var indx = 0.obs;
    var selectedRadio = 0.obs;
    var c1 = Colors.white.obs;
    var c2 = Colors.white.obs;
    var c3 = Colors.white.obs;

    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: const Text('RTO Exam',
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
            : Obx(
                () => SingleChildScrollView(
                  padding: const EdgeInsets.all(10),
                  child: indx.value == examQuestionsList.length
                      ? resultScore()
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.black, width: 0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                      child: Text(
                                          'Question ${indx.value + 1} of ${examQuestionsList.length}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red))),
                                  const SizedBox(height: 20),
                                  Text(examQuestionsList[indx.value].question!,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                  const SizedBox(height: 20),
                                  Container(
                                    // color: c1.value,
                                    child: RadioListTile(
                                      title: Text(
                                          examQuestionsList[indx.value]
                                              .option1!,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      value: 1,
                                      groupValue: selectedRadio.value,
                                      onChanged: (value) {
                                        selectedRadio.value = 1;
                                        if (examQuestionsList[indx.value]
                                                .answer! ==
                                            '1') {
                                          c1.value = Colors.green.shade900;
                                          c2.value = Colors.white;
                                          c3.value = Colors.white;
                                        } else if (examQuestionsList[indx.value]
                                                .answer! ==
                                            '2') {
                                          c1.value = Colors.red.shade900;
                                          c2.value = Colors.green.shade900;
                                          c3.value = Colors.white;
                                        } else if (examQuestionsList[indx.value]
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
                                    // color: c2.value,
                                    child: RadioListTile(
                                      selected: selectedRadio.value == 2
                                          ? true
                                          : false,
                                      title: Text(
                                          examQuestionsList[indx.value]
                                              .option2!,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      value: 2,
                                      groupValue: selectedRadio.value,
                                      onChanged: (value) {
                                        selectedRadio.value = 2;
                                        if (examQuestionsList[indx.value]
                                                .answer! ==
                                            '1') {
                                          c1.value = Colors.green.shade900;
                                          c2.value = Colors.red.shade900;
                                          c3.value = Colors.white;
                                        } else if (examQuestionsList[indx.value]
                                                .answer! ==
                                            '2') {
                                          c1.value = Colors.white;
                                          c2.value = Colors.green.shade900;
                                          c3.value = Colors.white;
                                        } else if (examQuestionsList[indx.value]
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
                                    // color: c3.value,
                                    child: RadioListTile(
                                      title: Text(
                                          examQuestionsList[indx.value]
                                              .option3!,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black)),
                                      value: 3,
                                      groupValue: selectedRadio.value,
                                      onChanged: (value) {
                                        selectedRadio.value = 3;
                                        if (examQuestionsList[indx.value]
                                                .answer! ==
                                            '1') {
                                          c1.value = Colors.green.shade900;
                                          c2.value = Colors.white;
                                          c3.value = Colors.red.shade900;
                                        } else if (examQuestionsList[indx.value]
                                                .answer! ==
                                            '2') {
                                          c1.value = Colors.white;
                                          c2.value = Colors.green.shade900;
                                          c3.value = Colors.red.shade900;
                                        } else if (examQuestionsList[indx.value]
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
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                indx.value++;
                                // if (indx.value == examQuestionsList.length) {
                                //   indx.value = 0;
                                // }
                                answeredData.value =
                                    List.from(answeredData.value)
                                      ..add(selectedRadio.value);
                                print(
                                    'indx vlue ${indx.value} answredData $answeredData');
                                selectedRadio.value = 0;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green[900],
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(20),
                                width: 140,
                                child: const Center(
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                ),
              ));
  }

  Widget resultScore() {
    var showAnsBool = false.obs;
    return Obx(
      () => Visibility(
        visible: showAnsBool.value,
        replacement: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Center(
                    child: Text('Results',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.red)),
                  ),
                  SizedBox(height: 20),
                  Text('You have answered 16 of 50 Questions correctly!}',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.red)),
                  SizedBox(height: 20),
                  Text('Score is Poor! You need to practice more!',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black))
                ],
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
                showAnsBool.value = true;
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(20),
                  width: 210,
                  child: const Center(
                    child: Text(
                      'VIEW ANSWERS',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: correctAnswers(),
      ),
    );
  }

  Widget correctAnswers() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: examQuestionsList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(examQuestionsList[index].question!,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                const SizedBox(height: 20),
                Text(
                    '${(examQuestionsList[index].answer! == '1' ? examQuestionsList[index].option1 : examQuestionsList[index].answer! == '2' ? examQuestionsList[index].option2 : examQuestionsList[index].option3)}',
                    style: const TextStyle(fontSize: 15, color: Colors.green)),
                const SizedBox(height: 20),
                Text(
                    '${(answeredData[index] == 1 ? examQuestionsList[index].option1 : answeredData[index] == 2 ? examQuestionsList[index].option2 : answeredData[index] == 3 ? examQuestionsList[index].option3 : 'Not Selected')}',
                    style: TextStyle(
                        fontSize: 15,
                        color: examQuestionsList[index].answer ==
                                answeredData[index].toString()
                            ? Colors.green
                            : Colors.red))
              ],
            ),
          );
        },
      ),
    );
  }
}
