package com.brashmonkey.spriter;

public class PlayerTweener extends Player {
  private TweenedAnimation anim;
  
  public String baseBoneName = null;
  
  private Player player1;
  
  private Player player2;
  
  public boolean updatePlayers = true;
  
  public PlayerTweener(Entity paramEntity) { this(new Player(paramEntity), new Player(paramEntity)); }
  
  public PlayerTweener(Player paramPlayer1, Player paramPlayer2) {
    super(paramPlayer1.getEntity());
    setPlayers(paramPlayer1, paramPlayer2);
  }
  
  public Animation getBaseAnimation() { return this.anim.baseAnimation; }
  
  public Player getFirstPlayer() { return this.player1; }
  
  public Player getSecondPlayer() { return this.player2; }
  
  public float getWeight() { return this.anim.weight; }
  
  public void setAnimation(Animation paramAnimation) {}
  
  public void setBaseAnimation(int paramInt) { setBaseAnimation(this.entity.getAnimation(paramInt)); }
  
  public void setBaseAnimation(Animation paramAnimation) { this.anim.baseAnimation = paramAnimation; }
  
  public void setBaseAnimation(String paramString) { setBaseAnimation(this.entity.getAnimation(paramString)); }
  
  public void setEntity(Entity paramEntity) {}
  
  public void setPlayers(Player paramPlayer1, Player paramPlayer2) {
    if (paramPlayer1.entity == paramPlayer2.entity) {
      this.player1 = paramPlayer1;
      this.player2 = paramPlayer2;
      if (paramPlayer1.entity == this.entity)
        return; 
      this.anim = new TweenedAnimation(paramPlayer1.getEntity());
      this.anim.setAnimations(paramPlayer1.animation, paramPlayer2.animation);
      super.setEntity(paramPlayer1.getEntity());
      super.setAnimation(this.anim);
      return;
    } 
    throw new SpriterException("player1 and player2 have to hold the same entity!");
  }
  
  public void setWeight(float paramFloat) { this.anim.weight = paramFloat; }
  
  public void update() {
    if (this.updatePlayers) {
      this.player1.update();
      this.player2.update();
    } 
    this.anim.setAnimations(this.player1.animation, this.player2.animation);
    super.update();
    if (this.baseBoneName != null) {
      Player player;
      if (this.anim.onFirstMainLine()) {
        player = this.player1;
      } else {
        player = this.player2;
      } 
      int i = player.getBoneIndex(this.baseBoneName);
      if (i != -1) {
        TweenedAnimation tweenedAnimation = this.anim;
        tweenedAnimation.base = tweenedAnimation.getCurrentKey().getBoneRef(i);
        super.update();
      } else {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("A bone with name \"");
        stringBuilder.append(this.baseBoneName);
        stringBuilder.append("\" does no exist!");
        throw new SpriterException(stringBuilder.toString());
      } 
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/brashmonkey/spriter/PlayerTweener.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */