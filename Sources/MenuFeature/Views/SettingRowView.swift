//
//  SettingRowView.swift
//
//
//  Created by Ilia Lubianoi on 17.05.2024.
//

import SwiftUI
import SharedUI
import SFSafeSymbols

enum SettingType {
    case auth(Image, String? = nil)
    case image(Image)
    case symbol(SFSymbol)
}

struct SettingRowView: View {
    
    @State private var highlighted = false
    
    let title: LocalizedStringKey
    let type: SettingType
    let action: (() -> Void)
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Group {
                    switch type {
                    case .auth(let image, let name):
                        HStack {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 48, height: 48)
                                .clipShape(.circle)
                                .padding(8)
                            
                            VStack(alignment: .leading) {
                                if let name {
                                    Text(name)
                                    Text("Open profile")
                                } else {
                                    Text("Guest")
                                    Text("Log in")
                                }
                            }
                            
                            Spacer()
                        }
                        
                    case .image(let image):
                        HStack {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .padding(.leading, 16)
                            
                            Text(title)
                            
                            Spacer()
                        }
                        
                    case .symbol(let symbol):
                        HStack {
                            Image(systemSymbol: symbol)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.gray)
                                .padding(.leading, 16)
                            
                            Text(title)
                            
                            Spacer()
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Spacer()
            }
            .contentShape(.rect)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .buttonStyle(ListButtonStyle())
        .listRowInsets(EdgeInsets())
    }
}
