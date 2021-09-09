import SwiftUI

public struct PrimaryCapsuleButtonStyle: ButtonStyle {
    var color: Color = .accentColor
    var foregroundColor: Color = .white
    var scheme: ColorScheme = .light
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 18))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .foregroundColor(scheme == .dark ? color : foregroundColor)
            .background(color.opacity(scheme == .dark ? 0.15 : 1))
            .clipShape(Capsule())
            .contentShape(Rectangle())
    }
}

struct PrimaryCapsuleButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("Button", action: {})
                .buttonStyle(PrimaryCapsuleButtonStyle())
                .padding()
            
            Button("Button", action: {})
                .buttonStyle(PrimaryCapsuleButtonStyle(scheme: .dark))
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}
