//
//  CarteView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI
//import MapKit
//import CoreLocation

//struct MapView: UIViewRepresentable {
//    typealias UIViewType = UIView
//
//    let coordinate: CLLocationCoordinate2D
//
//    func makeUIView(context: Context) -> UIView {
//        let view = UIView()
//
//        let map = MKMapView()
//        map.setRegion(MKCoordinateRegion(
//            center: coordinate,
//            span: MKCoordinateSpan(
//                latitudeDelta: 0.7,
//                longitudeDelta: 0.7)
//        ),
//        animated: true)
//
//        view.addSubview(map)
//
//        map.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            map.widthAnchor.constraint(equalTo: view.widthAnchor),
//            map.heightAnchor.constraint(equalTo: view.heightAnchor),
//            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            map.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
//
//        let pin = MKPointAnnotation()
//        pin.coordinate = coordinate
//        pin.title = "Europe"
//        map.addAnnotation(pin)
//
//        return view
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        // ne rien faire
//    }
//}

// Possibilité 1 : intégration une carte du monde avec annotations en utilisant MapKit

//struct CarteView: View {
//
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Choisissez la région dont vous souhaitez voir les recettes")
//                    .foregroundColor(Color.gray)
//                Spacer()
//                ZStack {
//
//                    MapView(coordinate: CLLocationCoordinate2D(latitude: 50, longitude: 15))
//                    VStack {
//                        Spacer()
//                        HStack(spacing: 32.0) {
//                            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//                                Image(systemName: "shuffle")
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .background(Color.blue)
//                                    .cornerRadius(99)
//                            }
//                            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
//                                Image(systemName: "plus")
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .background(Color.blue)
//                                    .cornerRadius(99)
//                            }
//                        }
//                        .font(.title)
//                    } .padding()
//
//                }
//
//
//
//                //            Text(listRegions())
//
//            } .navigationTitle("Carte")
//        }
//    }
//}

// Possibilité 2 : Afficher une liste simple des régions

struct RegionsView: View {
    
    @State var texteRecherche = ""
    @State var isSearching = false
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                BarreDeRecherche(texteRecherche: $texteRecherche, isSearching: $isSearching)
                
                List(Region.allCases.filter({ "\($0)".contains(texteRecherche) || texteRecherche.isEmpty }), id: \.self) { region in
                    
                    NavigationLink(destination: Text(region.rawValue)) {
                        Text(region.rawValue)
                    }
                    
                } .navigationTitle("Régions")
            }
            
            
        }
    }
}

struct BarreDeRecherche: View {
    
    @Binding var texteRecherche: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Rechercher", text: $texteRecherche)
                    .padding(.leading, 24)
            }
            .padding()
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture {
                isSearching = true
            }
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    if isSearching {
                        Button(action: { texteRecherche = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                    }
                    
                } .padding(.horizontal, 32)
                .foregroundColor(.gray)
            )                    .transition(.move(edge: .trailing))
            .animation(.spring())
            
            if isSearching {
                
                Button(action: {
                    isSearching = false
                    texteRecherche = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}

struct RegionsView_Previews: PreviewProvider {
    static var previews: some View {
        RegionsView()
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(coordinate: CLLocationCoordinate2D(latitude: 50, longitude: 15))
//    }
//}
