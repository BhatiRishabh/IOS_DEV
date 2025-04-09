# 🌤️ CLIMA

This is a simple and beautiful iOS application developed using Swift and SwiftUI. The app allows users to search for any location and get the current temperature using the **AccuWeather API**. It also supports **Light and Dark Mode** for a better user experience.

---

## ✨ Features

- 🌍 Search any city or location
- 🌡️ Get real-time temperature using AccuWeather API
- 🌙 Light Mode and Dark Mode support
- 🧭 Clean and responsive UI

---

## 📸 Screenshot

![App Screenshot](Screenshots/climate_app.png)

> Replace `Screenshots/climate_app.png` with the actual path to your image in the project directory.

---

## 🧑‍💻 Code Structure

### 🔹 Main Components

- **ContentView.swift**  
  The main entry point where UI is defined. It contains the search bar and temperature display. It listens to state changes in the `WeatherViewModel`.

- **WeatherViewModel.swift**  
  A view model responsible for API calls to AccuWeather and storing the data. It updates the view on receiving the temperature.

- **WeatherService.swift**  
  This file contains the logic for fetching data from the AccuWeather API. It handles URL construction, API keys, and network responses.

- **ThemeManager.swift** *(Optional)*  
  Handles Light/Dark mode switching. Utilizes `@Environment(\.colorScheme)` and toggles accordingly.

---

## 🧰 Tech Stack

- Swift
- SwiftUI
- Combine (for reactive data updates)
- AccuWeather API
- Xcode

---

## 🔑 API Integration

To use this app, you need to obtain a free API key from [AccuWeather Developer Portal](https://developer.accuweather.com/).

1. Create an account.
2. Generate your API key.
3. Add the key to your project (preferably using `.xcconfig` or environment variables).

Example usage in code:

```swift
let apiKey = "YOUR_API_KEY"
let url = "https://dataservice.accuweather.com/currentconditions/v1/\(locationKey)?apikey=\(apiKey)"
