import 'package:dial/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import 'controller/dashbboard_screen_controller.dart';

class DashBoardScreen extends GetWidget<DashBoardScreenController> {
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
      body: PopScope(
        canPop: true,
        onPopInvoked: controller.onWillPop,
        child: Obx(
          () => controller.pages[controller.tabIndex.value],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: ColorConstant.primaryBlue),
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.call,
          color: ColorConstant.primaryWhite,
          size: getHeight(30),
        ),
      ),
      bottomNavigationBar: Container(
        height: getHeight(80),
        decoration: const BoxDecoration(
          color: ColorConstant.primaryWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: Obx(() => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconWidget(index: 0, icon: Icons.call, label: AppString.dialer),
                iconWidget(
                    index: 1,
                    icon: Icons.person_pin_rounded,
                    label: AppString.crm),
                iconWidget(
                    index: 2, icon: Icons.check_box, label: AppString.tasks),
                iconWidget(
                    index: 3, icon: Icons.settings, label: AppString.settings),
              ],
            )),
      ),
    );
  }

  Widget iconWidget(
      {required int index, required IconData icon, required String label}) {
    return Bounce(
      onTap: () {
        controller.changeTabIndex(index);
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getWidth(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              SizedBox(
                height: getHeight(5),
              ),
              Text(
                label,
                style: controller.tabIndex.value == index
                    ? DL.styleDL(fontColor: ColorConstant.primaryBlue)
                    : DL.styleDL(fontColor: ColorConstant.primaryBlack),
              )
            ],
          ),
        ),
      ),
    );
  }
}
