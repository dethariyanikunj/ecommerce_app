# 🛒 Ecommerce App

A robust and scalable multi-module Flutter app built with **Clean Architecture**, **GetX**, **Isar (offline-first DB)**, and **modular widgets**. This project demonstrates best practices in modern Flutter development: network caching, animations, advanced filtering, custom widget libraries, and testing.

---

## 🚀 Features

### 🛍️ Product Catalog
- Fetch product list from REST API using **Dio**
- Infinite scrolling with API-driven pagination
- Debounced search input with filter support
- Range-based **price & rating** filters
- Advanced UI animations for product transitions
- Optimized with lazy loading for performance

### 📡 Offline-First Architecture
- Uses **Isar** local database for offline caching
- Automatically switches between online & offline states using `connectivity_plus`
- Offline banner and fallback to cached data
- Re-fetches online data when network is restored

### 🧩 Custom Widgets & Component Library
- 📦 Created a separate **Flutter widget package**: `product_carousel`
    - Product carousel with gesture support and animations
    - Custom hero transitions
    - Image lazy-loading with error handling
    - Fully documented & widget-tested
- Added in `pubspec.yaml` under dependencies
- Reusable architecture for multiple projects

### ⚙️ Architecture & State Management
- Based on **Clean Architecture** principles (Domain → Data → Presentation)
- State managed using **GetX**
- Dependency Injection using `Get.put` pattern
- Separation of concerns across modules: features, core, widgets, models, services

### ⚡ Performance Optimizations
- Lazy-loaded product images via `CachedNetworkImage`
- Debounced search (400ms)
- Paginated data loads only on scroll threshold
- Optimized rebuilds using `Obx` and reactive controllers

### 🧪 Testing
- ✅ Unit tests for controllers, filtering, search, pagination
- ✅ Widget tests for:
    - Carousel
    - Search bar & filter range UI
- ✅ Offline UI state
- 🧪 Provision for code coverage (`lcov.info`) integration

### 🧯 Error Handling & Logging
- Custom error handling for API and network failure
- Offline fallbacks
- Logging via `debugPrint` and `toastification`

---

## 📦 Tech Stack

| Layer        | Library/Tool                       |
|--------------|------------------------------------|
| UI           | Flutter, ScreenUtil, GetX          |
| State Mgmt   | GetX (Rx, Controller, DI)          |
| API          | Dio                                |
| Offline DB   | Isar                               |
| Caching      | Isar, CachedNetworkImage           |
| Animations   | Flutter Staggered Animations, Hero |
| Testing      | flutter_test, mockito, test        |
| CI/Tools     | Code Coverage,  Custom package     |

---

## 📂 Folder Structure

``` 
lib/
├── core/                      # App-wide utils, themes, localization, connectivity
│   ├── widgets/               # Reusable UI components (e.g. AppInputField)
│   ├── utils/                 # AppDimens, validators, constants
│   └── localizations/         # Multi-language support
│
├── features/                 
│   └── product_catalog/       # Modular feature (Product listing)
│       ├── data/              # Models, datasources (API, DB)
│       ├── domain/            # Repositories, use cases
│       └── presentation/      # Views, controllers, widgets
│
├── di.dart                    # Dependency injection setup
└── main.dart                  # App entry point

product_carousel/              # 🔌 Custom carousel widget package (outside lib)
```

---

## 🔧 Setup Instructions

1. **Clone the repo**
```bash
git clone https://github.com/dethariyanikunj/ecommerce_app.git
```

2. **Isar Namespace Setup

If you face the following error:

```
> Namespace not specified. Specify a namespace in the module's build file.

```

✅ Quick Fix: Follow this official workaround shared by the Isar team:  
🔗 [Isar Issue #1729 – Namespace Not Specified](https://github.com/isar/isar/issues/1729#issuecomment-3013073444)

Set compile sdk 35 other wise it will cause issue at time of building apk
AAPT: error: resource android:attr/lStar not found.
 
```bash
compileSdkVersion 35
```

Make sure you have defined the namespace inside your `android/app/build.gradle` file:

```groovy
android {
  namespace "com.example.your_app"
}
```

3**Install dependencies**
```bash
flutter pub get
```

4. **Run the app**
```bash
flutter run
```

---

## 📥 Offline Mode Handling

- When device is **offline**, cached data is shown
- Offline banner notifies the user
- Once the network is restored, **API is re-fetched**
- `ConnectivityManager` service handles all logic and state

---

## 🔗 Custom Package: `product_carousel`

- 📦 Located at `lib/product_carousel/`
- Imported via local dependency in `pubspec.yaml`
```yaml
dependencies:
  product_carousel:
    path: ./product_carousel
```

- Includes:
    - `ProductCarousel`
    - `ProductCarouselItem`
    - `ProductCarouselModel`
- ✅ Fully tested with `flutter_test`
- 🧪 Test cases written for rendering, tap, empty state, and item limits
- 📝 Well-documented with inline comments

---

## 📹 Demo / Preview

- 🔗 **[Watch Feature Walkthrough](https://drive.google.com/file/d/1DVbY-WEHApOLAOLjLwyFL_NBAdUFcSx1/view?usp=sharing)**
- 📦 **[Download APK](https://drive.google.com/file/d/1FzXj1V6DageMnGxiyMRi3SNPbd6yjHka/view?usp=sharing)**
- 📊 **[Code Coverage Report](https://drive.google.com/file/d/1hILwW_uG4rv_BPKksTZYQlLNL0C_fVLp/view?usp=sharing)**

---

## 🧑‍💻 Developer

**Nikunj Dethariya**  
🔧 10+ years of Mobile Development  
📧 [dethariyanikunj@gmail.com](mailto:dethariyanikunj@gmail.com)  
🌐 [GitHub](https://github.com/dethariyanikunj)

---

## 📄 License

MIT – use freely with attribution.

---

## ✅ Test Coverage Report (macOS)

You can generate a local test coverage report to visualize how much of your codebase is covered by unit and widget tests.

---

### 🧪 Steps to Generate HTML Report

1. **Run tests with coverage enabled**

   This command runs all tests and generates a `coverage/lcov.info` file:

   ```bash
   flutter test --coverage
   ```

2. **Install `lcov` (first time only)**

   `lcov` is used to convert the coverage info to a readable HTML format:

   ```bash
   brew install lcov
   ```

3. **Generate the HTML report**

   This command generates an HTML report inside the `coverage/html` folder:

   ```bash
   genhtml coverage/lcov.info -o coverage/html
   ```

4. **Open the report in your browser**

   Run the command below to view your test coverage report:

   ```bash
   open coverage/html/index.html
   ```

   > This shows:
   > - ✅ Which lines are covered by tests
   > - ❌ Which lines are missed
   > - 📊 File-by-file breakdown

---
