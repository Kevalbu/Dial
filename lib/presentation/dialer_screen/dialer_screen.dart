import 'package:dial/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:dial/core/utils/app_fonts.dart';

import '../../core/utils/color_constant.dart';
import '../../core/utils/size_utils.dart';
import '../../widgets/numPad.dart';
import 'controller/dialer_screen_controller.dart';

class DialerScreen extends GetWidget<DialerScreenController> {
  DialerScreen({super.key});

  DialerScreenController controllerD = Get.put(DialerScreenController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Text(
          AppString.dial,
          style: DL.styleDL(
              fontSize: (50),
              fontWeight: FontWeight.bold,
              fontColor: ColorConstant.primaryBlue),
        )),
        NumPad(
          type: '-',
          controller: controllerD.pinController,
          delete: () {
            HapticFeedback.lightImpact();

            if (controllerD.pinController.text.isNotEmpty) {
              controllerD.pinController.text = controllerD.pinController.text
                  .substring(0, controllerD.pinController.text.length - 1);
            }
          },
          // do something with the input numbers
          onSubmit: () {
            debugPrint('Your code: ${controllerD.pinController.text}');
          },
        ),
      ],
    );
  }
}
