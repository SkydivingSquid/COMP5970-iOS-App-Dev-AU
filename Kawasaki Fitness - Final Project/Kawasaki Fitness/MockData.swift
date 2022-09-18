//
//  MockData.swift
//  FinalProject_fitnessApp_v1
//
//  Created by George Martin on 7/21/22.
//

import SwiftUI

//MARK: - Preloaded Exercise Data

struct MockData{
    
    static let completeWorkoutData: [ExerciseGroup] = [chestDay, backDay, shoulderDay, hamstringDay, armDay, quadDay]
    
        
//MARK: - Chest Exercise Data
    static let chestDay = ExerciseGroup(muscleGroup: .chest, exercises:
                                            [Exercise(title: "Seated Chest Press", sets: "Sets: 4", reps: "Reps: 15",
                                                      
                                                      description: "Instruction: Set machine arms to get a good pull while seated. Increase weight each set. Final set is a triple drop set.", imageName: "Chest Press (I)", note: "Notes: "),
    
                                            Exercise(title: "Incline Dumbbell Press", sets: "Sets: 4", reps: "Reps: 15",
                                                                                                   
                                                     description: "Instruction: Full range of motion. Get a pull at the bottom and squeeze at the top. Drop set on the last set", imageName: "Incline Dumbbell Press", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Incline Machine Press", sets: "Sets: 3", reps: "Reps: 15",
                                                           
                                                          description: "Instruction: Set machine arms to get a good pull while seated. Increase weight each set. Really squeeze at the top.", imageName: "Chest Press (I)", note: "Notes: "),
                                            
                                             Exercise(title: "Dummbell Pec-Fly", sets: "Sets: 3", reps: "Reps: 15",
                                                           
                                                      description: "Instruction: While lying down, begin with weight above you. Keeping elbow bent, bring dumbbells down below parallel to get a pull. Push weight straight up and squeeze.", imageName: "Dumbbell Fly", note: "Notes: "),
                                                 
                                                 
                                            Exercise(title: "Standing Cable Fly", sets: "Sets: 3", reps: "Reps: 15",
                                                           
                                                     description: "Instruction: Set cables to highest setting. With cables above and behind you, bring cable handles down and in front of you, with your hips bent slightly. Keep elbows bent. Cable should remain in contact with forarms throughout motion. The mind-muscle connection and squeeze is critical in this movement.", imageName: "Standing Cable Fly", note: "Notes: "),
                                                 
                                                 
                                            Exercise(title: "Low Cable Crossover", sets: "Sets: 3", reps: "Reps: 15",
                                                           
                                                     description: "Instruction: Set cables to lowest setting. With cables behind you and elbows bent, raise cable handles, using an underhand grip, to parallel with chest, getting a squeeze in the chest. ", imageName: "Low Cable Crossover", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Dip Machine", sets: "Sets: 3", reps: "Reps: 15",
                                                           
                                                           description: "Instruction: Lean as forward as possible, so chest is almost touching legs. Repeat dip motion with focus on the upper movement. Focus on the chest.", imageName: "Dips", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Bench Press", sets: "Sets: 3", reps: "Reps: 15/10/5",
                                                           
                                                           description: "Instruction: Keeping a straight back, planted feet, and shoudler width grip, execute controlled movement. Slight pause at the bottom each rep. Be sure to use a spotter for heavier weights.", imageName: "Bench", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Push Ups", sets: "Sets: 1", reps: "Reps: To Failure",
                                                           
                                                           description: "Instruction: Keeping good form, repeat push ups in a slow and controlled manner, all the way down, all the way up. Produce power from the chest, not the back.", imageName: "Push Ups", note: "Notes: ")
                                                
                                                ])
        
    //MARK: - Back Exercise Data
        
