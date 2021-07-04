using Toybox.Application;
using Toybox.Graphics;


class GRunApp extends Application.AppBase
{
  protected var gRunView;
  hidden var zhcnFont;
  
  function initialize()
  {
    //System.println("Garmin Edge 1030 / 1030 Bontrager (High Memory)");
    AppBase.initialize();
    zhcnFont = WatchUi.loadResource(Rez.Fonts.Zhcn);
    gRunView = new GRunViewHighMem();
  }
  
  
  public static function getTextDimensions(dc, value, font)
  {
    var textDimensions = dc.getTextDimensions(value, font);
    
    if (font < 7) { textDimensions[0] += 2; }
    textDimensions[1] = 0.8 * textDimensions[1];
    if (font == 4) { textDimensions[1] -= 4; }
        
    return textDimensions;
  }
  
  
  public static function getYOffset(font)
  {
    var yOffset = -1;
    if (font >= 7) { yOffset = 5; }
    else if (font >= 6) { yOffset = 2; }
    else if (font >= 5) { yOffset = 1; }
    else if (font >= 4) { yOffset = -1; }
    else if (font >= 3) { yOffset = -2; }
    else if (font == 0) { yOffset = -2; }
    
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