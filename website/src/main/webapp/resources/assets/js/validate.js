function validateForm() {
	console.log("inside validaate form");
	var x = document.productdetail.name;
	var y = document.productdetail.price;
	var z = document.productdetail.gweight;
	var a = document.productdetail.noofdiamond;
	var b = document.productdetail.dweight;
	var d = document.productdetail.stock;
	alert("x:" + x.value + " y:" + y.value + " z:" + z.value + " a:" + a.value
			+ " b:" + b.value + " d: " + d.value);
	if (filevalidation()) {
		if (allLetter(x)) {
			if (allnumeric(y) && notzero(y)) {
				if (allnumeric(d) && notzero(d)) {
					if (allnumeric(z) && notzero(z)) {
						if (allnumeric(a) && notzero(a)) {
							if (allnumeric(b) && notzero(b)) {
								return true;
							}
						}
					}
				}
			}
		}
	}
	console.log("for false");
	return false;
}
function allLetter(c) {
	// alert(c.value);
	var letters = /^[A-Z a-z]+$/;
	try {
		if (c.value.match(letters)) {
			document.getElementById("texterr").innerHTML = '';
			return true;
		} else {
			alert('name must have alphabet characters only');
			c.focus();
			throw 'name must have alphabet characters only';
			// return false;
		}
	} catch (e) {
		document.getElementById("texterr").innerHTML = e;
		return false;
	}
}
function allnumeric(inputtxt) {
	var numbers = /^[0-9.]+$/;
	try{
	if (inputtxt.value.match(numbers)) {
		document.getElementById(inputtxt.id + "err").innerHTML = '';
		return true;
	} else {
		alert('Please input numeric characters only');
		inputtxt.focus();
		throw 'please enter valid input.';
	}
	} catch(e){
		document.getElementById(inputtxt.id + "err").innerHTML = 'please enter valid input';
		return false;		
	}
}
function notzero(inputtxt) {
	console.log('inputss:', inputtxt);
	var temp = 0;
	try {
		if (inputtxt.value <= temp) {
			console.log('inputs in true part ');
			alert('please enter integer value greater than zero.');
			inputtxt.focus();
			throw 'please enter some input.';
		} else {
			console.log('inputs in else part ');
			document.getElementById(inputtxt.id + "err").innerHTML = '';
			return true;
		}
	} catch (e) {
		document.getElementById(inputtxt.id + "err").innerHTML = e;
		return false;
	}
}
function filevalidation() {
	var fileInput = document.getElementById('file');
	var filePath = fileInput.value;
	console.log("inside file", fileInput);
	console.log("file path ", filePath);
	var allowedExtensions = /(\.jpg|\.jpeg|\.png|\.gif)$/i;
	console.log(allowedExtensions.exec(filePath));
	try {
		if (!allowedExtensions.exec(filePath)) {
			alert('Invalid file type');
			fileInput.value = '';
			throw "please enter valid file.";
		} else {
			console.log("file is correct");
			document.getElementById("fileerr").innerHTML = '';
			return true;
		}
	} catch (e) {
		document.getElementById("fileerr").innerHTML = e;
		return false;

	}
}