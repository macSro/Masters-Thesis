//
//  ContentView.swift
//  ios_animations
//
//  Created by Maciej Sroczek on 06/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
                    VStack {
                        RowWithRotatingLogos(duration: 1, inverse: false, reverse: false)

                        RowWithRotatingLogos(duration: 0.2, inverse: true, reverse: false)

                        RowWithRotatingLogos(duration: 0.5, inverse: false, reverse: false)
                        
                        RowWithRotatingLogos(duration: 0.5, inverse: true, reverse: false)
                        
                        RowWithRotatingLogos(duration: 0.5, inverse: false, reverse: true)
                        
                        HStack{
                            GrowingLogo(size: 150, duration: 1)
                            GrowingLogo(size: 90, duration: 0.7)
                            GrowingLogo(size: 130, duration: 0.4)
                        }
                        .frame(height: 150)
                        
                        HStack{
                            GrowingLogo(size: 180, duration: 0.25)
                            GrowingLogo(size: 100, duration: 0.55)
                            GrowingLogo(size: 60, duration: 0.85)
                        }
                        .frame(height: 200)
                    }
                }
                .navigationBarTitle("Research scenario #2")
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

struct RowWithGrowingLogos: View {
    let size: CGFloat
    let duration: Double

    var body: some View {
        HStack(spacing: 20) {
            GrowingLogo(size: size, duration: duration)
            GrowingLogo(size: size, duration: duration)
            GrowingLogo(size: size, duration: duration)
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
                )
            )
            .onAppear {
                rotation = rotationAngle
            }
    }
}

struct GrowingLogo: View {
    let size: CGFloat
    let duration: Double
    @State private var scale: CGFloat = 0.0

    var body: some View {
        return Image(systemName: "apple.logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size * scale, height: size * scale)
            .animation(.easeInOut(duration: duration).repeatForever(autoreverses: true))
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
