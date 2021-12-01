The Bike Kollective
CS 467 - Fall 2021

Members:
Melissa Clark
Adriane Hairston
Jaime Justo


Installation
1) Navigate to find the source code at our GitHub Repository:
    https://github.com/hairstoa/bike_kollective/releases/tag/v1.0.18
2) Download the APK file ‘app-x86_64-debug.apk’
3) Run the AVD emulator that runs x86 and has Google Play Store installed. Google Pixel 2 API 28 will work. 
4) Drag and drop the downloaded file onto the emulator and open it from the Android menu. The app is called “Bike Kollective” and looks like a black and white bicycle.  

Instructions

- Login Page. If this is the first time accessing the application, there is a button to register on the bottom right of the inputs. Otherwise enter email and password, then click sign in. 

- Registration page. Enter your name, email and Password, then Sign Up. 

-Profile Page. Displays name, email, option to sign out, add a bike feature and a confirmation page. If the user has not registered, a ‘verify email’ button will send the user an email at the address provided with a confirmation link. 

-Add Bike - Bike Details Page. Allows the user to add information about the bike they would like to register with the program. The top drop down lists the types of bikes (Road, Mountain, etc.). There is a prompt for frame size and another drop down to select from centimeters or inches. Then the user can add the combination for their bike lock. 

-Add Bike - Image Upload Page. The user can take a photo of the bike with their camera or choose an existing photo from their phone photo gallery. The user will be prompted to crop the photo. A thumbnail appears after their selection. They may choose again or continue to the next step, location.

-Add Bike - Share Location Page. The user needs to allow their location to be shared, then hit ‘finish’. This concludes the process of adding a bike. At this point, the information that the user entered has been saved into the Firestore Database.

Acknowledgements

-  pub.dev
-  https://docs.flutter.dev/
-  https://firebase.google.com/docs
-  Programming Addict: https://www.youtube.com/watch?v=4GFmKr6McgU
