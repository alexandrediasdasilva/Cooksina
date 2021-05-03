import SwiftUI

struct ProfilView: View {
    var body: some View {
    
                
        ScrollView {
            VStack {
                VStack {
                    
                    Text("Profil")
                        .font(.largeTitle)
                    
                    Image("jason-briscoe")
                        .resizable()
                        .frame(width: 120, height: 100)
                        .cornerRadius(60)
                    
                }
                
                Text("Jason")
                Text("Briscoe")
                Spacer()
                HStack{
                Image(systemName: "mappin")
                    .foregroundColor(.red)
                    Text("Paris")
                        .font(.caption)
            }
            Spacer()
                VStack{
                    Text("Recette(s) :")
                     .position(x: 50, y: 4)
                   
                    Divider()
                    ForEach(recettes){
                        recette in
                        
                        RecetteListRow(myRecette: recette)
                            
                    }
                    ContainerRelativeShape()
                        .foregroundColor(.orange)
                }
            } .padding()
        }
      
    }
}
        
        struct ProfilView_Previews: PreviewProvider {
            static var previews: some View {
                ProfilView()
            }
        }
