using Toybox.Application;
using Toybox.Graphics;


class GRunApp extends Application.AppBase
{
  protected var gRunView;
  hidden var zhcnFont;
  
  function initialize()
  {
    //System.println("Garmin Forerunner 645m (High Memory)");
    AppBase.initialize();
    zhcnFont = WatchUi.loadResource(Rez.Fonts.Zhcn);
    gRunView = new GRunViewHighMem();
  }
    
  
  public static function getTextDimensions(dc, value, font)
  {
    var textDimensions = dc.getTextDimensions(value, font);
    
    if (font < 7) { textDimensions[0] += 2; }
    textDimensions[1] = textDimensions[1] - (2 * dc.getFontDescent(font)) + 4;
    
    return textDimensions;
  }
  
  
  public static function getYOffset(font)
  {
    var yOffset = -1;
    if (font == 2) { yOffset = -2; }
    
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