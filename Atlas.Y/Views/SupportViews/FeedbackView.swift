import SwiftUI

struct FeedbackView: View {
    @State private var givenName: String = ""
    @State private var surname: String = ""
    @State private var country: String = ""
    @State private var researchField: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var companyOrInstitution: String = ""
    @State private var feedbackType: String = ""
    @State private var comments: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Feedback Form")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("Use the form below to send us your comments. We read all feedback carefully, but we are unable to respond to each submission individually. If you provide your email address, you agree that we may contact you to better understand the comments you submitted.")
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
                FormField(title: "Feedback Type") {
                    TextField("Enter your feedback type", text: $feedbackType)
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(8)
                }
            }

            FormField(title: "Comments") {
                TextEditor(text: $comments)
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

#Preview {
    FeedbackView()
}
