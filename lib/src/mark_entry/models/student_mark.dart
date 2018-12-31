// Copyright (C) 2018 HiPro IT Solutions Private Limited, Chennai. All
// rights reserved.
//
// This program and the accompanying materials are made available
// under the terms described in the LICENSE file which accompanies
// this distribution. If the LICENSE file was not attached to this
// distribution or for further clarifications, please contact
// legal@hipro.co.in.

class ExamStatus {
  final int id;
  final String name;

  const ExamStatus(this.id, this.name);
}

class StudentMark {
  int id;
  String regNum = '';
  bool hasEntry = false;
  ExamStatus status;
  Map<int, double> obtainedMarks;
  // based on the status the total might contain either a double or a
  // string.
  double total = 0;
  bool isSaved = false;
  bool hasError = false;
  String errorMessage = '';

  StudentMark() {
    obtainedMarks = Map<int, double>();
  }
}

// Local Variables:
// mode: dart
// End:
