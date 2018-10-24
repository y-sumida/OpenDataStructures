import XCTest
@testable import OpenDataStructures

class ArrayQueueTests: XCTestCase {
    var arrayQueue = ArrayQueue<Int>()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testQueueInitialCount() {
        XCTAssertEqual(arrayQueue.size(), 0)
    }

    func testQueueAdd() {
        let _ = arrayQueue.add(x: 10)
        let _ = arrayQueue.add(x: 20)
        let _ = arrayQueue.add(x: 30)
        XCTAssertEqual(arrayQueue.size(), 3)
    }

    func testQueueRemove() {
        let _ = arrayQueue.add(x: 10)
        let _ = arrayQueue.add(x: 20)
        let _ = arrayQueue.add(x: 30)
        XCTAssertEqual(arrayQueue.size(), 3)
        let x = arrayQueue.remove()
        XCTAssertEqual(x, 10)
        let y = arrayQueue.remove()
        XCTAssertEqual(y, 20)
        let z = arrayQueue.remove()
        XCTAssertEqual(z, 30)
    }
}
