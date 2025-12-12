# 🍎 FruitsDemo

Una aplicación iOS moderna desarrollada con SwiftUI que permite gestionar una lista personalizada de frutas con emojis y descripciones.

## 📱 Descripción

FruitsDemo es una aplicación educativa que demuestra las capacidades de SwiftUI para crear interfaces de usuario interactivas. Los usuarios pueden visualizar, agregar y eliminar frutas de su lista personalizada, cada una con su emoji característico y una descripción de sus beneficios para la salud.

## ✨ Características

- ✅ **Lista de frutas interactiva**: Visualiza todas tus frutas favoritas en una lista elegante
- ➕ **Agregar frutas**: Añade nuevas frutas con nombre, emoji y descripción personalizada
- 🗑️ **Eliminar frutas**: Desliza para eliminar frutas de la lista
- 👁️ **Vista detallada**: Toca cualquier fruta para ver sus detalles completos
- 🎨 **Selector de emojis**: Elige entre una variedad de emojis de frutas predefinidos
- ✔️ **Validación de datos**: 
  - Previene nombres vacíos
  - Evita frutas duplicadas
  - Limpia espacios en blanco automáticamente
- 🎯 **Interfaz intuitiva**: Diseño limpio y fácil de usar siguiendo las guías de Apple

## 🍓 Frutas Predefinidas

La aplicación incluye estas frutas por defecto:
- 🍎 Manzana - Ayuda a desarrollar resistencia contra infecciones
- 🍍 Piña - Ayuda a combatir la artritis
- 🍉 Sandía - Ayuda a controlar la frecuencia cardíaca

## 📋 Requisitos

- **iOS**: 15.0 o superior
- **Xcode**: 13.0 o superior
- **Swift**: 5.5 o superior
- **macOS**: Big Sur (11.0) o superior

## 🚀 Instalación

1. **Clona el repositorio**:
```bash
git clone https://github.com/tuusuario/FruitsDemo.git
cd FruitsDemo
```

2. **Abre el proyecto en Xcode**:
```bash
open FruitsDemo/FruitsDemo.xcodeproj
```

3. **Selecciona tu dispositivo destino**:
   - Elige un simulador de iOS o tu dispositivo físico

4. **Compila y ejecuta**:
   - Presiona `Cmd + R` o haz clic en el botón de ejecutar

## 🏗️ Arquitectura del Proyecto

El proyecto sigue el patrón de arquitectura **MVVM (Model-View-ViewModel)**:

```
FruitsDemo/
├── Model/
│   └── Fruit.swift              # Modelo de datos de Fruta
├── ViewModel/
│   └── FruitStore.swift         # Store observable para gestión de estado
├── Views/
│   ├── ContentView.swift        # Vista principal con lista
│   ├── AddFruitView.swift       # Vista para agregar frutas
│   ├── DetailFruitView.swift    # Vista de detalle de fruta
│   ├── FruitRowView.swift       # Vista de fila en la lista
│   └── EmojiPicker.swift        # Selector personalizado de emojis
└── FruitsDemoApp.swift          # Punto de entrada de la app
```

## 🛠️ Tecnologías Utilizadas

- **SwiftUI**: Framework de UI declarativo de Apple
- **ObservableObject**: Para gestión de estado reactivo
- **@Published**: Para propiedades observables
- **NavigationView**: Para navegación entre vistas
- **Sheet**: Para presentación de modales
- **Alert**: Para mostrar mensajes de error
- **ForEach**: Para iteración sobre colecciones

## 💡 Uso

### Agregar una Fruta

1. Toca el botón `+` en la esquina superior derecha
2. Ingresa el nombre de la fruta
3. Selecciona un emoji del selector
4. Añade una descripción opcional
5. Toca "Add" para guardar

### Ver Detalles

- Toca cualquier fruta de la lista para ver sus detalles completos

### Eliminar una Fruta

- Desliza hacia la izquierda sobre cualquier fruta y toca el botón de eliminar

## 🎨 Capturas de Pantalla

_Puedes añadir capturas de pantalla aquí para mostrar la aplicación en acción_

## 👥 Contribuciones

Las contribuciones son bienvenidas. Si deseas mejorar el proyecto:

1. Haz un Fork del proyecto
2. Crea una rama para tu funcionalidad (`git checkout -b feature/NuevaFuncionalidad`)
3. Haz commit de tus cambios (`git commit -m 'Añadir nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/NuevaFuncionalidad`)
5. Abre un Pull Request

## 📝 Notas de Desarrollo

- El proyecto incluye comentarios detallados en el código
- Se implementaron validaciones para mejorar la experiencia del usuario
- El código sigue las convenciones de Swift y las mejores prácticas de SwiftUI

## 📄 Licencia

Este proyecto es de código abierto y está disponible bajo la [Licencia MIT](LICENSE).

## 🤝 Créditos

- Desarrollado como proyecto educativo para demostrar las capacidades de SwiftUI
- Contribuciones de Pau Alcaraz en funcionalidades de eliminación

## 📧 Contacto

Si tienes preguntas o sugerencias, no dudes en abrir un issue en el repositorio.

---

⭐ Si te gusta este proyecto, ¡no olvides darle una estrella en GitHub!
