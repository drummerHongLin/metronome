import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExternalWebViewScreen extends StatefulWidget {
  final String url;  // 外部链接参数
  final String title;

  const ExternalWebViewScreen({super.key, required this.url, required this.title});

  @override
  State<ExternalWebViewScreen> createState() => _ExternalWebViewScreenState();
}

class _ExternalWebViewScreenState extends State<ExternalWebViewScreen> {
  late final WebViewController _controller;
  var _isLoading = true;  // 加载状态
  var _progress = 0;      // 加载进度

  @override
  void initState() {
    super.initState();
    
    // 创建并配置 WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)  // 启用 JS
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            setState(() => _progress = progress);
          },
          onPageStarted: (String url) {
            setState(() => _isLoading = true);
          },
          onPageFinished: (String url) {
            setState(() => _isLoading = false);
          },
          onWebResourceError: (WebResourceError error) {
            // 处理加载错误
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));  // 加载外部链接
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          // 刷新按钮
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: Column(
        children: [
          // 加载进度条
          if (_isLoading)
            LinearProgressIndicator(
              value: _progress / 100,
              minHeight: 3,
            ),
          
          // WebView 主体
          Expanded(
            child: WebViewWidget(controller: _controller),
          ),
        ],
      ),
      // 导航控制按钮
      bottomNavigationBar: _buildNavigationControls(),
    );
  }

  // 底部导航控制栏
  Widget _buildNavigationControls() {
    return FutureBuilder(
      future: _controller.canGoBack(),
      builder: (context, backSnapshot) {
        return FutureBuilder(
          future: _controller.canGoForward(),
          builder: (context, forwardSnapshot) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: backSnapshot.data == true
                      ? () => _controller.goBack()
                      : null,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: forwardSnapshot.data == true
                      ? () => _controller.goForward()
                      : null,
                ),
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () => _controller.loadRequest(Uri.parse(widget.url)),
                ),
              ],
            );
          },
        );
      },
    );
  }
}