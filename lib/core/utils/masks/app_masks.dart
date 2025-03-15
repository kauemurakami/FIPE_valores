import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

abstract class AppMasks {
  static final fipeMask = MaskTextInputFormatter(
    mask: '######-#',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
