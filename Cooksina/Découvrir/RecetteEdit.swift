//
//  RecetteEdit.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI
import Combine

var ingredients = [
    Ingredient(nom: "Farine", quantite: "1", unite: "Kilo", suppression: false),
    Ingredient(nom: "Eau", quantite: "1", unite: "Litre", suppression: false),
    Ingredient(nom: "Citrouilles", quantite: "3", unite: "portion", suppression: false),
]

struct RecetteEdit: View {
    
    @StateObject var viewModel = ViewModel()
    @State var recette=Recette(titre: "String", description: "ddzad", image: "String", auteur: "String", categories: ["String"], region: .afriqueDuNord, nbPersonnes: 3, difficulte: .difficile, temps: 30, ingredients: ingredients, instructions: "String", ustensiles: "String")
    @State var note:String = "Ecrire la description de préparation de votre plat ici ..."

    @State private var inputIngredient : String = "mon ingrédient"
    @State private var quantities = ["0", "1", "2", "3"]
    @State private var unities = ["Kilo", "Litre", "Unité", "Portion"]
    @State private var ustensiles = ["casserole", "poêle", "mélangeur", "gants"]
    @State private var selectedUnity = "Kilo"
    @State private var quantity = 1
    @State private var selectedQuantity = "1"
    @State private var selectedUstensile = "casserole"
    @State private var hours = 0
    @State private var minutes = 1
    @State private var hoursAndMinutes = "0h:01m"
    @State private var guests = 1
    @State private var selectedGuests = "1"
    @State private var showingPopover = false
    @State private var showingPopover2 = false
    @State private var showingPopover3 = false
    @State private var showingPopover4 = false
    
