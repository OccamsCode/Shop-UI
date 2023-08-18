//
//  DetailView.swift
//  Furniture
//
//  Created by Brian Munjoma on 15/08/2023.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    Image("chair_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    DescriptionView()
                        .offset(y: -40.0)
                    
                }
                .edgesIgnoringSafeArea(.top)
                
                    HStack {
                        Text("$1299")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Text("Add to Cart")
                                .padding()
                                .padding(.horizontal)
                                .background(.white)
                                .cornerRadius(10.0)
                        }
                        .tint(Color("Primary"))
                        
                    }
                    .padding()
                    .padding(.horizontal)
                    .background(Color("Primary"))
                    .cornerRadius(50, corners: .topLeft)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButtonView(action: {presentationMode.wrappedValue.dismiss()}),
                                trailing: Image("threeDot"))
        }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}

struct CustomBackButtonView: View {
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            Image("chevron.backward")
                .padding(.all, 12)
                .background(.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        }
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lurxury Sweden Chair")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 5) {
                ForEach(0 ..< 5) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Spacer()
            }
            
            Text("Decription")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("Luxury Sweden Chair is a contemporary chair based on the virtues of modern craft. It carries on the simplicity and honesty of the archetypical chair")
                .lineSpacing(8.0)
                .foregroundColor(.black.opacity(0.6))
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    Text("Height: 120cm")
                        .foregroundColor(.black.opacity(0.6))
                    Text("Width: 80cm")
                        .foregroundColor(.black.opacity(0.6))
                    Text("Diameter: 72cm")
                        .foregroundColor(.black.opacity(0.6))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    Text("Jati Wood, Canvas, Amazing Love")
                        .foregroundColor(.black.opacity(0.6))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack {
                        ColorDotView(color: .white)
                        ColorDotView(color: .black)
                        ColorDotView(color: Color("Primary"))
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
