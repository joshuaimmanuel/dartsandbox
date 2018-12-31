// Copyright (C) 2018 HiPro IT Solutions Private Limited, Chennai. All
// rights reserved.
//
// This program and the accompanying materials are made available
// under the terms described in the LICENSE file which accompanies
// this distribution. If the LICENSE file was not attached to this
// distribution or for further clarifications, please contact
// legal@hipro.co.in.

import 'models/student_mark.dart';

const questionFormat = [
  {"id": 1, "max_marks": 10.00, "qno": "A1", "group": 1},
  {"id": 2, "max_marks": 10.00, "qno": "A2", "group": 2},
  {"id": 3, "max_marks": 10.00, "qno": "A3", "group": 3},
  {"id": 4, "max_marks": 10.00, "qno": "A4", "group": 4},
  {"id": 5, "max_marks": 10.00, "qno": "A5", "group": 5},
  {"id": 6, "max_marks": 10.00, "qno": "A6", "group": 6},
  {"id": 7, "max_marks": 10.00, "qno": "A7", "group": 6},
  {"id": 8, "max_marks": 10.00, "qno": "A8", "group": 8},
  {"id": 9, "max_marks": 10.00, "qno": "A9", "group": 9},
  {"id": 10, "max_marks": 10.00, "qno": "A10", "group": 10},
  {"id": 11, "max_marks": 15.00, "qno": "B1", "group": 11},
  {"id": 12, "max_marks": 15.00, "qno": "B2", "group": 12},
  {"id": 13, "max_marks": 15.00, "qno": "B3", "group": 13},
  {"id": 14, "max_marks": 15.00, "qno": "B4", "group": 13},
  {"id": 15, "max_marks": 15.00, "qno": "B5", "group": 13},
  {"id": 16, "max_marks": 15.00, "qno": "B6", "group": 16},
  {"id": 17, "max_marks": 15.00, "qno": "B7", "group": 17},
  {"id": 18, "max_marks": 15.00, "qno": "B8", "group": 18},
  {"id": 19, "max_marks": 15.00, "qno": "B9", "group": 19},
  {"id": 20, "max_marks": 15.00, "qno": "B10", "group": 20},
  {"id": 21, "max_marks": 20.00, "qno": "C1", "group": 21},
  {"id": 22, "max_marks": 20.00, "qno": "C2", "group": 21},
  {"id": 23, "max_marks": 20.00, "qno": "C3", "group": 23},
  {"id": 24, "max_marks": 20.00, "qno": "C4", "group": 24},
  {"id": 25, "max_marks": 20.00, "qno": "C5", "group": 25},
  {"id": 26, "max_marks": 20.00, "qno": "C6", "group": 26},
  {"id": 27, "max_marks": 20.00, "qno": "C7", "group": 27},
  {"id": 28, "max_marks": 20.00, "qno": "C8", "group": 28},
  {"id": 29, "max_marks": 20.00, "qno": "C9", "group": 29},
  {"id": 30, "max_marks": 20.00, "qno": "C10", "group": 30}
];

const List<ExamStatus> examStatusList = [
  ExamStatus(0, 'Not entered'),
  ExamStatus(1, 'Attended'),
  ExamStatus(2, 'Absent'),
  ExamStatus(3, 'Not permitted'),
];

ExamStatus getStatus(int val) {
  return examStatusList.firstWhere((status) {
      return status.id == val;
    });
}

ExamStatus getStatusByName(String val) {
  return examStatusList.firstWhere((status) {
      return status.name == val;
    });
}

// Local Variables:
// mode: dart
// End:
