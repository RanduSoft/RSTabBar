# RSTabBar

![](https://img.shields.io/badge/platform-iOS-lightgrey)
![](https://img.shields.io/badge/iOS-13.0%2B-blue)
![](https://img.shields.io/badge/Swift-5-orange?logo=Swift&logoColor=white)

`SwiftUI` standard `TabView` component lacks basic functions from `UIKit` like hiding the `TabBar` in specific screens.
`RSTabBar` aims to fix that while keeping the default look and feel of the `TabBar`

## Requirements

- SwiftUI
- iOS 13.0 or newer

## Installation

**RSTabBar** is available through [Swift Package Manager](https://github.com/apple/swift-package-manager)

### Swift Package Manager
- In Xcode select: 
  ```
  File > Swift Packages > Add Package Dependency...
  ```
- Then paste this URL: 
  ```
  https://github.com/rursache/RSTabBar
  ```
## Usage

The following view will have 2 custom tabs, each with their `Text` view:

```swift
import SwiftUI
import RSTabBar

struct DemoView: View {
	static let tabs = [
		TabItem(index: 0, title: "Home", icon: "house"),
		TabItem(index: 1, title: "More", icon: "bolt.car")
	]
	
	@State var tabBarVisible: Bool = true
	@State var tabs = DemoView.tabs
	@State var selectedTab: TabItem = DemoView.tabs.first!
	
	var body: some View {
		AdvancedTabBar(tabs: $tabs, selectedTab: $selectedTab, tabBarVisible: $tabBarVisible) {
		
			Text("First view")
				.font(.title).bold()
				.padding()
				.tag(self.tabs[1])
				
			Text("First view")
				.font(.title).bold()
				.padding()
				.tag(self.tabs[2])
		}
	}
}

```

Hiding the tabbar is easy, just `tabBarVisible = false` anywhere

Check out the more advanced [example](https://github.com/rursache/RSTabBar/blob/master/ExampleView.swift) to understand how to further customize `RSTabBar`

## Roadmap
- Support for any `Image` in `TabItem` instead of just `SFSymbols`
- Hopefully will fix some of the issues below

## Known issues
- Depending on the child `View`s, sometimes there is a transparent gap between the bottom of the `RSTabBar` and the bottom of the screen on iPhones with notches. This can be fixed by adding `.padding(.bottom, showTabBar ? 10 : 0)` in the top View of the child. This is not ideal and I'll try to fix it.
- The safe area of the OG transparent `TabBar` are there and this is on purpose. However there are cases where you don't want that padding. Again, something like `.padding(.bottom, -40)` will adjust or remove that padding. I'm not sure what I can do about this.

## Contribution

If you struggle with something feel free to [open an issue](https://github.com/rursache/RSTabBar/issues/new). 
Pull requests are also appreciated as I still learn SwiftUI.

## License

**RSTabBar** is under the terms and conditions of the [MIT license]().

```
MIT License

Copyright (c) 2022 Radu Ursache

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
