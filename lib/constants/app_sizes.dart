import 'package:flutter/material.dart';

const double appBarHeight = 80;
const double appBarBottomHeight = 40;
const double commonAppBarHeight = 40;
const double pagePadding = 16;
const double cardWithTwoDividersMaxHeight = 248;
const double cardWithOneDividerMaxHeight = 240;

//dart 3.0에 추가된 record 써보고 싶었음
({double diameter, double radius}) getTimerSize(BuildContext context) {
  //* 전체 페이지 좌측 padding 16 + 타이머를 둘러싼 좌측 padding 16 = 32
  //* 전체 페이지 우측 padding 16 + 타이머를 둘러싼 우측 padding 16 = 32
  //* 타이머의 직경은 전체 너비에서 32 + 32를 뺀 값
  final double diameter = MediaQuery.of(context).size.width - 32 - 32;
  return (diameter: diameter, radius: diameter / 2);
}
