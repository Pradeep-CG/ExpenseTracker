//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Pradeep kumar sagar on 23/06/26.
//

import SwiftUI
import Charts

struct ContentView: View {
    let sales = [
        SalesData(month: "Jan", revenue: 1200),
        SalesData(month: "Feb", revenue: 1800),
        SalesData(month: "Mar", revenue: 1500),
        SalesData(month: "Apr", revenue: 2400),
        SalesData(month: "May", revenue: 2100),
        SalesData(month: "Jun", revenue: 1300)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
                VStack(spacing: 10){
                    cardView
                    
                    graphView
                       // .background(.yellow)
                        .padding(.top, 90)
                    transactionView
                        //.background(.cyan)
                        .padding(.top, 10)
                    
                    Spacer()
                }
                .padding(.top, 40)
                
                
            }
            .padding(.top, 0)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("1")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .cornerRadius(14)
                        .overlay {
                            Circle().stroke(lineWidth: 1)
                        }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bell.badge")
                }
            }
        }
    }
    var cardView: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(.purple)
                .frame(width: UIScreen.main.bounds.width * 0.7, height: 100)
                .offset(y: -20)
                .overlay {
                    Image("pattern1")
                        .resizable(resizingMode: .tile)
                        .frame(width: UIScreen.main.bounds.width * 0.9 ,height: 200)
                    
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .overlay {
                            RoundedRectangle(cornerRadius: 25, style: .continuous).stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        }
                        .padding(.top, 90)
                        .shadow(radius: 5)
                        .overlay(alignment: .bottomLeading) {
                            HStack{
                                Text("2644  7876  3322  1987")
                                     .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image("MasterCard_Logo")
                                    .resizable()
                                    .frame(width: 90, height: 60)
                                    .scaledToFit()
                            }
                            .padding(.horizontal, 30)
                            .padding(.bottom, 10)
                        }
                }
            
            VStack{
                HStack{
                    VStack(alignment: .leading, spacing: 20){
                        Text("Total Balance")
                            .font(.title2)
                            .foregroundColor(.white)
                        
                        Text("$59,765.00")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding(.top, 30)
                    Spacer()
                    
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .offset(y: -20)
                }
                .padding(.horizontal, 50)
                .padding(.top, 20)
            }
            
        }
        
    }
    
    var graphView: some View{
        VStack{
            HStack{
                Text("Analytics")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Button {
                    
                } label: {
                    HStack{
                        Text("Year - 2022")
                            
                            
                            
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .font(.title3)
                    .background(.orange)
                    .cornerRadius(20)
                    .foregroundColor(.white)
                }

            }
            .padding()
            
            Chart(sales) { item in
                BarMark(x: .value("Month", "\(item.month)"), y: .value("Revenue", item.revenue))
                    .annotation(position: .top) {
                            Text("\(Int(item.revenue))")
                                .font(.caption)
                                .foregroundStyle(.primary)
                        }
                    
            }
            .chartXAxis {
                AxisMarks { value in
                    AxisValueLabel()
                        .foregroundStyle(.black)
                        .font(.system(size: 14, weight: .bold))
                }
            }
            .frame(height: 250)
            .padding()
        }
       
    }
    
    var transactionView: some View{
        VStack(spacing: 20){
            HStack{
                Text("Transactions")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Button("View All") {
                    
                }

            }
            .padding()
            
            ForEach(0..<5) { val in
                HStack(spacing: 20){
                    Image(systemName: "keyboard")
                    
                    VStack{
                        Text("Chroma Store")
                            .font(.title2)
                        
                        Text("Bank Account")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text("$954")
                            .font(.title2)
                            .foregroundColor(.green)
                        
                        Text("Fri, 24 Jun 2026")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width * 0.9)
                .background(.gray.opacity(0.2))
                .cornerRadius(20)
            }
        }
    }
}

struct SalesData: Identifiable {
    let id = UUID()
    let month: String
    let revenue: Double
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
