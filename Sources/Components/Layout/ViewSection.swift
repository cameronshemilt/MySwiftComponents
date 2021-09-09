import SwiftUI

public struct ViewSection<Content: View>: View {
    let content: Content
    var title: LocalizedStringKey?
    
    init(_ title: LocalizedStringKey? = nil,@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.title = title
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if title != nil {
                HStack(alignment: .bottom) {
                    Text(title!)
                        .font(.system(size: 22, weight: .semibold))
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            
            content
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
    
    public func addAction<Action: View>(@ViewBuilder action: @escaping () -> Action) -> some View {
        guard let title = title else { return AnyView(self) }
        return AnyView(ViewActionSection(title, action: action(), content: content))
    }
}

private struct ViewActionSection<Content: View, Action: View>: View {
    let content: Content
    let action: Action
    var title: LocalizedStringKey
    
    init(_ title: LocalizedStringKey, action: Action, content: Content) {
        self.content = content
        self.title = title
        self.action = action
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .bottom) {
                Text(title)
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
                action
            }
            .padding(.bottom, 10)
            
            content
        }
        .padding(.horizontal)
        .padding(.bottom, 20)
    }
}

struct ViewSection_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ViewSection("Title") {
                Text("Content Within")
            }.addAction {
                Button("Sort", action: {})
            }
            
            ViewSection("Title") {
                Text("Content Within")
            }
        }
    }
}
