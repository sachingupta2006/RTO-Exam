import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';
import 'question_bank_tab1.dart';

class QuestionBank extends StatefulWidget {
  const QuestionBank({super.key});

  @override
  State<QuestionBank> createState() => _QuestionBankState();
}

class _QuestionBankState extends State<QuestionBank> {
  bool isLoading2 = true;
  List<TrafficSigns> trafficSignsList = [];

  @override
  void initState() {
    super.initState();
    getData2();
  }


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
          body: TabBarView(children: [const QuestionBankTab1(), tab2()]),
        ));
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
