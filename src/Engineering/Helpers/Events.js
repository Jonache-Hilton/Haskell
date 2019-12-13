"use strict";

const callbackMapper = {
  map : function(fn) {
    if(typeof window.__FN_INDEX !== 'undefined' && window.__FN_INDEX !== null) {
      var proxyFnName = 'F' + window.__FN_INDEX;
      window.__PROXY_FN[proxyFnName] = fn;
        window.__FN_INDEX++;
      return proxyFnName;
    } else {
      throw new Error("Please initialise window.__FN_INDEX = 0 in index.js of your project.");
    }
  }
}

exports.backPressHandlerImpl = function () {
  return function(e) {
    window.onBackPressed();
  }
}

exports.timerHandlerImpl = function (time) {
  return function(interval) {
    return function(push) {
      if(typeof window.__cancelTimer === "function"){
        window.__cancelTimer()
      }
      if (window.__OS.toLowerCase() != "ios") {
        var i = time;
        var clearId = setInterval(function () {
          push(i--)();
        }, interval);
        var f1 = function () {
          clearInterval(clearId); // Comment this line
        }
        window.__cancelTimer = f1;
        setTimeout(f1, time * 1000);
      } else {
        var timerCallback = callbackMapper.map(function(value) {
          push(value)();
        });
        var f1 = function () {
          JBridge.stopTimer();
        }
        window.__cancelTimer = f1;
        JBridge.startTimerWithTime(time, 1, timerCallback);
      }
    }
  }
}

exports.cancelTimerHandler = function() {
  if (window.__cancelTimer) {
    window.__cancelTimer();
  }
}


exports.timerHandlerImplWithIntervalImpl = function (time) {
  return function(push) {
    return function() {

      if (window.__OS.toLowerCase() != "ios") {
        var clearId = setInterval(function () {
          push()();
        }, time * 1000);
        setTimeout(function () {
          clearInterval(clearId);
        }, time * 1000);
      } else {
        var timerCallback = callbackMapper.map(function(value) {
          push()();
        });
        JBridge.startTimerWithTime(0, time, timerCallback);
      }
    }
  }
}
