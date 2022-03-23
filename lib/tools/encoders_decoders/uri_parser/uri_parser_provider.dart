part of './uri_parser_view.dart';

final _input = StateProvider.autoDispose<TextEditingController>((ref) {
  final controller = TextEditingController();
  ref.onDispose(controller.dispose);
  return controller;
});

final _uri = StateProvider.autoDispose<Uri?>((ref) {
  return Uri.parse(ref.watch(_input).text);
});

final _uriParts = StateProvider.autoDispose<List<UriPart>>((ref) {
  final uri = ref.watch(_uri);
  if (uri == null) return [];
  String? origin;
  try {
    origin = uri.origin;
  } catch (e) {
    origin = null;
  }

  String params = JsonEncoder.withIndent(' ' * 4).convert(uri.queryParameters);
  return [
    UriPart(title: (context) => 'host', name: uri.host),
    if (origin != null) UriPart(title: (context) => 'origin', name: origin),
    UriPart(title: (context) => 'scheme', name: uri.scheme),
    UriPart(title: (context) => 'port', name: '${uri.port}'),
    UriPart(title: (context) => 'path', name: uri.path),
    UriPart(
      title: (context) => 'path',
      name: params,
      lang: LangHighlightType.json,
    ),
  ];
});

class UriPart {
  final String Function(BuildContext context) title;
  final String name;
  final String? lang;
  UriPart({
    required this.title,
    required this.name,
    this.lang,
  });
}
