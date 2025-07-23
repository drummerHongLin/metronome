import 'package:flutter/material.dart';
import 'package:flutter_metronome/ui/drawer/widgets/jinghong_info.dart';
import 'package:flutter_metronome/ui/drawer/widgets/sponsorship_info.dart';
import 'package:flutter_metronome/ui/drawer/widgets/version_info.dart';
import 'package:flutter_metronome/ui/utils/popuprouter_wrapper.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<(int, String)> _tiles = [(1, '版本说明'), (2, '关于惊鸿'), (3, '赞助')];

  int _selectedIndex = 0;

  Route _buildInfoRoute(int i) {
    if (i == 1) return PopUpRouteWrapper(child: VersionInfo());
    if (i == 2) return PopUpRouteWrapper(child: JinghongInfo());
    if (i == 3) return PopUpRouteWrapper(child: SponsorshipInfo());
    return PopUpRouteWrapper(child: VersionInfo());
  }

  void _setSelectedIndex(int v) {
    setState(() {
      _selectedIndex = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: CircleImg(
              imgFilePath: "assets/images/avatar.png",
              imgSize: Size(100, 100),
            ),
          ),
          for (var _t in _tiles)
            ListTile(
              title: Text(_t.$2),
              selected: _selectedIndex == _t.$1,
              onTap: () async {
                // Update the state of the app
                await Navigator.push(context, _buildInfoRoute(_t.$1));
                // Then close the drawer
              },
            ),
        ],
      ),
    );
  }
}

class CircleImg extends StatelessWidget {
  final String imgFilePath;
  final Size imgSize;
  final Color? color;
  final List<BoxShadow>? boxShadow;

  const CircleImg({
    super.key,
    required this.imgFilePath,
    required this.imgSize,
    this.color,
    this.boxShadow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: imgSize.height,
      width: imgSize.width,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        shape: BoxShape.circle,
        color: color,
        image: DecorationImage(image: AssetImage(imgFilePath)),
      ),
    );
  }
}
