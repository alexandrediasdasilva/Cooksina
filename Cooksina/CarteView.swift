//
//  CarteView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct RegionsView: View {
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                Grid()
                    .padding(.top, 12)
                
            }
            .navigationTitle("Découvrir")
            .navigationBarItems(leading:
                                    Button(action: {RecetteDetails(recetteChoisie: recettes.randomElement()!)}) {
                                        Text("Surprenez-moi")
                                            .fontWeight(.regular)
                                    }
                                , trailing:
                                    Button(action: {}) {Image(systemName: "plus")
                                    }
            )
            
            
        }
    }
}
    
    // Composants/extractions de vue
    
    struct Grid: View {
        var body: some View {
            ScrollView {
                
                // Voir si je dois passer regionChoisie en optionnel pour ne pas être obligé de le renseigner dans le cas où l'utilisateur veut voir toutes les recettes sans filtrage
                
//                NavigationLink(destination:
                                                      
//                    RecettesView(regionChoisie: "", texteRecherche: ""))
//                    {
//                    Text("Toutes les recettes")
//                }
                
                LazyVGrid(columns: [
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top),
                    GridItem(.flexible(minimum: 50, maximum: 200), spacing: 16, alignment: .top)
                ], alignment: .leading, spacing: 16, content: {
                    
                    ForEach(Region.allCases, id: \.self) { region in
                        
                        NavigationLink(destination: RecettesView(regionChoisie: region, texteRecherche: "")) {
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Image(region.nomImage)
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                
                                Text(region.rawValue)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                    .padding(.top, 4)
                                    .font(.caption2)
                                
                                Spacer()
                            }
                            
                        }
                    }
                    
                }) .padding(.horizontal, 12)
            }
        }
    }
    
    
    
    // Previews
    
    struct RegionsView_Previews: PreviewProvider {
        static var previews: some View {
            RegionsView()
        }
    }
    
//    struct ListeRegions: View {
//        
//        @Binding var texteRecherche: String
//        
//        var body: some View {
//            List(Region.allCases.filter({ "\($0)".localizedCaseInsensitiveContains(texteRecherche) || texteRecherche.isEmpty }), id: \.self) { region in
//                
//                NavigationLink(destination: Text(region.rawValue)) {
//                    Text(region.rawValue)
//                }
//                
//            } .navigationTitle("Découvrir")
//        }
//    }


// Possibilité 1 : intégration une carte du monde avec annotations en utilisant MapKit

//import MapKit
//import CoreLocation
//
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
//
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
//            } .navigationTitle("Carte")
//        }
//    }
//}

// Fin possibilité 1

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(coordinate: CLLocationCoordinate2D(latitude: 50, longitude: 15))
//    }
//}



