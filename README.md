# Pong
Voorbeeld van het starten met SEB GP BP1

## Inleiding
De naam Pong is afgeleid van pingpong. Het spel werkt met twee batjes en een balletje en twee muren aan de zijkant. De bedoeling van het spel is dat het balletje achter het batje van de tegenspeler terechtkomt. In dat geval wordt een punt gescoord. De score verschijnt links en rechts bovenin het scherm. Er wordt een bepaalde tijd gespeeld of het er wordt gespeeld tot een speler een bepaald aantal punten. bv. 10 punten heeft gescoord. In beide gevallen is degene met de meeste punten de winnaar. [bron Wikipedia](https://nl.wikipedia.org/wiki/Pong)

## SEB GP 

Op basis van deze traditionele opzet gaan we voor SEB GP een aantal moeilijkheiden toevoegen.
In het speelveld wordt een blok bepaald waar de bal tegenaan kan vliegen. Als deze aan de zijkant komt wordt er een punt bij de actieve speler opgeteld en veranderd de grote en positie naar een andere plek in het speelveld.

### Prioritering

Hieronder staat de prioritering van de functionele eisen gegeven aan de hand van de MoSCoW
methode.
- M = Must haves
- S = Should haves
- C = Could haves
- W = Won’t haves

|ID	    |Beschrijving|Prioriteit|
|---	|---|:---:|
|FR01   |Een 2 speler spel 	|M |
|FR02   |Het spel wordt met het toetsenbord bestuurd.  	|M |
|FR03   |De bal beweegt in willekeurige richting. |M |
|FR04   |De bal kan niet uit het spel verdwijnen. |M |
|FR05   |De bal heeft een natuurlijke beweging.| M|
|FR06   |Er bevindt zich 1 rechthoekig opstakel in het spel. | M |
|FR07   |Als de bal de linker of rechterzijkant raakt, krijgt de actieve speler een punt. | M |
|FR08   |Als de bal de linker of rechterzijkant raakt, veranderd de positie en afmeting van het obstakel. | M |
|FR09   |De speler die de bal het laatst heeft geraakt wordt de actieve speler. | M |
|FR10   |Het spel eindigt als een speler als eerste 10 punten heeft gehaald. |M |
|FR11   |Er is een eindscherm met de uiteindelijke uitslag en de mogelijkheid om opnieuw te beginnen. | S |
|FR12   |Een startscherm waarin de balsnelheid en afmeting in te stellen is. Deze instellingen worden in het spel gebruikt. | S |
|FR13   |Als de bal de linker of rechterzijkant raakt, worden de batjes van de spelers kleiner maar niet kleiner dan de afmeting van de bal. |C |
|FR14   |Een 1 speler met een AI als tegenstander. | C |

## Lessen
Tijdens Lesweek 3 en Lesweek 4 gaan we dit spel opzetten en uitwerken.

## Stappen
Welke stappen kun je zetten om tot de uitwerking van deze game te komen. De mogelijke stappen die je kunt nemen zijn uitgewerkt per branch. De main brancht bevat de volledig uitgewerkte oplossing van MustHaves.

### 01 branch stap01_elementen
- In deze stap bepaal je welke elementen je nodig hebt in de game.
  - bal 
  - 2 spelers of 2 batjes
  - obstakel
  - iets om score bij te houden
- Bepaal de kenmerken van de elementen om het datatype te kunnen bepalen.
  - de bal heeft een afmeting en een positie. Beweegt in een bepaalde richting. **int[]**
  - een batje heeft een afmeting, positie in het spel en een kleur. **int[]**
  - obstakel heeft een afmeting en een willekeurige postitie in het spel. Maar niet waar een bal of batje staat. **int[]**
  - de score per speler. **int**
- Teken de elementen (of een aantal) op het scherm

### 02 branch stap_02_beweging_bal
- In deze stap laten we de bal over het scherm bewegen.
    - mag niet uit het spel verdwijnen

### 03 branch stap_03_botsing_batje
- In deze stap laten we de bal over het scherm bewegen en botsen met de batjes.
    - mag niet uit het spel verdwijnen
    - moet van richting veranderen als een batje wordt geraakt.

### 04 branch stap_04_obstakel
- In deze stap tekenen we het obstakel in het speelveld en laten de bal botsen
  - moet tussen de batjes staan, binnen het scherm
  - moet op een willekeurige plaats worden getekend.
  - bal moet van richting veranderen bij botsing
  - obstakel opnieuw bepalen na botsing bal
