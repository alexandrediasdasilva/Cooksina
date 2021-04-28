//
//  MapView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import Foundation
import UIKit
import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    typealias UIViewType = UIView
    
    let coordinate: CLLocationCoordinate2D
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        let map = MKMapView()
        map.setRegion(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.7,
                longitudeDelta: 0.7)
        ),
        animated: true)
        
        view.addSubview(map)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: view.widthAnchor),
            map.heightAnchor.constraint(equalTo: view.heightAnchor),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Europe"
        map.addAnnotation(pin)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // ne rien faire
    }
    
    
    
}

// On créé une variable pour stocker les résultats filtrés

struct CarteView: View {
    
    //    let recettesEurope = recettes.filter { recette in
    //        recette.region == .europe
    //    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Choisissez la région dont vous souhaitez voir les recettes")
                    .foregroundColor(Color.gray)
                Spacer()
                ZStack {
                    
                    MapView(coordinate: CLLocationCoordinate2D(latitude: 50, longitude: 15))
                    VStack {
                        Spacer()
                        HStack(spacing: 32.0) {
                            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                Image(systemName: "shuffle")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(99)
                            }
                            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(99)
                            }
                        }
                        .font(.title)
                    } .padding()
                    
                }
                
                
                
                //            Text(listRegions())
                
            } .navigationTitle("Carte")
        }
    }
}

//func listRegions() -> String {
//    for region in Region.allCases {
//        return region.rawValue
//    }
//
//    Region.allCases.forEach { print($0) }
//}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 50, longitude: 15))
    }
}
