package com.badlogic.gdx.scenes.scene2d.ui;

import com.badlogic.gdx.Files;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.math.Interpolation;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.actions.Actions;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Timer;
import java.util.Iterator;

public class TooltipManager {
  private static Files files;
  
  private static TooltipManager instance;
  
  public boolean animations = true;
  
  public float edgeDistance = 7.0F;
  
  public boolean enabled = true;
  
  public float initialTime = 2.0F;
  
  public float maxWidth = 2.14748365E9F;
  
  public float offsetX = 15.0F;
  
  public float offsetY = 19.0F;
  
  final Timer.Task resetTask = new Timer.Task() {
      public void run() {
        TooltipManager tooltipManager = TooltipManager.this;
        tooltipManager.time = tooltipManager.initialTime;
      }
    };
  
  public float resetTime = 1.5F;
  
  final Timer.Task showTask = new Timer.Task() {
      public void run() {
        if (TooltipManager.this.showTooltip != null && this.this$0.showTooltip.targetActor != null) {
          Stage stage = this.this$0.showTooltip.targetActor.getStage();
          if (stage == null)
            return; 
          stage.addActor(this.this$0.showTooltip.container);
          this.this$0.showTooltip.container.toFront();
          TooltipManager.this.shown.add(TooltipManager.this.showTooltip);
          this.this$0.showTooltip.container.clearActions();
          TooltipManager tooltipManager = TooltipManager.this;
          tooltipManager.showAction(tooltipManager.showTooltip);
          if (!this.this$0.showTooltip.instant) {
            tooltipManager = TooltipManager.this;
            tooltipManager.time = tooltipManager.subsequentTime;
            TooltipManager.this.resetTask.cancel();
          } 
        } 
      }
    };
  
  Tooltip showTooltip;
  
  final Array<Tooltip> shown = new Array();
  
  public float subsequentTime = 0.0F;
  
  float time = this.initialTime;
  
  public static TooltipManager getInstance() {
    Files files1 = files;
    if (files1 == null || files1 != Gdx.files) {
      files = Gdx.files;
      instance = new TooltipManager();
    } 
    return instance;
  }
  
  public void enter(Tooltip paramTooltip) {
    this.showTooltip = paramTooltip;
    this.showTask.cancel();
    if (this.enabled || paramTooltip.always) {
      if (this.time == 0.0F || paramTooltip.instant) {
        this.showTask.run();
        return;
      } 
      Timer.schedule(this.showTask, this.time);
    } 
  }
  
  public void hide(Tooltip paramTooltip) {
    this.showTooltip = null;
    this.showTask.cancel();
    if (paramTooltip.container.hasParent()) {
      this.shown.removeValue(paramTooltip, true);
      hideAction(paramTooltip);
      this.resetTask.cancel();
      Timer.schedule(this.resetTask, this.resetTime);
    } 
  }
  
  protected void hideAction(Tooltip paramTooltip) { paramTooltip.container.addAction(Actions.sequence(Actions.parallel(Actions.alpha(0.2F, 0.2F, Interpolation.fade), Actions.scaleTo(0.05F, 0.05F, 0.2F, Interpolation.fade)), Actions.removeActor())); }
  
  public void hideAll() {
    this.resetTask.cancel();
    this.showTask.cancel();
    this.time = this.initialTime;
    this.showTooltip = null;
    Iterator iterator = this.shown.iterator();
    while (iterator.hasNext())
      ((Tooltip)iterator.next()).hide(); 
    this.shown.clear();
  }
  
  public void instant() {
    this.time = 0.0F;
    this.showTask.run();
    this.showTask.cancel();
  }
  
  protected void showAction(Tooltip paramTooltip) {
    float f;
    if (this.animations) {
      if (this.time > 0.0F) {
        f = 0.5F;
      } else {
        f = 0.15F;
      } 
    } else {
      f = 0.1F;
    } 
    paramTooltip.container.setTransform(true);
    (paramTooltip.container.getColor()).a = 0.2F;
    paramTooltip.container.setScale(0.05F);
    paramTooltip.container.addAction(Actions.parallel(Actions.fadeIn(f, Interpolation.fade), Actions.scaleTo(1.0F, 1.0F, f, Interpolation.fade)));
  }
  
  public void touchDown(Tooltip paramTooltip) {
    this.showTask.cancel();
    if (paramTooltip.container.remove())
      this.resetTask.cancel(); 
    this.resetTask.run();
    if (this.enabled || paramTooltip.always) {
      this.showTooltip = paramTooltip;
      Timer.schedule(this.showTask, this.time);
    } 
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/scenes/scene2d/ui/TooltipManager.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */