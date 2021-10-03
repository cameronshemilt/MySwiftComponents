import SwiftUI

public struct FeatureSection: View {
    private var icon: String
    private var headline: String
    private var paragraph: String
    
    public init(icon: String, headline: String, paragraph: String) {
        self.icon = icon
        self.headline = headline
        self.paragraph = paragraph
    }
    
    public var body: some View {
        HStack{
            FeatureIcon(icon)

            VStack(alignment: .leading){
                Text(headline)
                    .bold()
                Text(paragraph)
                    .font(.caption)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct FeatureSection_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            FeatureSection(icon: "heart", headline: "Favorite", paragraph: "Mark your favorites and save them")
            FeatureSection(icon: "square.and.pencil", headline: "Edit", paragraph: "Edit your text again and again")
            FeatureSection(icon: "trash", headline: "Trash", paragraph: "Throw away your trash")
        }
        .padding()
    }
}
