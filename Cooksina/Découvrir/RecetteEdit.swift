//
//  RecetteEdit.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI
import Combine

var ingredients = [
    Ingredient(nom: "Farine", quantite: "1", unite: "kg", suppression: false),
    Ingredient(nom: "Eau", quantite: "1", unite: "L", suppression: false),
    Ingredient(nom: "Citrouilles", quantite: "3", unite: "unités", suppression: false),
]

struct RecetteEdit: View {
    
    @StateObject var viewModel = ViewModel()
    @State var recette=Recette(titre: "String", description: "ddzad", image: "String", auteur: "String", categories: ["String"], region: .afriqueDuNord, nbPersonnes: 3, difficulte: .difficile, temps: 30, ingredients: ingredients, instructions: "String", ustensiles: "String")
    @State var note: String = "Éplucher les légumes et les couper en petits morceaux."
    @State var champUstensiles: String = "Cocotte, mixeur plongeant"
    @State var champTitre: String = "Soupe"

    
    @State private var inputIngredient : String = ""
    @State private var quantities = ["0", "1", "2", "3"]
    @State private var unities = ["kg", "L", "unité"]
    @State private var ustensiles = "Casserole, poêle, mélangeur, gants"
    @State private var selectedUnity = "kg"
    @State private var quantity = 1
    @State private var selectedQuantity = "1"
    @State private var selectedUstensile = "casserole"
    @State private var hours = 0
    @State private var minutes = 1
    @State private var hoursAndMinutes = "1 min"
    @State private var guests = 1
    @State private var selectedGuests = "1"
    @State private var showingPopover = false
    @State private var showingPopover2 = false
    @State private var showingPopover3 = false
    @State private var showingPopover4 = false
    
