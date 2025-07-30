import 'package:flutter_metronome/service/shared_preference/shared_preference.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> get providers {
  return [
    ChangeNotifierProvider(create: (context) => SharedPreferencesService(),)
  ];
}