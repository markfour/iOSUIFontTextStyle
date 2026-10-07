//
//  ContentView.swift
//  iOSUIFontTextStyle
//
//  Created by Kazumi Hayashida on 2026/10/07.
//

import SwiftUI
import UIKit

struct FontTextStyleItem: Identifiable {
    let name: String
    let style: UIFont.TextStyle

    var id: String { name }

    static let all: [FontTextStyleItem] = [
        .init(name: "body", style: .body),
        .init(name: "callout", style: .callout),
        .init(name: "caption1", style: .caption1),
        .init(name: "caption2", style: .caption2),
        .init(name: "footnote", style: .footnote),
        .init(name: "headline", style: .headline),
        .init(name: "subheadline", style: .subheadline),
        .init(name: "largeTitle", style: .largeTitle),
        .init(name: "title1", style: .title1),
        .init(name: "title2", style: .title2),
        .init(name: "title3", style: .title3),
    ]
}

struct ContentView: View {
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        NavigationStack {
            List(FontTextStyleItem.all) { item in
                FontTextStyleRow(item: item, dynamicTypeSize: dynamicTypeSize)
            }
            .listStyle(.plain)
            .navigationTitle("UIFont.TextStyle")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text(String(describing: dynamicTypeSize))
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .sharedBackgroundVisibility(.hidden)
            }
        }
    }
}

struct FontTextStyleRow: View {
    let item: FontTextStyleItem
    let dynamicTypeSize: DynamicTypeSize

    private var font: UIFont {
        let traits = UITraitCollection(preferredContentSizeCategory: UIContentSizeCategory(dynamicTypeSize))
        return UIFont.preferredFont(forTextStyle: item.style, compatibleWith: traits)
    }

    var body: some View {
        let font = font
        VStack(alignment: .leading, spacing: 4) {
            Text(item.name)
                .font(Font(font))
            Text("Point size = \(font.pointSize, format: .number.precision(.fractionLength(1)))")
                .font(.body)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}

#Preview("accessibility5") {
    ContentView()
        .environment(\.dynamicTypeSize, .accessibility5)
}
