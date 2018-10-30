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

    func testDequeueAdd3() {
        let _ = arrayDequeue.add(at: 0, element: 10)
        let _ = arrayDequeue.add(at: 1, element: 20)
        let _ = arrayDequeue.add(at: 2, element: 30)
        let _ = arrayDequeue.add(at: 3, element: 40)
        let _ = arrayDequeue.add(at: 4, element: 50)
        let _ = arrayDequeue.add(at: 3, element: 60)
        XCTAssertEqual(arrayDequeue.get(at: 3), 60)
        XCTAssertEqual(arrayDequeue.get(at: 4), 40)
        XCTAssertEqual(arrayDequeue.get(at: 5), 50)
        XCTAssertEqual(arrayDequeue.size(), 6)
    }

    func testDequeueRemove() {
        let _ = arrayDequeue.add(at: 0, element: 10)
        let _ = arrayDequeue.add(at: 1, element: 20)
        let _ = arrayDequeue.add(at: 2, element: 30)
        let _ = arrayDequeue.add(at: 3, element: 40)
        let _ = arrayDequeue.add(at: 4, element: 50)
        let _ = arrayDequeue.add(at: 5, element: 60)
        let _ = arrayDequeue.add(at: 6, element: 70)
        let _ = arrayDequeue.add(at: 7, element: 80)
        XCTAssertEqual(arrayDequeue.size(), 8)
        let x = arrayDequeue.remove(at: 2)
        XCTAssertEqual(arrayDequeue.size(), 7)
        XCTAssertEqual(x, 30)
        let _ = arrayDequeue.add(at: 4, element: 90)
        let _ = arrayDequeue.add(at: 3, element: 100)
        let _ = arrayDequeue.add(at: 3, element: 110)
        XCTAssertEqual(arrayDequeue.get(at: 3), 110)
        XCTAssertEqual(arrayDequeue.get(at: 4), 100)
        XCTAssertEqual(arrayDequeue.get(at: 5), 50)
    }
}
