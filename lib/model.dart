class TrafficSigns {
  String? id;
  String? image;
  String? name;

  TrafficSigns({this.id, this.image, this.name});

  TrafficSigns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class QuestionBank {
  String? id;
  String? question;
  String? answer;

  QuestionBank({this.id, this.question, this.answer});

  factory QuestionBank.fromJson(Map<String, dynamic> json) {
    return QuestionBank(
      id: json['id'],
      question: json['question'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    return data;
  }
}

class PracticeTest {
  String? id;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? answer;

  PracticeTest(
      {this.id,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.answer});

  PracticeTest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    option1 = json['option_1'];
    option2 = json['option_2'];
    option3 = json['option_3'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['option_1'] = this.option1;
    data['option_2'] = this.option2;
    data['option_3'] = this.option3;
    data['answer'] = this.answer;
    return data;
  }
}

class ExamQuestions {
  String? id;
  String? question;
  String? option1;
  String? option2;
  String? option3;
  String? answer;

  ExamQuestions(
      {this.id,
      this.question,
      this.option1,
      this.option2,
      this.option3,
      this.answer});

  ExamQuestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    option1 = json['option_1'];
    option2 = json['option_2'];
    option3 = json['option_3'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['option_1'] = this.option1;
    data['option_2'] = this.option2;
    data['option_3'] = this.option3;
    data['answer'] = this.answer;
    return data;
  }
}
