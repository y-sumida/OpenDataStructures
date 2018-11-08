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
        let y = list.pop()
        XCTAssertEqual(y, 10)
        let z = list.pop()
        XCTAssertEqual(z, nil)
    }
}
