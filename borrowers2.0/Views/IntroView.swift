//
//  IntroView.swift
//  borrowers2.0
//
//  Created by Lissa Deguti on 01/08/25.
//

import SwiftUI

struct IntroView: View {
    @State private var step = 1
    @State var finishedTyping = false
    
    let texts = [
        "In our world, there\nare small creatures.",
        "They hide close to\nour homes to borrow things.\nLike sugar or tea.",
        "We call them\nborrowers."
    ]
    
    var body: some View {
        ZStack {
            Color.defaultBackground
                .edgesIgnoringSafeArea(.all)
            
            VStack (alignment: .leading, spacing: 24){
                ForEach(0..<step, id: \.self) { index in
                    TypingTextView(
                        finalText: texts[index],
                        font: .custom("Baby Doll", size: 30)
                    ) {
                        //pra ele só mostrar a setinha quando o último texto acabar
                        //pega o texto anterior
                        if index == step - 1 {
                            finishedTyping = true
                        }
                    }
                }
                
                if finishedTyping {
                    Image(systemName: "chevron.down")
                        .font(.title)
                        .opacity(0.6)
                        .padding(.top, 10)
                        .transition(.opacity)
                        .animation(.easeInOut, value: finishedTyping)
                }
            }
            .frame(width: 300, alignment: .leading)
        }
        .contentShape(Rectangle()) //pra poder clicar em qualquer lugar da tela
        .onTapGesture {
            //pra passar de texto
            if finishedTyping && step < texts.count {
                step += 1
                finishedTyping = false
            }
            //pra passar de tela
            if finishedTyping && step >= texts.count {
                finishedTyping = false
                //TODO: MUDAR DE TELA
                
            }
        }
    }
}

#Preview {
    IntroView()
}
