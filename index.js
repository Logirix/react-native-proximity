import { NativeModules, DeviceEventEmitter, Platform } from "react-native";

const { RNProximity } = NativeModules;

let addListener = null;
let removeListener = null;

if (Platform.OS === "ios") {
  (addListener = function(callback) {
    console.warn("here");

    RNProximity.proximityEnabled(true);
    return DeviceEventEmitter.addListener("proximityStateDidChange", callback);
  }),
    (removeListener = function(listener) {
      console.warn("here2");
      RNProximity.proximityEnabled(false);
      DeviceEventEmitter.removeAllListeners(
        "proximityStateDidChange",
        listener
      );
    });
} else if (Platform.OS == "android") {
  addListener = callback => {
    RNProximity.addListener();

    DeviceEventEmitter.addListener(RNProximity.EVENT_ON_SENSOR_CHANGE, e => {
      console.warn(RNProximity.EVENT_ON_SENSOR_CHANGE);
      console.warn(e);

      callback(e);
    });
  };
  removeListener = listener => {
    RNProximity.removeListener();
    DeviceEventEmitter.removeAllListeners(
      RNProximity.EVENT_ON_SENSOR_CHANGE,
      listener
    );
  };
}

module.exports = {
  addListener,
  removeListener
};
