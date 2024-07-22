//
//  Copyright © 2024 Bontouch AB. All rights reserved.
//

import SwiftUI

struct Toast: View {

    let title: String

    init(_ title: String) {
        self.title = title
    }

    var body: some View {
        Text(title)
            .foregroundStyle(.primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
    }
}

@Observable class ToastModel {

    var isShowingToast: Bool = false

    @ObservationIgnored
    private var hideToastTask: Task<Void, Never>?

    @MainActor func showToast() {
        if !isShowingToast {
            withAnimation(.smooth) {
                isShowingToast = true
            }
        }
        if let hideToastTask {
            self.hideToastTask = nil
            hideToastTask.cancel()
        }
        hideToastTask = Task {
            try? await Task.sleep(for: .seconds(2))
            if !Task.isCancelled {
                withAnimation(.smooth) {
                    isShowingToast = false
                }
            }
        }
    }
}

#Preview {
    Toast("Copied manifest to pasteboard")
        .padding(50)
        .background(Color(NSColor.controlBackgroundColor))
}
