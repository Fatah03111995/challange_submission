import 'dart:math';

import 'package:challange_submission/core/model/question_model.dart';

class Brain {
  static QuestionModel generateQuestion() {
    Random random = Random();
    List<int> kuadrat = List.generate(10, (index) => (index + 1) * (index + 1));
    int denominator = kuadrat[random.nextInt(kuadrat.length)];

    //GENERATE NOMINATOR
    int nominator = 1;
    if (denominator > 1) {
      nominator = random.nextInt(denominator) + 1; // +1 agar tidak mulai dari 0
    }

    return QuestionModel(
      nominator: nominator,
      denominator: denominator,
    );
  }
}
