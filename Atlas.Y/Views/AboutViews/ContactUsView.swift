import SwiftUI

struct ContactUsView: View {
    @State private var givenName: String = ""
    @State private var surname: String = ""
    @State private var country: String = ""
    @State private var researchField: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var companyOrInstitution: String = ""
    @State private var post: String = ""
    @State private var note: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Contact Us")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("If you have any questions or feedback, please fill out the contact form and our team will get back to you as soon as possible.")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)

            HStack(spacing: 20) {
                FormField(title: "Given Name") {
                    TextField("Enter your given name", text: $givenName)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
                FormField(title: "Surname") {
                    TextField("Enter your surname", text: $surname)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
            }

            HStack(spacing: 20) {
                FormField(title: "Country") {
                    TextField("Enter your country", text: $country)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
                FormField(title: "Research Field") {
                    TextField("Enter your research field", text: $researchField)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
            }

            HStack(spacing: 20) {
                FormField(title: "E-mail") {
                    TextField("Enter your e-mail", text: $email)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
                FormField(title: "Phone Number") {
                    TextField("Enter your phone number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
            }

            HStack(spacing: 20) {
                FormField(title: "Company / Institution") {
                    TextField("Enter your company or institution", text: $companyOrInstitution)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
                FormField(title: "Post") {
                    TextField("Enter your post", text: $post)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
            }

            FormField(title: "Note") {
                TextEditor(text: $note)
                    .frame(height: 150)
                    .padding(8)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
            }

            Button(action: {}) {
                Text("Submit")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .padding(.top, 20)
        }
        .padding()
        .background(Color.white)
        .frame(maxWidth: 1000)
    }
}

struct FormField<Content: View>: View {
    let title: String
    let content: Content

    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color(UIColor.label))
            content
        }
    }
}

#Preview {
    ContactUsView()
}
