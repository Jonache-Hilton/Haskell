var callbackMapper = require("presto-ui").helpers.android.callbackMapper;


exports["showPanel"] = function(screenInput) {
  return function(configData) {
    return function(fn) {
      return function() {
        console.log("screenInput", screenInput);
        console.log("configData", configData);

        var cb = callbackMapper.map(function(data) {
          var newConfig = JSON.parse(data);

          screenInput[configData.selectedComponent] = newConfig;

          console.log(screenInput);

          fn(screenInput)();
        });

        JBridge.showPanel(JSON.stringify(configData), cb);

        return;
      }
    }
  }
}
