final int SCHERM_BREEDTE = 800;
final int SCHERM_HOOGTE = 800;
final int BAL_SNELHEID = ceil(SCHERM_BREEDTE * 1.05);
final int MAX_SCORE_WIN = 10;

void settings() {
    size(SCHERM_BREEDTE, SCHERM_HOOGTE);
}

void setup() {
    maakObstakel();
    frameRate(BAL_SNELHEID); // snelheid van de bal
}

void draw() {
    background(255);

    if (gameOver()) {
        tekenEindScherm();
    }
    else {
        verplaatsBatjes();
        beweegBal();
        bepaalScore();

        tekenSpelObjecten();    
    }
}

void keyPressed() {
    //println("key: " + key + " keyCode: " + keyCode);
    beweegBatjes();
} 

void tekenSpelObjecten() {
    tekenBal(bal);
    tekenBat(batA, KLEUR_BAT_A);
    tekenBat(batB, KLEUR_BAT_B);
    tekenObstakel(obstakel);
}

void tekenEindScherm() {
    fill(#007800);
    textSize(floor(SCHERM_BREEDTE * 0.06));
    textAlign(CENTER, CENTER);
    text(tekstWinnaarSpel(), width / 2, height / 2); 
}

void bepaalScore() {
    raaktBalSpeler(batA, bal);
    raaktBalSpeler(batB, bal);
    
    boolean hit = raaktBalObject(obstakel, bal);
    if (hit) {
        obstakelIsGeraakt();
        if (obstakelIsVernietigt()) {
            verhoogScoreSpeler(activeBat);
        }
    }
}

boolean gameOver() {
    boolean winner = hasMaxScore(batA) || hasMaxScore(batB);
    return winner;
}