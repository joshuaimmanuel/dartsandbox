// Copyright (C) 2018 HiPro IT Solutions Private Limited, Chennai. All
// rights reserved.
//
// This program and the accompanying materials are made available
// under the terms described in the LICENSE file which accompanies
// this distribution. If the LICENSE file was not attached to this
// distribution or for further clarifications, please contact
// legal@hipro.co.in.

import 'models/question_format.dart';
import 'constants.dart' as cnst;

class MarkService {
  Map<int, double> maxMarks;
  List<QuestionFormat> questionFormat;

  void loadData() {
    maxMarks = Map<int, double>();
    questionFormat = List<QuestionFormat>();

    for (final row in cnst.questionFormat) {
      maxMarks[row['id']] = row['max_marks'];
      questionFormat.add(QuestionFormat.fromJson(row));
    }
  }
}
// Local Variables:
// mode: dart
// End:
