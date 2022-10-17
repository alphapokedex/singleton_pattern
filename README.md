# Singleton Pattern
A new Flutter project template using singleton services/configs and mixins.

## Architecture
Folder structure followed in this project has singleton as it's main focus.
Using core utilities as mixins.
And local data caching using hive generated models.

```
│   .firebaserc
│   .gitignore
|
├───.fvm
│       fvm_config.json
|
├───assets
│   ├───font
│   │       Roboto-Black.ttf
│   │       Roboto-BlackItalic.ttf
│   │       Roboto-Bold.ttf
│   │       Roboto-BoldItalic.ttf
│   │       Roboto-Italic.ttf
│   │       Roboto-Light.ttf
│   │       Roboto-LightItalic.ttf
│   │       Roboto-Medium.ttf
│   │       Roboto-MediumItalic.ttf
│   │       Roboto-Regular.ttf
│   │       Roboto-Thin.ttf
│   │       Roboto-ThinItalic.ttf
│   │
│   └───png
│           cable.png
│           img_placeholder.png
│           maintenance.png
│           not_found.png
|
├───lib
│   │   main.dart
│   │
│   ├───config
│   │       api_config.dart
│   │       firebase_config.dart
│   │       hive_config.dart
│   │
│   ├───data
│   │   ├───api
│   │   │       api_end_points.dart
│   │   │       connectivity_service.dart
│   │   │       exceptions.dart
│   │   │       http_wrapper.dart
│   │   │
│   │   ├───box
│   │   │       preference_box.dart
│   │   │
│   │   ├───generated_model
│   │   │       generated_model_export.dart
│   │   │       preference_model.dart
│   │   │
│   │   └───model
│   │           api_response.dart
│   │           model_export.dart
│   │           server_status.dart
│   │
│   ├───ui
│   │   │   app_root.dart
│   │   │
│   │   ├───components
│   │   │       components.dart
│   │   │       google_icon_custom_painter.dart
│   │   │       shadow_button.dart
│   │   │       text_widgets.dart
│   │   │
│   │   └───errors
│   │           internet_error_view.dart
│   │           maintenance_view.dart
│   │           page_not_found_view.dart
│   │
│   └───utilities
│           core.dart
│           enums.dart
│           extensions.dart
│           log_util.dart
│           png.dart
│           routes.dart
│           theme.dart
│           typedefs.dart
│           ui_strings.dart
│
├───policy
│       index.html
│
├───test
│       widget_test.dart
│
├───web
│   │   favicon.png
│   │   index.html
│   │   manifest.json
│   │
│   └───icons
│           Icon-192.png
│           Icon-512.png
│           Icon-maskable-192.png
│           Icon-maskable-512.png
|
│   .metadata
│   analysis_options.yaml
│   firebase.json
│   firestore.rules
│   LICENSE
│   pubspec.lock
│   pubspec.yaml
│   README.md
│   storage.rules
```
