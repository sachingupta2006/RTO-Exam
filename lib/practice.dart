import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
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
              child: const Text('question',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  answerWidget(),
                  answerWidget(),
                  answerWidget(),
                ],
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Swipe Right to Next',
              style: TextStyle(fontSize: 30, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }

  Widget answerWidget() {
    var selected = false.obs;
    return GestureDetector(
      onTap: () => selected.value = true,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 8,
                backgroundColor:  Colors.white,
                child: CircleAvatar(
                    radius: 6,
                    backgroundColor:
                        selected.value ? Colors.green : Colors.white),
              ),
            ),
            const SizedBox(width: 10),
            const Text('answer',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
