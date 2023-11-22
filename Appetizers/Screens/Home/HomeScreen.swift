//
//  HomeScreen.swift
//  Appetizers
//
//  Created by Muhammad Usman Saeed on 20/11/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var viewModal = AppetizersViewModal()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModal.appetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                        .onTapGesture {
                            viewModal.selectedAppetizer = appetizer
                            viewModal.isShowingDetails = true
                        }

                }.listStyle(.plain)
                    .navigationTitle("Appetizers")
                    .disabled(viewModal.isShowingDetails)
            }
            .onAppear {
                if viewModal.appetizers.count == 0 {
                viewModal.getAppetizers()
                }
            }
            .blur(radius: viewModal.isShowingDetails ? 20 : 0)
            
            if viewModal.isShowingDetails {
                AppetizerDetailView(
                    appetizer: viewModal.selectedAppetizer!,
                    isShowingDetails: $viewModal.isShowingDetails)
            }
            
            if viewModal.isLoading {
                LoadingView()
            }
            
        }
        .alert(item: $viewModal.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }

}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
