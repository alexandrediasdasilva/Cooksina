//
//  RecetteEdit.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

var ingredients = [
    Ingredient(nom: "Farine", quantite: "1 Kilo(s)", suppression: false),
    Ingredient(nom: "Eau", quantite: "1 Litre(s)", suppression: false),
    Ingredient(nom: "Citrouilles", quantite: "3 element(s)", suppression: false),
]

struct IngredientListRow: View {
    let myIngredient: Ingredient
    let deleteAction:()->Void
    
    var body: some View {
            HStack(){
                Text(myIngredient.nom)
                    .frame(width: 130, height: 30
                            , alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                Text(myIngredient.quantite)
                    .frame(width: 125, height: 30
                            , alignment: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                Button(action: deleteAction, label: {
                    Image(systemName: "minus.square")
                        .font(.largeTitle)
                })
        }
    }
}

struct RecetteEdit: View {
    
    @StateObject var viewModel = ViewModel()
    @State var recette=Recette(titre: "String", description: "ddzad", image: "String", auteur: "String", categories: ["String"], region: .afrique, nbPersonnes: 3, difficulte: .difficile, temps: 30, ingredients: ingredients, instructions: "String", ustensiles: "String")
    @State var modeEmploi:String = "zadahd geofrforgj vdedzdern fejfùof, jlheide bjdzé ekdhéepo jkzd hdzjakhdl zadgazudzu afdgziear, nvbncxvbn jzdda zhaehazfd sqcvhd eyrrtz"
    @State var v1: String = ""
    @State var v2 = [0, 1, 2, 3]
    @State var inputIngredient : String = ""
    @State var inputQuantite : String = ""
    
    func addAction(){
        if(inputIngredient != "" && inputQuantite != ""){
        recette.ingredients.append(Ingredient(nom: inputIngredient, quantite: inputQuantite, suppression: false))
        inputIngredient = ""
        inputQuantite = ""
        }
    }
  
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                Text("Soupe Citrouille")
                    .font(.title)
                    .padding(.leading, 5.0)
                VStack(spacing: 0) {
                        imageView(for: viewModel.selectedImage)
                        controlBar()
                        Divider()
                    }
                    .fullScreenCover(isPresented: $viewModel.isPresentingImagePicker, content: {
                        ImagePicker(sourceType: viewModel.sourceType, completionHandler: viewModel.didSelectImage)
                    })
                
                HStack(spacing: 50.0){
                Text("Ingredients")
                Text("Quantités")
                }
                .font(.headline)
                .padding(.leading, 10.0)

                VStack(){
                    ForEach(recette.ingredients)
                    {
                        ingredient in IngredientListRow(myIngredient: ingredient, deleteAction: {if let index = recette.ingredients.map(\.id).firstIndex(of: ingredient.id) {
                            recette.ingredients.remove(at: index)
                            }})
                    }
                }.padding(.leading, 10)
                
                HStack(spacing : 35.5){
                    TextField("ingredient", text: $inputIngredient)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .frame(width: 100)
                    TextField("quantité", text: $inputQuantite)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .frame(width: 100)
                    Button(action: {
                        addAction()
                    }, label: {
                        Image(systemName: "plus.square")
                            .font(.largeTitle)
                    })
                }.padding(.leading, 10.0)
                HStack(spacing: 20){
                        HStack{
                    Image(systemName: "timer")
                        .font(.largeTitle)
                        TextField("", text: $v1)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .frame(width: 50)
                        }
                        HStack{
                    Image(systemName: "person.badge.plus")
                        .font(.largeTitle)
                        TextField("", text: $v1)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                            .frame(width: 50)
                        }
                }.padding(.leading, 5.0)
                
                Divider()
                   Text("Mode D'Emploi").bold()
                    .padding(.leading, 10.0)
               
                TextEditor(text: $modeEmploi)
                        .lineLimit(3)
                    .frame(height: 77.0)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal, 5.0)
                
                    Button(action: {
                        print("publier")
                    }, label: {
                        Text("Publier")
                    })
                    .frame(width: 100.0, height: 30.0)
                    .background(Color.blue)
                    .font(.system(size:15, weight: .bold))
                    .foregroundColor(.white)
                    .cornerRadius(3.0)
                    .padding(.leading, 110.0)
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
                .frame(width: 300, height: 150)
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
                .frame(width: 300, height: 150)
                .clipShape(Rectangle())
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                .padding(0.0)
        }
    }
    
    func controlBar() -> some View {
        HStack(spacing: 10) {
            Button(action: viewModel.choosePhoto, label: {
                Text("Ajouter Photo")
            })
            .frame(width: 110.0, height: 30.0)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size:15, weight: .bold))
            .cornerRadius(3.0)
            Button(action: viewModel.takePhoto, label: {
                Text("Prendre Photo")
            })
            .frame(width: 110.0, height: 30.0)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size:15, weight: .bold))
            .cornerRadius(3.0)
        }.padding(10.0)
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
