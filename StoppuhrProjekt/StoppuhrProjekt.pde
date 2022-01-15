Stoppuhr uhr;


void setup()
{
  size(400,400);
  uhr = new Stoppuhr();
}

void draw()
{
  background(200);
  uhr.aktualisieren();
  uhr.anzeigen(); 
}

void keyPressed()
{
  if (key == 's')
  {
    uhr.starten();
  }
  if (key == 'e')
  {
    uhr.stoppen();
  }
  if (key == 'r')
  {
    uhr.reset();
  }
}
