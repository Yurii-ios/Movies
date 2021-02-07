//
//  SettingsView.swift
//  Movies
//
//  Created by Yurii Sameliuk on 05/02/2021.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    //MARK: - SECTION 1
                    GroupBox(
                        label:
                            SettingsLabelView(labelText: "The Movie Db", labelImage: "info.circle")
                        
                    ) {
                        Divider().padding(.vertical)
                        VStack(alignment: .center, spacing: 10) {
                            Image("deadpool")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 250, height: 80)
                                .cornerRadius(9.0)
                            Text("The Movie Database (TMDb) is a community built movie and TV database. Every piece of data has been added by our amazing community dating back to 2008. TMDb's strong international focus and breadth of data is largely unmatched and something we're incredibly proud of. Put simply, we live and breathe community and that's precisely what makes us different.")
                                .font(.footnote)
                            
                        }
                    }
                    
                    //MARK: - SECTION 2
                    GroupBox(
                        label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    ) {
                        Divider().padding(.vertical, 4)
                        
                        Text("If you wish, you can restart the application by press button Logout. That way it starts the onboarding process and you will see the Login screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        if isOnboarding {
                            Button(action: {
                                isOnboarding.toggle()
                            }, label: {
                                Text("Logout".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                                
                            })
                            .padding()
                            .background(
                                Color(UIColor.tertiarySystemBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 8, style: RoundedCornerStyle.continuous))
                            )
                        }
                    }
                    
                    //MARK: - SECTION 3
                    
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")) {
                        SettingsRowViews(name: "Developer", content: "Yurii Sameliuk", linkLabel: nil, linkDestination: nil)
                        SettingsRowViews(name: "Disigner", content: "Yurii Sameliuk", linkLabel: nil, linkDestination: nil)
                        SettingsRowViews(name: "Compatibility", content: "iOS 14", linkLabel: nil, linkDestination: nil)
                        SettingsRowViews(name: "Website API", content: nil, linkLabel: "The Movie DB", linkDestination: "themoviedb.org")
                        SettingsRowViews(name: "Twitter", content: nil, linkLabel: "@XXX", linkDestination: "twitter.com/XXX")
                        SettingsRowViews(name: "SwiftUI", content: "2.0", linkLabel: nil, linkDestination: nil)
                        SettingsRowViews(name: "Version", content: "1.1.0", linkLabel: nil, linkDestination: nil)
                        
                    } //: GroupBox
                    
                    
                } //: VStack
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                )
                .padding()
            }//: ScrollView
        } //: NavigationView
    }
}

//MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

