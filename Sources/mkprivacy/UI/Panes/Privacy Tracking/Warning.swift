//
//  Copyright © 2024 Apparata AB. All rights reserved.
//

import SwiftUI

struct Warning: View {

    private let message: String

    @Environment(\.colorScheme) private var colorScheme

    init(_ message: String) {
        self.message = message
    }

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "exclamationmark.triangle.fill")
            Text("**Warning:** \(message)")
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .foregroundStyle(colorScheme == .light ? Color.primary : Color.yellow)
        .background(colorScheme == .light ? Color.yellow : Color.yellow.opacity(0.2) )
        .clipShape(Capsule())
    }
}

#Preview {
    Warning("This is a warning")
}
