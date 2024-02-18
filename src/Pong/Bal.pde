// constanten bal
final int DIAMETER = 50;
final int KLEUR_BAL = #CC6600;
final int BAL_X = 0;
final int BAL_Y = 1;

// variabelen bal
boolean beweegtRechts = true;
boolean beweegtBeneden = true;

int[] bal = {150, 50, DIAMETER}; // x, y, afmeting

void tekenBal(int[] bal) {
  fill(KLEUR_BAL);
  circle(bal[0], bal[1], bal[2]);
}


boolean isBalBuitenSpeelveld(int pos, int waarde, int radius) {
    if (waarde > 0) {
        return pos > (waarde - radius);
    }
    return pos < radius; 
}

boolean raaktBalObject(int[] object, int[] bal) {
    boolean geraakt = false;
    int radius = DIAMETER / 2;
    int balX = bal[BAL_X];
    int balY = bal[BAL_Y];
    int objectX = object[0];
    int objectY = object[1];
    int objectBreedte = object[2];
    int objectHoogte = object[3];

    // raakt de bal het batje. De lokale variabelen zijn t.b.v. leesbaarheid.
    if ((balX >= objectX - radius && balX <= objectX + objectBreedte + radius) 
    &&  (balY >= objectY - radius && balY <= objectY + objectHoogte + radius)) {
        // moet de beweging worden omgedraaid
        if (keerBewegingBalNaBotsing(objectX, balX, radius, objectBreedte, beweegtRechts)) {
            beweegtRechts = !beweegtRechts;
        }
        if(keerBewegingBalNaBotsing(objectY, balY, radius, objectHoogte, beweegtBeneden)) {
            beweegtBeneden = !beweegtBeneden; 
        }
        geraakt = true;
    }   
    return geraakt;
}

boolean keerBewegingBalNaBotsing(int batPos, int balPos, int  radius, int batAfmeting, boolean beweging) {
    return (batPos - balPos == radius && beweging) || (balPos - (batPos + batAfmeting) == radius && !beweging);
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