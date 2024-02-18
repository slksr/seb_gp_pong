// constanten obstakel
final int KLEUR_OBSTAKEL = #780000;
final int MAX_HITS = 3;

int[] obstakel = new int[5];
boolean isVernietigt = false;

void tekenObstakel(int[] obstakel) {
    fill(KLEUR_OBSTAKEL);
    rect(obstakel[0],obstakel[1],obstakel[2],obstakel[3]);
    fill(255);
    textSize(24);
    textAlign(CENTER, CENTER);
    text(obstakel[4], obstakel[0] + (obstakel[2] / 2), obstakel[1] + (obstakel[3] / 2)); 
}

void maakObstakel() {
    int breedte = int(random(50, 100));
    int hoogte  = int(random(50, 100));
    int xPos = int(random(0, width - breedte)); 
    int yPos = int(random(BAT_A_Y + HOOGTE_BAT, BAT_B_Y - hoogte));
    obstakel[0] = xPos;
    obstakel[1] = yPos;
    obstakel[2] = breedte;
    obstakel[3] = hoogte;
    obstakel[4] = MAX_HITS;
}

void obstakelIsGeraakt() {
    obstakel[4]--;
    if (obstakel[4] == 0) {
        isVernietigt = true; 
        maakObstakel();
    }
    else {
        isVernietigt = false;
    }    
}

boolean obstakelIsVernietigt() {
    return isVernietigt;
}