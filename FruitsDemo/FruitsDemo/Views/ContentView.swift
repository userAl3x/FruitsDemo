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
    
    // Estado para mostrar alertas
    @State private var showAlert = false
    @State private var alertMessage = ""
    
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
                        // Resetear la nueva fruta antes de abrir el modal
                        newFruit = Fruit(name: "", emoji: .apple, description: "")
                        sheetIsVisible = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            
            // Modal para agregar una nueva fruta
            .sheet(isPresented: $sheetIsVisible, onDismiss: onSheetDismiss) {
                NavigationView {
                    AddFruitView(newFruit: $newFruit)
                        // Añadimos la fruta (título)
                        .navigationTitle("Add Fruit")
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar {
                            // Botón para cancelar
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button("Cancel") {
                                    sheetIsVisible = false
                                    sheetAction = .cancel //Con esto, al abrir el modal, si se cancela, y se vuelve a abrir despues, se queda limpio
                                }
                            }
                            // Botón para añadir
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Add") {
                                    sheetIsVisible = false
                                    sheetAction = .add
                                }
                                .disabled(isAddButtonDisabled()) //Usa la funcion para la validacion y Como medida extra; Previene el error
                            }
                        }
                }
            }
            // Alerta para mostrar errores
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }
            
            // Vista por defecto (split view)
            DetailFruitView(fruit: store.fruits.first ?? FruitStore.defaultFruit)
        }
    }
    
    // Función para verificar que hay un nombre al añadir una fruta
    func isAddButtonDisabled() -> Bool {
        // El botón está deshabilitado si el nombre está vacío o solo tiene espacios
        return newFruit.name.trimmingCharacters(in: .whitespaces).isEmpty
    }
        
    // Función para verificar si la fruta ya existe (duplicado)
    func fruitAlreadyExists() -> Bool {
        let trimmedName = newFruit.name.trimmingCharacters(in: .whitespaces)
        return store.fruits.contains { fruit in
            fruit.name.lowercased() == trimmedName.lowercased()
        }
    }
    
    // Función que se ejecuta cuando se cierra el modal
    func onSheetDismiss() {
        if sheetAction == .add {
            // Limpiar espacios en blanco del nombre
            let trimmedName = newFruit.name.trimmingCharacters(in: .whitespaces)

            // Validar que el nombre no esté vacío
            if trimmedName.isEmpty {
                alertMessage = "The fruit name cannot be empty."
                showAlert = true
                sheetAction = .cancel
                return
            }
            
            // Validar que no sea duplicado
            if fruitAlreadyExists() {
                alertMessage = "A fruit with the name '\(trimmedName)' already exists."
                showAlert = true
                sheetAction = .cancel
                return
            }
            
            //Si pasa correctamente las validaciones, se agrega la fruta
            var fruitToAdd = newFruit
            fruitToAdd.name = trimmedName   // Guarda el nombre sin espacios
            store.fruits.append(fruitToAdd) // Agrega la nueva fruta al store

            
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
