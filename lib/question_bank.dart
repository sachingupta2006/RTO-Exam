import 'package:flutter/material.dart';

class QuestionBank extends StatelessWidget {
  const QuestionBank({super.key});

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
            questionWidget(
                'que fu frw  hffh ufhoeufwefieowef efe dw d egp yf f f eofpaw ef efu waef eu fpawe fwe ffwu tr  w stion',
                'an efwefw efewfhfh f uh ur  g g gy fu u f swer'),
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            trafficSignsWidget(
                'Compulsory turn left',
                Icon(Icons.arrow_circle_left_outlined,
                    color: Colors.indigo[900])),
            trafficSignsWidget(
                'Compulsory turn left',
                Icon(Icons.arrow_circle_left_outlined,
                    color: Colors.indigo[900])),
            trafficSignsWidget(
                'Compulsory turn left',
                Icon(Icons.arrow_circle_left_outlined,
                    color: Colors.indigo[900])),
            trafficSignsWidget(
                'Compulsory turn left',
                Icon(Icons.arrow_circle_left_outlined,
                    color: Colors.indigo[900])),
          ],
        ),
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

  Widget trafficSignsWidget(String txt, Widget widget) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://mapi.trycatchtech.com/uploads/rto/ddfa7e57ca46e2f2c69c5b09a509769c.png',
                height: 60,
              ),
              const SizedBox(width: 25),
              Text(
                txt,
                style: const TextStyle(
                    fontSize: 20,
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
}
