import 'package:flutter/material.dart';
import 'package:singleton_pattern/ui/components/components.dart';
import 'package:singleton_pattern/utilities/core.dart';

class PageNotFoundView extends StatelessWidget with Core, Components {
  const PageNotFoundView({Key? key}) : super(key: key);
  static const String routeName = '/page-not-found';

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
                AssetPngStrings.notFound,
              ),
              heightBox27,
              Text(
                'oops! 404'.toCamelCase(),
                style: roboto700.copyWith(fontSize: 30),
              ),
              heightBox16,
              Text(
                'Sorry about that but the page you are '
                'looking for was not found',
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
                onPressed: navigator.pop,
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
