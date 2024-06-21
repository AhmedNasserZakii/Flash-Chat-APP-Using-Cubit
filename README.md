
# Flash Chat App Using Cubit

## Description

Flash Chat is a group chat application built with the MVVM structure, using Cubit for state management. The app leverages Firebase Authentication and Firestore for user authentication and real-time data storage. The main focus of this project is on the implementation of the BLoC (Business Logic Component) pattern and integration with Firebase services.

## Features

- **Group Chat**: Users can join and participate in group chats.
- **MVVM Architecture**: The app is structured using the Model-View-ViewModel architecture.
- **Cubit State Management**: Utilizes Cubit to manage the state of the application.
- **Firebase Authentication**: Users can sign up, log in, and authenticate using Firebase Authentication.
- **Firebase Firestore**: Real-time database for storing and retrieving chat messages.
- **Streams**: Real-time updates and data handling using Streams.

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/AhmedNasserZakii/Flash-Chat-APP-Using-Cubit.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd Flash-Chat-APP-Using-Cubit
   ```

3. **Install dependencies:**

   ```bash
   flutter pub get
   ```

4. **Set up Firebase:**

   - Create a Firebase project on the [Firebase Console](https://console.firebase.google.com/).
   - Add an Android app to your Firebase project and download the `google-services.json` file.
   - Place the `google-services.json` file in the `android/app` directory of your project.
   - Enable Firebase Authentication and Firestore in your Firebase project.

5. **Run the app:**

   ```bash
   flutter run
   ```

## Usage

1. **Sign Up / Log In:**
   - Users can sign up or log in using their email and password.

2. **Join a Chat Group:**
   - Users can join existing chat groups or create new ones.

3. **Send Messages:**
   - Users can send and receive messages in real-time.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.
