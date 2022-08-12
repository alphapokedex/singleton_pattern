import 'package:flutter/material.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/utilities/core.dart';

class InternetErrorView extends StatelessWidget with Core, Components {
  const InternetErrorView({Key? key}) : super(key: key);
  static const String routeName = '/no-internet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: hr25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetPngStrings.error),
              heightBox27,
              Container(
                decoration: BoxDecoration(
                  borderRadius: cir30,
                  color: primaryColor,
                ),
                padding: v20h35,
                child: Card(
                  color: white,
                  shape: RoundedRectangleBorder(borderRadius: cir20),
                  child: Padding(
                    padding: all32,
                    child: Text(
                      UiString.noInternet,
                      style: roboto700.copyWith(
                        fontSize: 30,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
