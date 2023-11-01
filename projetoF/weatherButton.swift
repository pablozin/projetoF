//
//  teste.swift
//  projetoF
//
//  Created by Pablo on 30/10/23.
//

import SwiftUI

struct weatherButton: View {
    @StateObject var weatherFetch = WeatherFetch()

    var body: some View {
        VStack {
            if weatherFetch.temperature != "Loading..." {
                Text(weatherFetch.temperature)
                    .font(.largeTitle)
                    .padding()
            }

            Button(action: {
                weatherFetch.fetchTemperature()
            }) {
                Image(systemName: "drop.degreesign")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
                    .tint(.black)
            }
        }
    }
}

struct weatherButton_Previews: PreviewProvider {
    static var previews: some View {
        weatherButton()
    }
}
