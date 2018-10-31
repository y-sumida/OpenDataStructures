import XCTest
@testable import OpenDataStructures

class DualArrayDequeTests: XCTestCase {
    var dualArrayDeque = DualArrayDeque<Int>()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testQueueAdd() {
        let _ = dualArrayDeque.add(at: 0, element: 10)
        let _ = dualArrayDeque.add(at: 0, element: 20)
        let _ = dualArrayDeque.add(at: 0, element: 30)
        XCTAssertEqual(dualArrayDeque.size(), 3)
        XCTAssertEqual(dualArrayDeque.get(at: 0), 30)
        XCTAssertEqual(dualArrayDeque.get(at: 1), 20)
        XCTAssertEqual(dualArrayDeque.get(at: 2), 10)
    }
}
