exports["getAllDrawables"] = function () {
    return JSON.stringify(JBridge.getAllDrawables());  
}


exports.registerEvent = function(eventType) {
  return function(f) {
    window[eventType] = window[eventType] || {}
    if(window.__dui_screen) {
      if(eventType == "executeOnCardNumberChanged") {
        window[eventType][window.__dui_screen] = f;
      } else if (eventType == "executeExpiry") {
        window[eventType][window.__dui_screen] = f;
      }else if (eventType == "afterRender") {
        window[eventType][window.__dui_screen] = f;
      } else {
        window[eventType][window.__dui_screen] = f()
      }
    } else {
      console.error("please call setScreen first")
    }
  }
}

exports.backPressHandlerImpl = function () {
  window.onBackPressed();
}

exports._density = function () {
  // TODO: Cache value
  return JBridge.getPixels()
}