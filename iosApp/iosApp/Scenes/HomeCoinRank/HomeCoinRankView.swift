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
    @State private var isShowTopThree: Bool = true
    @FocusState private var searchTextFieldIsFocused: Bool
    
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateViewModel var viewModel = CoinsViewModel(coinsUseCase: KoinDependencies().coinsUseCase)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                // MARK: Search Section View
                searchView()
                Divider()
                
                if viewModel.coinsState.loading {
                    Text("Loading...")
                    ProgressView()
                } else if (viewModel.coinsState.error != nil) {
                    Text("Error : \(viewModel.coinsState.error ?? "")")
                } else {
                    // MARK: Top 3 Section View
                    topThreeCoinView()
                    
                    // MARK: CoinList Section View
                    coinListDefaultDisplay()
                }
            }
            .padding()
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
        self.viewModel.clearCoins()
        self.viewModel.getCoins()
    }
    
    func sheetCoinDetail(coin: Coin) {
        viewModel.selectedCoin(coin: coin)
        coordinator.present(sheet: .coinDetail(coin: viewModel.coinsState.selectedCoin))
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
                    .foregroundStyle(Color(colorName: .black))
                Text("\(numberTopCoin)")
                    .font(CoinFont.Style.robotoBold.swiftUIFont(16))
                    .foregroundStyle(Color(colorName: .red))
                Text("rank crypto")
                    .font(CoinFont.Style.robotoMedium.swiftUIFont(16))
                    .foregroundStyle(Color(colorName: .black))
                Spacer()
                Button {
                    isShowTopThree = !isShowTopThree
                } label: {
                    Text(isShowTopThree ? "hide" : "show")
                }

            }

            if isShowTopThree {
                HStack(spacing: 8) {
                    if !viewModel.coinsState.topThreeCoins.isEmpty {
                        // Rank One
                        let coinRankOne = viewModel.coinsState.topThreeCoins[0]
                        TopRankCoinItemView(item: coinRankOne, onClick: {
                            sheetCoinDetail(coin: coinRankOne)
                        })
                        // Rank Two
                        let coinRankTwo = viewModel.coinsState.topThreeCoins[1]
                        TopRankCoinItemView(item: coinRankTwo, onClick: {
                            sheetCoinDetail(coin: coinRankTwo)
                        })
                        // Rank Three
                        let coinRankThree = viewModel.coinsState.topThreeCoins[2]
                        TopRankCoinItemView(item: coinRankThree, onClick: {
                            sheetCoinDetail(coin: coinRankThree)
                        })
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func coinListDefaultDisplay() -> some View {
        // List When Home Normal Display
        let coinsList = isShowTopThree ? Array(viewModel.coinsState.coins.dropFirst(3)) : viewModel.coinsState.coins
        ForEach(coinsList, id: \.self) { coin in
            CoinItemView(item: coin) {
                print("Click open Coin Detail")
                sheetCoinDetail(coin: coin)
            }
            .id(coin.uuid)
        }
    }
}

#Preview {
    HomeCoinRankView()
}
