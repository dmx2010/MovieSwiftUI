//
//  PopularList.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 07/06/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import Combine

final class PopularPageListener: PageListener {
    override func loadPage() {
        AppStore.global.dispatch(action: MoviesActions.FetchPopular(page: currentPage))
    }
}

struct PopularList : View {
    //DMX this is used in Tabbar as well. so what is the difference between an EnvironmentObject
    //    and a global static instance, like the one in AppStore's static global?
    //    since this is not production code but a very good open source demo app, I would have to let
    //    this question go. since there are lot of places in this app that just use AppStore.global
    //    instead of using the @EnvironmentObject. we will have to wait for Apple detail documentation
    //    to understand why @EnvironmentObject is needed
    @EnvironmentObject var store: AppStore
    @State var pageListener = PopularPageListener()
    
    var body: some View {
        MoviesList(movies: store.state.moviesState.popular, displaySearch: true, pageListener: pageListener)
            .navigationBarTitle(Text("Popular"))
            .onAppear {
                self.pageListener.loadPage()
        }
    }
}

#if DEBUG
struct PopularList_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularList().environmentObject(sampleStore)
        }
    }
}
#endif
