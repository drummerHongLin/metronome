import 'package:flutter/material.dart';
import 'package:flutter_metronome/theme/theme.dart';
import 'package:flutter_metronome/theme/util.dart';
import 'package:flutter_metronome/ui/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(
      context,
      "Noto Sans SC",
      "Noto Sans SC",
    );

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: '惊鸿节拍器',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: SafeArea(
        child: Scaffold(body: MainScreen(), resizeToAvoidBottomInset: false),
      ),
    );
  }
}

/*

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageSelectorScreen(),
    );
  }
}

class ImageSelectorScreen extends StatefulWidget {

  const ImageSelectorScreen({super.key});



  @override
  _ImageSelectorScreenState createState() => _ImageSelectorScreenState();
}

class _ImageSelectorScreenState extends State<ImageSelectorScreen> {
  // 当前选中的图片索引
  int _selectedIndex = 0;
  
  // 图片资源列表（示例使用占位图）
  final List<String> imageUrls = List.generate(10, (i) => 'assets/test/$i.jpg');

  // 控制悬浮选择器显示
  bool _showSelector = false;

  // 悬浮层控制器
  OverlayEntry? _overlayEntry;

  // 页面控制器（用于滑动选择）
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  // 显示图片选择器
  void _showImageSelector(BuildContext context, Offset tapPosition) {
    _showSelector = true;
    
    // 创建悬浮层
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned.fill(
        child: GestureDetector(
          onTap: _hideImageSelector,
          behavior: HitTestBehavior.opaque,
          child: Container(
            color: Colors.black54,
            child: Center(
              child: _buildImageSelector(tapPosition),
            ),
          ),
        ),
      ),
    );
    
    // 插入到悬浮层
    Overlay.of(context).insert(_overlayEntry!);
  }

  // 隐藏图片选择器
  void _hideImageSelector() {
    if (_showSelector) {
      _showSelector = false;
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  // 构建图片选择器组件
  Widget _buildImageSelector(Offset position) {
    return  Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: Colors.black26, blurRadius: 20, spreadRadius: 2)
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                '滑动选择图片',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.vertical,
                onPageChanged: (index) {
                  setState(() => _selectedIndex = index);
                },
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imageUrls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                '当前选择: ${_selectedIndex + 1}/${imageUrls.length}',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图片选择器')),
      body: Center(
        child: GestureDetector(
          onLongPressStart: (details) {
            _showImageSelector(context, details.globalPosition);
          },
          onLongPressEnd: (details) {
            _hideImageSelector();
            setState(() {}); // 更新显示选中的图片
          },
          child: Hero(
            tag: 'selected-image',
            child: Image.asset(
              imageUrls[_selectedIndex],
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _hideImageSelector();
    super.dispose();
  }
}


*/
