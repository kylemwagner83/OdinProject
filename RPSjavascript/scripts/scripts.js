const rockbutton = document.getElementById("rockButton");
rockbutton.onclick = function () {
    game("rock")
}

const paperbutton = document.getElementById("paperButton");
paperbutton.onclick = function () {
    game("paper")
}

const scissorsbutton = document.getElementById("scissorsButton");
scissorsbutton.onclick = function () {
    game("scissors")
}

var computerpick = document.getElementById("computerPick");
var playerpick = document.getElementById("playerPick");
var result = document.getElementById("resultParagraph");
var playerscoreboard = document.getElementById("playerScore");
var computerscoreboard = document.getElementById("computerScore");
var tiescoreboard = document.getElementById("tieScore");
var playerscore = 0
var computerscore = 0
var ties = 0

function computerPlay() {
    x = Math.floor(Math.random() * 3) + 1
    switch (x) {
        case 1:
            computerselection = "rock";
            return computerselection
        case 2:
            computerselection = "paper";
            return computerselection
        case 3:
            computerselection = "scissors";
            return computerselection
    }
};


function playRound(playerselection, computerselection) {

    let p = playerselection
    let c = computerselection

    if (p == c) {
        return `Tie! both picked ${p}`

    } else if (p == "rock") {
        switch (c) {
            case "paper":
                return "You lose! Paper beats rock";
            case "scissors":
                return "You win! Rock beats scissors";
        }

    } else if (p == "paper") {
        switch (c) {
            case "rock":
                return "You win! Paper beats rock";
            case "scissors":
                return "You lose! Scissors beats paper";
        }

    } else if (p == "scissors") {
        switch (c) {
            case "rock":
                return "You lose! Rock beats scissors";
            case "paper":
                return "You win! Scissors beats paper"
        }
    }
};



function game(playerselection) {

    let computerselection = computerPlay();
    computerpick.innerHTML = computerselection
    playerpick.innerHTML = playerselection

    let x = playRound(playerselection, computerselection)
    result.innerHTML = x

    if (x.includes("win")) {
        playerscore++
        playerscoreboard.innerHTML = playerscore

    } else if (x.includes("lose")) {
        computerscore++
        computerscoreboard.innerHTML = computerscore

    } else if (x.includes("Tie")) {
        ties++
        tiescoreboard.innerHTML = ties
    }

    let gamesplayed = (playerscore + computerscore + ties)
    console.log(gamesplayed)

    if (gamesplayed > 4) {
        if (playerscore > computerscore) {
            window.alert("You win best of 5!")
        } else if (playerscore < computerscore) {
            window.alert("Computer wins best of 5!")
        } else if (playerscore == computerscore) {
            window.alert("Tied after 5!")
        }
        playerscore = 0
        playerscoreboard.innerHTML = playerscore
        computerscore = 0
        computerscoreboard.innerHTML = computerscore
        ties = 0
        tiescoreboard.innerHTML = ties
    }
}