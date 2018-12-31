// Copyright (C) 2018 HiPro IT Solutions Private Limited, Chennai. All
// rights reserved.
//
// This program and the accompanying materials are made available
// under the terms described in the LICENSE file which accompanies
// this distribution. If the LICENSE file was not attached to this
// distribution or for further clarifications, please contact
// legal@hipro.co.in.

import 'package:angular/angular.dart';

import 'models/question_format.dart';

@Component(
  selector: 'ue-question-format-header',
  templateUrl: 'question_format_header_component.html',
  styleUrls: [
    'question_format_header_component.scss.css',
  ],
  directives: [
    NgIf,
    NgFor,
    NgStyle,
  ],
)
class QuestionFormatHeaderComponent implements OnInit {
  Map<String, String> gridStyle = <String, String>{};

  @Input()
  List<QuestionFormat> format;

  void ngOnInit() {
    print("QuestionFormatHeaderComponent: ngOnInit");
    int columns = 0;
    for (final fmt in format) {
      if (fmt.group < fmt.id) {
        columns += 1;
      }
      columns += 1;
    }
    gridStyle['grid-template-columns'] = '2fr 2fr repeat($columns, 1fr) 1fr';
  }
}

// Local Variables:
// mode: dart
// End:
