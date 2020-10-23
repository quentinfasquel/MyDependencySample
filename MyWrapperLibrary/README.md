# MyWrapperLibrary

This is an example of a Swift Package describing an `Objective-C` framework that provides a wrapper for a C++ api.

The C++ library being distributed as a `xcframework`, it is necessary to run `MyCppLibrary/scripts/build.sh` from anywhere.

Typically, the `binaryTarget` in _Package.swift_ can be replaced by a remote url to a zip archive with the proper checksum.
