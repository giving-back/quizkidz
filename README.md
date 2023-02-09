# quizkidz

https://firebase.google.com/docs/flutter/setup?platform=ios

Emulator install - sudo npm i -g firebase-tools

firebase init

firebase emulators:start

To rebuild the freezed classes - flutter pub run build_runner build --delete-conflicting-outputs

To sort imports - flutter pub run import_sorter:main to cleanup imports

Remember the explicit_to_json in build.yaml is important for saving freezed objects to firebase.