        static let backDay = ExerciseGroup(muscleGroup: .back, exercises:
                                                [Exercise(title: "Lat Pull Down", sets: "Sets: 3", reps: "Reps: 15",
                                                          description: "Instruction: Pull weight down with minimum lean, keeping elbows in throughout movement. \n\n[Superset with Straight Arm Pulldowns]", imageName: "Lat Pulldown", note: "Notes: "),
                                                 
                                                 
                                                  Exercise(title: "Straight Arm Pull Down", sets: "Sets: 3", reps: "Reps: 15",
                                                            description: "Instruction: Using a rope attachment, set cable to highest setting. Standing back with hips slightly back staight arms, bring rope down to legs. Slowly return to starting position (arms on ears). \n\n[Superset with Lat Pull Downs]", imageName: "Rope Pulldown", note: "Notes: "),
                                                 
                                                 
                                                  Exercise(title: "Single Arm Dumbbell Rows", sets: "Sets: 4", reps: "Reps: 15/12/10/8",
                                                            description: "Instruction: Standing behind a bench, and while wearing a belt, 'row' dumbbell with lats, not arms. Increase weight each set.", imageName: "Dumbbell Rows", note: "Notes: "),
                                                 
                                                 
                                                  Exercise(title: "Seated Cable Rows", sets: "Sets: 3", reps: "Reps: 15",
                                                            description: "Instruction: Maintain a straight back and a slight forward lean throughout exercise. Feel a squeeze in the back.", imageName: "Cable Rows", note: "Notes: "),
                                                 
                                                 
                                                  Exercise(title: "Close Grip Underhand Cable Row", sets: "Sets: 3", reps: "Reps: 15",
                                                        description: "Instruction: Using straight bar, maintain a straight back and a slight forward lean throughout exercise. Feel a squeeze in the back.",  imageName: "Underhand Cable Row", note: "Notes: "),
                                                 
                                                 
                                                  Exercise(title: "Seating Alternating Row", sets: "Sets: 3", reps: "Reps: 15",
                                                            description: "Instruction: Pull with each arm and focus on lat. Move shoulder before arm.",  imageName: "Alternating Row", note: "Notes: "),
                                                 
                                                 
                                                  Exercise(title: "Conventional Deadlifts", sets: "Sets: 3", reps: "Reps: 15/10/8/5",
                                                            description: "Instruction: Using a lifting belt and lifting shoes (or no shoes), progressively load weight on bar each set, maintaining proper form. Keep chin up, chest out. Squat into position, keep core tight, and engage lats before lift. Lift with heels, squeezing glutes at the top of the movement. Return weight to floor in a controlled manner each rep. Do not bounce/drop.",  imageName: "Deadlift", note: "Notes: "),
                                                 
                                                 
                                                  Exercise(title: "Pull Ups", sets: "Sets: 3", reps: "Reps: To Failure",
                                                            description: "Instruction: Using a wide grip pull up, repeat pull ups with good form until failure. Use pull-up assist machine if unable to get at least 5.",  imageName: "Pullup",note: "Notes: "),
                                                 
                                                 
                                                  Exercise(title: "Push Ups", sets: "Sets: 1", reps: "Reps: 50+",
                                                            description: "Instruction: Keeping good form, repeat push ups in a slow and controlled manner, all the way down, all the way up. Produce power from the back, not the chest. Feel the mid-back squeeze.", imageName: "Push Ups", note: "Notes: ")
                                                 
                                                ])
        
        
        
        
    //MARK: - Shoulder Exercise Data
        static let shoulderDay = ExerciseGroup(muscleGroup: .shoulders, exercises:
                                                [Exercise(title: "Dumbbell Shoulder Press", sets: "Sets: 4", reps: "Reps: 12-15",
                                                          description: "Instruction: Control the weight all the way down with a slight pause at the bottom. Last set is a drop set (half weight).",  imageName: "Dumbbell Shoulder Press", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Dumbbell Side-Lateral Raises", sets: "Sets: 3", reps: "Reps: 15/15",
                                                          description: "Start with weight in front of you. With elbows bent, raise weight parallel to shoudlers leading with the elbow. Keep shoulder-blades back, hips slightly bent, squeezing with the back at the top of the movement. Do 15 full, 15 half per set.",  imageName: "Side Laterals (2)", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Cable Side-Lateral Raises", sets: "Sets: 3", reps: "Reps: 15",
                                                           description: "Instruction: With cable set at the bottom, hold the handle attachment so that the cable is behind the back. Keep elbow bent. \n\n[Superset with Cable Upright Row]",  imageName: "Cable Side Lateral", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Cable Upright Row", sets: "Sets: 3", reps: "Reps: 15",
                                                           description: "Instruction: Using a straight-bar attachment or handle, use an overhand grip to pull weight to nose/chin level. Slowly return weight down. \n\n[Superset with Single Arm Cable Curls]", imageName: "Cable Upright Row", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Rear Delt Rope Pull-In", sets: "Sets: 3", reps: "Reps: 15",
                                                           description: "Instruction: Using a rope attachment, set the cable machine to the highest setting. Pull rope towards forehead, pausing slightly, and slowly returning weight to start.",  imageName: "Cable Rope Pull In", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Seated Reverse Pec-Fly", sets: "Sets: 3", reps: "Reps: 15",
                                                           description: "Instruction: Ensure full range of motion with a noticable squeeze in the delts and back.",  imageName: "Reverse Pec Deck", note: "Notes: "),
                                                 
                                                 Exercise(title: "Dumbbell Shurgs", sets: "Sets: 3", reps: "Reps: 25/15",
                                                           description: "Instruction: Shrug dumbbells keeping shoulders back and not using arms. Drop set each rep (half weight) for 15.",  imageName: "Shrugs",note: "Notes: ")
                                                 

                                                ])
    //MARK: - Hamstring Exercise Data
        
