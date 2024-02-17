// constanten bal
final int DIAMETER = 50;
final int KLEUR_BAL = #CC6600;

// constanten bat
final int KLEUR_BAT_A = #787878;
final int KLEUR_BAT_B = #787800;
final int BREEDTE_BAT = 200;
final int HOOGTE_BAT = 20;

// Elementen met initiale waarden
int[] bal = {50, 50, DIAMETER}; // x, y, afmeting
int[] batA = {100, 60, BREEDTE_BAT, HOOGTE_BAT}; // x, y, afmeting
int[] batB = {100, 720, BREEDTE_BAT, HOOGTE_BAT};
int[] obstakel;

int scoreA = 0; 
int scoreB = 0;


void setup() {
    size(800, 800);
}

void draw() {
    background(255);
    tekenBal(bal);
    tekenBat(batA, KLEUR_BAT_A);
    tekenBat(batB, KLEUR_BAT_B);
}


void tekenBal(int[] bal) {
  fill(KLEUR_BAL);
  circle(bal[0], bal[1], bal[2]);
}

void tekenBat(int[] bat, int kleur) {
    fill(kleur);
    rect(bat[0], bat[1], bat[2], bat[3]); 
}