//
//  ContentView.swift
//  Furniture
//
//  Created by Brian Munjoma on 10/08/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedCategory = "All"
    private let categories = ["All", "Chair", "Sofa", "Lamp", "Kitchen", "Table"]
    var body: some View {
        ZStack {
            Color("Bg")
                .ignoresSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    AppHeaderView()
                    
                    TagLineView()
                        .padding()
                    
                    SearchView()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(categories, id: \.self) { category in
                                CategoryView(isActive: (category == selectedCategory), text: category)
                                    .onTapGesture {
                                        selectedCategory = category
                                    }
                            }
                        }
                        .padding()
                    }
                    
                    ProductListView(title: "Popular", size: 210)
                    
                    ProductListView(title: "Best", size: 180)
                }
            }
            
            HStack {
                NavBarItem(image: Image("Home"), action: {})
                NavBarItem(image: Image("fav"), action: {})
                NavBarItem(image: Image("shop"), action: {})
                NavBarItem(image: Image("User"), action: {})
            }
            .padding()
            .background(.white)
            .clipShape(Capsule())
            .padding()
            .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct AppHeaderView: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                Image("menu")
                    .padding()
                    .background(.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image("Profile")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text(copy)
            .font(.custom("PlayfairDisplay-Regular", size: 28))
            .foregroundColor(Color("Primary"))
    }
    
    var copy: AttributedString {
        return (try? AttributedString(
            markdown:"Find The Best **Furniture!**")) ??
        AttributedString()
    }
}

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack(spacing: 20) {
            HStack {
                Image("Search")
                    .padding(.trailing)
                TextField("Search Furniture", text: $search)
                
            }
            .padding(.all, 20)
            .background(.white)
            .cornerRadius(10.0)
            
            Image("Scan")
                .padding()
                .background(Color("Primary"))
                .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(text)
                .font(.system(size: 18.0))
                .fontWeight(.medium)
                .foregroundColor( isActive ? Color("Primary") : .black)
            
            if isActive {
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductView: View {
    let image: Image
    let size: CGFloat
    var body: some View {
        VStack(alignment: .leading) {
            image
                .resizable()
                .frame(width: size, height: 200 * (size / 210))
                .cornerRadius(20.0)
            
            Text("Luxury Sweden Chair")
                .font(.custom("PlayfairDisplay-Bold", size: 16))
            
            HStack(spacing: 2) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Spacer()
                Text("£1299")
                    .font(.custom("PlayfairDisplay-Bold", size: 16))
            }
        }
        .frame(width: size)
        .padding()
        .background(.white)
        .cornerRadius(20.0)
    }
}

struct ProductListView: View {
    let title: String
    let size: CGFloat
    var body: some View {
        Text(title)
            .font(.custom("PlayfairDisplay-Bold", size: 24))
            .padding(.horizontal)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(1..<5) { index in
                    ProductView(image: .init("chair_\(index)"), size: size)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct NavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    }
}
