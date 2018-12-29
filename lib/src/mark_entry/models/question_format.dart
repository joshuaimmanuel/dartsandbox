// Copyright (C) 2018 HiPro IT Solutions Private Limited, Chennai. All
// rights reserved.
//
// This program and the accompanying materials are made available
// under the terms described in the LICENSE file which accompanies
// this distribution. If the LICENSE file was not attached to this
// distribution or for further clarifications, please contact
// legal@hipro.co.in.

class QuestionFormat {
  int id;
  String question;
  double maxMarks;
  int group;

  QuestionFormat();

  factory QuestionFormat.fromJson(Map<String, dynamic> data) {
    final qf = QuestionFormat();
    qf.id = data['id'];
    qf.question = data['qno'];
    qf.maxMarks = data['max_marks'];
    qf.group = data['group'];
    return qf;
  }
}

// Local Variables:
// mode: dart
// End:
