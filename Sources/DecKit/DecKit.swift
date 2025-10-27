import UIKit
import Combine
import SwiftUI

private final class TestViewController: DeclarativeViewController {
    
    @UIBinding var colors: [UIColor] = [
        .systemBlue
    ]
    
    private var cancellables: Set<AnyCancellable> = []
    
    override var body: UIView {
        return UIStackView.horizontal(spacing: 8) {
            UILabel()
                .text("Change Color")
                .font(.systemFont(ofSize: 36))
                .textColor(.white)
                .textAlignment(.center)
                .onTapGesture { [weak self] in
                    self?.setRandomColor()
                }
            
            TestSubview(color: $colors[0])
        }
        .alignment(.center)
        .backgroundColor($colors[0])
    }
    
    private func setRandomColor() {
        let newColor = UIColor(
            red:   .random(in: 0...1),
            green: .random(in: 0...1),
            blue:  .random(in: 0...1),
            alpha: 1.0
        )
        colors[0] = newColor
    }
}

private final class TestSubview: DeclarativeUIView {
    
    @UIBinding var color: UIColor
    
    override var body: UIView {
        UIView()
            .backgroundColor($color)
            .constraint
            .height(equalToConstant: 100)
            .width(equalToConstant: 100)
            .activate()
            .sourceView
            .onTapGesture { [weak self] in
                self?.setRandomColor()
            }
            .borderColor(.systemGray4)
            .borderWidth(2)
    }
    
    init(color: UIBinding<UIColor>) {
        self._color = color
        super.init(frame: .zero)
    }
    
    private func setRandomColor() {
        let newColor = UIColor(
            red:   .random(in: 0...1),
            green: .random(in: 0...1),
            blue:  .random(in: 0...1),
            alpha: 1.0
        )
        
        let newColor2 = UIColor(
            red:   .random(in: 0...1),
            green: .random(in: 0...1),
            blue:  .random(in: 0...1),
            alpha: 1.0
        )
        color = newColor
        color = newColor2
    }
    
    required init?(coder: NSCoder) {
        self._color = .constant(.clear)
        super.init(coder: coder)
    }
}

@available(iOS 17.0, *)
#Preview {
    TestViewController()
}
