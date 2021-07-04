using Toybox.Application;
using Toybox.Graphics;


class GRunApp extends Application.AppBase
{
  protected var gRunView;
  
  function initialize()
  {
    //System.println("Garmin Venu (Low Memory)");
    AppBase.initialize();
    gRunView = new GRunView();
  }
  
  
  public static function getTextDimensions(dc, value, font)
  {
    var textDimensions = dc.getTextDimensions(value, font);
    
    if (font < 7) { textDimensions[0] += 2; }
    textDimensions[1] = textDimensions[1] - (1.5 * dc.getFontDescent(font));
    
    return textDimensions;
  }
  
  
  public static function getYOffset(font)
  {
    var yOffset = 0;
    if (font <= 6) { yOffset = -1; }
    if (font == 0) { yOffset = -2; }
    
    return yOffset;
  }

  
  function onSettingsChanged()
  {
    AppBase.onSettingsChanged();
    gRunView.initializeUserData(null);
  }
  

  function getInitialView()
  {
    return [ gRunView ];
  }
}