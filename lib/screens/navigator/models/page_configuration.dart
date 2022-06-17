import 'package:training/screens/navigator/constants.dart';
import 'package:flutter/material.dart';
class PageConfiguration{
  final String key;
  final String path;
  final Pages uiPage;
  PageAction currentPageAction;
PageConfiguration({required this.key,required this.path,required this.uiPage,required this.currentPageAction});
}

class PageAction {
  PageState pageState;
  PageConfiguration? pageConfiguration;
  List<PageConfiguration>? pages;
  Widget? widget;
  PageAction({this.pageState=PageState.none,this.pageConfiguration=null,this.pages=null,this.widget=null});
}

