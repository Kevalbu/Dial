import 'package:dial/presentation/crm_screen/crm_screen.dart';
import 'package:dial/presentation/dialer_screen/dialer_screen.dart';
import 'package:dial/presentation/settings_screen/settings_screen.dart';
import 'package:dial/presentation/tasks_screen/tasks_screen.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';

import '../../../core/app_export.dart';

class DashBoardScreenController extends GetxController {
  var tabIndex = 0.obs;
  DateTime? currentBackPressTime;
  final key = GlobalKey<ExpandableFabState>();

  final pages = [
    DialerScreen(),
    const CRMScreen(),
    const TaskScreen(),
    const SettingsScreen()
  ];

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  Future<bool> onWillPop(bool value) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      ProgressDialogUtils.showSnackBar(
          bodyText: AppString.exit, headerText: AppString.error);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
