// Copyright (C) 2018 HiPro IT Solutions Private Limited, Chennai. All
// rights reserved.
//
// This program and the accompanying materials are made available
// under the terms described in the LICENSE file which accompanies
// this distribution. If the LICENSE file was not attached to this
// distribution or for further clarifications, please contact
// legal@hipro.co.in.

import 'dart:async';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'models/question_format.dart';
import 'models/student_mark.dart';
import 'constants.dart' as cnst;

@Component(
  selector: 'ue-student-question-mark',
  templateUrl: 'student_question_marks_component.html',
  styleUrls: [
    'student_question_marks_component.scss.css',
  ],
  directives: [
    NgIf,
    NgFor,
    NgStyle,
    formDirectives,
  ],
)
class StudentQuestionMarksComponent implements OnInit {
  Map<String, String> gridStyle = <String, String>{};
  Map<int, double> maxMarks;
  Map<int, String> errors;
  List<ExamStatus> examStatus;
  String remark = '';
  String _selectedStatus;

  @Input()
  List<QuestionFormat> format;

  @Input()
  StudentMark student;

  void ngOnInit() {
    print("StudentQuestionMarksComponent: ngOnInit");
    maxMarks = Map<int, double>();
    errors = Map<int, String>();
    int columns = 0;
    for (final fmt in format) {
      maxMarks[fmt.id] = fmt.maxMarks;
      if (fmt.group < fmt.id) {
        columns += 1;
      }
      columns += 1;
    }
    gridStyle['grid-template-columns'] = '2fr 2fr repeat($columns, 1fr) 1fr 1fr';
    examStatus = List<ExamStatus>.from(cnst.examStatusList);
    if (student.hasEntry) {
      examStatus.removeAt(0);
    }

    final notEnteredStatus = cnst.getStatus(0);
    if (student.status == null) {
      _selectedStatus = notEnteredStatus.name;
    } else {
      _selectedStatus = student.status.name;
    }
  }

  String get selectedStatus => _selectedStatus;

  void set selectedStatus(String newStatus) {
    if (newStatus != selectedStatus) {
      student.isSaved = false;
      student.hasEntry = true;
      student.status = cnst.getStatusByName(newStatus);
      if (student.status.id != 1) {
        student.hasEntry = false;
        if (student.status.id == 0) {
          remark = '';
        } else if (student.status.id == 2) {
          remark = 'AA';
        } else if (student.status.id == 3) {
          remark = 'NA';
        }
      }
      _selectedStatus = newStatus;
    }
  }

  void onMarksChanged(int fmtId, String qno, String newMarks) {
    double marks = double.tryParse(newMarks);
    double oldMark = null;
    print("fmtid : ${fmtId}, qno : ${qno}, newMarks : ${newMarks}, marks : ${marks}");
    if (marks == null && newMarks.length > 0) {
      final errStr = "${qno}: Invalid marks";
      errors[fmtId] = errStr;
      student.hasError = true;
      student.errorMessage = errStr;
      return;
    }
    if (student.obtainedMarks.containsKey(fmtId)) {
      oldMark = student.obtainedMarks[fmtId];
      if (student.total > 0 && oldMark != null) {
        student.total -= oldMark;
      }
    }
    if (newMarks.length < 1) {
      // This could be optional question or regular
      errors[fmtId] = '';
      student.hasError = false;
      student.errorMessage = '';
      return;
    }
    double max = maxMarks[fmtId];
    if (marks > max) {
      final errStr = "${qno}: Marks greater than max marks";
      errors[fmtId] = errStr;
      student.hasError = true;
      student.errorMessage = errStr;
      return;
    }
    if (marks == null) {
      return;
    }
    errors.remove(fmtId);
    if (errors.isEmpty) {
      student.hasError = false;
    } else {
      // When there are multiple errors including the current mark
      // error while clearing the current error we should check for
      // errors in other questions and set the appropriate error.
      student.hasError = true;
      student.errorMessage = errors.values.first;
    }
    student.obtainedMarks[fmtId] = marks;
    student.total += marks;
  }

  void onEdit() {
    student.isSaved = false;
  }
}

// Local Variables:
// mode: dart
// End:
