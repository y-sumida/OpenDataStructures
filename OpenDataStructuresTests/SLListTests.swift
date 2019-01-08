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
}
