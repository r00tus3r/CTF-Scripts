package com.badlogic.gdx.physics.box2d.graphics;

import com.badlogic.gdx.graphics.g2d.ParticleEmitter;
import com.badlogic.gdx.graphics.g2d.Sprite;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.physics.box2d.Fixture;
import com.badlogic.gdx.physics.box2d.RayCastCallback;
import com.badlogic.gdx.physics.box2d.World;
import java.io.BufferedReader;
import java.io.IOException;

public class ParticleEmitterBox2D extends ParticleEmitter {
  private static final float EPSILON = 0.001F;
  
  final Vector2 endPoint = new Vector2();
  
  float normalAngle;
  
  boolean particleCollided;
  
  final RayCastCallback rayCallBack = new RayCastCallback() {
      public float reportRayFixture(Fixture param1Fixture, Vector2 param1Vector21, Vector2 param1Vector22, float param1Float) {
        ParticleEmitterBox2D particleEmitterBox2D = ParticleEmitterBox2D.this;
        particleEmitterBox2D.particleCollided = true;
        particleEmitterBox2D.normalAngle = MathUtils.atan2(param1Vector22.y, param1Vector22.x) * 57.295776F;
        return param1Float;
      }
    };
  
  final Vector2 startPoint = new Vector2();
  
  final World world;
  
  public ParticleEmitterBox2D(World paramWorld) { this.world = paramWorld; }
  
  public ParticleEmitterBox2D(World paramWorld, ParticleEmitter paramParticleEmitter) {
    super(paramParticleEmitter);
    this.world = paramWorld;
  }
  
  public ParticleEmitterBox2D(World paramWorld, BufferedReader paramBufferedReader) throws IOException {
    super(paramBufferedReader);
    this.world = paramWorld;
  }
  
  protected ParticleEmitter.Particle newParticle(Sprite paramSprite) { return new ParticleBox2D(paramSprite); }
  
  private class ParticleBox2D extends ParticleEmitter.Particle {
    public ParticleBox2D(Sprite param1Sprite) { super(param1Sprite); }
    
    public void translate(float param1Float1, float param1Float2) {
      if (param1Float1 * param1Float1 + param1Float2 * param1Float2 < 0.001F)
        return; 
      float f1 = getX() + getWidth() / 2.0F;
      float f2 = getY() + getHeight() / 2.0F;
      ParticleEmitterBox2D particleEmitterBox2D = ParticleEmitterBox2D.this;
      particleEmitterBox2D.particleCollided = false;
      particleEmitterBox2D.startPoint.set(f1, f2);
      ParticleEmitterBox2D.this.endPoint.set(f1 + param1Float1, f2 + param1Float2);
      if (ParticleEmitterBox2D.this.world != null)
        ParticleEmitterBox2D.this.world.rayCast(ParticleEmitterBox2D.this.rayCallBack, ParticleEmitterBox2D.this.startPoint, ParticleEmitterBox2D.this.endPoint); 
      f2 = param1Float1;
      f1 = param1Float2;
      if (ParticleEmitterBox2D.this.particleCollided) {
        this.angle = ParticleEmitterBox2D.this.normalAngle * 2.0F - this.angle - 180.0F;
        this.angleCos = MathUtils.cosDeg(this.angle);
        this.angleSin = MathUtils.sinDeg(this.angle);
        f2 = param1Float1 * this.angleCos;
        f1 = param1Float2 * this.angleSin;
      } 
      super.translate(f2, f1);
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */