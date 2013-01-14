// =============================================================================
// getElementsByClassName(oElm, strTagName, strClassName)
// .............................................................................
// Return an array of elements with a specified class
// To get all anchor elements in the document with an “info-links” class.
//   getElementsByClassName(document, "a", "info-links");
// To get all a elements within the element named “box”,
// with a “col” and a “left” class.
//   getElementsByClassName(document.getElementById("box"), "a", ["col", "left"]);
// .............................................................................
// Written by Jonathan Snook, http://www.snook.ca/jonathan
// Add-ons by Robert Nyman, http://www.robertnyman.com
// =============================================================================

function getElementsByClassName(oElm, strTagName, oClassNames){
	var arrElements = (strTagName == "*" && oElm.all)? oElm.all : oElm.getElementsByTagName(strTagName);
	var arrReturnElements = new Array();
	var arrRegExpClassNames = new Array();
	if(typeof oClassNames == "object"){
		for(var i=0; i<oClassNames.length; i++){
			arrRegExpClassNames.push(new RegExp("(^|\\s)" + oClassNames[i].replace(/\-/g, "\\-") + "(\\s|$)"));
		}
	}
	else{
		arrRegExpClassNames.push(new RegExp("(^|\\s)" + oClassNames.replace(/\-/g, "\\-") + "(\\s|$)"));
	}
	var oElement;
	var bMatchesAll;
	for(var j=0; j<arrElements.length; j++){
		oElement = arrElements[j];
		bMatchesAll = true;
		for(var k=0; k<arrRegExpClassNames.length; k++){
			if(!arrRegExpClassNames[k].test(oElement.className)){
				bMatchesAll = false;
				break;
			}
		}
		if(bMatchesAll){
			arrReturnElements.push(oElement);
		}
	}
	return (arrReturnElements)
}
// .............................................................................


// =============================================================================
// checkAll(frm,ctl_ele,grp_class_name)
// .............................................................................
// Check/uncheck all checkbox elements in defined grp
// =============================================================================

function checkAll(frm,ctl_ele,grp_class_name) {
	grp_eles = getElementsByClassName(document, 'input', grp_class_name);
	if (ctl_ele.checked == true) {
		for (var i=0; i<grp_eles.length; i++) {
			var e = grp_eles[i];
			if (e.type=='checkbox') {e.checked = true;}
		}
	} else {
		for (var i=0; i<grp_eles.length; i++) {
			var e = grp_eles[i];
			if (e.type=='checkbox') {e.checked = false;}
		}
	}
}
// .............................................................................
