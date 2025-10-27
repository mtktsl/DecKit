# DecKit

Bring **SwiftUI‑style declarative syntax and reactive bindings** to UIKit —  
while keeping **UIKit’s native keywords** you already know and use.

With DecKit you don’t need to learn a new vocabulary.  
You still write `.text`, `.font`, `.textColor`, `.onTapGesture`, etc. —  
but now in a **declarative, chainable style** that feels like SwiftUI.

---

## 🚀 Quick Start

- DeclarativeViewController:
```swift
import DecKit
import UIKit

final class ViewController: DeclarativeViewController {

    @UIBinding var text = "Hello World"

    override var body: UIView {
        UILabel()
            .text($text)
            .font(.systemFont(ofSize: 36))
            .textColor(.white)
            .textAlignment(.center)
            .onTapGesture { [weak self] in
                self?.text = "Changed!"
            }
    }
}
```

- DeclarativeUIView:
```swift
import DecKit
import UIKit

final class MyView: DeclarativeUIView {

    @UIBinding var text = "Hello World"

    override var body: UIView {
        UILabel()
            .text($text)
            .font(.systemFont(ofSize: 36))
            .textColor(.white)
            .textAlignment(.center)
            .onTapGesture { [weak self] in
                self?.text = "Changed!"
            }
    }
}
```

When the label is tapped, the `@UIBinding` updates, and the label’s text changes automatically.

## ✨ Features

- **Declarative syntax** for UIKit views:
  ```swift
  UILabel()
      .text("Hello World")
      .font(.systemFont(ofSize: 24))
      .textColor(.systemBlue)
  ```

- Reactive bindings with @UIBinding:

```swift
@UIBinding var text = "Hello World"

UILabel()
    .text($text) // updates automatically when `text` changes
```

- Build layout containers using `resultBuilder` closures:

```swift
UIStackView.vertical(spacing: 8) {
    UILabel()
      .text($title)

    UILabel()
      .text($description)
}
```

- Base classes with body:

`DeclarativeUIView`

`DeclarativeUIViewController`

- Just subclass and override `body`:

```swift
final class ViewController: DeclarativeUIViewController {
    @UIBinding var text = "Hello World"

    override var body: UIView {
        UIStackView.vertical {
            UILabel()
              .text($text)

            UILabel()
                .title("Change text")
                .onTapGesture { [weak self] in
                    self?.text = "Changed!"
                }
        }
    }
}
```

- Shared state: Pass a UIBinding into subviews and mutate it anywhere — all observers update automatically.

- onChange support: Observe binding changes directly on any UIView:

```swift
UILabel()
    .onChange(of: $text) { label, newValue in
        label?.textColor = newValue.isEmpty ? .red : .green
    }
```

# 📦 Installation

### Add via Xcode
1. In Xcode, go to **File > Add Packages…**
2. Enter the repository URL:  
   `https://github.com/mtktsl/DecKit.git`
3. Select **Add Package**.

### Add via Package.swift
Add DecKit to your dependencies in `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/mtktsl/DecKit.git", from: "1.0.0")
]

```

# 🔍 How It Works
- `UIBinding<T>` is a class‑based property wrapper built on top of `@Published`.
- Each binding manages its own Combine subscription and ensures updates are delivered on the main run loop.
- BindingObservable is a protocol adopted by `UIView` that provides the onChange(of:) API.
- Extension methods (like `.text(_:)`, `.font(_:)v, `.title(_:)`) use onChange to reactively update views when the bound value changes.
- `DeclarativeUIView` and `DeclarativeUIViewController` provide an `open var body: UIView` property, mirroring SwiftUI’s design.
- This design means you don’t need to manage AnyCancellable sets in your views — bindings clean up after themselves.

# 📌 Future Plans
- More layout containers (`UICollectionView` DSL etc.)
- Additional built‑in modifiers for UIKit components

# 🤝 Contributing
Contributions are welcome! Feel free to open issues or submit pull requests to help expand DecKit.
