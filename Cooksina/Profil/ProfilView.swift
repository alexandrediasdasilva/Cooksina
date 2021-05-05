import SwiftUI

struct ProfilView: View {
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack {
                    
                    VStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Image("jason-briscoe")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                
                                Spacer()
                                
                                HStack {
                                    VStack {
                                        Text("13")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        Text("recettes")
                                            .font(.caption)
                                    }
                                    
                                    VStack {
                                        Text("42")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        Text("abonnés")
                                            .font(.caption)
                                    }
                                    
                                    VStack {
                                        Text("256")
                                            .font(.title3)
                                            .fontWeight(.bold)
                                        Text("abonnements")
                                            .font(.caption)
                                    }
                                }
                                .padding(.trailing)
                                
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 5.0) {
                                Text("Jason Briscoe")
                                    .fontWeight(.semibold)
                                
                                HStack(alignment: .bottom, spacing: 3.0) {
                                    Image(systemName: "mappin")
                                        .foregroundColor(.red)
                                    Text("Paris")
                                }
                                .font(.caption)
                            }
                            
                        }
                    } .padding(.bottom)
                    
                    Spacer()
                    
                    HStack {
                        
//                        NavigationLink(destination: RecetteEdit()) {
//                            Text("Nouvelle recette")
//                                .font(.subheadline)
//                                .fontWeight(.semibold)
//                                .foregroundColor(Color.black)
//                                .frame(minWidth: 0, maxWidth: .infinity)
//                                .padding(8)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.gray, lineWidth: 1))
//                        }
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Mes recettes")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        ForEach(recettes) { recette in
                            
                            NavigationLink(
                                destination: RecetteDetails(recetteChoisie: recette)
                            ) {
                                RecetteListRow(myRecette: recette)
                            }
                        }
                    }
                    
                } .padding()
            } .navigationTitle("Profil")
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: ProfilView()) {
                        Text("Modifier")
                            .fontWeight(.regular)
                    }
            )
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}
