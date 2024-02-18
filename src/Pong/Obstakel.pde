// constanten obstakel
final int KLEUR_OBSTAKEL = #780000;

int[] obstakel = new int[4];


void tekenObstakel(int[] obstakel) {
    fill(KLEUR_OBSTAKEL);
    rect(obstakel[0],obstakel[1],obstakel[2],obstakel[3]);
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
}