//
//  ContentView.swift
//  ios_animations
//
//  Created by Maciej Sroczek on 06/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack {
                    RowWithRotatingLogos(duration: 1, inverse: false, reverse: false)
                    RowWithRotatingLogos(duration: 0.2, inverse: true, reverse: false)
                    HStack(spacing: 20) {
                        RotatingLogo(duration: 0.3, inverse: false, reverse: false)
                        RotatingLogo(duration: 0.6, inverse: false, reverse: false)
                        RotatingLogo(duration: 0.9, inverse: false, reverse: false)
                        RotatingLogo(duration: 1.2, inverse: false, reverse: false)
                    }
                    .padding(.vertical, 10)
                    RowWithRotatingLogos(duration: 0.5, inverse: true, reverse: true)
                    HStack(spacing: 20) {
                        RotatingLogo(duration: 0.5, inverse: false, reverse: true)
                        RotatingLogo(duration: 0.25, inverse: false, reverse: true)
                        RotatingLogo(duration: 1, inverse: false, reverse: true)
                        RotatingLogo(duration: 0.75, inverse: false, reverse: true)
                    }
                    .padding(.vertical, 10)
                    
                    HStack{
                        Spacer()
                        GrowingLogo(size: 150, duration: 1, reverse: false)
                        Spacer()
                        GrowingLogo(size: 90, duration: 0.7, reverse: false)
                        Spacer()
                        GrowingLogo(size: 130, duration: 0.4, reverse: false)
                        Spacer()
                    }
                    .frame(height: 150)
                    
                    HStack{
                        Spacer()
                        GrowingLogo(size: 180, duration: 0.25, reverse: true)
                        Spacer()
                        GrowingLogo(size: 100, duration: 0.55, reverse: true)
                        Spacer()
                        GrowingLogo(size: 60, duration: 0.85, reverse: true)
                        Spacer()
                    }
                    .frame(height: 200)
                }
                .navigationBarTitle("Research scenario #2")
            }
        }
    }
}

struct RowWithRotatingLogos: View {
    let duration: Double
    let inverse: Bool
    let reverse: Bool

    var body: some View {
        HStack(spacing: 20) {
            ForEach(0..<4) { _ in
                RotatingLogo(duration: duration, inverse: inverse, reverse: reverse)
            }
        }
        .padding(.vertical, 10)
    }
}

struct RotatingLogo: View {
    let duration: Double
    let inverse: Bool
    let reverse: Bool
    @State private var rotation: Double = 0

    var body: some View {
        let rotationAngle = inverse ? 360.0 : -360.0

        return Image(systemName: "apple.logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(rotation))
            .animation(
                Animation.linear(duration: duration).repeatForever(
                    autoreverses: reverse
                ),
                value: rotation
            )
            .onAppear {
                rotation = rotationAngle
            }
    }
}

struct GrowingLogo: View {
    let size: CGFloat
    let duration: Double
    let reverse: Bool
    @State private var scale: CGFloat = 0.0

    var body: some View {
        return Image(systemName: "apple.logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size * scale, height: size * scale)
            .animation(.easeInOut(duration: duration).repeatForever(autoreverses: reverse), value: scale)
            .onAppear {
                scale = 1.0
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
