# form

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

run command flutter run -d chrome --web-renderer html
flutter build web --web-renderer canvaskit
flutter build web --web-renderer canvaskit --release
or

you can go to index.html file on web folder, then change

onEntrypointLoaded: function(engineInitializer) {
engineInitializer.initializeEngine().then(function(appRunner) {
appRunner.runApp();
});
}

to

onEntrypointLoaded: function(engineInitializer) {
let config = { renderer: 'html' };
engineInitializer.initializeEngine(config).then(function(appRunner) {
appRunner.runApp();
});
}
Based on https://docs.flutter.dev/platform-integration/web/renderers

"auto (default) - automatically chooses which renderer to use. This option chooses the HTML renderer when the app is running in a mobile browser, and CanvasKit renderer when the app is running in a desktop browser."