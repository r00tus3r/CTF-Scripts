package com.badlogic.gdx;

public abstract class Game implements ApplicationListener {
  protected Screen screen;
  
  public void dispose() {
    Screen screen1 = this.screen;
    if (screen1 != null)
      screen1.hide(); 
  }
  
  public Screen getScreen() { return this.screen; }
  
  public void pause() {
    Screen screen1 = this.screen;
    if (screen1 != null)
      screen1.pause(); 
  }
  
  public void render() {
    Screen screen1 = this.screen;
    if (screen1 != null)
      screen1.render(Gdx.graphics.getDeltaTime()); 
  }
  
  public void resize(int paramInt1, int paramInt2) {
    Screen screen1 = this.screen;
    if (screen1 != null)
      screen1.resize(paramInt1, paramInt2); 
  }
  
  public void resume() {
    Screen screen1 = this.screen;
    if (screen1 != null)
      screen1.resume(); 
  }
  
  public void setScreen(Screen paramScreen) {
    Screen screen1 = this.screen;
    if (screen1 != null)
      screen1.hide(); 
    this.screen = paramScreen;
    paramScreen = this.screen;
    if (paramScreen != null) {
      paramScreen.show();
      this.screen.resize(Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/Game.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */