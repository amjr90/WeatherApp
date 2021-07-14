//
//  WeatherAppTests.swift
//  WeatherAppTests
//
//  Created by andres jaramillo on 14/07/21.
//

import XCTest
@testable import WeatherApp

class WeatherAppTests: XCTestCase {



    func testSearchCityResultOk() throws {
        let searchLocationViewModel = SearchLocationViewModel(repository: LocationRepository(locationService: LocationServiceMock()))
        
        searchLocationViewModel.searchLocation(query: "bogo") {
            XCTAssertEqual(searchLocationViewModel.locations[0].woeid, 368148)
        }
        
    }
}


