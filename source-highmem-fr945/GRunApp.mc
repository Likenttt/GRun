using Toybox.Application;
using Toybox.Graphics;


class GRunApp extends Application.AppBase
{
  protected var gRunView;
  hidden var zhcnFont;
  
  function initialize()
  {
    //System.println("Garmin Forerunner 945 (High Memory)");
    AppBase.initialize();
    zhcnFont = WatchUi.loadResource(Rez.Fonts.Zhcn);
    gRunView = new GRunViewHighMem();
  }
    
  
  public static function getTextDimensions(dc, value, font)
  {
    var textDimensions = dc.getTextDimensions(value, font);
    
    var yPixel = 0;
    if (font < 7) { yPixel = 4; textDimensions[0] += 2; }
    textDimensions[1] = textDimensions[1] - (2 * dc.getFontDescent(font)) + yPixel;
    
    return textDimensions;
  }
  
  
  public static function getYOffset(font)
  {
    var yOffset = -2;
    if (font >= 7) { yOffset = -3; }
    else if (font >= 6) { yOffset = -1; }
    else if (font == 3) { yOffset = -1; }
    else if (font == 1) { yOffset = -1; }
    
    return yOffset;
  }

  
  function onSettingsChanged()
  {
    AppBase.onSettingsChanged();
    gRunView.initializeUserData(zhcnFont);
  }
  

  function getInitialView()
  {
    return [ gRunView ];
  }
}