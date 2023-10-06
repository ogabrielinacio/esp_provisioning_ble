# example

"A new Flutter project."

## Getting Started

In this example, we used the [flutter_ble_lib_ios_15](https://github.com/davejlin/flutter_ble_lib_ios_15) as the BLE Flutter package.

If you are also using this library, please make the following changes to your application:

1. Inside your `android/app/build.gradle` file, change the `minSdkVersion` to 21:

```gradle
minSdkVersion 21
```

2. Inside your `android/build.gradle` file, update the `ext.kotlin_version` to 1.9.0:

```gradle
ext.kotlin_version = '1.9.0'
```