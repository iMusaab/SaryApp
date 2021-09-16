//
//  ToastView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 08/02/1443 AH.
//

import SwiftUI

struct ToastView: View {
    @Binding var show: Bool
    var banner: BannerResult
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            HStack {
                Text(banner.description)
                    .font(.callout)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.trailing)
                    .padding(.top)
                
            }
            .padding(.horizontal)
            HStack {
                Button(action: {
                    openURL(URL(string: banner.link)!)
                    
                }, label: {
                    HStack {
                        Text(banner.button_text)
                            .lineLimit(1)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                    }
                            .padding(.vertical, 5)
                    .frame(width: UIScreen.main.bounds.width / 1.75)
                            .background(Color.white)
                            .cornerRadius(35)
                            .shadow(color: Color(#colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)).opacity(0.2), radius: 10, x: 0, y: 6)
                        
                    
                })
            }
            .padding(.vertical)
            
            HStack {
                Button(action: {
                    withAnimation {
                                    self.show = false
                                }
                }, label: {
                    Image(systemName: "xmark.circle" )
                        .foregroundColor(Color(#colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)))
                        .font(.system(size: 20, weight: .medium))
                        .padding(.bottom)
                })
                
                    
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.25, height: 100)
        .padding(.vertical, 40)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.4549019608, green: 0.9490196078, blue: 0.8078431373, alpha: 1)), Color(#colorLiteral(red: 0.4862745098, green: 1, blue: 0.7960784314, alpha: 1))]), startPoint: .top, endPoint: .bottom))
        .cornerRadius(30)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }
    }
}

struct Overlay<T: View>: ViewModifier {
    
    @Binding var show: Bool
    let overlayView: T
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if show {
                overlayView
            }
        }
    }
}

extension View {
    func overlay<T: View>( overlayView: T, show: Binding<Bool>) -> some View {
        self.modifier(Overlay.init(show: show, overlayView: overlayView))
    }
}

struct ToastView_Previews: PreviewProvider {
    @State static var show = false
    static var previews: some View {
        ToastView(show: $show, banner: exampleBanner)
    }
}
