//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Roy Bailey II on 12/9/20.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        ZStack {//zstack is veritcal up and down.
            BackgroundView(topColor: .blue, bottomColor: Color("lightblue"))
            VStack {
                
                CityTextView(cityName: "Las Vegas, NV")
                
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 100)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: -10)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: 39)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "cloud.moon.bolt.fill",
                                   temperature: 49)
                }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .light))
                .foregroundColor(.white)
        }
    }
}
        //.blue, Color("lightBlue")]
struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor ]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        VStack (spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
            }
            .padding(.bottom, 40)
        }
    }

}
