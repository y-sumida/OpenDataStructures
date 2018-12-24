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
}
