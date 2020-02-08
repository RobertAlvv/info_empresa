import 'package:flutter/material.dart';
import 'list.dart';
import '../widgets_dashboard/widgetsDashboard.dart';


List<Widget> menuDrawer(BuildContext context) {
  List<Widget> list = List<Widget>();
  list.add(headerDrawer());
  for (Map it in listMenuOpcionDrawer) {
    list.add(menuDrawerItem(context, it));
  }
  return list;
}
 