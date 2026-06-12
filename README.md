# Run & Rule (RunRealm)

Run & Rule is a territory-based fitness application built with Flutter. It gamifies running by allowing users to capture physical territory on a real-world map as they exercise.

## 🚀 Current Features

### 1. Real-time Run Tracking
- **Live Map Integration**: Uses Google Maps to display the user's current location and path.
- **Path Drawing**: Draws a blue polyline as the user moves, providing visual feedback on the route taken.
- **Session Stats**: Tracks and displays:
    - **Time**: Elapsed time since the start of the run.
    - **Distance**: Calculated distance in kilometers.
    - **Tiles (Territories)**: Count of successfully captured areas.

### 2. Territory Capture Logic
- **Loop Detection**: The app automatically detects when a user's running path forms a closed loop.
- **Area Creation**: Once a loop is detected (based on a proximity threshold between start and end points), the path is converted into a semi-transparent blue polygon ("Captured Territory").
- **Reset Mechanism**: Upon capturing a territory, the current path resets, allowing the runner to begin capturing a new area immediately.

## 🛠 Technical Stack

- **Framework**: [Flutter](https://flutter.dev/) (Material 3)
- **Maps**: [google_maps_flutter](https://pub.dev/packages/google_maps_flutter)
- **Location**: [location](https://pub.dev/packages/location) for high-accuracy background/foreground tracking.
- **Architecture**: Feature-based folder structure (e.g., `lib/features/map`).

## 📁 Project Structure

```text
lib/
├── main.dart                 # App entry point, Home and Run screens
└── features/
    └── map/
        └── map_screen.dart   # Google Maps integration and territory logic
```

## ⚙️ Setup & Configuration

### Prerequisites
- Flutter SDK
- Google Maps API Key

### Android Configuration
1. Add your Google Maps API key to `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <meta-data android:name="com.google.android.geo.API_KEY"
       android:value="YOUR_API_KEY_HERE"/>
   ```
2. Ensure location permissions are granted in the manifest.

### iOS Configuration
1. Add `GMSServices.provideAPIKey` in `AppDelegate.swift`.
2. Add `NSLocationWhenInUseUsageDescription` to `Info.plist`.

## 🚧 Roadmap / Planned Improvements
- [ ] Multi-user "Factions" (Red vs Blue territories).
- [ ] Persistence (saving captured territories to a backend/local database).
- [ ] Leaderboards based on total area captured.
- [ ] Performance optimizations for long-distance runs.
