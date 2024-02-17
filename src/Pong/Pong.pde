// constanten bal
final int DIAMETER = 50;
final int KLEUR_BAL = #CC6600;
final int BAL_X = 0;
final int BAL_Y = 1;

// variabelen bal
boolean beweegtRechts = true;
boolean beweegtBeneden = true;

// constanten bat
final int KLEUR_BAT_A = #787878;
final int KLEUR_BAT_B = #787800;
final int BREEDTE_BAT = 200;
final int HOOGTE_BAT = 20;
final int BAT_A_Y = 60;
final int BAT_B_Y = 720;

// Elementen met initiale waarden
int[] bal = {150, 50, DIAMETER}; // x, y, afmeting
int[] batA = {100, BAT_A_Y, BREEDTE_BAT, HOOGTE_BAT}; // x, y, afmeting
int[] batB = {400, BAT_B_Y, BREEDTE_BAT, HOOGTE_BAT};
int[] obstakel;

int scoreA = 0; 
int scoreB = 0;

void setup() {
    size(800, 800);
    frameRate(500); // snelheid van de bal
}

void draw() {
    background(255);

    beweegBal();
    raaktBalBatje(batA, bal);
    raaktBalBatje(batB, bal);

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

void beweegBal() {
    int radius = DIAMETER / 2;

    // bepaal richting
    bepaalRichtingBal(radius);

    // zet de x en y positie
    if (beweegtRechts) { 
        bal[BAL_X] += 1; 
    } else { 
        bal[BAL_X]-=1;
    }
        
    if (beweegtBeneden) { 
        bal[BAL_Y] += 1; 
    } else { 
        bal[BAL_Y] -=1;
    }
}

boolean isBalBuitenSpeelveld(int pos, int waarde, int radius) {
    if (waarde > 0) {
        return pos > (waarde - radius);
    }
    return pos < radius; 
}

void bepaalRichtingBal(int radius) {
    if (isBalBuitenSpeelveld(bal[BAL_X], width, radius)) {
        beweegtRechts = false;
    }
    if (isBalBuitenSpeelveld(bal[BAL_Y], height, radius)) {
        beweegtBeneden = false;
    }
       
    if (isBalBuitenSpeelveld(bal[BAL_X], 0, radius)) {
        beweegtRechts = true;
    }
    if (isBalBuitenSpeelveld(bal[BAL_Y], 0, radius)) {
        beweegtBeneden = true;
    }
}


void raaktBalBatje(int[] bat, int[] bal) {
    int radius = DIAMETER / 2;
    int balX = bal[BAL_X];
    int balY = bal[BAL_Y];
    int batX = bat[0];
    int batY = bat[1];

    // raakt de bal het batje. De lokale variabelen zijn t.b.v. leesbaarheid.
    if ((balX >= batX - radius && balX <= batX + BREEDTE_BAT + radius) 
    &&  (balY >= batY - radius && balY <= batY + HOOGTE_BAT + radius)) {
        // moet de beweging worden omgedraaid
        if (keerBewegingBalNaBotsing(batX, balX, radius, BREEDTE_BAT, beweegtRechts)) {
            beweegtRechts = !beweegtRechts;
        }
        if(keerBewegingBalNaBotsing(batY, balY, radius, HOOGTE_BAT, beweegtBeneden)) {
            beweegtBeneden = !beweegtBeneden; 
        }

        /*    
        if ((batX - balX == radius && beweegtRechts) || (balX - (batX + BREEDTE_BAT) == radius && beweegtRechts == false)) {
            beweegtRechts = !beweegtRechts;
        }
        if((batY - balY == radius && beweegtBeneden) || (balY - (batY + HOOGTE_BAT) == radius && beweegtBeneden == false)) {
            beweegtBeneden = !beweegtBeneden; 
        } 
        */   
    }   
}

boolean keerBewegingBalNaBotsing(int batPos, int balPos, int  radius, int batAfmeting, boolean beweging) {
    return (batPos - balPos == radius && beweging) || (balPos - (batPos + batAfmeting) == radius && !beweging);
}