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
}
