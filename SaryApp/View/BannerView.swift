//
//  BannerView.swift
//  SaryApp
//
//  Created by Musab Aljarba on 08/02/1443 AH.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - This view is for the banners on top with thier sliding

struct BannerView: View {
    @ObservedObject private var bannerViewModel = BannerViewModel()
    @State var selectedTab = 0
    @State var showToastOverlay = false
    
    @State private var toastedBanner = exampleBanner
    
    var body: some View {
        GeometryReader { proxy in
        TabView {
            ForEach(bannerViewModel.banners, id: \.self) { banner in
                WebImage(url: URL(string: banner.image))
                    .resizable()
                    .scaledToFill()
                    .tag(banner.id)
                    .onTapGesture {
                        self.toastedBanner = banner
                        withAnimation {
                                                showToastOverlay = true
                                            }
                    }
            }
        }.tabViewStyle(PageTabViewStyle())
        .frame(width: proxy.size.width - 30, height: proxy.size.height , alignment: .center)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.leading, 15)
        
//        .onChange(of: selectedTab) { newValue in
//                    model.myFunction(item: newValue)
//                }
        .overlay(overlayView: ToastView(show: $showToastOverlay, banner: toastedBanner)
                , show: $showToastOverlay)
            .onAppear {
                bannerViewModel.getBanners()
            }
        }
        .frame(height: 200, alignment: .center)
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView().environment(\.layoutDirection, .rightToLeft)
    }
}

var exampleBanner = BannerResult(id: 1, title: "d", description: " مجاني. استخدم كود الخصمابشر بـ خصم ٥٪ يوصل إلى ٥٠ ريال على اول طلب وعليها توصيل مجاني. استخدم كود الخصم: Hala", button_text: "اطلب الان ⬅️", expiry_status: false, created_at: "", start_date: "", expiry_date: "", image: "", priority: 1, photo: "", link: "sary://sary.com/discount?promocode=hala", level: "", is_available: false, branch: 1)
