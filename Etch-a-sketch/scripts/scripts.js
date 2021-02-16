function makeGrid(width) {
    const container = document.querySelector("#container");

    const existingPixels = document.querySelectorAll(".pixel");
    var i = 0;
    while (i < existingPixels.length) {
        existingPixels[i].remove();
        i++
    }

    var area = width * width
    var pixelSize = (750 / width) + 2

    var i = 0;
    while (i < area) {
        const pixel = document.createElement("div");
        pixel.setAttribute("class", "pixel");
        pixel.style.width = pixelSize;
        pixel.style.height = pixelSize;
        pixel.addEventListener("mouseover", function (x) {this.className = "pixel"})
        pixel.addEventListener("mouseover", function (x) {this.classList.add(`${backgroundColor}`)})
        container.appendChild(pixel);
        i++
    }
}



function changeResolution() {
    userWidth = document.getElementById("userWidth").value
    if (userWidth > 1 && userWidth < 101 && Number.isInteger(Number(userWidth))) {
        makeGrid(Number(userWidth))
    } else {
        alert("You must enter a number between 2 and 100")
    }
}



function clearCanvas() {
    const isFilled = document.querySelectorAll(".pixel")
    i = 0
    while (i < isFilled.length) {
        isFilled[i].className = "pixel"
        i++;
    };
};
    



function colorSelect(x) {
    const colorClass = document.querySelectorAll(".colorButton");
    i = 0
    while (i < colorClass.length) {
        colorClass[i].classList.remove("colorButtonSelected")
        i++
    }
    x.target.classList.add("colorButtonSelected")

    if (x.target.id == "buttonBlack") {
        backgroundColor = "backgroundBlack"
    } else if (x.target.id == "buttonRed") {
        backgroundColor = "backgroundRed"
    } else if (x.target.id == "buttonBlue") {
        backgroundColor = "backgroundBlue"
    } else {
        backgroundColor = "backgroundGreen"
    }
}





const textSubmit = document.querySelector("#textSubmit");
textSubmit.addEventListener("click", changeResolution)

const clearButton = document.querySelector("#clearButton");
clearButton.addEventListener("click", clearCanvas);

const colorButtons = document.querySelectorAll(".colorButton");
colorButtons.forEach(x => x.addEventListener("click", colorSelect))




var backgroundColor = "backgroundBlack";
makeGrid(16)