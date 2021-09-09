import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    var color: Color = .accentColor
    var foregroundColor: Color = .white
    var scheme: ColorScheme = .light
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(scheme == .dark ? color : foregroundColor)
            .frame(minWidth: 0, maxWidth: .infinity, idealHeight: 10, maxHeight: 10, alignment: .center)
            .padding(18)
            .background(color.opacity(scheme == .dark ? 0.15 : 1))
            .cornerRadius(10)
    }
}

struct PrimaryButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button("Button", action: {})
                .buttonStyle(PrimaryButtonStyle(scheme: .light))
                .padding()
            
            Button("Button", action: {})
                .buttonStyle(PrimaryButtonStyle(scheme: .dark))
                .padding()
                .preferredColorScheme(.dark)
        }
    }
}
