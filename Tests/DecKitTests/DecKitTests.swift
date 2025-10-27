import Testing
import UIKit
@testable import DecKit

private final class TestView: UIView {
    
    @MainActor
    deinit {
        DecKitTests.deinitCount[ObjectIdentifier(Self.self)] = 1
    }
}

@Suite("DecKit Tests")
struct DecKitTests {
    
    @MainActor
    static var deinitCount: [ObjectIdentifier: Int] = [:]
    
    @Test
    @MainActor
    func memoryLeak() async throws {
        @UIBinding var number: Int = 0
        
        var view: UIView? = TestView()
            .tag($number)
            .onTapGesture {}
            .constraint
            .sourceView
        
        #expect(Self.deinitCount[ObjectIdentifier(TestView.self)] == nil)
        
        view = nil
        
        #expect(Self.deinitCount[ObjectIdentifier(TestView.self)] == 1)
    }
}
