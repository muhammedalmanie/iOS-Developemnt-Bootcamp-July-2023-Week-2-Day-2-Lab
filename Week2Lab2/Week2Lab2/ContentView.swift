//
//  ContentView.swift
//  Week2Lab2
//
//  Created by Muhammed on 7/31/23.
//

import SwiftUI

struct CardData: Identifiable {
    var id: UUID = UUID()
    let title: String
    let subtitle: String
    let imageURL: URL?
}

struct CardView: View{
    let data: CardData
    var body: some View{
            HStack {
                AsyncImage(url: data.imageURL) { result in
                    if let image = result.image {
                        image
                            .resizable()
                            .frame(width: 90, height: 100)
                    } else {
                        ProgressView()
                    }
                }
                VStack(alignment: .leading, spacing: 8) {
                    Text(data.title)
                        .bold()
                    Text(data.subtitle)
                        .foregroundColor(.gray)
                }
                .padding(20)
            }
            .background(Color.gray.opacity(0.14))
            .cornerRadius(15)
    }
}

struct ContentView: View {
    
    // MARK: Implementing Dark Mode "Task 6"
    @Environment(\.colorScheme) var colorScheme
    
    @State private var showContent = false
    
    let menu: Array<String> = ["Sort ▼ ","Genres ▼ ","Free eBooks ","Premium "]
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack{
                    Text(" Book Clubs")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(
                            .custom(
                            "AmericanTypewriter",
                            fixedSize: 34)
                            .weight(.semibold))
                        .opacity(showContent ? 1.0 : 0.0)
                          
                    Image(systemName: "moon.stars")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                        .opacity(showContent ? 1.0 : 0.0)
                    
                    Image(systemName: "magnifyingglass")
                        .font(Font.system(size: 30))
                        .padding(10)
                        .opacity(showContent ? 1.0 : 0.0)
                    
                }
                // MARK: Fade-in animation
                .onAppear {
                    withAnimation(.easeIn(duration: 1.0)) {
                        showContent = true
                    }
                }
                
                // MARK: Scrollable horizontal menu
                ScrollView(.horizontal){
                    HStack{
                        ForEach(menu, id: \.self) { option in
                            Button(action: {

                            })
                            {
                                Text(option)
                                    .padding(10)
                                    .foregroundColor(.primary)
                                    .cornerRadius(25)
                                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.primary, lineWidth: 0.5))
                            }
                        }
                    }
                    .padding(8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.system(size: 20))
                }
                
                // MARK: Scrollable book clubs cards
                ScrollView{
                    CardView(data: CardData(
                        title: "Ezeekat's Book Club        ",
                        subtitle: "Ezeekat Moderates",
                        imageURL:URL(string:"https://source.unsplash.com/500x300/?book")
                    ))
                    .frame(width:340 ,height: 102 )
                    .opacity(showContent ? 1.0 : 0.0)
                    
                    CardView(data: CardData(
                        title: "Mohammed's Book Club",
                        subtitle: "Mohammed Moderates",
                        imageURL:URL(string:"https://source.unsplash.com/500x300/?book")
                    ))
                    .frame(width:340 ,height: 102 )
                    .opacity(showContent ? 1.0 : 0.0)
                    
                    CardView(data: CardData(
                        title: "Riyadh's Book Club          ",
                        subtitle: "Ali Moderates",
                        imageURL:URL(string:"https://source.unsplash.com/500x300/?book")
                    ))
                    .frame(width:340 ,height: 102 )
                    .opacity(showContent ? 1.0 : 0.0)

                    CardView(data: CardData(
                        title: "Ahmad's Book Club         ",
                        subtitle: "Ahmad Moderates",
                        imageURL:URL(string:"https://source.unsplash.com/500x300/?book")
                    ))
                    .frame(width:340 ,height: 102 )
                    .opacity(showContent ? 1.0 : 0.0)

                    CardView(data: CardData(
                        title: "Pelicans's Book Club      ",
                        subtitle: "Faris Moderates",
                        imageURL:URL(string:"https://source.unsplash.com/500x300/?book")
                    ))
                    .frame(width:340 ,height: 102 )
                    .opacity(showContent ? 1.0 : 0.0)

                    CardView(data: CardData(
                        title: "Maha's Book Club            ",
                        subtitle: "Maha Moderates",
                        imageURL:URL(string:"https://source.unsplash.com/500x300/?book")
                    ))
                    .frame(width:340 ,height: 102 )
                    .opacity(showContent ? 1.0 : 0.0)

                    CardView(data: CardData(
                        title: "Tuwaiq Book Club            ",
                        subtitle: "Mohammed Moderates",
                        imageURL:URL(string:"https://source.unsplash.com/500x300/?book")
                    ))
                    .frame(width:340 ,height: 102 )
                    .opacity(showContent ? 1.0 : 0.0)
                }
            }
            .preferredColorScheme(colorScheme)
            .padding(10)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
