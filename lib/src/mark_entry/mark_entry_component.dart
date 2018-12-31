// Copyright (C) 2018 HiPro IT Solutions Private Limited, Chennai. All
// rights reserved.
//
// This program and the accompanying materials are made available
// under the terms described in the LICENSE file which accompanies
// this distribution. If the LICENSE file was not attached to this
// distribution or for further clarifications, please contact
// legal@hipro.co.in.

import 'package:angular/angular.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel.dart';

import 'question_format_header_component.dart';
import 'student_question_marks_component.dart';
import 'mark_service.dart';
import 'models/question_format.dart';
import 'models/student_mark.dart';
import 'constants.dart' as cnst;

@Component(
  selector: 'ue-mark-entry',
  templateUrl: 'mark_entry_component.html',
  styleUrls: [
    'mark_entry_component.scss.css',
  ],
  directives: [
    NgIf,
    NgFor,
    MaterialExpansionPanel,
    MaterialButtonComponent,
    QuestionFormatHeaderComponent,
    StudentQuestionMarksComponent,
  ],
)
class MarkEntryComponent implements OnInit {
  final MarkService _markService;
  List<QuestionFormat> questionFormat;
  List<StudentMark> studentMarkList;
  bool dataLoaded = false;
  String chngStr = '';

  MarkEntryComponent(this._markService);

  void ngOnInit() {
    print("MarkEntryComponent: ngOnInit");
  }

  void loadData() {
    dataLoaded = false;
    _markService.loadData();
    questionFormat = _markService.questionFormat;
    studentMarkList = List<StudentMark>();
    final notEnteredStatus = cnst.getStatus(0);
    for (var i = 1; i < 801; i++) {
      StudentMark mark = StudentMark();
      mark.id = i;
      mark.regNum = "61R3-${i}";
      mark.status = notEnteredStatus;
      studentMarkList.add(mark);
    }
    dataLoaded = true;
  }

  void hasChanges() {
    if (studentMarkList == null || studentMarkList.isEmpty) {
      chngStr = 'Student list is empty';
      return;
    }

    for (final mark in studentMarkList) {
      if ((mark.hasEntry && !mark.isSaved) ||
          (!mark.hasEntry && mark.status != null && mark.status.id != 0)) {
        chngStr = '${mark.regNum} is not saved';
        return;
      }
    }
    chngStr = 'There are no changes to save';
  }
}

// Local Variables:
// mode: dart
// End:
