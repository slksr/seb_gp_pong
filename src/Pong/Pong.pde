final int SCHERM_BREEDTE = 800;
final int SCHERM_HOOGTE = 800;
final int BAL_SNELHEID = ceil(SCHERM_BREEDTE * 1.05);

int scoreA = 0; 
int scoreB = 0;

void settings() {
    size(SCHERM_BREEDTE, SCHERM_HOOGTE);
}

void setup() {
    maakObstakel();
    frameRate(BAL_SNELHEID); // snelheid van de bal
}

void draw() {
    background(255);

    verplaatsBatjes();
    beweegBal();

    raaktBalObject(batA, bal);
    raaktBalObject(batB, bal);
    boolean hit = raaktBalObject(obstakel, bal);
    if (hit) {
        maakObstakel();
    }

    tekenSpelObjecten();    
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