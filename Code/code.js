var data = require('./input.json')

var convert = (data) => {

	var w = (data.w + data.h) / 2.0
	var h = (data.w + data.h) / 2.0
	var x = data.x + w / 2.0
	var y = data.y + h / 2.0

	return {
		w: w,
		h: h,
		x: x,
		y: y
	}
}

for(var i = 0; i < data.length; i++) {

	var circle = convert(data[i])

	if (i % 6 == 0) {
		console.log(`circles.add(new Circle(${circle.x}, ${circle.y}, ${0}, ${0}, ${circle.x}, ${circle.y}, ${circle.w}, ${circle.h}));`)
	} else if ((i + 1) % 6 == 0) {
		var nextCircle = convert(data[i-1])
		console.log(`circles.add(new Circle(${nextCircle.x}, ${nextCircle.y}, ${nextCircle.w}, ${nextCircle.h}, ${circle.x}, ${circle.y}, ${circle.w}, ${circle.h}));`)
		console.log(`circles.add(new Circle(${circle.x}, ${circle.y}, ${circle.w}, ${circle.h}, ${circle.x}, ${circle.y}, ${0}, ${0}));`)
	} else {
		var nextCircle = convert(data[i-1])
		console.log(`circles.add(new Circle(${nextCircle.x}, ${nextCircle.y}, ${nextCircle.w}, ${nextCircle.h}, ${circle.x}, ${circle.y}, ${circle.w}, ${circle.h}));`)
	}
}
