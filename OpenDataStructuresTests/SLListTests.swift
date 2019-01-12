import XCTest
@testable import OpenDataStructures

class SLListTests: XCTestCase {
    var list = SLList<Int>()

    override func setUp() {
    }

    override func tearDown() {
    }

    func testListPush() {
        let x = list.push(value: 10)
        XCTAssertEqual(list.size(), 1)
        XCTAssertEqual(x, 10)
        let _ = list.push(value: 20)
        XCTAssertEqual(list.size(), 2)
    }

    func testListPop() {
        let _ = list.push(value: 10)
        let _ = list.push(value: 20)
        let x = list.pop()
        XCTAssertEqual(x, 20)
        XCTAssertEqual(list.size(), 1)
        let y = list.pop()
        XCTAssertEqual(y, 10)
        XCTAssertEqual(list.size(), 0)
        let z = list.pop()
        XCTAssertEqual(z, nil)
        XCTAssertEqual(list.size(), 0)
    }

    func testListAdd() {
        let _ = list.add(value: 10)
        let _ = list.add(value: 20)
        let _ = list.add(value: 30)
        XCTAssertEqual(list.size(), 3)
        let x = list.remove()
        XCTAssertEqual(x, 10)
        let y = list.remove()
        XCTAssertEqual(y, 20)
    }

    func testSecondLast() {
        let _ = list.add(value: 10)
        XCTAssertEqual(list.secondLast(), nil) // 要素1の時の末尾の1つ前だからnilでいい？
        let _ = list.add(value: 20)
        let _ = list.add(value: 30)
        XCTAssertEqual(list.secondLast(), 20)
    }

    func testGet() {
        let _ = list.add(value: 10)
        let _ = list.add(value: 20)
        let _ = list.add(value: 30)
        XCTAssertEqual(list.get(i: 0), 10)
        XCTAssertEqual(list.get(i: 1), 20)
        XCTAssertEqual(list.get(i: 2), 30)
    }

    func testSet() {
        let _ = list.add(value: 10)
        let _ = list.add(value: 20)
        let _ = list.add(value: 30)
        list.set(i: 1, x: 99)
        XCTAssertEqual(list.get(i: 0), 10)
        XCTAssertEqual(list.get(i: 1), 99)
        XCTAssertEqual(list.get(i: 2), 30)
    }

    func testListAdd2() {
        let _ = list.add(value: 10)
        let _ = list.add(value: 20)
        let _ = list.add(value: 30)
        let _ = list.add(i: 1, x: 99)
        XCTAssertEqual(list.get(i: 0), 10)
        XCTAssertEqual(list.get(i: 1), 99)
        XCTAssertEqual(list.get(i: 2), 20)
        XCTAssertEqual(list.get(i: 3), 30)
        let _ = list.add(i: 0, x: 100)
        XCTAssertEqual(list.get(i: 0), 100)
        XCTAssertEqual(list.get(i: 1), 10)
        XCTAssertEqual(list.get(i: 2), 99)
        XCTAssertEqual(list.get(i: 3), 20)
        XCTAssertEqual(list.get(i: 4), 30)
        XCTAssertEqual(list.size(), 5)
    }

    func testListRemove() {
        let _ = list.add(value: 10)
        let _ = list.add(value: 20)
        let _ = list.add(value: 30)
        let x = list.remove(i: 1)
        XCTAssertEqual(x, 20)
        XCTAssertEqual(list.get(i: 0), 10)
        XCTAssertEqual(list.get(i: 1), 30)
        XCTAssertEqual(list.size(), 2)
        let y = list.remove(i: 0)
        XCTAssertEqual(y, 10)
        XCTAssertEqual(list.get(i: 0), 30)
        XCTAssertEqual(list.size(), 1)
    }

    func testReverse() {
        let _ = list.add(value: 10)
        let _ = list.add(value: 20)
        let _ = list.add(value: 30)
        list.reverse()
        XCTAssertEqual(list.get(i: 0), 30)
        XCTAssertEqual(list.get(i: 1), 20)
        XCTAssertEqual(list.get(i: 2), 10)
        list.reverse()
        XCTAssertEqual(list.get(i: 0), 10)
        XCTAssertEqual(list.get(i: 1), 20)
        XCTAssertEqual(list.get(i: 2), 30)
    }
}
