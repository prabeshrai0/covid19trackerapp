

import 'package:flutter/material.dart';

Color kprimaryColor=Color(0xff166DE0);
Color kConfirmedColor=Color(0xffff1242);
Color kActiveColor =Color(0xff017bff);
Color kRecoveredColor =Color(0xff29A746);
Color kDeathColor=Color(0xff6D757D);



LinearGradient kGradientShimmer=LinearGradient(
  begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Colors.grey[300],Colors.grey[100]]);


RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
Function mathFunc = (Match match) => '${match[1]}.';