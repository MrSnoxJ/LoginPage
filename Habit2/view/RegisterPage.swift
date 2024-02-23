//
//  RegisterPage.swift
//  Habit
//
//  Created by Yerasyl Sharipov on 22.04.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
struct RegisterPage: View {
    @State var index = 0
    @State var userLoggedIn = false
    var body: some View {
       
        if (userLoggedIn){
            //ControlView()
        }else {
            content
        }
        
    }
    var content : some View  {
        GeometryReader{ _ in
            VStack(content: {
                Spacer()
                    Text("Habit")
                    .italic()
                    .foregroundColor(Color("main"))
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(width: 100,height: 100)
                  
                ZStack(content: {
                    SignUp(index: self.$index, userLoggedIn: self.$userLoggedIn)
                        .zIndex(Double(self.index))
                    Login(index: self.$index, userLoggedIn: self.$userLoggedIn)
                })
                HStack(content: {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 1)
                    Text("OR")
                        .italic()
                        .foregroundColor(Color("main"))
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(width: 100,height: 100)
                    Rectangle()
                        .fill(Color.blue)
                        .frame(height: 1)
                        
                })
                .padding(.horizontal,30)
                .padding(.top,50)
                HStack(spacing: 25,content: {
                    Button(action: {
                        // MARK: - gmail
                    }, label: {
                        Image(systemName: "house")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 100, height: 50)
                            .clipShape(Rectangle())
                    })
                   
                })
                .padding(.top,30)
                Spacer()
            })
            
            .padding(.vertical)
            
        }
       .edgesIgnoringSafeArea(.all)
    }
    
}

struct RegisterPage_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPage()
    }
}

struct CShape1: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}
struct CShape2: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}
struct Login : View {
    @State var email = ""
    @State var Password = ""
    @Binding var index : Int
    @Binding var userLoggedIn : Bool
    var body: some View{
        ZStack(alignment: .bottom,content: {
            VStack(content: {
                HStack(content: {
                    VStack(spacing: 10,content: {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : Color.black.opacity(0.3))
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100,height: 5)
                    })
                    Spacer()
                    
                }).padding(.top,30)
                VStack(content: {
                    HStack(spacing: 15,content: {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.black)
                        
                        TextField("Email Address", text: self.$email)
                    })
                    Divider().backgroundStyle(Color.white.opacity(0.5))
                })
                .padding(.horizontal)
                .padding(.top,40)
                
                VStack(content: {
                    HStack(spacing: 15,content: {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        SecureField("Password", text: self.$Password)
                        
                    })
                    Divider()
                        .backgroundStyle(Color.white.opacity(0.5))
                }).padding(.horizontal)
                    .padding(.top,30)
                
                HStack(content: {
                    Spacer(minLength: 0)
                    Button(action: {
                        //
                    }, label: {
                        Text("Forget Password")
                            .foregroundColor(Color.white.opacity(0.6))
                    })
                }).padding(.horizontal)
                    .padding(.top,30)
            }).padding()
                .padding(.bottom,65)
                .background(Color("main"))
                .clipShape(CShape2())
                .contentShape(CShape2())
                .shadow(color: Color.black.opacity(0.3), radius: 5,x: 0,y: -5)
                .onTapGesture {
                    self.index = 0
                }
                .cornerRadius(35)
                .padding(.horizontal,20)
            
            
            Button(action: {
                login()
            }, label: {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal,50)
                    .background(Color.orange)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5,x: 0,y: 5)
            })
            .offset(y:25)
            .opacity(self.index == 0 ? 1 : 0)
        })
        .onAppear{
            Auth.auth().addStateDidChangeListener{ auth, user in
                if user != nil {
                    userLoggedIn.toggle()
                }
                
            }
        }
    }
    func login (){
        Auth.auth().signIn(withEmail: email, password: Password){ result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
    }
}
struct SignUp : View{
    @State var email = ""
    @State var password = ""
    @State var repass = ""
    @Binding var index : Int
    @Binding var userLoggedIn : Bool
    var body: some View{
        ZStack(alignment:.bottom,content: {
            VStack(content: {
                HStack(content: {
                    Spacer(minLength: 0)
                    VStack(spacing: 10,content: {
                        Text("SignUp")
                            .foregroundColor(self.index == 0 ?  Color.black.opacity(0.3) : Color.white)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    })
                })
                .padding(.top,30)
                VStack(content: {
                    HStack(spacing: 15,content: {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.black)
                        TextField("Email Address", text: self.$email)
                    })
                    Divider()
                        .background( Color.white.opacity(0.5))
                    
                })
                .padding(.horizontal)
                .padding(.top,40)
                
                
                VStack(content: {
                    HStack(spacing: 15,content: {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        SecureField("Password", text: self.$password)
                    })
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                }).padding(.horizontal)
                    .padding(.top,30)
                VStack(content: {
                    HStack(spacing: 15,content: {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.black)
                        SecureField("Password", text: self.$repass)
                    })
                    Divider()
                        .background(Color.white.opacity(0.5))
                    
                })
                .padding(.horizontal)
                .padding(.top,30)
            })
            .padding()
            .padding(.bottom,65)
            .background(Color("main"))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5,x: 0,y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            
            Button(action: {
                register()
            }, label: {
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.orange)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: -5)
            })
            .offset(y:25)
            .opacity(self.index == 1 ? 1 : 0)
        })
//        .onAppear{
//            Auth.auth().addStateDidChangeListener{ auth, user in
//                if user != nil {
//                    userLoggedIn.toggle()
//                }
//
//            }
//        }
    }
    func register() {
        Auth.auth().createUser(withEmail: email, password: password){ result ,error in
            if error != nil {
                print(error!.localizedDescription)
            }
            
        }
    }
}
struct LogedIn : View {

    var body: some View {
        ZStack(content: {
            
        })
    }
}
