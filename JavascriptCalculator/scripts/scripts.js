var displayValue = "";
var opType = "";
var opSetFlag = 0;
var numSetFlag = 0;
var equalSetFlag = 0;
var num1 = "";
var num2 = "";


function operate(opType, num1, num2) {
    if (opType == "+") {
        return num1 + num2;
    } if (opType == "-") {
        return num1 - num2;
    } if (opType == "*") {
        return num1 * num2;
    } if (opType == "/") {
        return num1 / num2;
    }
};

function updateDisplay() {
    document.getElementById("display").textContent = displayValue;
};

function numClick(x) {
    if (opSetFlag == 1 || equalSetFlag == 1) {
        displayValue = "";
        opSetFlag = 0
    }
    displayValue += x.target.value;
    updateDisplay();
    numSetFlag = 1;
};

function decClick() {
    if (displayValue == "" || opSetFlag == 1) {
        displayValue = "0.";
    } if (equalSetFlag == 1) {
        displayValue = "0.";
        opType = "";
    } else if (displayValue.includes(".")) {
        displayValue = displayValue;
    } else {
        displayValue += ".";
    }
    
    updateDisplay();
    numSetFlag = 1;
    opSetFlag = 0;
    equalSetFlag = 0;
}


function funcClick(x) {
    if (x.target.value == "clear") {
        displayValue = "";
        opType = "";
        num1 = "";
        num2 = "";
        opSetFlag = 0;
        numSetFlag = 0;
        equalSetFlag = 0;
        updateDisplay();

    } if (x.target.value == "backspace") {
        if (numSetFlag == 1) {
            displayValue = displayValue.slice(0, -1)
            updateDisplay();
        }
        
    } if (x.target.value == "=") {
        if (numSetFlag == 1) {
            num2 = Number(displayValue)
        }
        displayValue = operate(opType, num1, num2)
        updateDisplay()
        num1 = displayValue
        numSetFlag = 0;
        opSetFlag = 0;
        equalSetFlag = 1;
    }
};

function opClick(x) {
    if (num1 == "") {
        num1 = Number(displayValue)
        opType = x.target.value
        opSetFlag = 1
        numSetFlag = 0
        equalSetFlag = 0
    } else if (numSetFlag == 1) {
        num2 = Number(displayValue)
        displayValue = operate(opType, num1, num2)
        updateDisplay()
        num1 = displayValue
        opType = x.target.value
        opSetFlag = 1
        numSetFlag = 0
        equalSetFlag = 0
    } else {
        opType = x.target.value
        opSetFlag = 1
        numSetFlag = 0
        equalSetFlag = 0
    }
};




const numButtons = document.querySelectorAll(".numButton");
numButtons.forEach(x => x.addEventListener("click", numClick));

const funcButtons = document.querySelectorAll(".funcButton");
funcButtons.forEach(x => x.addEventListener("click", funcClick));

const opButtons = document.querySelectorAll(".opButton");
opButtons.forEach(x => x.addEventListener("click", opClick));

const decButton = document.querySelector(".decimalButton");
decButton.addEventListener("click", decClick);