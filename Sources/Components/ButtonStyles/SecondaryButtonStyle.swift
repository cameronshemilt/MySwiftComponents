import SwiftUI
#if os(macOS)
import AppKit
#endif

public struct SecondaryButtonStyle: ButtonStyle {
    var color: Color = .accentColor
    
    #if os(macOS)
    let background: Color = Color(NSColor.quaternaryLabelColor)
    #else
    let background: Color = Color(UIColor.secondarySystemBackground)
    #endif
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(color)
            .frame(minWidth: 0, maxWidth: .infinity, idealHeight: 10, maxHeight: 10, alignment: .center)
            .padding(18)
            .background(background)
            .cornerRadius(10)
        
    }
}

struct SecondaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("Button", action: {})
                .buttonStyle(SecondaryButtonStyle())
                .padding()
            
            Button("Button", action: {})
                .buttonStyle(SecondaryButtonStyle())
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}