        static let hamstringDay = ExerciseGroup(muscleGroup: .hamstrings, exercises:
                                                [Exercise(title: "Prone Lying Leg Curl", sets: "Sets: 4", reps: "Reps: 20/20",
                                                          description: "Instruction: Control each curl for a 20 full and 20 half reps. \n\n[Superset with Goblet Squats]",  imageName: "Lying Leg Curl", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Goblet Squats", sets: "Sets: 4", reps: "Reps: 20",
                                                           description: "Instruction: Hold Kettlebell upside down, below chin. \n\n[Superset with Prone Lying Leg Curl]",  imageName: "Goblet Squat", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Seated Leg Curl", sets: "Sets: 3", reps: "Reps: 10/10/10",
                                                           description: "Instruction: 10 top to middle, 10 bottom to middle, 10 full.", imageName: "Leg Curls", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Cable Leg Press", sets: "Sets: 3", reps: "Reps: 30",
                                                           description: "Instruction: Keep feet high and wide. Repeat movement, breaking 90 degrees each rep. Push with heels.",  imageName: "Cable Leg Press", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Leg Press", sets: "Sets: 3", reps: "Reps: 15",
                                                           description: "Instruction: Keep feet high and wide. Be mindful of legs/ribs. Push with heels. ", imageName: "Leg Press", note: "Notes: ")
                                                
                                                ])
    //MARK: - Arm Exercise Data
        static let armDay = ExerciseGroup(muscleGroup: .arms, exercises:
                                                [Exercise(title: "[WARM-UP] - Cable Arm Curls", sets: "Sets: 3", reps: "Reps: 20",
                                                          description: "Instruction: Using D-ring handle attachment, focus on pushing blood into the muscle. Do not fatigue.",  imageName: "Cable Curls", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "[WARM-UP] - Tricep Dips", sets: "Sets: 3", reps: "Reps: 10",
                                                           description: "Instruction: Repeat dips slowly. Do not fatigue.",  imageName: "Dips", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Alternating Dummbell Curls", sets: "Sets: 3", reps: "Reps: 15",
                                                           description: "Instruction: Keep a 2/2/2 tempo. Do not swing body. Squeeze hard during isometic peak. \n\n[Superset with EZ Bar Curls]",  imageName: "Dumbbell Curls", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "EZ Bar Curls", sets: "Sets: 3", reps: "Reps: 10",
                                                           description: "Instruction: Keep a 1/2/3 tempo. Do not swing body. Squeeze hard during isometric peak. \n\n[Superset with Dumbbell Curls.",  imageName: "EZ Bar Curls", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Single Arm Cable Curls", sets: "Sets: 3", reps: "Reps: 15/20",
                                                           description: "Instruction: Set cable machine to lowest level using D-Ring handle attachment. Repeat 15 full reps, followed by 20 bent-over half reps. ",  imageName: "Cable Curls", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Preacher Curl", sets: "Sets: 3", reps: "Reps: 8-10",
                                                           description: "Instruction: Hold first contraction for 10 seconds. Keep tempo 3/2/6.",  imageName: "Preacher Curl", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Tricep Rope Extension", sets: "Sets: 3", reps: "Reps: 15",
                                                           description: "Instruction: Keep a 2/2/2 tempo.",  imageName: "Cable Rope Pulldown", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Straight Bar Push Downs", sets: "Sets: 3", reps: "Reps: 15",
                                                           description: "Instruction: Keep a 2/2/2 tempo, squeezing hard at the bottom.",  imageName: "Straight Bar Pushdown", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Overhead Rope Extensions", sets: "Sets: 3", reps: "Reps: 20/20",
                                                           description: "Instruction: Keep a 2/1/2 tempo during full reps followed by a 1/1/1 for half reps.",  imageName: "Overhead Tricep Extension", note: "Notes: "),
                                                
                                                 
                                                 Exercise(title: "Concentration Curls", sets: "Sets: 1", reps: "Reps: 15",
                                                           description: "Instruction: While seated, curl dumbbell on inner thigh, squeezing hard each rep.", imageName: "Concentration Curls",  note: "Notes: ")
                                                
                                                ])

