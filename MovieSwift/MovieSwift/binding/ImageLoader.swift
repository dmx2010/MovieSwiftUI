//
//  ImageData.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 09/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import UIKit
import Combine

final class ImageLoader: BindableObject {
    let didChange = PassthroughSubject<UIImage?, Never>()
    
    let poster: String?
    let size: ImageService.Size
    
    //DMX who subscribe to the didChange? Is this Combine??
    var image: UIImage? = nil {
        didSet {
            didChange.send(image)
        }
    }
    
    var missing: Bool = false {
        didSet {
            didChange.send(nil)
        }
    }

    init(poster: String?, size: ImageService.Size) {
        self.size = size
        self.poster = poster
    }

}

extension ImageLoader {
    
    func loadImage() {
        //DMX: again the quarky Swift idiom, if the member variable poster has value then
        //     give it to the local poster variable.
        //     also the guard statement, it does make it more readable and make the statement
        //     purpose more obvious
        guard let poster = poster else {
            //DMX this assignment is a powerful statement, because it is a set on a property,
            //    it triggers the didSet defined in the missing property, which calls the
            //    Combine didChange to sent event to its subscriber
            missing = true
            return
        }
        ImageService.shared.image(poster: poster, size: .medium) { (result) in
            do { self.image = try result.get() } catch { }
        }
    }
    
}
