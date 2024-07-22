import SwiftUI
import AppKit

/// The WindowReflection is a view that peeks behind the curtain and finds the underlying NSWindow.
///
/// ```
/// .background(WindowReflection(window: $window))
/// ```
public struct WindowReflection: NSViewRepresentable {
    
    @Binding var window: NSWindow?
    
    public func makeNSView(context: Context) -> NSView {
        let view = NSView()
        DispatchQueue.main.async {
            self.window = view.window
        }
        return view
    }
    
    public func updateNSView(_ nsView: NSView, context: Context) {}
}
