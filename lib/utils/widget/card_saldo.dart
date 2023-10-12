// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nutech_flutter_apps/resources/resources.dart';
import 'package:sizer/sizer.dart';

class CardSaldo extends StatefulWidget {
  CardSaldo({
    Key? key,
    required this.showSaldobutton,
    required this.nominal,
  }) : super(key: key);

  final bool? showSaldobutton;
  String nominal;

  @override
  State<CardSaldo> createState() => _CardSaldoState();
}

class _CardSaldoState extends State<CardSaldo> {
  bool showNominal = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            color: AppColors.redCard,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Saldo Anda",
                style: TextStyle(
                  fontSize: 4.w,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white
                ),
              ),
              SizedBox(height: 1.h,),
              Text(
                (showNominal || widget.showSaldobutton == false) ? "Rp ${widget.nominal}" : "Rp •••••••" ,
                style: TextStyle(
                  fontSize: 8.w,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white
                ),
              ),
              SizedBox(height: 3.h,),
              (widget.showSaldobutton ?? false)
              ? InkWell(
                  onTap: () {
                    setState(() {
                      showNominal = !showNominal;
                    });
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Lihat Saldo',
                        style: TextStyle(
                          fontSize: 3.w,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white
                        ),
                      ),
                      SizedBox(width: 2.w,),
                      (showNominal)
                      ? Icon(
                          Icons.visibility_outlined,
                          size: (3.5).w,
                          color: AppColors.white,
                        )
                      : Icon(
                          Icons.visibility_off_outlined,
                          size: (3.5).w,
                          color: AppColors.white,
                        )
                    ],
                  ),
                )
              : SizedBox(),
            ],
          ),
        )
      ],
    );
  }
}