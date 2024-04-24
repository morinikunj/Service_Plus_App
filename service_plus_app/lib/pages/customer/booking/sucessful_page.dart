import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:service_plus_app/components/successful_widget.dart';
import 'package:service_plus_app/utils/constants/text_strings.dart';

class BookingSuccessPage extends StatelessWidget {
  const BookingSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessfulWidget(
      desc: bookingSucessDesc,
      onPress: () {},
    );
  }
}
