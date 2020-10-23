#!/bin/sh

ROOT_PATH=$(cd "$(dirname "$0")/.."; pwd -P)
pushd $ROOT_PATH > /dev/null

BUILD_DIR="build"
OUTPUT_PATH="${ROOT_PATH}/../MyWrapperLibrary/libs"

# requires BUILD_DIR to be set, defaults to `build`
function build_library_xcframework() { # PRODUCT_NAME, XCODEPROJ_PATH, SCHEME
    PRODUCT_NAME=$1
    PROJECT_NAME=$2
    SCHEME=$3
    OUTPUT_FILE="${OUTPUT_PATH}/${PRODUCT_NAME}.xcframework"

    # Remove previous products
    rm -rf "${OUTPUT_FILE}"

    # Build archive for iphoneos
    xcodebuild archive -project "${PROJECT_NAME}" -scheme "${SCHEME}" -sdk iphoneos \
     -archivePath "${BUILD_DIR}/${PRODUCT_NAME}-iphoneos.xcarchive" SKIP_INSTALL=NO BUILD_BINARY_FOR_DISTRIBUTION=YES

    # Build archive for iphonesimulator
    xcodebuild archive -project "${PROJECT_NAME}" -scheme "${SCHEME}" -sdk iphonesimulator \
     -archivePath "${BUILD_DIR}/${PRODUCT_NAME}-iphonesimulator.xcarchive" SKIP_INSTALL=NO BUILD_BINARY_FOR_DISTRIBUTION=YES

    # Package as XCFramework
    xcodebuild -create-xcframework \
        -library "${BUILD_DIR}/${PRODUCT_NAME}-iphoneos.xcarchive/Products/usr/local/lib/${PRODUCT_NAME}.a" \
        -headers "${BUILD_DIR}/${PRODUCT_NAME}-iphoneos.xcarchive/Products/usr/local/include" \
        -library "${BUILD_DIR}/${PRODUCT_NAME}-iphonesimulator.xcarchive/Products/usr/local/lib/${PRODUCT_NAME}.a" \
        -headers "${BUILD_DIR}/${PRODUCT_NAME}-iphonesimulator.xcarchive/Products/usr/local/include" \
        -output "${OUTPUT_FILE}"
}

build_library_xcframework "libMyCppLibrary" "MyCppLibrary.xcodeproj" "MyCppLibrary"

popd > /dev/null
