import SwiftUI

struct FeatureIcon: View {
    @Environment(\.colorScheme) var scheme
    
    var icon: Image
    var size: CGFloat
    var radius: CGFloat
    var color: Color
    var foregroundColor: Color
    var weight: Font.Weight = .medium
    
    init(_ icon: String, size: CGFloat = 40, radius: CGFloat = 5, color: Color = .accentColor, foregroundColor: Color = .white) {
        self.icon = Image(systemName: icon)
        self.size = size
        self.radius = radius
        self.color = color
        self.foregroundColor = foregroundColor
    }
    
    init(customIcon: String, size: CGFloat = 40, radius: CGFloat = 5, color: Color = .accentColor, foregroundColor: Color = .white) {
        self.icon = Image(customIcon)
        self.size = size
        self.radius = radius
        self.color = color
        self.foregroundColor = foregroundColor
    }
    
    var body: some View {
        ZStack (alignment: .center) {
            Rectangle()
                .foregroundColor(color.opacity(scheme == .dark ? 0.15 : 1))
                .frame(width: size, height: size)
            icon
                .foregroundColor(scheme == .dark ? color : foregroundColor)
                .font(.system(size: size * 0.425, weight: weight))
        }
        .cornerRadius(radius)
    }
    
    func weight(_ weight: Font.Weight) -> some View {
        var copy = self
        copy.weight = weight
        return copy
    }
}

struct FeatureIcon_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FeatureIcon("infinity")
                .weight(.black)
            
            FeatureIcon("infinity")
                .preferredColorScheme(.dark)
        }
    }
}
