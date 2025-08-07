import 'package:flutter/material.dart';
import 'package:flutter_metronome/ui/utils/cutome_elevated_button.dart';

class ConfigComponent extends StatelessWidget {
  final String currentTitle;
  final bool showSave;
  final VoidCallback onTap;
  final VoidCallback showHisList;

  const ConfigComponent({
    super.key,
    required this.currentTitle,
    required this.showSave,
    required this.onTap,
    required this.showHisList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: showHisList,
          label: Text(currentTitle),
          icon: Icon(Icons.music_note),
        ),
        Spacer(),
        CustomeElevatedButton(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 5, vertical: 2),
            child: Text(
              showSave ? "保存" : "新建",
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
