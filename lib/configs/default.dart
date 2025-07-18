import 'package:flutter_metronome/configs/data_type.dart';

abstract class DefaultData {
static ReferenceBeat referenceBeat = ReferenceBeat.quarter_note;
static int bpm = 60;
static int beatNum = 4;
static int beatNote  = 4;
static List<int> beatNumChoices = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16];
static List<int> beatNoteChoices = [2,4,8,16];

}

