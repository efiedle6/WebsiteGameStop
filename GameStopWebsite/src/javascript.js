var req;
var isIE;
var productField;
var productTable;
var autoRow;

function init() {
	//get info from Header.jsp
    productField = document.getElementById("productfield");
    productTable = document.getElementById("producttable");
    autoRow = document.getElementById("auto-row");
    productTable.style.top = getElementY(autoRow) + "px";
}

function doCompletion() {

    var url = "autocomplete?action=complete&id=" + escape(productField.value);
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

//to check from InternetExplorer i believe, not 100% sure
function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

//clear the table of previous searches, set the proper state, and parse once again
function callback() {
    clearTable();

    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessages(req.responseXML);
        }
    }
}

//called from parseMessages tp add products to list
function appendProduct(producer,item,productId) {

    var row;
    var cell;
    var linkElement;
    
    if (isIE) {
        productTable.style.display = 'block';
        row = productTable.insertRow(productTable.rows.length);
        cell = row.insertCell(0);
    } else {
        productTable.style.display = 'table';
        row = document.createElement("tr");
        cell = document.createElement("td");
        row.appendChild(cell);
        productTable.appendChild(row);
    }

    cell.className = "popupCell";

	//give each product a link to their proper page
    linkElement = document.createElement("a");
    linkElement.className = "popupItem";
    linkElement.setAttribute("href", "autocomplete?action=lookup&id=" + productId);
    linkElement.appendChild(document.createTextNode(producer + " " + item));
    cell.appendChild(linkElement);
}

function clearTable() {
    if (productTable.getElementsByTagName("tr").length > 0) {
        productTable.style.display = 'none';
        for (loop = productTable.childNodes.length -1; loop >= 0 ; loop--) {
            productTable.removeChild(productTable.childNodes[loop]);
        }
    }
}

function getElementY(element){
    
    var targetTop = 0;
    
    if (element.offsetParent) {
        while (element.offsetParent) {
            targetTop += element.offsetTop;
            element = element.offsetParent;
        }
    } else if (element.y) {
        targetTop += element.y;
    }
    return targetTop;
}

function parseMessages(responseXML) {

    if (responseXML == null) {
        return false;
    } else {

        var products = responseXML.getElementsByTagName("products")[0];

        if (products.childNodes.length > 0) {
            productTable.setAttribute("bordercolor", "black");
            productTable.setAttribute("border", "1");
    
            for (loop = 0; loop < products.childNodes.length; loop++) {
                var product = products.childNodes[loop];
                var producer = product.getElementsByTagName("producer")[0];
                var item = product.getElementsByTagName("item")[0];
                var productId = product.getElementsByTagName("id")[0];
                appendProduct(producer.childNodes[0].nodeValue,
                    item.childNodes[0].nodeValue,
                    productId.childNodes[0].nodeValue);
            }
        }
    }
}