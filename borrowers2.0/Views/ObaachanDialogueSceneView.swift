//
//  ObaachanDialogueSceneView.swift
//  borrowers2.0
//
//  Created by Lissa Deguti on 01/08/25.
//

import SwiftUI

struct ObaachanDialogueSceneView: View {
    @State private var stepIndex = 0
    @State var finishedTyping = false
    
    //animação da fa  
    @State private var isTalking = false
    @State private var showFirstImage = true
    
    let steps: [ObaachanMinaDialogueStep] = [
        //0
        ObaachanMinaDialogueStep(narration: "In the agitated urban life, a little house still existed, and that’s where Mina and Obaachan lived, between the trees’ roots."),
        //1
        ObaachanMinaDialogueStep(narration: "Obaachan was sick, and needed medicine to get better — human medicine."),
        //2
        ObaachanMinaDialogueStep(speech: "Mina... Did you close the hatch behind the roots?", speaker: .obaachan),
        //3
        ObaachanMinaDialogueStep(speech: "Yes, Obaachan, no one saw me.", speaker: .mina),
        //4
        ObaachanMinaDialogueStep(speech: "Good, humans have been too close to our home lately. We have to be more careful.", speaker: .obaachan),
        //5
        ObaachanMinaDialogueStep(speech: "I know...", speaker: .mina)
    ]
    
    var body: some View {
        ZStack {
            Color.defaultBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(alignment: .leading, spacing: 24) {
                    
                    //narração
                    if let narration = steps[stepIndex].narration {
                        TypingTextView(
                            finalText: narration,
                            font: .custom("Baby Doll", size: 21)
                        ) {
                            finishedTyping = true
                        }
                        .id(narration) //força recriação quando o texto mudar
                    }
                    
                    //fala
                    if let speech = steps[stepIndex].speech {
                        TypingTextView(
                            finalText: speech,
                            font: .custom("Baby Doll", size: 21)
                        ) {
                            finishedTyping = true
                        }
                        .id(speech) //força recriação quando o texto mudar
                    }
                    
                    if finishedTyping {
                        Image(systemName: "chevron.down")
                            .font (.custom("Baby Doll", size: 21))
                            .opacity(0.6)
                            .padding(.top, 10)
                            .transition(.opacity)
                            .animation(.easeInOut, value: finishedTyping)
                    }
                    
                }
                .frame(width: 300, alignment: .leading)
                .padding(.top, 90)
                
                Spacer()
                
                //narração
                if steps[stepIndex].narration != nil {
                    HStack(alignment: .center, spacing: 20){
                        Image("mina_default")
                            .resizable()
                            .scaledToFit() //proporção
                            .frame(width: 100)
                        
                        Image("obaachan_default")
                            .resizable()
                            .scaledToFit() //proporção
                            .frame(width: 200)
                    }
                    .padding(.bottom)
                }
                
                //fala
                if steps[stepIndex].speech != nil {
                    HStack(alignment: .center, spacing: 20){
                        Image("mina_default")
                            .resizable()
                            .scaledToFit() //proporção
                            .frame(width: 100)
                        
                        Image("obaachan_default")
                            .resizable()
                            .scaledToFit() //proporção
                            .frame(width: 200)
                    }
                    .padding(.bottom)
                }
            }
            
        }
        .contentShape(Rectangle()) // pra poder clicar em qualquer lugar da tela
        .onTapGesture {
            if finishedTyping && stepIndex < steps.count {
                stepIndex += 1
                finishedTyping = false
            }
        }
    }
}

#Preview {
    ObaachanDialogueSceneView()
}
