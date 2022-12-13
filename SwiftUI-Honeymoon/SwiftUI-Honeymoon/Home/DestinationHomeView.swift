//
//  ContentView.swift
//  SwiftUI-Honeymoon
//
//  Created by Nitin Aggarwal on 11/12/22.
//

import SwiftUI

struct DestinationHomeView: View {
    
    // MARK: - Properties
    @State private var showAlert: Bool = false
    @State private var showGuide: Bool = false
    @State private var showInfo: Bool = false
    @GestureState private var dragState: DragState = .inactive
    private var dragAreaThreshold: CGFloat = 50.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    // MARK: - Cards
    @State private var cardViews: [DestinationCardView] = {
        var cards: [DestinationCardView] = []
        for index in 0..<2 {
            cards.append(DestinationCardView(destination: destinationArray[index]))
        }
        return cards
    }()
    
    private func moveCards() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        let destination = destinationArray[lastCardIndex % destinationArray.count]
        let newCard = DestinationCardView(destination: destination)
        self.cardViews.append(newCard)
    }
    
    // MARK: - Top Card
    private func isTopCard(_ cardView: DestinationCardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    // MARK: - Drag State
    enum DragState {
        
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing: return .zero
            case .dragging(let translation): return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .inactive, .pressing: return false
            case .dragging: return true
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .inactive, .dragging: return false
            case .pressing: return true
            }
        }
    }
    
    var body: some View {
        
        VStack {
            
            // MARK: - Header View
            HomeHeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .frame(height: 80)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: UUID())
            
            Spacer()
            
            // MARK: - Card View
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView) ? 1 : 0)
                        .overlay(content: {
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(DragSymbolModifier())
                                    .opacity(self.dragState.translation.width < -dragAreaThreshold && self.isTopCard(cardView) ? 1.0 : 0.0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(DragSymbolModifier())
                                    .opacity(self.dragState.translation.width > dragAreaThreshold && self.isTopCard(cardView) ? 1.0 : 0.0)
                            }
                        })
                        .offset(x: self.isTopCard(cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView) ? 0.85 : 1)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView) ? Double(self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: UUID())
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                                .onChanged({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransition = .leadingBottom
                                    }
                                    
                                    if drag.translation.width > self.dragAreaThreshold {
                                        self.cardRemovalTransition = .trailingBottom
                                    }
                                })
                                .onEnded({ (value) in
                                    
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        playSound(sound: "sound-rise", type: "mp3")
                                        self.moveCards()
                                    }
                                })
                        ).transition(self.cardRemovalTransition)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - Footer View
            HomeFooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: UUID())
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing a lovely and most precious of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!")))
        }
    }
}

struct DestinationHomeView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationHomeView()
    }
}
