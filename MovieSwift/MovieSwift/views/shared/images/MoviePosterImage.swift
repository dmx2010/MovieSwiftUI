//
//  MoviePosterImage.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 13/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct PosterStyle: ViewModifier {
    let loaded: Bool
    func body(content: Content) -> some View {
        return content
            .frame(width: 100, height: 150)
            .cornerRadius(5)
            .opacity(loaded ? 1 : 0.1)
            .shadow(radius: 8)
    }
}

extension View {
    //DMX. great extension usage. it is called below. it creates a Modified View. It just makes it easy to use.
    //     the Modified takes an existing view and have the modifier to modify based on it. in our case, the PosterStyle
    //     just add a frame to the image, set the cornerRadius, opacity and shadow. This is just crazy powerful.
    func posterStyle(loaded: Bool) -> some View {
        //DMX so the Modified is going to call PosterStyle.body and passes in the self as the content argument?
        return Modified(content: self, modifier: PosterStyle(loaded: loaded))
    }
}

struct MoviePosterImage : View {
    //DMX powerful variable semantics. This just means imageLoader is a variable, and must have
    //    a value, meaning that when create MoviePosterImage, the caller must pass in an imageLoader
    //    argument, and it cannot be nil. and without all the boiler plate code. See the call site
    //    in MovieRow.swift
    @State var imageLoader: ImageLoader
    //DMX since this one has a default value, so it is optional when creating MoviePosterImage.
    @State var isImageLoaded = false
    
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .renderingMode(.original)
                    //DMX the power of extension, it makes it like just a normal operation, which makes tons of
                    //    sense. it is more like real life, over time, a class/an object learns new trick. The challenge
                    //    is to do it safe and not compromise, for example, to grab the private password field etc.
                    .posterStyle(loaded: true)
                    .animation(.basic())
                    .onAppear{
                        self.isImageLoaded = true
                }
            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .posterStyle(loaded: false)
            }
        }.onAppear {
            self.imageLoader.loadImage()
        }
    }
}
