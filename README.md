# hp_weather

* A Minimalistic Weather application to show current location's and other locations weather information along with 5 day forecast of weather developed using Flutter.
* User needs to provide GPS location permission in order to fetch weather information.
* User can click on location name on top left to navigate to search screen, where user can input a location and select a location or place from the results to get weather information.
* User can change the units of the weather from celsius to fahrenheit and vice-versa.

## How to run
* Install the APK from the `apk` folder or execute below command
```bash
 flutter run --dart-define="weatherApiKey=9332fcc0e58e66a4c76588f197b75be7" 
```
## Building release APK
```bash
 flutter build apk --release --dart-define="weatherApiKey=9332fcc0e58e66a4c76588f197b75be7"
```
We use `--dart-define` for providing sensitive information like API key to app, such that we don't need to hardcode the key anywhere in code for enhanced security. (I'll update this readMe to remove API key and will disable the key after 3 days of submission to prevent fraud usage)

## Dependencies and why we used it
* [async](https://pub.dev/packages/async) - Used for [CancelableOperation](https://pub.dev/documentation/async/latest/async/CancelableOperation-class.html) which acts as deBouncer in search widget
* [bloc](https://pub.dev/packages/bloc), [flutter_bloc]() - Used for State management of the application
* [equatable](https://pub.dev/packages/equatable) - used in the cubit(bloc) states
* [http](https://pub.dev/packages/http) - used for making API calls to [Open weather map](https://openweathermap.org/) for weather and forecast data and [open street map](https://www.openstreetmap.org/#map=5/21.843/82.795) for places data
* [url_launcher](https://pub.dev/packages/url_launcher) - Used to open URLs such as attribution links and source code links in the browser
* [geolocator](https://pub.dev/packages/geolocator) - Used for obtaining location permission and get GPS coordinates of the device
* [intl](https://pub.dev/packages/intl) - used to format `DateTime` timestamps to display on UI

## Future roadmap
Below mentioned were few items I could have worked(What you would do if you had more time)
* [ ] Add push notifications to notify users for server weather conditions
* [ ] Add more in-detail weather information like UV index, air quality and more
* [ ] Locally store all the locations user searched for in past and keep track of them
* [ ] Provide an option to user to delete locally saved previously searched locations/places
* [ ] Locally save units preference of user and show weather information in that units by default
* [ ] Add a bit more graphic(colors or animations) to today current weather info UI card based on timezone

## Reach out to me @
* [Harsha Pulikollu](https://www.linkedin.com/in/harshapulikollu/)