//
// This file is part of Canvas.
// Copyright (C) 2019-present  Instructure, Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

import Foundation
import XCTest
import TestsFoundation

class SpringBoardTests: CoreUITestCase {
    func testMultitaskingSetup() {
        XCUIDevice.shared.orientation = .landscapeLeft
        SpringBoard.shared.setupSplitScreenWithSafariOnRight()

        func appToSpringBoardRatio() -> CGFloat {
            app.frame.height / SpringBoard.shared.sbApp.frame.height
        }

        sleep(2)
        XCTAssertEqual(appToSpringBoardRatio(), 0.5, accuracy: 0.05)

        let ratio1per3: CGFloat = 1 / 3.0
        SpringBoard.shared.moveSplit(toFraction: ratio1per3)
        sleep(2)
        XCTAssertEqual(appToSpringBoardRatio(), ratio1per3, accuracy: 0.05)

        let ratio2per3: CGFloat = 2 / 3.0
        SpringBoard.shared.moveSplit(toFraction: ratio2per3)
        sleep(2)
        XCTAssertEqual(appToSpringBoardRatio(), ratio2per3, accuracy: 0.05)

        SpringBoard.shared.moveSplit(toFraction: 0.5)
        sleep(2)
        XCTAssertEqual(appToSpringBoardRatio(), 0.5, accuracy: 0.05)
    }
}
