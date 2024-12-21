import SwiftUI

struct ContentsView: View {
    var body: some View {
        NavigationView {
            List {
                DisclosureGroup {
                    NavigationLink(destination: BasicHomeView()) {
                        Text("Basic Designer")
                    }
                    NavigationLink(destination: DynamicHomeView()) {
                        Text("Dynamic Designer")
                    }
                } label: {
                    Label("Tag Designer", systemImage: "tag")
                }

                DisclosureGroup {
                    NavigationLink(destination: AlgorithmStoreView()) {
                        Text("Algorithm Store")
                    }
                    NavigationLink(destination: MembershipPlanView()) {
                        Text("Membership Plan")
                    }
                } label: {
                    Label("Store", systemImage: "cart")
                }

                DisclosureGroup {
                    NavigationLink(destination: UserGuideView()) {
                        Text("User Guide")
                    }
                } label: {
                    Label("Documentation", systemImage: "doc.text")
                }

                DisclosureGroup {
                    NavigationLink(destination: TeamView()) {
                        Text("Team")
                    }
                    NavigationLink(destination: WikiView()) {
                        Text("Wiki")
                    }
                    NavigationLink(destination: ContactUsView()) {
                        Text("Contact Us")
                    }
                } label: {
                    Label("About", systemImage: "info.circle")
                }

                DisclosureGroup {
                    NavigationLink(destination: FAQsView()) {
                        Text("FAQs")
                    }
                    NavigationLink(destination: FeedbackView()) {
                        Text("Feedback")
                    }
                } label: {
                    Label("Support", systemImage: "questionmark.circle")
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 58)
                        .offset(y: 30)
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        NavigationLink(destination: LoginView()) {
                            Text("Login")
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                        .padding(.trailing, 3)
                        Text("/")
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        .padding(.trailing, 3)
                        NavigationLink(destination: RegisterView()) {
                            Text("Register")
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
        }
    }
}
