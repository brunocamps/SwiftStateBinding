//
//  ContentView.swift
//  StateBinding
//
//  Created by Bruno Campos on 7/4/23.
//

import SwiftUI

enum Weather: String {
  case sunny = "☀️"
  case rainy = "🌧️"
  case snowing = "❄️"
  case stormy = "⛈️"
}

struct ContentView: View {
  @State private var name: String = ""
  @State private var weatherColor: Color = .green
  @State private var weather: Weather = .sunny

  var body: some View {
    VStack {
      StatusControl(name: $name, weatherColor: $weatherColor, weather: $weather)
        .padding()

      StatusIcon(name: name, weatherColor: weatherColor, weather: weather)
        .padding()
    }
  }
}

struct StatusControl: View {
  @Binding var name: String
  @Binding var weatherColor: Color
  @Binding var weather: Weather

  var body: some View {
    VStack {
      TextField("Name", text: $name)
        .textFieldStyle(RoundedBorderTextFieldStyle())

      ColorPicker("Weather Color", selection: $weatherColor)

      Picker("Weather", selection: $weather) {
        Text(Weather.sunny.rawValue).tag(Weather.sunny)
        Text(Weather.rainy.rawValue).tag(Weather.rainy)
        Text(Weather.snowing.rawValue).tag(Weather.snowing)
        Text(Weather.stormy.rawValue).tag(Weather.stormy)
      }
      .pickerStyle(SegmentedPickerStyle())
    }
  }
}

struct StatusIcon: View {
  let name: String
  let weatherColor: Color
  let weather: Weather

  var body: some View {
    VStack {
      Text(weather.rawValue)
      Text(name)
        .foregroundColor(.white)
    }
    .font(.largeTitle)
    .padding()
    .background(weatherColor)
    .cornerRadius(12)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
