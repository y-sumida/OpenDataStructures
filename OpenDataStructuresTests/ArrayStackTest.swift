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
        arrayStack.add(at: 0, element: 101)
        XCTAssertEqual(arrayStack.size(), 3)
        XCTAssertEqual(arrayStack.get(at: 0), 101)
        XCTAssertEqual(arrayStack.get(at: 1), 100)
        XCTAssertEqual(arrayStack.get(at: 2), 99)
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

    func testArrayStackOptional() {
        let arrayStackOptional = ArrayStack<Int?>()

        arrayStackOptional.add(at: 0, element: nil)
        XCTAssertEqual(arrayStackOptional.get(at: 0), nil)
    }
}
