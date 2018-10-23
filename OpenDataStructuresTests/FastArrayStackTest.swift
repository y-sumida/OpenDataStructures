import XCTest
@testable import OpenDataStructures

class FastArrayStackTests: XCTestCase {
    var arrayStack = FastArrayStack<Int>()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testArrayAdd() {
        arrayStack.add(at: 0, element: 99)
        arrayStack.add(at: 1, element: 100)
        XCTAssertEqual(arrayStack.size(), 2)
        XCTAssertEqual(arrayStack.get(at: 0), 99)
        XCTAssertEqual(arrayStack.get(at: 1), 100)
    }

    func testArrayRemove() {
        arrayStack.add(at: 0, element: 99)
        arrayStack.add(at: 1, element: 100)
        let _ = arrayStack.remove(at: 1)
        XCTAssertEqual(arrayStack.size(), 1)
        XCTAssertEqual(arrayStack.get(at: 0), 99)
    }

    func testSpeedCheck() {
        arrayStack.add(at: 0, element: 99)
        arrayStack.add(at: 1, element: 100)
        for i in 0...10000 {
            arrayStack.add(at: 1, element: i)
        }
        for _ in 0...10000 {
            let _ = arrayStack.remove(at: 1)
        }
    }
}
