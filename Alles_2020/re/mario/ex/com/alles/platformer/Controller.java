package com.alles.platformer;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.OrthographicCamera;
import com.badlogic.gdx.graphics.Texture;
import com.badlogic.gdx.scenes.scene2d.InputEvent;
import com.badlogic.gdx.scenes.scene2d.InputListener;
import com.badlogic.gdx.scenes.scene2d.Stage;
import com.badlogic.gdx.scenes.scene2d.ui.Image;
import com.badlogic.gdx.scenes.scene2d.ui.Table;
import com.badlogic.gdx.utils.viewport.FitViewport;
import com.badlogic.gdx.utils.viewport.Viewport;

public class Controller {
  OrthographicCamera cam = new OrthographicCamera();
  
  boolean downPressed;
  
  boolean leftPressed;
  
  boolean rightPressed;
  
  Stage stage = new Stage(this.viewport, MyPlatformer.absoluteBatch);
  
  boolean upPressed;
  
  Viewport viewport = new FitViewport(800.0F, 480.0F, this.cam);
  
  public Controller() {
    this.stage.addListener(new InputListener() {
          public boolean keyDown(InputEvent param1InputEvent, int param1Int) {
            switch (param1Int) {
              default:
                return true;
              case 22:
                Controller.this.rightPressed = true;
              case 21:
                Controller.this.leftPressed = true;
              case 20:
                Controller.this.downPressed = true;
              case 19:
                break;
            } 
            Controller.this.upPressed = true;
          }
          
          public boolean keyUp(InputEvent param1InputEvent, int param1Int) {
            switch (param1Int) {
              default:
                return true;
              case 22:
                Controller.this.rightPressed = false;
              case 21:
                Controller.this.leftPressed = false;
              case 20:
                Controller.this.downPressed = false;
              case 19:
                break;
            } 
            Controller.this.upPressed = false;
          }
        });
    Gdx.input.setInputProcessor(this.stage);
    Table table1 = new Table();
    table1.left().bottom();
    Table table2 = new Table();
    table2.left().bottom();
    Image image1 = new Image(new Texture("flatDark25.png"));
    image1.setSize(80.0F, 80.0F);
    image1.addListener(new InputListener() {
          public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            Controller.this.upPressed = true;
            return true;
          }
          
          public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) { Controller.this.upPressed = false; }
        });
    Image image2 = new Image(new Texture("flatDark26.png"));
    image2.setSize(80.0F, 80.0F);
    image2.addListener(new InputListener() {
          public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            Controller.this.downPressed = true;
            return true;
          }
          
          public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) { Controller.this.downPressed = false; }
        });
    Image image3 = new Image(new Texture("flatDark24.png"));
    image3.setSize(80.0F, 80.0F);
    image3.addListener(new InputListener() {
          public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            Controller.this.rightPressed = true;
            return true;
          }
          
          public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) { Controller.this.rightPressed = false; }
        });
    Image image4 = new Image(new Texture("flatDark23.png"));
    image4.setSize(80.0F, 80.0F);
    image4.addListener(new InputListener() {
          public boolean touchDown(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) {
            Controller.this.leftPressed = true;
            return true;
          }
          
          public void touchUp(InputEvent param1InputEvent, float param1Float1, float param1Float2, int param1Int1, int param1Int2) { Controller.this.leftPressed = false; }
        });
    table2.add();
    table2.row().pad(5.0F, 5.0F, 5.0F, 5.0F);
    table2.add(image4).size(image4.getWidth(), image4.getHeight());
    table2.add();
    table2.add(image3).size(image3.getWidth(), image3.getHeight());
    table2.row().padBottom(5.0F);
    table1.add();
    table1.pad(5.0F, 500.0F, 5.0F, 5.0F).row().pad(5.0F, 5.0F, 5.0F, 5.0F);
    table1.add(image2).size(image2.getWidth(), image2.getHeight());
    table1.add();
    table1.add(image1).size(image1.getWidth(), image1.getHeight());
    table1.row().padBottom(5.0F);
    this.stage.addActor(table1);
    this.stage.addActor(table2);
  }
  
  public void draw() { this.stage.draw(); }
  
  public boolean isDownPressed() { return this.downPressed; }
  
  public boolean isLeftPressed() { return this.leftPressed; }
  
  public boolean isRightPressed() { return this.rightPressed; }
  
  public boolean isUpPressed() { return this.upPressed; }
  
  public void resize(int paramInt1, int paramInt2) { this.viewport.update(paramInt1, paramInt2); }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/alles/platformer/Controller.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */