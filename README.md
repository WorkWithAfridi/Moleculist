# 🧬 Moleculist

A cross-platform Flutter app that allows users to **browse**, **search**, and **explore** chemical compounds with detailed information, powered by the **[PubChem API](https://pubchem.ncbi.nlm.nih.gov/docs/pug-rest)**.

---

## 📱 Features

### ✅ Home Screen
- Displays a curated grid of popular compounds
- Shows:  
  - Common Name  
  - Molecular Formula  
  - Molecular Weight  
  - Hazard Tag (mocked)
  - Compound Image (from CID)

### 🔍 Search
- Search any chemical compound by name
- Displays results with real-time PubChem API data
- Handles loading and error states gracefully

### 📄 Compound Detail Page
- IUPAC Name
- Molecular Formula & Weight
- Molecular Structure Image
- CAS Number (if available)
- Synonyms
- Hazard Statements (mocked or inferred)
- Description (if available)

### 💾 Offline Caching (Bonus)
- Last 5 compounds viewed are cached using local storage
- Displays from cache when offline

### 📦 State Management
- Uses `Cubit` (Bloc package) and `GetIt` for DI
- Modular and scalable architecture

---

## 🛠️ Tech Stack

| Tech | Purpose |
|------|---------|
| Flutter | Cross-platform UI |
| Dio | Networking |
| Bloc | State management |
| GetIt | Dependency injection |
| Hive / SharedPreferences | Local storage (caching) |
| PubChem API | Chemistry data provider |

---

## 🧪 Getting Started

### 🚀 Run the App
git clone https://github.com/your-username/moleculist.git
cd moleculist
flutter pub get
flutter run


### ✍️ Test Names to Try
Aspirin, Acetone, Benzene, Ethanol, Caffeine, Methane, Chloroform, Sulfuric Acid, Urea, Citric Acid

## 🏗️ Project Architecture
Moleculist is built with a clean, layered architecture that ensures separation of concerns, testability, and scalability.

### 🔧 Layers Overview
lib/
├── common/
│   ├── resources/       → App-wide resources (e.g., themes, constants).
│   ├── services/        → Common services (e.g., logging).
│   └── utilities/       → Utility functions and helpers.
├── data/
│   ├── local/           → Local data sources (e.g., Hive for caching).
│   └── remote/          → Remote data sources & API clients (e.g., Dio).
├── domain/
│   ├── entities/        → Core business objects (plain Dart objects).
│   ├── models/          → Data models with serialization logic.
│   ├── repositories/    → Abstract contracts for data layers.
│   └── services/        → Business logic and use cases.
├── presentation/
│   ├── blocs/           → State management (Blocs/Cubits).
│   └── views/           → UI screens and widgets.
└── main.dart            → App entry point.

### 🧠 State Management: Bloc/Cubit
We use Flutter Bloc for predictable state management. Each UI feature is backed by a dedicated Cubit:

### Cubits
Cubit	Responsibility
CompoundCubit	Load default compounds and cache them
SearchCubit	Perform dynamic search and handle results

## 📦 Repository Pattern
All external data (network or local) is accessed via repositories. Each repository:

Implements an abstract class (AbstractCompoundRepository)

Separates data-fetching logic from UI & business rules

Communicates with services, which are consumed by Cubits

This makes the app testable and ready for change or scale.

## 💼 Service Layer
The service layer coordinates multiple repository calls and composes logic. It contains:

Cache fallback logic

Transformation between raw data and models

Business-specific operations (e.g., batch loading, conditional fallback)

## 💡 Design Principles Followed
✅ Single Responsibility Principle
✅ Dependency Injection via GetIt
✅ Clean Architecture (Separation of Concerns)
✅ Fail-safe Error Handling
✅ Local caching with override support