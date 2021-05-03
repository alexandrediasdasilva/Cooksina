//
//  ProfilView.swift
//  Cooksina
//
//  Created by Alexandre Dias Da Silva on 28/04/2021.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {
    
                
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
                Divider()
           
               Text("Recette(s) :")
                .position(x: 50, y: 20)
                
                Text("Poulet au curry")
                    .bold()
                    .font(.caption)
                
                Image("poulet-curry")
                        .resizable()
                        .frame(width:60, height: 50)
                        .position(x: 40)
                Text("Soupe Butternut")
                    .bold()
                    .font(.caption)
                Image("soupe de butternut")
                    .resizable()
                    .frame(width:60, height: 60)
                    .position(x: 40)
                Text("Pancakes")
                    .bold()
                    .font(.caption)
                Image("pancakes")
                    .resizable()
                    .frame(width:60, height: 60)
                    .position(x: 40)
                ContainerRelativeShape()
                    .foregroundColor(.orange)
            }
        }
      
    }
}
        
        struct ProfilView_Previews: PreviewProvider {
            static var previews: some View {
                ProfilView()
            }
        }
