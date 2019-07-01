//
//  Tabbar.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 07/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI

struct Tabbar : View {
    //DMX why use an EnvironmentObject instead of just passed it in
    //here is the code in SceneDelegate
    //UIHostingController(rootView: Tabbar().environmentObject(AppStore.global))
    //How does this store variable gets assigned/or injected?
    @EnvironmentObject var store: AppStore
    //DMX by default the movies tab is selected
    @State var selectedTab = Tab.movies
    
    enum Tab: Int {
        case movies, discover, myLists
    }

    var body: some View {
        //
        TabbedView(selection: $selectedTab) {
            MoviesHome().tabItemLabel(Text("Movies")).tag(Tab.movies)
            DiscoverView().tabItemLabel(Text("Discover")).tag(Tab.discover)
            MyLists().tabItemLabel(Text("My Lists")).tag(Tab.myLists)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct Tabbar_Previews : PreviewProvider {
    static var previews: some View {
        Tabbar().environmentObject(sampleStore)
    }
}
#endif