    func addAction(){
        if(inputIngredient != "" && selectedQuantity != "0"){
            recette.ingredients.append(Ingredient(nom: inputIngredient, quantite: selectedQuantity, unite: selectedUnity, suppression: false))
            inputIngredient = ""
            selectedQuantity = "0"
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                VStack(spacing: 0) {
                    Text("Soupe Citrouille")
                        .font(.title)
                        .padding(.bottom, 5.0)
                    imageView(for: viewModel.selectedImage)
                    controlBar()
                    Divider()
                }
                .fullScreenCover(isPresented: $viewModel.isPresentingImagePicker, content: {
                    ImagePicker(sourceType: viewModel.sourceType, completionHandler: viewModel.didSelectImage)
                })
            
                //.padding(.leading, 25.0)
                
                VStack(alignment: .leading){
                    HStack(){
                        Text("Ingredients")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Qtés")
                            .frame(width: 60, alignment: .leading)
                        Text("Unités").frame(width: 70, alignment: .leading)
                        Spacer()
                            .frame(width:55)
                    }
                    .font(.headline)
                    .padding(.leading, 5.0)
                    ForEach(recette.ingredients)
                    {
                        ingredient in IngredientListRow(myIngredient: ingredient, deleteAction: {if let index = recette.ingredients.map(\.id).firstIndex(of: ingredient.id) {
                            recette.ingredients.remove(at: index)
                        }})
                    }
                }
                
                HStack{
                    TextField("Ingredient", text: $inputIngredient)
                        .frame(maxWidth: .infinity, maxHeight: .infinity
                        )
                        .foregroundColor(.blue)
                       
                    Button(action: {
                        showingPopover = true
                    }, label: {
                        Text(selectedQuantity)
                            .frame(width: 60, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        Text(selectedUnity)
                            .frame(width: 70, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    }).popover(isPresented: self.$showingPopover){ //, arrowEdge: .bottom
                        Text("\(selectedQuantity)")
                        Text("\(selectedUnity)")
                        HStack {
                            Spacer()
                            Picker("Quantity", selection: $quantity) {
                                ForEach(0..<quantities.count) { index in
                                    Text("\(self.quantities[index])").tag(quantities[index])
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 180)
                            .clipped()
 
                            Picker("Unity", selection: $selectedUnity) {
                                ForEach(0..<unities.count) { index in
                                    Text("\(self.unities[index])").tag(unities[index])
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 180)
                            .clipped()

                            Spacer()
                        }
                        
                        Button("Close") {
                            self.showingPopover = false
                            selectedQuantity = "\(quantity)"
                        }
                    }// end popover

                    Button(action: {
                        addAction()
                    }, label: {
                        Image(systemName: "plus.square")
                            .font(.largeTitle)
                    })
                }
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding(.leading, 5)
                
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Image(systemName: "tray")
                            .font(.largeTitle)
                        
                        Button(action: {
                            showingPopover4 = true
                        }, label: {
                            Text(selectedUstensile)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                        }).popover(isPresented: self.$showingPopover4){ //, arrowEdge: .bottom
                            Text("\(selectedUstensile)")
                            HStack {
                                Spacer()
                                
                                Picker("Ustensile", selection: $selectedUstensile) {
                                    ForEach(0..<ustensiles.count) { index in
                                        Text("\(self.ustensiles[index])").tag(ustensiles[index])
                                    }
                                }
                                .labelsHidden()
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 180)
                                .clipped()
                                
                                Spacer()
                            }
                            
                            Button("Close") {
                                self.showingPopover4 = false
                            }
                        }// end popover
                    }
                    HStack{
                        Image(systemName: "timer")
                            .font(.largeTitle)
                        
                        Button(action: {
                            showingPopover2 = true
                        }, label: {
                            Text(hoursAndMinutes)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                        }).popover(isPresented: self.$showingPopover2){ //, arrowEdge: .bottom
                            Text("\(hours):\(minutes)")
                            HStack {
                                Spacer()
                                
                                Picker("Hours", selection: $hours){
                                    ForEach(0..<4, id: \.self) { i in
                                        Text("\(i) hours").tag(i)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 180)
                                .clipped()
                                
                                Picker("Minutes", selection: $minutes){
                                    ForEach(1..<60, id: \.self) { i in
                                        Text("\(i) min").tag(i)
                                    }
                                }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 180)
                                .clipped()
                                
                                Spacer()
                            }
  
                            Button("Close") {
                                self.showingPopover2 = false
                                hoursAndMinutes = "\(hours)h:\(minutes)m"
                            }
                        }// end popover
                    }
                    HStack{
                        Image(systemName: "person.badge.plus")
                            .font(.largeTitle)
                        
                        Button(action: {
                            showingPopover3 = true
                        }, label: {
                            Text(selectedGuests)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                        }).popover(isPresented: self.$showingPopover3){ //, arrowEdge: .bottom
                            Text("\(guests)")
                            HStack {
                                Spacer()
 
                                    Picker("Guests", selection: $guests) {
                                        ForEach(1..<11, id: \.self) { nbr in
                                            Text("\(nbr) personnes").tag(nbr)
                                        }
                                     }
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 180)
                                .clipped()
                                
                                Spacer()
                            }
                            
                            Button("Close") {
                                self.showingPopover3 = false
                                selectedGuests = "\(guests)"
                            }
                        }// end popover
                    }
                }.padding(.leading, 10)
                
                Divider()
                Text("Mode D'Emploi").bold()
                    .padding(.leading, 10.0)
                
                TextEditor(text: self.$note)
                    .lineLimit(3)
                    .frame(minHeight: 130.0)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 5.0)
                    .onTapGesture {
                                        if self.note == "Ecrire la description de préparation de votre plat ici ..." {
                                            self.note = ""
                                        }
                                    }
                
                Button(action: {
                    print("publier")
                }, label: {
                    Text("Publier")
                })
                .frame(maxWidth: 130.0, minHeight: 40.0)
                .background(Color.blue)
                .font(.system(size:20, weight: .bold))
                .foregroundColor(.white)
                .cornerRadius(3.0)
                .padding(.bottom)
                //.padding(.horizontal, 150.0)
                //Spacer()
            }
        }
    }
    
    @ViewBuilder
    func imageView(for image: UIImage?) -> some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                //.scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipShape(Rectangle())
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding(0.0)
        }
        else {
            //Text("Votre Image ici")
            Image("soupe-citrouille")
                .resizable()
                //.scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 200)
                .clipShape(Rectangle())
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding(0.0)
        }
    }
    
    func controlBar() -> some View {
        HStack(spacing: 10) {
            Button(action: viewModel.choosePhoto, label: {
//                Text("Ajouter Photo")
                Image(systemName: "photo.on.rectangle")
            })
            .frame(maxWidth: 130.0, minHeight: 40.0)
//            .background(Color.blue)
//            .foregroundColor(.white)
            .font(.system(size:18, weight: .bold))
            .cornerRadius(3.0)
            Button(action: viewModel.takePhoto, label: {
                Image(systemName: "camera")
//                Text("Prendre Photo")
            })
            .frame(maxWidth: 130.0, minHeight: 40.0)
//            .background(Color.blue)
//            .foregroundColor(.white)
            .font(.system(size:18, weight: .bold))
            .cornerRadius(3.0)
        }.padding(10.0)
    }
}

struct IngredientListRow: View {
    let myIngredient: Ingredient
    let deleteAction:()->Void
    var body: some View {
        HStack(){
            Text(myIngredient.nom)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            Text(myIngredient.quantite)
                .frame(width: 60, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            Text(myIngredient.unite)
                .frame(width: 70, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            Button(action: deleteAction, label: {
                Image(systemName: "minus.square")
                    .font(.largeTitle)
            })
        }.padding(.leading, 5)
    }
}

extension RecetteEdit {
    final class ViewModel: ObservableObject {
        @Published var selectedImage: UIImage?
        @Published var isPresentingImagePicker = false
        private(set) var sourceType: ImagePicker.SourceType = .camera
        
        func choosePhoto() {
            sourceType = .photoLibrary
            isPresentingImagePicker = true
        }
        
        func takePhoto() {
            sourceType = .camera
            isPresentingImagePicker = true
        }
        
        func didSelectImage(_ image: UIImage?) {
            selectedImage = image
            isPresentingImagePicker = false
        }
    }
}

struct RecetteEdit_Previews: PreviewProvider {
    static var previews: some View {
        RecetteEdit()
    }
}
