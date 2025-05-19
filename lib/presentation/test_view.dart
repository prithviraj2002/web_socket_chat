import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_socket_chat/generated/assets.dart';
import 'package:web_socket_chat/presentation/components/card_tile.dart';
import 'package:web_socket_chat/presentation/components/colors.dart';
import 'package:web_socket_chat/presentation/components/gpay_button.dart';

import 'components/strings.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.arrowColor,
              size: 24,
            )),
        title: Text(
          AppString.addToGpay,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: AppColors.bgBase,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24), topRight: Radius.circular(24))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              Assets.imagesGpayImage,
              height: 120,
              width: 250,
            ),
            const SizedBox(height: 12),
            Text(
              AppString.sayHelloText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: AppColors.textPrimary),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              AppString.addGpayCardText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: AppColors.textTertiary),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    return CardTile();
                  },
                  separatorBuilder: (ctx, index) {
                    return const SizedBox(height: 12,);
                  },
                  itemCount: 4),
            ),
            const SizedBox(height: 20),
            GpayButton(onTap: () {}, width: MediaQuery.of(context).size.width * 0.9,),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  AppString.maybeLater,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.textSecondary,
                      color: AppColors.textSecondary),
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
