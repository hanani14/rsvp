import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextStyleGlobal{
  TextStyle cResponsive(context, fontSize, color, fontWeight, fontStyle) => TextStyle(color: color, fontWeight: fontWeight, fontStyle: fontStyle, fontSize: Adaptive.h((fontSize * 0.1) + 0.3));
  TextStyle form1FontSize1 = const TextStyle(fontSize: 12.0, color: Colors.black);
    TextStyle form1FontSize2 = const TextStyle(fontSize: 12.0, color: Colors.black45);

  TextStyle btnText = const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14);

}