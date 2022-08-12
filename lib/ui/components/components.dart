import 'package:flutter/material.dart';
import 'package:singleton_pattern/ui/errors/internet_error_view.dart';
import 'package:singleton_pattern/ui/errors/maintenance_view.dart';
import 'package:singleton_pattern/utilities/core.dart';

mixin Components {
  NeverScrollableScrollPhysics get neverScroll =>
      const NeverScrollableScrollPhysics();

  Widget get dialogLoader => Center(
        child: Container(
          height: 50,
          width: 50,
          padding: all20,
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: cir10,
          ),
          child: const CircularProgressIndicator(),
        ),
      );

  Widget get maintenance => const MaintenanceView();
  Widget get noInternet => const InternetErrorView();

  Widget get loader => const Center(child: CircularProgressIndicator());
  Widget get errorText => const Center(child: Text(UiString.error));
  Widget get noDataText => const Center(child: Text(UiString.nothingFound));

  Duration get milli200 => const Duration(milliseconds: 200);
  Duration get milli300 => const Duration(milliseconds: 300);
  Duration get milli500 => const Duration(milliseconds: 500);
  Duration get milli800 => const Duration(milliseconds: 800);

  Duration get sec1 => const Duration(seconds: 1);
  Duration get sec2 => const Duration(seconds: 2);
  Duration get sec3 => const Duration(seconds: 3);
  Duration get sec5 => const Duration(seconds: 5);

  EdgeInsets get all4 => const EdgeInsets.all(4);
  EdgeInsets get all8 => const EdgeInsets.all(8);
  EdgeInsets get all16 => const EdgeInsets.all(16);
  EdgeInsets get all20 => const EdgeInsets.all(20);
  EdgeInsets get all24 => const EdgeInsets.all(24);
  EdgeInsets get all32 => const EdgeInsets.all(32);

  EdgeInsets get vr20 => const EdgeInsets.symmetric(vertical: 20);

  EdgeInsets get hr15 => const EdgeInsets.symmetric(horizontal: 15);
  EdgeInsets get hr20 => const EdgeInsets.symmetric(horizontal: 20);
  EdgeInsets get hr25 => const EdgeInsets.symmetric(horizontal: 25);
  EdgeInsets get hr35 => const EdgeInsets.symmetric(horizontal: 35);

  EdgeInsets get v20h35 => const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 20,
      );

  EdgeInsets get v8h25 => const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 8,
      );

  EdgeInsets get v10h15 => const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      );

  EdgeInsets get v4h10 => const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      );

  EdgeInsets get v2h8 => const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      );

  BorderRadius get cir10 => BorderRadius.circular(10);
  BorderRadius get cir15 => BorderRadius.circular(15);
  BorderRadius get cir20 => BorderRadius.circular(20);
  BorderRadius get cir30 => BorderRadius.circular(30);
  BorderRadius get cir40 => BorderRadius.circular(40);

  Radius get radCir10 => const Radius.circular(10);
  Radius get radCir15 => const Radius.circular(15);
  Radius get radCir20 => const Radius.circular(20);
  Radius get radCir30 => const Radius.circular(30);
  Radius get radCir80 => const Radius.circular(80);

  Widget get spacer => const Spacer();
  Widget get spacer2 => const Spacer(flex: 2);
  Widget get spacer3 => const Spacer(flex: 3);
  Widget get spacer5 => const Spacer(flex: 5);
  Widget get spacer8 => const Spacer(flex: 8);
  Widget get spacer10 => const Spacer(flex: 10);

  Widget get heightBox4 => const SizedBox(height: 4);
  Widget get heightBox8 => const SizedBox(height: 8);
  Widget get heightBox11 => const SizedBox(height: 11);
  Widget get heightBox16 => const SizedBox(height: 16);
  Widget get heightBox20 => const SizedBox(height: 20);
  Widget get heightBox27 => const SizedBox(height: 27);

  Widget get widthBox4 => const SizedBox(width: 4);
  Widget get widthBox8 => const SizedBox(width: 8);
  Widget get widthBox16 => const SizedBox(width: 16);
}
