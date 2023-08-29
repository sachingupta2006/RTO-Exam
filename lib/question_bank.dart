import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class QuestionBank extends StatefulWidget {
  const QuestionBank({super.key});

  @override
  State<QuestionBank> createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  bool isLoading1 = true;
  List<QuestionBank> questionBankList = [];
  bool isLoading2 = true;
  List<TrafficSigns> trafficSignsList = [];

  @override
  void initState() {
    super.initState();
    // getData1();
    getData2();
  }

  // getData1() async {
  //   try {
  //     String url = 'https://mapi.trycatchtech.com/v1/rto/text_question_list';
  //     http.Response res = await http.get(Uri.parse(url));
  //     if (res.statusCode == 200) {
  //       List<dynamic> responseData1 = json.decode(res.body);
  //       questionBankList =
  //           responseData1.map((item) => QuestionBank.fromJson(item)).toList();
  //       setState(() {
  //         isLoading1 = false;
  //       });
  //     }
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  getData2() async {
    try {
      String url = 'https://mapi.trycatchtech.com/v1/rto/image_question_list';
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        List<dynamic> responseData = json.decode(res.body);
        trafficSignsList =
            responseData.map((item) => TrafficSigns.fromJson(item)).toList();

        setState(() {
          isLoading2 = false;
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Question Bank',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
            backgroundColor: Colors.red,
            bottom: const TabBar(
                unselectedLabelColor: Colors.white54,
                labelPadding: EdgeInsets.only(bottom: 10),
                indicatorColor: Colors.white,
                tabs: [
                  Text('QUESTIONS', style: TextStyle(fontSize: 16)),
                  Text(
                    'TRAFFIC SIGNS',
                    style: TextStyle(fontSize: 16),
                  )
                ]),
          ),
          body: TabBarView(children: [tab1(), tab2()]),
        ));
  }

  Widget tab1() {
    return Container(
      color: Colors.yellow,
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            questionWidget('question', 'answer'),
            questionWidget('question', 'answer'),
            questionWidget('question', 'answer'),
          ],
        ),
      ),
    );
  }

  Widget tab2() {
    return Container(
      color: Colors.yellow,
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: isLoading2
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return trafficSignsWidget(
                    trafficSignsList[index].name ?? 'Unknown',
                    trafficSignsList[index].image!);
              },
              itemCount: trafficSignsList.length,
            ),
    );
  }

  Widget questionWidget(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
                question,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              const SizedBox(height: 30),
              Text(
                answer,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )
            ],
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  Widget trafficSignsWidget(String txt, String netImage) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(netImage, height: 60,
                  errorBuilder: (context, error, stackTrace) {
                return const Text('Image not available');
              }),
              const SizedBox(width: 20),
              Flexible(
                child: Text(
                  txt,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
