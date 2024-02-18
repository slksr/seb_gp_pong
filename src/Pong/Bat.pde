// constanten bat
final int KLEUR_BAT_A = #787878;
final int KLEUR_BAT_B = #787800;
final int BREEDTE_BAT = 200;
final int HOOGTE_BAT = 20;
final int BAT_A_Y = 60;
final int BAT_B_Y = SCHERM_HOOGTE - 80;
final char RECHTS_BAT_A = 'c'; 
final char LINKS_BAT_A = 'z';  
final char RECHTS_BAT_B = '.';
final char LINKS_BAT_B = ',';  

int[] batA = {100, BAT_A_Y, BREEDTE_BAT, HOOGTE_BAT, 0}; // x, y, afmeting, score
int[] batB = {100, BAT_B_Y, BREEDTE_BAT, HOOGTE_BAT, 0};

int[] activeBat;

void tekenBat(int[] bat, int kleur) {
    String tekst = "";
    fill(kleur);
    rect(bat[0], bat[1], bat[2], bat[3]); 
    if (activeBat == bat) {
        tekst = "ACTIEF (" + bat[4] + ")";
    }
    fill(255);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(tekst, bat[0] + (bat[2] / 2), bat[1] + (bat[3] / 2)); 
}

void verplaatsBatjes() {
    veranderBatPositie(RECHTS_BAT_A, LINKS_BAT_A, batA );
    veranderBatPositie(RECHTS_BAT_B, LINKS_BAT_B, batB );
}

void veranderBatPositie(char rechterToets, char linkerToets, int[] bat) {
    if (keyPressed && key == linkerToets) {    
        bat[0] -= 1; 
    }
    if (keyPressed && key == rechterToets) { 
        bat[0] += 1; 
    }
}
void raaktBalSpeler(int[] speler, int[] bal) {
    boolean actief = raaktBalObject(speler, bal);
    if (actief) {
        zetActiveSpeler(speler);
    }
}

void zetActiveSpeler(int[] bat) {
    activeBat = bat;
    //println("batje: " + bat[1]);
}

void beweegBatjes() {
    // lijkt erop dat de functie keyPressed() niet elke cycle wordt verwerkt.
    // werkt wel goed voor toetsen met een keyCode zoals de pijltjes toetsen.
    // afhankelijkheid met OS
}

void verhoogScoreSpeler(int[] speler) {
    speler[4]++; 
}

boolean hasMaxScore(int[] speler) {
    return speler[4] >= MAX_SCORE_WIN;
}

String tekstWinnaarSpel() {
    String tekst = "De winaar van dit spel is Speler " + (batA[4] >= MAX_SCORE_WIN ? "A" : batB[4] >= MAX_SCORE_WIN ? "B" : "(onbekend)") + "!";
    return tekst; 
}