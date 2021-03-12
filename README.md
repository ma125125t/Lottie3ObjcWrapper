# Lottie3ObjcWrapper

[![CI Status](https://img.shields.io/travis/FFFang/Lottie3ObjcWrapper.svg?style=flat)](https://travis-ci.org/FFFang/Lottie3ObjcWrapper)
[![Version](https://img.shields.io/cocoapods/v/Lottie3ObjcWrapper.svg?style=flat)](https://cocoapods.org/pods/Lottie3ObjcWrapper)
[![License](https://img.shields.io/cocoapods/l/Lottie3ObjcWrapper.svg?style=flat)](https://cocoapods.org/pods/Lottie3ObjcWrapper)
[![Platform](https://img.shields.io/cocoapods/p/Lottie3ObjcWrapper.svg?style=flat)](https://cocoapods.org/pods/Lottie3ObjcWrapper)

## Example

Lottie3 is rewritten in Swift,so it's not possible to directly use Lottie3 and its new feature in Objective-C project.

This lib is to wrap native Lottie3 class with an `@objc` keyword,so we can use indirectly.

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```
@import Lottie3ObjcWrapper;

LottieAnimationView *loader = [[LottieAnimationView alloc] initWithFrame:CGRectMake(0, 100, 300, 300)];
loader.loop = false;
[loader loadAnimationWithName:@"demo"];
[loader playWithCompletion:nil];
[self.view addSubview:loader];
```

## Requirements

## Installation

Lottie3ObjcWrapper is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Lottie3ObjcWrapper'
```

## Author

FFFang, fang@soulapp.cn

## License

Lottie3ObjcWrapper is available under the MIT license. See the LICENSE file for more info.
