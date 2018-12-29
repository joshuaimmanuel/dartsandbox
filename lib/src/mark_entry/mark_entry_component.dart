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
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_expansionpanel/material_expansionpanel.dart';

import 'question_format_header_component.dart';
import 'mark_service.dart';
import 'models/question_format.dart';


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
  ],
)
class MarkEntryComponent implements OnInit {
  final MarkService _markService;
  List<QuestionFormat> questionFormat;

  MarkEntryComponent(this._markService);

  void ngOnInit() {
    print("MarkEntryComponent: ngOnInit");
  }

  void loadData() {
    _markService.loadData();
    questionFormat = _markService.questionFormat;
  }
}

// Local Variables:
// mode: dart
// End:
