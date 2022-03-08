import 'package:alga/utils/clipboard_util.dart';
import 'package:flutter/material.dart';

class MarkdownPreviewProvider extends ChangeNotifier {
  final markdownController = TextEditingController();

  String _data = '';
  String get data => _data;
  set data(String value) {
    _data = value;
    notifyListeners();
  }

  copy() {
    ClipboardUtil.copy(markdownController.text);
  }

  clear() {
    markdownController.clear();
    convert();
  }

  convert() {
    data = markdownController.text;
  }

  @override
  dispose() {
    markdownController.dispose();
    super.dispose();
  }
}
