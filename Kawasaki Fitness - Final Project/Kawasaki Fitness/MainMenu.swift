//
//  MainMenu.swift
//  FinalProject_fitnessApp_v1
//
//  Created by George Martin on 7/20/22.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

//MARK: - Main Menu

struct MainMenu: View {
    @AppStorage("workoutData") var workoutData = Data()
    @State private var listOfStuff = MockData.completeWorkoutData
    @Environment(\.scenePhase) var scenePhase
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    var body: some View {
        
        
        NavigationView {
            
            
            VStack {
                
                
                //Issues with phone resizing.
                Image("Kawasaki").resizable().aspectRatio(contentMode: .fit)
                    .padding(.all)
                    .background(Color.black.ignoresSafeArea())
                
                Spacer()
                
                NavigationLink {
                    MuscleGroupView(listOfStuff: $listOfStuff)
                } label: {
                    Text("[Go To Fitness Focus Area]")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 0.996, green: 0.003, blue: 0.214))
                        .padding(.all)
                }
                //Disgusting
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Text("Version 1.0.1")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.red)
                    .font(.system(size: 20, weight: .thin,
                                  design: .default))
                
                //Saving Data Stuff
                    .onChange(of: scenePhase) { newValue in
                        switch newValue {
                        case .active:
                            if let list = try? decoder.decode([ExerciseGroup].self, from: workoutData) {
                                listOfStuff = list
                            }
                        default:
                            guard let data = try? encoder.encode(listOfStuff)
                            else { return }
                            workoutData = data
                        }
                    }
            }
            .background(Color.black.ignoresSafeArea())
        }
    }
}

//MARK: - MuscleGroups

struct MuscleGroupView: View {
    @Binding var listOfStuff: [ExerciseGroup]
    
    var body: some View {
        
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                
                
                Text("Muscle Group")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.red)
                    .font(.system(size: 30, weight: .bold, design: .default))
                
                List {
                    
                    ForEach($listOfStuff, id: \.self) { $exerciseGroup in
                        NavigationLink {
                            ExcersiseListView(exercises: $exerciseGroup.exercises)
                            
                        } label: {
                            Text(exerciseGroup.muscleGroup.rawValue)
                            
                        }
                        //List Item Background
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.all)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .background(Color.black.ignoresSafeArea())
                        .foregroundColor(Color.white)
                        .listRowBackground(Color.black).ignoresSafeArea()
                        
                    }
                    //Border Around List Items
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(4)
                    .background(Color.red.ignoresSafeArea())
                    
                }
                //List View Background
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.all)
                .background(Color.black)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
            }
        }
    }
}


//MARK: - Exercises

struct ExcersiseListView: View {
    
    
    
    @Binding var exercises: [Exercise]
    var body: some View {
        
        
        ZStack {
            Color.black.ignoresSafeArea(.all)
            VStack {
                
                Text("Exercise Routine")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.red)
                    .font(.system(size: 30, weight: .bold, design: .default))
                
                List {
                    
                    
                    
                    ForEach($exercises, id: \.self) { $exercise in
                        NavigationLink {
                            ExerciseDetailView(exercise: $exercise)
                        } label: {
                            Text(exercise.title)
                        }
                        
                        //List Item Background
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.all)
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .background(Color.black.ignoresSafeArea())
                        .foregroundColor(Color.white)
                        .listRowBackground(Color.black).ignoresSafeArea()
                    }
                    
                    //Border Around List Items
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(5)
                    .background(Color.red.ignoresSafeArea())
                }
                //List View Background
                .frame(maxWidth: .infinity, maxHeight: 680)
                .padding(.all)
                .background(Color.black)
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
            }
        }
    }
}

//MARK: - Details

struct ExerciseDetailView: View {
    @Binding var exercise: Exercise
    
    
    var body: some View {
        VStack() {
            
            Text(exercise.title)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .font(.system(size: 22, weight: .bold, design: .default))
                .foregroundColor(Color.red)
            Spacer(minLength: 50)
            
            Text(exercise.description)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .font(.system(size: 15, weight: .bold, design: .default))
                .foregroundColor(Color.white)
            Spacer(minLength: 40)
            
            Text(exercise.sets)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .font(.system(size: 15, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white)
            Spacer(minLength: 10)
            
            Text(exercise.reps)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
                .font(.system(size: 15, weight: .bold, design: .default))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white)
            
            
            Image(exercise.imageName)
                .resizable().aspectRatio(contentMode: .fit)
                .padding(.all)
            
            Spacer()
            //Modify this so it works with resizing.
            TextEditor(text:$exercise.note).padding(.all)
                .border(Color.blue)
                .foregroundColor(Color.blue)
                .onAppear {
                    UITextView.appearance().backgroundColor = .clear
                }
        }
        
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.all)
            .background(Color.black)
        
            .onTapGesture {
                      self.hideKeyboard()
                    }
        
    }
}

//MARK: Preview

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainMenu()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
