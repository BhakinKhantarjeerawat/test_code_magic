import 'package:flutter/material.dart';

myNavigate(context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
