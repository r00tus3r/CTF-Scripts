package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.scenes.scene2d.Actor;
import com.badlogic.gdx.scenes.scene2d.utils.Drawable;

public class TextTooltip extends Tooltip<Label> {
  public TextTooltip(String paramString, Skin paramSkin) { this(paramString, TooltipManager.getInstance(), (TextTooltipStyle)paramSkin.get(TextTooltipStyle.class)); }
  
  public TextTooltip(String paramString1, Skin paramSkin, String paramString2) { this(paramString1, TooltipManager.getInstance(), (TextTooltipStyle)paramSkin.get(paramString2, TextTooltipStyle.class)); }
  
  public TextTooltip(String paramString, TextTooltipStyle paramTextTooltipStyle) { this(paramString, TooltipManager.getInstance(), paramTextTooltipStyle); }
  
  public TextTooltip(String paramString, TooltipManager paramTooltipManager, Skin paramSkin) { this(paramString, paramTooltipManager, (TextTooltipStyle)paramSkin.get(TextTooltipStyle.class)); }
  
  public TextTooltip(String paramString1, TooltipManager paramTooltipManager, Skin paramSkin, String paramString2) { this(paramString1, paramTooltipManager, (TextTooltipStyle)paramSkin.get(paramString2, TextTooltipStyle.class)); }
  
  public TextTooltip(String paramString, final TooltipManager manager, TextTooltipStyle paramTextTooltipStyle) {
    super(null, paramTooltipManager);
    Label label = new Label(paramString, paramTextTooltipStyle.label);
    label.setWrap(true);
    this.container.setActor(label);
    this.container.width(new Value() {
          public float get(Actor param1Actor) { return Math.min(this.val$manager.maxWidth, (((Label)this.this$0.container.getActor()).getGlyphLayout()).width); }
        });
    setStyle(paramTextTooltipStyle);
  }
  
  public void setStyle(TextTooltipStyle paramTextTooltipStyle) {
    if (paramTextTooltipStyle != null) {
      if (paramTextTooltipStyle instanceof TextTooltipStyle) {
        ((Label)this.container.getActor()).setStyle(paramTextTooltipStyle.label);
        this.container.setBackground(paramTextTooltipStyle.background);
        this.container.maxWidth(paramTextTooltipStyle.wrapWidth);
        return;
      } 
      throw new IllegalArgumentException("style must be a TextTooltipStyle.");
    } 
    throw new NullPointerException("style cannot be null");
  }
  
  public static class TextTooltipStyle {
    public Drawable background;
    
    public Label.LabelStyle label;
    
    public float wrapWidth;
    
    public TextTooltipStyle() {}
    
    public TextTooltipStyle(Label.LabelStyle param1LabelStyle, Drawable param1Drawable) {
      this.label = param1LabelStyle;
      this.background = param1Drawable;
    }
    
    public TextTooltipStyle(TextTooltipStyle param1TextTooltipStyle) {
      this.label = new Label.LabelStyle(param1TextTooltipStyle.label);
      this.background = param1TextTooltipStyle.background;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/TextTooltip.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */