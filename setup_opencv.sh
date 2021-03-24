#!/bin/bash

set -e

# Download OpenCV Android SDK

opencv_sdk_zip="cache/opencv-android-sdk.zip"


echo "Downloading ${opencv_sdk_zip}..."
download_url="https://pullrequest.opencv.org/buildbot/export/opencv_releases/master-contrib_pack-contrib-android/20210321-095343--11325/OpenCV4Android.zip"
echo "Download URL: ${download_url}"
wget -c -O ${opencv_sdk_zip} ${download_url}

echo "Unzipping OpenCV SDK..."
unzip -qqo ${opencv_sdk_zip} -d opencv_sdk
echo "Moving files in correct place..."
cp -r opencv_sdk/OpenCV-android-sdk/sdk/* opencv/
echo "Skipping Lint... (To be removed when fixed)"
echo "android { lintOptions { abortOnError false } }" >> opencv/build.gradle

echo "Cleaning Up..."
rm -rf opencv_sdk
