//
//  HomeCoinRankView.swift
//  iosApp
//
//  Created by Papon Supamongkonchai on 22/9/2567 BE.
//  Copyright © 2567 BE orgName. All rights reserved.
//
import Combine
import SwiftUI
import shared
import KMPNativeCoroutinesAsync
import KMPObservableViewModelSwiftUI

struct HomeCoinRankView: View {
    @State private var searchText: String = ""
    @FocusState private var searchTextFieldIsFocused: Bool
    
    @StateViewModel var viewModel = CoinsViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                // MARK: Search Section View
                searchView()
                Divider()
                
                // MARK: Top 3 Section View
                topThreeCoinView()
                
                // MARK: CoinList Section View
                coinListDefaultDisplay()
            }
        }
        .refreshable {
            resetSearch()
        }
        .onAppear {
            self.viewModel.getCoins()
        }
    }
    
    private func resetSearch() {
        self.searchText = ""
        self.searchTextFieldIsFocused = false
//        viewModel.resetSearchCoinsValue()
//        viewModel.requestCoinListTryAgain()
    }
}

extension HomeCoinRankView {
    @ViewBuilder
    private func searchView() -> some View {
        HStack {
            HStack(spacing: 8) {
                // MARK: Search Icon
                Button {
//                    viewModel.requestSearchCoinList(searchQuery: searchText)
                    self.searchTextFieldIsFocused = false
                } label: {
                    Image(with: .searchIcon)
                        .frame(width: 24, height: 24, alignment: .center)
                }//: Button
                .padding()

                // MARK: Textfield Search
                TextField(
                    "Search",
                    text: $searchText,
                    onCommit: {
//                        viewModel.requestSearchCoinList(searchQuery: searchText)
                    }
                )//: TextField
                .focused($searchTextFieldIsFocused)
                .onReceive(Just(searchText)) { searchText in
                    print("searchText : \(searchText)")
//                    viewModel.requestSearchCoinList(searchQuery: $0)
                }

                // MARK: Clear Button
                Button {
                    resetSearch()
                } label: {
                    Image(with: .deleteSearchIcon)
                        .frame(width: 16, height: 16, alignment: .center)

                }
                .opacity(searchText.isEmpty ? 0 : 1)
                .frame(width: searchText.isEmpty ? 0 : 30)
            }//: HStack
            .frame(height: 48)
            .padding(8)
            .background(Color(colorName: .bgSearch))
            .cornerRadius(8)
        }//: HStack
        .frame(height: 80)
        .background(Color(colorName: .white))
    }
    
    @ViewBuilder
    private func topThreeCoinView() -> some View {
        let numberTopCoin = 3
        VStack(spacing: 16) {
            HStack {
                Text("Top")
                    .font(CoinFont.Style.robotoBold.swiftUIFont(16))
                    .foregroundColor(Color(colorName: .black))
                Text("\(numberTopCoin)")
                    .font(CoinFont.Style.robotoBold.swiftUIFont(16))
                    .foregroundColor(Color(colorName: .red))
                Text("rank crypto")
                    .font(CoinFont.Style.robotoMedium.swiftUIFont(16))
                    .foregroundColor(Color(colorName: .black))
                Spacer()
            }

            HStack(spacing: 8) {
                // Rank One
                TopRankCoinItemView(item: viewModel.coinRankOne, onClick: {
//                    viewModel.requestCoinDetail(uuid: coinRankOne.uuid)
                })
                // Rank Two
                TopRankCoinItemView(item: viewModel.coinRankTwo, onClick: {
//                    viewModel.requestCoinDetail(uuid: coinRankTwo.uuid)
                })
                // Rank Three
                TopRankCoinItemView(item: viewModel.coinRankThree, onClick: {
//                    viewModel.requestCoinDetail(uuid: coinRankThree.uuid)
                })
            }
        }
    }
    
    @ViewBuilder
    private func coinListDefaultDisplay() -> some View {
        // List When Home Normal Display
        ForEach(viewModel.coinsState.coins, id: \.self) { coin in
            CoinItemView(item: coin) {
                print("Click open Coin Detail")
//                        viewModel.requestCoinDetail(uuid: coin.uuid)
            }
            .id(coin.uuid)
        }
    }
}

#Preview {
    HomeCoinRankView()
}
