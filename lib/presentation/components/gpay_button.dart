import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:web_socket_chat/generated/assets.dart';
import 'package:web_socket_chat/presentation/components/colors.dart';
import 'package:web_socket_chat/presentation/components/strings.dart';

class GpayButton extends StatelessWidget {
  final double? width;
  final Color? btnColor;
  final String? btnText;
  final Function onTap;

  const GpayButton({this.width, this.btnColor, this.btnText, required this.onTap,  super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Container(
        height: 50,
        width: width ?? 328,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: btnColor ?? AppColors.appBlack,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              btnText ?? AppString.addTo,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.appWhite),
            ),
            const SizedBox(width: 4,),
            SvgPicture.asset(Assets.imagesGpayLogo, height: 24, width: 62,),
          ],
        ),
      ),
    );
  }
}
