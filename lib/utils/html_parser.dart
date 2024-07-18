import 'package:html/parser.dart';

class HtmltoTextParser {
  String htmlDecoder(String text) {
    String result = parseFragment(text).text.toString();
    return result;
  }
}
