import XCTest
@testable import OpenDataStructures

class SEListTests: XCTestCase {
    var list = SEList<Int>(block_size: 10)

    override func setUp() {
    }

    override func tearDown() {
    }

    func testAdd() {
        list.add(x: 10)
        let x = list.get(i: 0)
        XCTAssertEqual(x, 10)
    }

    func testSet() {
        list.add(x: 10)
        list.add(x: 20)
        list.add(x: 30)
        _ = list.set(i: 1, x: 99)
        let x = list.get(i: 0)
        XCTAssertEqual(x, 10)
        let y = list.get(i: 1)
        XCTAssertEqual(y, 99)
        let z = list.get(i: 2)
        XCTAssertEqual(z, 30)
    }
}
