# QuickNimbleProject

🚀 **QuickNimbleProject** es un proyecto de prueba de concepto para aprender y aplicar **Testing en Swift** usando **Quick y Nimble**.

## 📌 Descripción
Este proyecto implementa un **Task Manager** con un `TaskViewModel` que permite agregar, eliminar y completar tareas. Se han desarrollado **tests unitarios y de concurrencia** para garantizar el correcto funcionamiento del código.

## 🛠️ Tecnologías utilizadas
- **Swift** 🚀
- **XCTest** 🧪
- **Quick & Nimble** (para tests más expresivos y organizados) ✅

## 📂 Estructura del proyecto

```
📦 QuickNimbleProject
 ┣ 📂 QuickNimbleProject
 ┃ ┣ 📜 Task.swift          # Modelo de una tarea
 ┃ ┣ 📜 TaskViewModel.swift # Lógica de negocio del Task Manager
 ┃ ┗ 📜 SceneDelegate.swift # Configuración de la UI
 ┣ 📂 QuickNimbleProjectTests
 ┃ ┣ 📜 TaskViewModelTests.swift          # Tests unitarios generales
 ┃ ┣ 📜 TaskViewModelConcurrencyTests.swift # Tests de concurrencia con GCD
 ┃ ┗ 📜 TaskViewModelEdgeCasesTests.swift  # Casos extremos (títulos largos, rendimiento)
 ┣ 📜 README.md  # Documentación del proyecto
 ┗ 📜 Package.swift  # Dependencias de Quick y Nimble
```

## 🧪 Instalación y ejecución de los tests
### 1️⃣ Clonar el repositorio
```bash
git clone https://github.com/ahhhv/QuickNimbleProject.git
cd QuickNimbleProject
```

### 2️⃣ Instalar dependencias
Este proyecto usa **Swift Package Manager (SPM)**. Asegúrate de tener Quick y Nimble agregados.

Si no están, agrégales manualmente desde **Xcode** → **File** → **Add Packages** e introduce:
- Quick → `https://github.com/Quick/Quick`
- Nimble → `https://github.com/Quick/Nimble`

### 3️⃣ Ejecutar los tests
Abre el proyecto en Xcode y presiona:
```
Cmd + U
```
También puedes ejecutar tests individuales desde la barra de pruebas en Xcode.

## 🚀 ¿Qué se prueba en este proyecto?
| Test | Descripción |
|------|------------|
| **TaskViewModelTests** | Tests unitarios básicos (CRUD de tareas) |
| **TaskViewModelConcurrencyTests** | Pruebas de concurrencia con GCD y ejecución en main thread |
| **TaskViewModelEdgeCasesTests** | Casos extremos: títulos largos, caracteres especiales, rendimiento |

## 📌 Contribuciones
Si quieres mejorar este proyecto, ¡las PRs son bienvenidas! 😊

## 📝 Licencia
Este proyecto es de código abierto bajo la licencia MIT.