//
//  Font.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 23/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import Foundation
import SwiftUI


//DMX: why the font extension defines func instead of static var?
//also pay attention here, the func is a static nevertheless
extension Font {
    public static func FHACondFrenchNC(size: Length) -> Font {
        return Font.custom("FHA Condensed French NC", size: size)
    }
}
