# MyDependencySample

This is an example of a Swift Package `MyWrapperLibrary` describing an `Objective-C` framework that provides a wrapper for a C++ api.

The C++ library being distributed as a `xcframework`, it is necessary to run `MyCppLibrary/scripts/build.sh` from anywhere, which will place `libMyCppLibrary.xcframework` in directory `MyWrapperLibrary/libs`.

Typically, the `binaryTarget` referenced in _MyWrapperLibrary/Package.swift_ can be replaced by a remote url to a zip archive with the proper checksum.

## Check the issue

* Run `MyCppLibrary/scripts/build.sh`
* Open `MyDependencySample.xcodeproj` and Build scheme `MyDependencySample`
* Notice compile issue `'EventListener.hpp' file not found`
* Close the project
* Open `MyWrapperLibrary/Package.swift` with Xcode 12, Build and event Run Tests
* Notice that there are no issues, headers are found within `libMyCppLibrary.xcframework`
