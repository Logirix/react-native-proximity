# react-native-proximity

## Getting started

`$ npm install react-native-proximity --save`

### Mostly automatic installation

`$ react-native link react-native-proximity`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-proximity` and add `Proximity.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libProximity.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.reactlibrary.ProximityPackage;` to the imports at the top of the file
  - Add `new ProximityPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-proximity'
  	project(':react-native-proximity').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-proximity/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-proximity')
  	```


## Usage
```javascript
import Proximity from 'react-native-proximity';

// TODO: What to do with the module?
Proximity;
```
