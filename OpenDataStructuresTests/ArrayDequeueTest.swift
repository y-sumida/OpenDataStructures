import XCTest
@testable import OpenDataStructures

class ArrayDeueueTests: XCTestCase {
    var arrayDequeue = ArrayDequeue<Int>()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testDequeueInitialCount() {
        XCTAssertEqual(arrayDequeue.size(), 0)
    }

    func testDequeueAdd() {
        let _ = arrayDequeue.add(at: 0, element: 10)
        let _ = arrayDequeue.add(at: 1, element: 20)
        XCTAssertEqual(arrayDequeue.get(at: 0), 10)
        XCTAssertEqual(arrayDequeue.get(at: 1), 20)
        XCTAssertEqual(arrayDequeue.size(), 2)
    }

    func testDequeueAdd2() {
        let _ = arrayDequeue.add(at: 0, element: 10)
        let _ = arrayDequeue.add(at: 0, element: 20)
        XCTAssertEqual(arrayDequeue.get(at: 1), 10)
        XCTAssertEqual(arrayDequeue.get(at: 0), 20)
        XCTAssertEqual(arrayDequeue.size(), 2)
    }
}
