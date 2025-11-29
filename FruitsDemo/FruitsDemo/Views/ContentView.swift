import SwiftUI

// Enum para controlar las acciones del sheet
enum SheetAction {
    case cancel
    case add
}

struct ContentView: View {
    @StateObject var store = FruitStore()
    
    // Estados para el modal de agregar fruta
    @State private var sheetIsVisible = false
    @State private var sheetAction = SheetAction.cancel
    @State private var newFruit = Fruit(name: "", emoji: .apple, description: "")
    
    var body: some View {
        // Vista principal de la lista de frutas
        NavigationView {
            List(store.fruits) { fruit in
                NavigationLink(destination: DetailFruitView(fruit: fruit)) {
                    FruitRowView(fruit: fruit)
                }
            }
            .navigationTitle("Fruits")
            // Toolbar para la navegación principal
            .toolbar {
                // Botón para editar la lista de frutas
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                // Botón para agregar una nueva fruta
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        sheetIsVisible = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            // Sheet para agregar una nueva fruta 
            .sheet(isPresented: $sheetIsVisible, onDismiss: onSheetDismiss) {
                NavigationView {
                    AddFruitView(newFruit: $newFruit)
                        .navigationTitle("Add Fruit")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Cancel") {
                                    sheetIsVisible = false
                                }
                            }
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Add") {
                                    sheetIsVisible = false
                                    sheetAction = .add
                                }
                                .disabled(newFruit.name.isEmpty)
                            }
                        }
                }
            }
            
            // Vista por defecto (split view)
            DetailFruitView(fruit: store.fruits.first ?? FruitStore.defaultFruit)
        }
    }
    
    // Función que se ejecuta cuando se cierra el modal
    func onSheetDismiss() {
        if sheetAction == .add {
            // Agregar la nueva fruta al store
            store.fruits.append(newFruit)
            
            // Reset: crear una nueva fruta vacía
            newFruit = Fruit(name: "", emoji: .apple, description: "")
            
            // Resetear la acción
            sheetAction = .cancel
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}