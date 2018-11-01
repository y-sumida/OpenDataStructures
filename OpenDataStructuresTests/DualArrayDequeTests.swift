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

    func testQueueRmove() {
        let _ = dualArrayDeque.add(at: 0, element: 10)
        let _ = dualArrayDeque.add(at: 0, element: 20)
        let _ = dualArrayDeque.add(at: 0, element: 30)
        let x = dualArrayDeque.remove(at: 0)
        XCTAssertEqual(x, 30)
        let y = dualArrayDeque.remove(at: 1)
        XCTAssertEqual(y, 10)
    }

    func testQueueBalance() {
        let _ = dualArrayDeque.add(at: 0, element: 10)
        let _ = dualArrayDeque.add(at: 0, element: 20)
        let _ = dualArrayDeque.add(at: 0, element: 30)
        let _ = dualArrayDeque.add(at: 0, element: 40)
        // 内部の2つのArrayStackはprivateなのでテスト書けない
    }
}
