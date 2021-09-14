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
            }
            HStack {
                Button(action: {
                    openURL(URL(string: banner.link)!)
                    
                }, label: {
                    HStack {
                        Image(systemName: "arrow.up.backward")
                            .foregroundColor(Color(#colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)))
                            .font(.system(size: 12))
                        Text("اطلب!")
                            .lineLimit(1)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                    }
                            .padding(.vertical, 8)
                            .padding(.horizontal, 5)
                            .frame(width: 20)
                            .background(Color.white)
                            .cornerRadius(35)
                            .shadow(color: Color(#colorLiteral(red: 0.05882352941, green: 0.05882352941, blue: 0.05882352941, alpha: 1)).opacity(0.2), radius: 10, x: 0, y: 6)
                        
                    
                }).padding(.trailing, 10)
            }
        }
        .frame(width: UIScreen.main.bounds.width / 1.25)
        .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                self.show = false
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.show = false
                }
            }
        })
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
        ToastView(show: $show, banner: BannerResult(id: 1, title: "d", description: " مجاني. استخدم كود الخصم: Hala", button_text: "اطلب الان ⬅️", expiry_status: false, created_at: "", start_date: "", expiry_date: "", image: "", priority: 1, photo: "", link: "sary://sary.com/discount?promocode=hala", level: "", is_available: false, branch: 1))
    }
}
