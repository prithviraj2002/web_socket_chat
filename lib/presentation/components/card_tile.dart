import 'package:flutter/material.dart';
import 'package:web_socket_chat/generated/assets.dart';

import 'colors.dart';

class CardTile extends StatelessWidget{
  final String? title;
  final String? subtitle;
  const CardTile({this.title, this.subtitle, super.key});

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Image.asset(Assets.imagesCardTileLogo),
      title: Text(title ?? "Seminar expenses", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, color: AppColors.textPrimary),),
      subtitle: Text(subtitle ?? "Physical ......3443", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.textTertiary),),
    );
  }
}