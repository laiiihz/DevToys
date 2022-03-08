import 'package:alga/l10n/l10n.dart';
import 'package:alga/tools/converters/number_base_converter/number_base_converter_provider.dart';
import 'package:alga/widgets/app_title.dart';
import 'package:alga/widgets/tool_view.dart';
import 'package:flutter/material.dart';

class NumberBaseConverterView extends StatefulWidget {
  const NumberBaseConverterView({Key? key}) : super(key: key);

  @override
  State<NumberBaseConverterView> createState() =>
      _NumberBaseConverterViewState();
}

class _NumberBaseConverterViewState extends State<NumberBaseConverterView> {
  final _provider = NumberBaseConverterProvider();
  @override
  Widget build(BuildContext context) {
    return ToolView.scrollVertical(
      title: Text(S.of(context).numberBaseConverter),
      children: _provider.controllers.map((e) {
        return AppTitleWrapper(
          title: e.title,
          actions: [
            IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () => e.copy(),
            ),
          ],
          child: TextField(
            controller: e.controller,
            inputFormatters: e.formatter,
            onChanged: (_) {
              _provider.onUpdate(e);
            },
          ),
        );
      }).toList(),
    );
  }
}