    //MARK: - Quad Exercise Data
        static let quadDay = ExerciseGroup(muscleGroup: .quads, exercises:
                                                [Exercise(title: "Cable Leg Press", sets: "Sets: 4", reps: "Reps: 25",
                                                          description: "Instruction: Keep a narrower stance for quad isolation. Break 90 degrees each rep. \n\n[Superset with Leg Extensions]",  imageName: "Cable Leg Press", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Leg Extensions", sets: "Sets: 4", reps: "Reps: 25/25",
                                                           description: "Instruction: 25 Full / 25 Half, no rest, keeping toes pointed up. Pause slightly at the top. \n\n[Superset with Leg Press]",  imageName: "Leg Extensions", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Highbar Weighted Squats", sets: "Sets: 3-4", reps: "Reps: 15/15/15/5",
                                                           description: "Instruction: Wearing a lifting belt and lifting shoes (or no shoes) squat all the way down. Stay on heels the entire time. Do not sacrifice form. Optional 4th set.",  imageName: "Squat", note: "Notes: "),
                                                 
                                                 
                                                 Exercise(title: "Hack Squats", sets: "Sets: 3", reps: "Reps: 12",
                                                           description: "Instruction: 3 second negatives, keeping core tight.",  imageName: "Hack Squats", note: "Notes: "),
                                                
                                                 
                                                 Exercise(title: "Ultra-Heavy Seated Leg Curl", sets: "Sets: 3", reps: "Reps: 12",
                                                           description: "Instruction: Slow and controlled reps, pause at the top. Try to find failure between 10-12.",  imageName: "Leg Extensions", note: "Notes: ")
                                                 
                                                ])
                                             
                                             
                                             
                                            
}

//MARK: - Data Structures
struct Exercise: Hashable, Codable {
    let title: String
    let sets: String
    let reps: String
    let description: String

    var imageName: String
    
    var image: Image {
        Image(imageName)
    }
    
    var note: String
}

enum MuscleGroup: String, Codable {
    case chest = "Chest"
    case back = "Back"
    case shoulders = "Shoulders"
    case hamstrings = "Hamstrings"
    case arms = "Arms"
    case quads = "Quads"
}

struct ExerciseGroup: Hashable, Codable {
    let muscleGroup: MuscleGroup
    var exercises: [Exercise]
}


