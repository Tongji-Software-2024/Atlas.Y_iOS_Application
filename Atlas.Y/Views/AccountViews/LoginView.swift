import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)

            TextField("E-mail", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal)

            HStack {
                if showPassword {
                    TextField("Password", text: $password)
                        .autocapitalization(.none)
                } else {
                    SecureField("Password", text: $password)
                }
                Button(action: {
                    showPassword.toggle()
                }) {
                    Image(systemName: showPassword ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
            .padding(.horizontal)

            Button(action: {}) {
                Text("Login")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.horizontal)
            }
            .padding(.vertical, 20)

            HStack(spacing: 10) {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.top, 5)
                    .padding(.bottom, 20)
                Text("or")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .offset(y: -8)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.5))
                    .padding(.top, 5)
                    .padding(.bottom, 20)
            }
            .padding(.horizontal)

            HStack(spacing: 20) {
                Image("Apple")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                Image("Google")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                Image("Facebook")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
            }

            Button(action: {}) {
                Text("Forgot Password?")
                    .foregroundColor(.blue)
            }
            .padding(.top, 30)
        }
        .frame(width: 500)
    }
}

#Preview {
    LoginView()
}
