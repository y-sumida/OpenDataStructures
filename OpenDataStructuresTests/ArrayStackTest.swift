import XCTest
@testable import OpenDataStructures

class ArrayStackTests: XCTestCase {
    var arrayStack = ArrayStack<Int>()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testArrayInitialCount() {
        XCTAssertEqual(arrayStack.size(), 0)
    }

    func testArrayAdd() {
        arrayStack.add(at: 0, element: 99)
        arrayStack.add(at: 0, element: 100)
        XCTAssertEqual(arrayStack.size(), 2)
        XCTAssertEqual(arrayStack.get(at: 0), 100)
        XCTAssertEqual(arrayStack.get(at: 1), 99)
    }

    func testArraySet() {
        arrayStack.add(at: 0, element: 99)
        arrayStack.add(at: 1, element: 100)
        let result = arrayStack.set(at: 1, element: 101)
        XCTAssertEqual(result, 100)
        XCTAssertEqual(arrayStack.get(at: 1), 101)
    }

    func testArrayRemove() {
        arrayStack.add(at: 0, element: 99)
        arrayStack.add(at: 1, element: 100)
        let _ = arrayStack.remove(at: 1)
        XCTAssertEqual(arrayStack.size(), 1)
        XCTAssertEqual(arrayStack.get(at: 0), 99)
    }

    func testArrayRemoveAll() {
        arrayStack.add(at: 0, element: 99)
        arrayStack.add(at: 1, element: 100)
        arrayStack.removeAll()
        XCTAssertEqual(arrayStack.size(), 0)
    }
}
