import SwiftUI

struct ContentView: View {
    
    @State private var selectedFile: String? = nil
    @State private var sqlText: String = ""
    
    var body: some View {
        HStack(spacing: 10) {
            // File Navigator Pane
            List {
                Text("SQL Scripts")
                .font(.headline)
                // Replace with actual list of files
                ForEach(placeholder_list, id: \.self) { file in
                    Text(file)
                        .onTapGesture {
                            selectedFile = file
                            // Load file content into sqlText here
                        }
            }
        }
        .listStyle(.sidebar)
        
        // SQL Code Editor Pane
        ZStack {
            TextEditor(text: $sqlText)
                .font(.monospaced)
                .disableAutocorrection(true)
            if selectedFile == nil {
                Text("Select a file from the navigator to view or edit its content.")
                    .foregroundColor(.gray)
                    .opacity(0.5)
            }
        }
    }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let placeholder_list = ["script_1.sql", "script_2.sql", "script_3.sql"]
