# Tu Home

## Delete all generated files
Get-ChildItem -Path . -Include *.g.dart,*.chopper.dart,*.gen.dart -Recurse -Force | Remove-Item -Force

## Run for generated all files
dart run build_runner build

## Build apk 
flutter build apk --split-per-abi --dart-define=URL=https://tu-home-backend.up.railway.app
