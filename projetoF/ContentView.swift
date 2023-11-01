//
//  ContentView.swift
//  projetoF
//
//  Created by Pablo on 28/10/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5, longitude: -0.12), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State private var selection = 0
    @State private var showingSheet = false
    

    var body: some View {
        
        ZStack{
            TabView(selection: $selection) {
                ScrollView{
                    VStack{
                        AsyncImage(url: URL(string: "https://mossoronoticias.com.br/adm/midia/image/a8538207461.webp")){ image in
                            image.resizable()
                            
                        } placeholder: {
                            ProgressView()
                        }
                        .aspectRatio(contentMode: .fit)
                        .blur(radius: 2.5)
                        .edgesIgnoringSafeArea(.all)
                        .overlay(
                            HStack{
                                VStack{
                                    Text("Bem vindo a")
                                        .font(.title2)
                                        .bold()
                                    Text("Mossoró")
                                        .font(.largeTitle)
                                        .bold()
                                }
                                .foregroundColor(.white)
                                .shadow(radius: 2)
                                .padding()
                                
                                weatherButton()
                            }
                            , alignment: .center)
                        
                        
                        VStack(alignment: .leading){
                            Text("Sobre")
                                .font(.system(size: 25).weight(.heavy))
                            Text("E aí, meu fi! Vou te contar um pouco sobre a cidade de Mossoró, que é conhecida como a Capital do Oeste e Cidade do Sal e do Petróleo.A cidade é tão quente...")
                                .onTapGesture {
                                    showingSheet.toggle()
                                }
                                .foregroundColor(.black)
                                .sheet(isPresented: $showingSheet) {
                                    SheetSobre()
                                }
                        }
                        .padding()
                        .background(){
                            Rectangle()
                                .fill(Color.blue)
                                .opacity(0.3)
                                .cornerRadius(20)
                        }
                        VStack(alignment: .leading){
                            Text("Recomendados")
                                .font(.system(size: 25).weight(.heavy))
                        }
                    }
                    }.tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                            }.tag(0)
                
                VStack{
                    Map(coordinateRegion: $mapRegion)
                        .frame(width: 200, height: 300)
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Bookmark")
                }
                .tag(1)
                
                Text("Favoritos")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoritos")
                    }
                    .tag(2)
                
                Text("Profile")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Conta")
                    }
                    .tag(3)
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
