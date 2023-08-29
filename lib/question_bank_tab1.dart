import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class QuestionBankTab1 extends StatefulWidget {
  const QuestionBankTab1({super.key});

  @override
  State<QuestionBankTab1> createState() => _QuestionBankTab1State();
}

class _QuestionBankTab1State extends State<QuestionBankTab1> {
  bool isLoading = true;
  List<QuestionBank> questionBankList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      String url = 'https://mapi.trycatchtech.com/v1/rto/text_question_list';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        List<dynamic> responseData = json.decode(res.body);
        questionBankList =
            responseData.map((item) => QuestionBank.fromJson(item)).toList();

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
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(15)),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    questionBankList[index].question!,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    questionBankList[index].answer!,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: questionBankList.length),
    );
  }
}
