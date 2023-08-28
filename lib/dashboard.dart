import 'package:flutter/material.dart';
import 'package:rto/exam.dart';
import 'package:rto/practice.dart';
import 'question_bank.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
          backgroundColor: Colors.red,
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text('RTO EXAM',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.yellow)),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customContainer(
                'Question Bank',
                'List of Question and Answer and meaning of road signs',
                context,
                const QuestionBank(),
                'question.png'),
            const SizedBox(height: 20),
            customContainer(
                'Practice',
                'Test Your Knowledge and prepare for the exam',
                context,
                const Practice(),
                'practice.jpg'),
            const SizedBox(height: 20),
            customContainer('Exam', 'Start Your text and show your knowledge.',
                context, const Exam(), 'exam.jpeg')
          ],
        ),
      ),
    );
  }

  Widget customContainer(
      String title, String subtitle, context, route, String png) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => route,
            ));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/$png', height: 60),
            const SizedBox(width: 20),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                  const SizedBox(height: 10),
                  Text(subtitle,
                      style:
                          const TextStyle(fontSize: 15, color: Colors.black)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
