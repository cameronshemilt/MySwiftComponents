import SwiftUI
#if os(macOS)
import AppKit
#endif

public struct SecondaryCapsuleButtonStyle: ButtonStyle {
    var color: Color = .accentColor
    
    #if os(macOS)
    let background: Color = Color(NSColor.quaternaryLabelColor)
    #else
    let background: Color = Color(UIColor.secondarySystemBackground)
    #endif
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .foregroundColor(color)
            .background(background)
            .clipShape(Capsule())
            .contentShape(Rectangle())
        
    }
}

struct SecondaryCapsuleButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("Button", action: {})
                .buttonStyle(SecondaryCapsuleButtonStyle())
                .padding()
            
            Button("Button", action: {})
                .buttonStyle(SecondaryCapsuleButtonStyle())
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}