    func addAction() {
        if(inputIngredient != "" && selectedQuantity != "0"){
            recette.ingredients.append(Ingredient(nom: inputIngredient, quantite: selectedQuantity, unite: selectedUnity, suppression: false))
            inputIngredient = ""
            selectedQuantity = "0"
        }
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(spacing: 10) {
                
//                VStack {
  
                    imageView(for: viewModel.selectedImage)
//                    controlBar()
//                    Divider()
//
//                }
                
                .fullScreenCover(isPresented: $viewModel.isPresentingImagePicker, content: {
                    ImagePicker(sourceType: viewModel.sourceType, completionHandler: viewModel.didSelectImage)
                })
                
                VStack {
                    TextField("Nom de la recette", text: $champTitre)
                    Divider()
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
                } .padding()
                
                VStack {
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text("Ingrédient".uppercased())
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Text("Qté".uppercased())
                                .fontWeight(.semibold)
                                .frame(width: 60, alignment: .leading)
                            
                            Text("Unité".uppercased())
                                .fontWeight(.semibold)
                                .frame(width: 70, alignment: .leading)
                            
                            Spacer()
                                .frame(width:55)
                        }
                        .font(.subheadline)
                        .padding(.bottom, 3)
                        
                        ForEach(recette.ingredients)
                        {
                            ingredient in IngredientListRow(myIngredient: ingredient, deleteAction: {if let index = recette.ingredients.map(\.id).firstIndex(of: ingredient.id) {
                                recette.ingredients.remove(at: index)
                            }})
                        }
                        
                    }
                    
                    HStack {
                        
                        TextField("", text: $inputIngredient)
                            .padding(.horizontal, 20)
                            .frame(width: 150)
                            .background(Color(#colorLiteral(red: 0.9220203161, green: 0.9220203161, blue: 0.9220203161, alpha: 1)))
                            .cornerRadius(5)
//                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button(action: {
                            showingPopover = true
                        }, label: {
                            Text(selectedQuantity)
                                .foregroundColor(Color.black)
                                .padding(.horizontal, 20)
                                .background(Color(#colorLiteral(red: 0.9220203161, green: 0.9220203161, blue: 0.9220203161, alpha: 1)))
                                .cornerRadius(5)
//                                .frame(width: 60, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            
                        
                            
                            Text(selectedUnity)
                                .foregroundColor(Color.black)
                                .padding(.horizontal, 20)
                                .background(Color(#colorLiteral(red: 0.9220203161, green: 0.9220203161, blue: 0.9220203161, alpha: 1)))
                                .cornerRadius(5)
//                                .frame(width: 70, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            
                        }).popover(isPresented: self.$showingPopover){ //, arrowEdge: .bottom
                            
//                            Text("\(selectedQuantity)")
//
//                            Text("\(selectedUnity)")
                            
                            HStack {

                                Picker("Quantity", selection: $quantity) {
                                    ForEach(0..<quantities.count) { index in
                                        Text("\(self.quantities[index])").tag(quantities[index])
                                    }
                                }
                                .labelsHidden()
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 180)
                                .clipped()
                                
//                                Spacer()
                                
                                Picker("Unity", selection: $selectedUnity) {
                                    ForEach(0..<unities.count) { index in
                                        Text("\(self.unities[index])").tag(unities[index])
                                    }
                                }
                                .labelsHidden()
                                .pickerStyle(WheelPickerStyle())
                                .frame(width: 180)
                                .clipped()
                                
//                                Spacer()
                            }
                            
                            Button("Fermer") {
                                self.showingPopover = false
                                selectedQuantity = "\(quantity)"
                            }
                        }// end popover
                        
                        Spacer()
                            
                        
                        Button(action: {
                            addAction()
                        }, label: {
                            Image(systemName: "plus.circle")
                                .font(.title2)
                        })
                    }
                    .padding(.vertical)
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10){
                        
                        HStack {
//                            Image(systemName: "timer")
//                                .font(.title3)
                            
                            Text("Temps de prép.".uppercased())
                                .font(.subheadline)
                                .fontWeight(.semibold).padding(.bottom, 5)
                            
                            Button(action: {
                                showingPopover2 = true
                            }, label: {
                                Text(hoursAndMinutes)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                            }).popover(isPresented: self.$showingPopover2){ //, arrowEdge: .bottom
//                                Text("\(hours):\(minutes)")
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
                                } .padding()
                                
                                Button("Fermer") {
                                    self.showingPopover2 = false
                                    hoursAndMinutes = "\(hours)h \(minutes)m"
                                }
                            }// end popover
                        }
                        
                        HStack {
//                            Image(systemName: "person.3")
                            Text("Nb de pers.".uppercased())
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Button(action: {
                                showingPopover3 = true
                            }, label: {
                                Text(selectedGuests)
                                    .multilineTextAlignment(.center)
                                    .frame(maxWidth: .infinity)
                            }).popover(isPresented: self.$showingPopover3){ //, arrowEdge: .bottom
//                                Text("\(guests)")
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
                                
                                Button("Fermer") {
                                    self.showingPopover3 = false
                                    selectedGuests = "\(guests)"
                                }
                            }// end popover
                        }
                        
                        Divider()
                        
                        VStack {
//                            Text("Ustensiles".uppercased())
//                                .font(.subheadline)
//                                .fontWeight(.semibold)
                            
           
                            
                                TextField("Ustensiles", text: $champUstensiles)
//                                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                                    .border(Color(UIColor.separator))
//                                    .padding(.horizontal, 5.0)
                                    .onTapGesture {
                                        if self.note == "Ecrire la description de préparation de votre plat ici ..." {
                                            self.note = ""
                                        }
                                }
                            Divider()
                            

                            
//                            Button(action: {
//                                showingPopover4 = true
//                            }, label: {
//                                Text(selectedUstensile)
//                                    .multilineTextAlignment(.center)
//                                    .frame(maxWidth: .infinity)
//                            }).popover(isPresented: self.$showingPopover4){ //, arrowEdge: .bottom
//                                Text("\(selectedUstensile)")
//
//                                HStack {
//                                    Spacer()
//
//                                    Picker("Ustensile", selection: $selectedUstensile) {
//                                        ForEach(0..<ustensiles.count) { index in
//                                            Text("\(self.ustensiles[index])").tag(ustensiles[index])
//                                        }
//                                    }
//                                    .labelsHidden()
//                                    .pickerStyle(WheelPickerStyle())
//                                    .frame(width: 180)
//                                    .clipped()
//
//                                    Spacer()
//                                }
//
//                                Button("Fermer") {
//                                    self.showingPopover4 = false
//                                }
//                            }// end popover
                            
                            
                        } .padding(.vertical)
                        
                    } .padding(.vertical)
                    

//
//                    Text("Instructions de préparation".uppercased())
//                        .bold()
//
                    TextEditor(text: self.$note)
                        .frame(minHeight: 130.0)
//                        .cornerRadius(25)
                        
//                        .foregroundColor(.gray)
//                        .overlay(
//                                RoundedRectangle(cornerRadius: 2)
//                                    .stroke(Color.gray, lineWidth: 1)
//                            )
                        .onTapGesture {
                            if self.note == "Ecrire la description de préparation de votre plat ici ..." {
                                self.note = ""
                            }
                        }
                    
                    Divider()
                    
                    Button(action: {
                        print("publier")
                    }, label: {
                        Text("Publier")
                            .font(.body)
                            .fontWeight(.semibold)
                        
                    })
                    .frame(maxWidth: 130.0, minHeight: 40.0)
                    .background(Color("AccentColor"))
                    .foregroundColor(.white)
                    .cornerRadius(3.0)
                    .padding()
                    
                } .padding()
                
                
                
            }
        } .navigationBarTitle(champTitre, displayMode: .inline)
    }
    
    @ViewBuilder
    func imageView(for image: UIImage?) -> some View {
        
        if let image = image {
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 300)
                

        }
        
        else {

            controlBar()
                .frame(height: 300)
                .background(Color(#colorLiteral(red: 0.9220203161, green: 0.9220203161, blue: 0.9220203161, alpha: 1)))
//                .border(Color("AccentColor"))
//                .padding()
//                .clipShape(Rectangle())
        }
        
    }
    
    func controlBar() -> some View {
        
        HStack(spacing: 30) {
            
            Spacer()
            
            Button(action: viewModel.choosePhoto, label: {
                Image(systemName: "photo.on.rectangle")
                    
            })
            
            Button(action: viewModel.takePhoto, label: {
                Image(systemName: "camera")
            })
            
            Spacer()
            
        } .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/) .padding()
        
    }
}

struct IngredientListRow: View {
    let myIngredient: Ingredient
    let deleteAction:()->Void
    var body: some View {
        HStack {
            Text(myIngredient.nom)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            Text(myIngredient.quantite)
                .frame(width: 60, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            Text(myIngredient.unite)
                .frame(width: 70, alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
        
            Button(action: deleteAction, label: {
                Image(systemName: "minus.circle")
                    .font(.title2)
            })
            
            
        } .padding(.bottom, 1)
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
