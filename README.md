
# HealthFit - Fitness and Wellness App

HealthFit is a Flutter-based mobile application designed to help users stay on top of their fitness and wellness goals. It features workout plans, a personalized home screen, and an introductory page highlighting the importance of health.

## Overview of the Project

HealthFit provides users with a user-friendly interface to browse workout routines, track their daily fitness plan, and get motivated with a clean, minimalistic design. Users can explore different workout types, see detailed information such as duration and calories burned, and stay organized with a "Today Plan" section.

Key Features:
- Intro screen with motivational text and a clear call-to-action.
- Customizable home screen displaying popular workouts and a personalized fitness plan for the day.
- Search bar for quickly finding workout routines.
- Horizontal scrollable cards showing workout information, including title, duration, and calories.

## Design Choices and Customizations Made

### 1. **UI Design**:
   - **Intro Screen**: The intro screen features a fullscreen background image with a gradient overlay, motivational text, and a "Get Started" button. We used `RichText` for custom styling to emphasize "Health" as a key term.
   - **Home Screen**: The home screen uses a clean design with a top bar greeting the user by name, followed by a search bar and two sections: "Popular Workouts" and "Today Plan."
   - **Workout Cards**: We chose a horizontal scroll list of workout cards to showcase various workout routines. The cards feature workout duration, calories, and a thumbnail image.
   - **Gradient Overlay**: On the intro screen, a linear gradient is applied to fade the image into white, ensuring the text stands out clearly.
  
### 2. **Modular Components**:
   - **WorkoutCard Widget**: A reusable widget that displays workout details.
   - **TodayPlanCard Widget**: Displays the user's plan for the day in a simplified format.

### 3. **Navigation**:
   - The intro screen is linked to the home screen using the `Navigator.pushNamed()` function, ensuring smooth navigation between screens.
  
### 4. **Customization**:
   - The colors, font sizes, and padding have been fine-tuned for a visually appealing, user-friendly experience.

## Setup and Running the Project

### Prerequisites
Before you begin, ensure you have the following tools installed:
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- An editor like [VSCode](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/HealthFit.git
   cd HealthFit
   ```

2. **Install Dependencies**:
   Run the following command to install all required dependencies:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   Use this command to run the app on an emulator or physical device:
   ```bash
   flutter run
   ```

### Folder Structure

```
lib/
│
├── main.dart               # The entry point of the app
├── screens/
│   ├── intro_screen.dart    # Intro screen code
│   ├── home_screen.dart     # Home screen code
│   ├── explore_screen.dart     # Explore screen code

├── widgets/
│   ├── workout_card.dart    # Widget for workout cards
│   ├── today_plan_card.dart # Widget for today's plan
└── assets/
    ├── 49e8204318ddc250c17a9fe76c47942e.jpeg  # Image for intro screen
    ├── cd9933411c6b5eaf08283408f5361651.jpeg  # Image for lower body training
    ├── demetrious-johnson-exercise-dumbbell.jpg  # Image for upper body training
```

### How to Add More Workouts

To add new workouts to the app, simply modify the `workoutList` in `home_screen.dart` by adding new entries with the following details:
- `title`: The name of the workout.
- `duration`: How long the workout lasts.
- `calories`: Estimated calories burned.
- `imageUrl`: Path to the workout image stored in the `assets` folder.

### Customizing UI Elements

You can easily customize the UI by tweaking the following:
- **Intro Screen**: Modify the `RichText` in `intro_screen.dart` to update motivational content.
- **Home Screen**: Add new sections, adjust paddings, and modify card styles by editing the `WorkoutCard` and `TodayPlanCard` widgets in the `widgets/` folder.

