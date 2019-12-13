exports['getOS'] = function (x) {
	var userAgent = navigator.userAgent;
	console.log('OS ==> ', userAgent);
	if (userAgent) {
		if (userAgent.indexOf('Android') != -1) {
			return 'ANDROID';
		}
		if (userAgent.indexOf('iPhone') != -1) {
			return 'IOS';
		} else {
			return 'WEB';
		}
	} else {
		console.log('Null user agent defaulting to android ');
	}
};

exports['getLabelHeight'] = function (text) {
	return function (fontName) {
		return function (fontSize) {
			return function (width) {
				return function (height) {
					if (__OS == 'ANDROID') {
						return 0;
					}
					var size = JBridge.sizeForLabelWithText(text, fontName, fontSize, width, height);
					return parseInt(JSON.parse(size)['height']);
				};
			};
		};
	};
};

exports['getLabelWidth'] = function (text) {
	return function (fontName) {
		return function (fontSize) {
			return function (width) {
				return function (height) {
					if (__OS == 'ANDROID') {
						return 0;
					}
					var size = JBridge.sizeForLabelWithText(text, fontName, fontSize, width, height);
					console.log('Size :', size);
					return parseInt(JSON.parse(size)['width']);
				};
			};
		};
	};
};

exports['screenWidth'] = function (x) {
	if (window.__OS == 'ANDROID') {
		if (window.__android_screenWidth) {
			return window.__android_screenWidth;
		} else {
			return (window.__android_screenWidth =
				JSON.parse(Android.getScreenDimensions()).width / JBridge.getPixels());
		}
	} else {
		if (window.__ios_screenWidth) {
			return window.__ios_screenWidth;
		} else {
			return (window.__ios_screenWidth = JSON.parse(Android.getScreenDimensions()).width);
		}
	}
};


exports["setScreen'"] = function (screen) {
	return function () {
		setTimeout(function () {
			if (window.idToBeRemoved) {
				Android.runInUI("set_VIEW=ctx->findViewById:i_" + window.idToBeRemoved + ";get_VIEW->removeAllViews;", null);
				Android.runInUI("set_VIEW=ctx->findViewById:i_" + window.idToBeRemoved + ";set_PARENT=get_VIEW->getParent;get_PARENT->removeView:get_VIEW;", null);
				window.idToBeRemoved = null;
			}
		}, 1200);
		window.__dui_screen = screen
		if (typeof window.pageId == "undefined") {
			window.pageid = -1;
		}
		++window.pageId
	}
}

exports["exitSDK'"] = function (payload) {
	return function (code) {
		console.log("EXIT SDK => ", payload);
		JOS.finish(code)(payload)()

	}
}

exports["log"] = function (tag) {
	return function (a) {
		console.log(tag + " >>", a);
		return a;
	}
}

exports.dropLastChar = function (str) {
	console.log("Splice => ", str);
	str = str.slice(0, str.length - 1);
	console.log("Splice => ", str);
	return str;
}
