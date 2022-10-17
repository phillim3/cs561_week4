import Alamofire
import XCTest

@testable import MyLibrary

final class WeatherServiceTests: XCTestCase {
    func testWeatherStruct() throws {
        // Given
        let filePath = try XCTUnwrap(Bundle.module.path(forResource: "data", ofType: "json"))
        let jsonString = try String(contentsOfFile: filePath)
        let jsonData = Data(jsonString.utf8)
        let jsonDecoder = JSONDecoder()

        // When
        let weather = try jsonDecoder.decode(Weather.self, from: jsonData)
        let testDouble: Double
        let type1 = type(of:testDouble)
        let type2 = type(of:weather.main.temp)

        // Then
        XCTAssertNotNil(weather.main.temp)
        XCTAssert(type1 == type2)
    }
    func testGetTemperature() async throws {
        // Given
        let myLibrary = MyLibrary()

        // When
        let temp = try await myLibrary.weatherService.getTemperature()
        let testInt: Int
        let type1 = type(of:testInt)
        let type2 = type(of:temp)

        // Then
        XCTAssertNotNil(temp)
        XCTAssert(type1 == type2)
    }
}