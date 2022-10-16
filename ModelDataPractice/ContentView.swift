//
//  ContentView.swift
//  ModelDataPractice
//
//  Created by Arief Ramadhan on 28/07/22.
//

import SwiftUI

//model data
struct ProductModel: Identifiable {
    let id: Int
    let namaProduk: String
    let fotoProduk: String
    let hargaProduk: Int
    let lokasi: String
    let ratingCount: Int
    let jumlahRating: Int
    
    init(id: Int, namaproduk: String, fotoproduk: String, hargaproduk:Int, lokasi: String, ratingcount: Int, jumlahrating: Int) {
        
        self.id = id
        self.namaProduk = namaproduk
        self.fotoProduk = fotoproduk
        self.hargaProduk = hargaproduk
        self.lokasi = lokasi
        self.ratingCount = ratingcount
        self.jumlahRating = jumlahrating
    }
}

struct ContentView: View {
    
    let data: [ProductModel] = [
        ProductModel(id: 1, namaproduk: "Tesla New 1", fotoproduk: "tesla1", hargaproduk: 2000000000, lokasi: "Payakumbuh", ratingcount: 5, jumlahrating: 3),
        ProductModel(id: 2, namaproduk: "Tesla New 2", fotoproduk: "tesla2", hargaproduk: 2000000000, lokasi: "Payakumbuh", ratingcount: 5, jumlahrating: 3),
        ProductModel(id: 3, namaproduk: "Tesla New 3", fotoproduk: "tesla3", hargaproduk: 2000000000, lokasi: "Payakumbuh", ratingcount: 5, jumlahrating: 3),
        ProductModel(id: 4, namaproduk: "Tesla New 4", fotoproduk: "tesla4", hargaproduk: 2000000000, lokasi: "Payakumbuh", ratingcount: 5, jumlahrating: 3),
        ProductModel(id: 5, namaproduk: "Tesla New 5", fotoproduk: "tesla5", hargaproduk: 2000000000, lokasi: "Payakumbuh", ratingcount: 5, jumlahrating: 3),
        ProductModel(id: 6, namaproduk: "Tesla New 1", fotoproduk: "tesla1", hargaproduk: 2000000000, lokasi: "Payakumbuh", ratingcount: 5, jumlahrating: 3),
        ProductModel(id: 7, namaproduk: "Tesla New 2", fotoproduk: "tesla2", hargaproduk: 2000000000, lokasi: "Payakumbuh", ratingcount: 5, jumlahrating: 3)
    ]
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                ForEach(data){ row in
                    VStack(spacing: 20){
                        Product(data: row)
                    }
                    .padding()
                }
            }
            .navigationTitle("Tesla New Product")
            .navigationBarItems(
                trailing:
                    HStack(spacing: 20){
                        Button(action: {print()}){
                            Image(systemName: "person.fill")
                        }
                        Button(action: {print()}){
                            Image(systemName: "cart.fill")
                        }
                    }
            )
        }
        .accentColor(Color.secondary)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //        Product()
    }
}

struct Product: View {
    
    let data: ProductModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 5) {
                ZStack(alignment: .topTrailing) {
                    Image(self.data.fotoProduk)
                        .resizable()
                        .frame(height: 200)
                }
                HStack {
                    //                Spacer()
                    Text(self.data.namaProduk)
                        .font(.title)
                        .padding(.leading)
                    Spacer()
                    Image(systemName: "heart")
                        .padding(.trailing, 10)
                }
                Text("Rp. \(self.data.hargaProduk)")
                    .font(.title2)
                    .bold()
                    .padding(.leading)
                    .padding(.trailing)
                HStack{
                    Image(systemName: "mappin.circle")
                    Text(self.data.lokasi)
                }
                .padding(.leading)
                .padding(.trailing)
                
                HStack{
                    HStack {
                        ForEach(0..<self.data.ratingCount){ items in
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        }
                    }
                }
                .padding(.leading)
                .padding(.trailing)
                
                
                Button (action: {print()}) {
                    HStack {
                        Spacer()
                        HStack {
                            Image(systemName: "cart")
                            Text("Masuk keranjang")
                                .padding()
                        }
                        Spacer()
                    }
                }
                .background(Color.green)
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding()
            }
            .background(.thinMaterial)
            .cornerRadius(20)
            //        .border(.black, width: 1)
            //        .shadow(radius: 2, x:2, y: 10)
        }
    }
}
