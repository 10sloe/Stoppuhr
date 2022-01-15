class Stoppuhr
{
  private int stunden;
  private int minuten;
  private int sekunden;
  private int zehntel;

  private int x;
  private int y;

  private int radius;

  private int startZeit;
  private int vergangeneZeit;

  private String zustand;

  Stoppuhr()
  {
    x = 200;
    y = 200;
    radius = 100;
    stunden = 0;
    minuten = 0;
    sekunden = 0;
    zustand = "reset";
  }

  void aktualisieren()
  {
    if (zustand.equals("laufend"))
    {
      int aktZeit = millis();
      vergangeneZeit = aktZeit - startZeit;
      
      // Berechnung der Stunden
      stunden = vergangeneZeit / (1000*3600);
      
      // Berechnung der Minuten
      minuten = (vergangeneZeit / (1000*60)) % 60 ;
      
      // Berechnung der Sekunden:
      sekunden = (vergangeneZeit / 1000) % 60 ;
      
      // Berechnung der Zehntelsekunden:
      zehntel = (vergangeneZeit / 100)%10;
    }
  }

  void anzeigen()
  {
    // Ziffernblatt
    fill(255);
    strokeWeight(5); // Liniendicke
    stroke(0); 
    circle(x, y, radius*2);

    // Die Sekundenanzeige
    zeichneSekundenzeiger();
    zeichneMinutenzeiger();
    zeichneStundenzeiger();
    
    textAlign(CENTER);
    fill(0);
    String anzeige = stunden + ":" + minuten + ":" + sekunden + "," + zehntel;
    
    text(anzeige, x, y - radius - 10);
    textSize(20); 
    circle(x, y, 5);
  }

  void zeichneSekundenzeiger()
  {
    float l = radius * 0.8;
    float winkel = sekunden / 60.0 * 2 * PI - PI/2;
    float sx = cos(winkel);
    float sy = sin (winkel);
    stroke(255, 0, 0);
    strokeWeight(1); // Liniendicke
    line(x, y, x + l*sx, y + l*sy);
  }

  void zeichneMinutenzeiger()
  {
    float l = radius * 0.7;
    float winkel = minuten / 60.0 * 2 * PI - PI/2;
    float sx = cos(winkel);
    float sy = sin (winkel);
    stroke(0);
    strokeWeight(3); // Liniendicke
    line(x, y, x + l*sx, y + l*sy);
  }

  void zeichneStundenzeiger()
  {
    float l = radius * 0.5;
    if (stunden > 12)
    {
      stunden = stunden - 12;
    }
    float winkel = (stunden + minuten/60.0) / 12.0 * 2 * PI - PI/2;
    float sx = cos(winkel);
    float sy = sin (winkel);
    stroke(0);
    strokeWeight(3); // Liniendicke
    line(x, y, x + l*sx, y + l*sy);
  }
  
  void starten()
  {
    startZeit = millis();
    zustand = "laufend";
  }
  
  void stoppen()
  {
    zustand = "gestoppt";
  }
  
  void reset()
  {
    zustand = "reset";
    stunden = 0;
    minuten = 0;
    sekunden = 0;
    zehntel = 0;
  }
}
