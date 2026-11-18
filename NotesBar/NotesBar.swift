import SwiftUI

@main
struct NotesBarApp: App {
    init() {
        // Menu bar only: no Dock icon
        NSApplication.shared.setActivationPolicy(.accessory)
    }

    var body: some Scene {
        MenuBarExtra("Notes", systemImage: "note.text") {
            ContentView()
        }
        .menuBarExtraStyle(.window)
    }
}

struct ContentView: View {
    // Saved automatically and persists between launches
    @AppStorage("note") private var note = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            TextEditor(text: $note)
                .font(.system(size: 13))
                .frame(width: 300, height: 240)
                .scrollContentBackground(.hidden)
                .padding(4)
                .background(Color.primary.opacity(0.05))
                .cornerRadius(6)

            HStack {
                Text("\(note.count) characters")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
                Button("Clear") { note = "" }
                Button("Quit") { NSApplication.shared.terminate(nil) }
                    .keyboardShortcut("q")
            }
        }
        .padding(12)
    }
}
