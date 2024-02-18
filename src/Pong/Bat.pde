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

int[] batA = {100, BAT_A_Y, BREEDTE_BAT, HOOGTE_BAT}; // x, y, afmeting
int[] batB = {100, BAT_B_Y, BREEDTE_BAT, HOOGTE_BAT};

void tekenBat(int[] bat, int kleur) {
    fill(kleur);
    rect(bat[0], bat[1], bat[2], bat[3]); 
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

void beweegBatjes() {
    // lijkt erop dat de functie keyPressed() niet elke cycle wordt verwerkt.
    // werkt wel goed voor toetsen met een keyCode zoals de pijltjes toetsen.
    // afhankelijkheid met OS
}