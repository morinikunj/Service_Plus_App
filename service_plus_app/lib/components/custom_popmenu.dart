import 'package:flutter/material.dart';

Widget customPopupMenu({
  required BuildContext context,
  required List<PopupMenuItem<String>> items,
   String? selectedValue,
  void Function(String?)? onSelected,
  Widget? child
}) {
  return PopupMenuButton<String>(
    itemBuilder: (BuildContext context) => items,
    onSelected: onSelected,
    initialValue: selectedValue,
    child: child ?? Icon(Icons.arrow_drop_down),
  );
}
