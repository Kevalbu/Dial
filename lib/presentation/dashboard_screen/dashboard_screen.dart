import 'package:dial/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import 'controller/dashbboard_screen_controller.dart';

class DashBoardScreen extends GetWidget<DashBoardScreenController> {
  DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    sizeCalculate(context);

    return Scaffold(
      body: Stack(
        children: [
          PopScope(
            canPop: true,
            onPopInvoked: controller.onWillPop,
            child: Obx(
              () => controller.pages[controller.tabIndex.value],
            ),
          ),
          Obx(() => controller.tabIndex.value == 0
              ? Positioned(
                  bottom: 17,
                  right: 17,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.customDialerScreenRout);
                    },
                    child: Container(
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
                  ),
                )
              : SizedBox.shrink())
        ],
      ),

      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: Obx(
        () => controller.tabIndex.value == 1
            ? ExpandableFab(
                key: controller.key,
                // duration: const Duration(milliseconds: 500),
                distance: 60.0,
                type: ExpandableFabType.up,
                // pos: ExpandableFabPos.left,
                childrenOffset: const Offset(0, 0),
                fanAngle: 0,
                openButtonBuilder: RotateFloatingActionButtonBuilder(
                  child: const Icon(Icons.add),
                  fabSize: ExpandableFabSize.regular,
                  foregroundColor: ColorConstant.primaryWhite,
                  backgroundColor: ColorConstant.primaryBlue,
                  shape: const CircleBorder(),
                  angle: 3.14 * 2,
                ),
                closeButtonBuilder: RotateFloatingActionButtonBuilder(
                  child: const Icon(Icons.close),
                  fabSize: ExpandableFabSize.regular,
                  foregroundColor: ColorConstant.primaryWhite,
                  backgroundColor: ColorConstant.primaryBlue,
                  shape: const CircleBorder(),
                  angle: 3.14 * 2,
                ),
                // overlayStyle: ExpandableFabOverlayStyle(
                //   // color: Colors.black.withOpacity(0.5),
                //   blur: 5,
                // ),
                onOpen: () {
                  debugPrint('onOpen');
                },
                afterOpen: () {
                  debugPrint('afterOpen');
                },
                onClose: () {
                  debugPrint('onClose');
                },
                afterClose: () {
                  debugPrint('afterClose');
                },
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: ColorConstant.primaryBlue),
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth(18), vertical: getHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person_pin_rounded,
                          color: ColorConstant.primaryWhite,
                        ),
                        SizedBox(
                          width: getWidth(10),
                        ),
                        Text(
                          AppString.contact,
                          style: DL.styleDL(
                              fontSize: 14,
                              fontColor: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: ColorConstant.primaryBlue),
                    padding: EdgeInsets.symmetric(
                        horizontal: getWidth(18), vertical: getHeight(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.list,
                          color: ColorConstant.primaryWhite,
                        ),
                        SizedBox(
                          width: getWidth(10),
                        ),
                        Text(
                          AppString.lists,
                          style: DL.styleDL(
                              fontSize: 14,
                              fontColor: ColorConstant.primaryWhite,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : SizedBox.shrink(),
      ), // Bounce(
      //   onTap: () {
      //     Get.toNamed(AppRoutes.customDialerScreenRout);
      //   },
      //   child: Container(
      //     decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(100),
      //         color: ColorConstant.primaryBlue),
      //     padding: EdgeInsets.all(10),
      //     child: Icon(
      //       Icons.call,
      //       color: ColorConstant.primaryWhite,
      //       size: getHeight(30),
      //     ),
      //   ),
      // ),
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
