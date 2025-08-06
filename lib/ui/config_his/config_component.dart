import 'package:flutter/material.dart';


class ConfigComponent extends StatelessWidget {
  final String currentTitle;
  final bool showSave;
  final VoidCallback onTap;

  const ConfigComponent({super.key, required this.currentTitle, required this.showSave, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton.icon(
          onPressed: () {},
          label: Text(currentTitle),
          icon: Icon(Icons.music_note),
        ),
        Spacer(),
        InkWell(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 5, vertical: 2),
              child: Text(
                showSave? "保存" :"新建",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
