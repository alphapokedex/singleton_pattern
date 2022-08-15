import 'package:flutter/material.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/utilities/core.dart';

class MaintenanceView extends StatelessWidget with Core, Components {
  /// Maintenance error view shows construction people image
  /// to the user when the server is down or restarting
  const MaintenanceView({Key? key}) : super(key: key);
  static const String routeName = '/maintenance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: hr25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetPngStrings.maintenance,
              ),
              heightBox27,
              Text(
                "we'll be back soon".toCamelCase(),
                style: roboto700.copyWith(fontSize: 30),
              ),
              heightBox16,
              Text(
                'We are down for scheduled maintenance '
                'and expect to back online in a few minutes.',
                style: roboto400.copyWith(
                  height: 1.5,
                  letterSpacing: 1,
                  color: textGrey,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              heightBox27,
              ElevatedButton(
                onPressed: navigator.systemPop,
                child: const Text('Exit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
