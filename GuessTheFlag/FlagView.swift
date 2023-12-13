//
//  FlagView.swift
//  GuessTheFlag
//
//  Created by Wojuade Abdul Afeez on 13/12/2023.
//

import SwiftUI

struct FlagView: View {
    let  country : String
    var body: some View {
        Image(country)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct FlagView_Previews: PreviewProvider {
    static var previews: some View {
        FlagView(country: "Nigeria" )
    }
}
