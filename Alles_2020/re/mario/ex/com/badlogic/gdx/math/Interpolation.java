package com.badlogic.gdx.math;

public abstract class Interpolation {
  public static final Bounce bounce;
  
  public static final BounceIn bounceIn;
  
  public static final BounceOut bounceOut;
  
  public static final Interpolation circle;
  
  public static final Interpolation circleIn;
  
  public static final Interpolation circleOut;
  
  public static final Elastic elastic;
  
  public static final ElasticIn elasticIn;
  
  public static final ElasticOut elasticOut;
  
  public static final Exp exp10;
  
  public static final ExpIn exp10In;
  
  public static final ExpOut exp10Out;
  
  public static final Exp exp5;
  
  public static final ExpIn exp5In;
  
  public static final ExpOut exp5Out;
  
  public static final Interpolation fade;
  
  public static final PowOut fastSlow;
  
  public static final Interpolation linear = new Interpolation() {
      public float apply(float param1Float) { return param1Float; }
    };
  
  public static final Pow pow2;
  
  public static final PowIn pow2In;
  
  public static final Interpolation pow2InInverse;
  
  public static final PowOut pow2Out;
  
  public static final Interpolation pow2OutInverse;
  
  public static final Pow pow3;
  
  public static final PowIn pow3In;
  
  public static final Interpolation pow3InInverse;
  
  public static final PowOut pow3Out;
  
  public static final Interpolation pow3OutInverse;
  
  public static final Pow pow4;
  
  public static final PowIn pow4In;
  
  public static final PowOut pow4Out;
  
  public static final Pow pow5;
  
  public static final PowIn pow5In;
  
  public static final PowOut pow5Out;
  
  public static final Interpolation sine;
  
  public static final Interpolation sineIn;
  
  public static final Interpolation sineOut;
  
  public static final PowIn slowFast;
  
  public static final Interpolation smooth = new Interpolation() {
      public float apply(float param1Float) { return param1Float * param1Float * (3.0F - param1Float * 2.0F); }
    };
  
  public static final Interpolation smooth2 = new Interpolation() {
      public float apply(float param1Float) {
        param1Float = param1Float * param1Float * (3.0F - param1Float * 2.0F);
        return param1Float * param1Float * (3.0F - param1Float * 2.0F);
      }
    };
  
  public static final Interpolation smoother = new Interpolation() {
      public float apply(float param1Float) { return param1Float * param1Float * param1Float * (param1Float * (6.0F * param1Float - 15.0F) + 10.0F); }
    };
  
  public static final Swing swing;
  
  public static final SwingIn swingIn;
  
  public static final SwingOut swingOut;
  
  static  {
    fade = smoother;
    pow2 = new Pow(2);
    pow2In = new PowIn(2);
    slowFast = pow2In;
    pow2Out = new PowOut(2);
    fastSlow = pow2Out;
    pow2InInverse = new Interpolation() {
        public float apply(float param1Float) { return (float)Math.sqrt(param1Float); }
      };
    pow2OutInverse = new Interpolation() {
        public float apply(float param1Float) { return 1.0F - (float)Math.sqrt(-(param1Float - 1.0F)); }
      };
    pow3 = new Pow(3);
    pow3In = new PowIn(3);
    pow3Out = new PowOut(3);
    pow3InInverse = new Interpolation() {
        public float apply(float param1Float) { return (float)Math.cbrt(param1Float); }
      };
    pow3OutInverse = new Interpolation() {
        public float apply(float param1Float) { return 1.0F - (float)Math.cbrt(-(param1Float - 1.0F)); }
      };
    pow4 = new Pow(4);
    pow4In = new PowIn(4);
    pow4Out = new PowOut(4);
    pow5 = new Pow(5);
    pow5In = new PowIn(5);
    pow5Out = new PowOut(5);
    sine = new Interpolation() {
        public float apply(float param1Float) { return (1.0F - MathUtils.cos(param1Float * 3.1415927F)) / 2.0F; }
      };
    sineIn = new Interpolation() {
        public float apply(float param1Float) { return 1.0F - MathUtils.cos(param1Float * 3.1415927F / 2.0F); }
      };
    sineOut = new Interpolation() {
        public float apply(float param1Float) { return MathUtils.sin(param1Float * 3.1415927F / 2.0F); }
      };
    exp10 = new Exp(2.0F, 10.0F);
    exp10In = new ExpIn(2.0F, 10.0F);
    exp10Out = new ExpOut(2.0F, 10.0F);
    exp5 = new Exp(2.0F, 5.0F);
    exp5In = new ExpIn(2.0F, 5.0F);
    exp5Out = new ExpOut(2.0F, 5.0F);
    circle = new Interpolation() {
        public float apply(float param1Float) {
          if (param1Float <= 0.5F) {
            param1Float *= 2.0F;
            return (1.0F - (float)Math.sqrt((1.0F - param1Float * param1Float))) / 2.0F;
          } 
          param1Float = (param1Float - 1.0F) * 2.0F;
          return ((float)Math.sqrt((1.0F - param1Float * param1Float)) + 1.0F) / 2.0F;
        }
      };
    circleIn = new Interpolation() {
        public float apply(float param1Float) { return 1.0F - (float)Math.sqrt((1.0F - param1Float * param1Float)); }
      };
    circleOut = new Interpolation() {
        public float apply(float param1Float) {
          param1Float--;
          return (float)Math.sqrt((1.0F - param1Float * param1Float));
        }
      };
    elastic = new Elastic(2.0F, 10.0F, 7, 1.0F);
    elasticIn = new ElasticIn(2.0F, 10.0F, 6, 1.0F);
    elasticOut = new ElasticOut(2.0F, 10.0F, 7, 1.0F);
    swing = new Swing(1.5F);
    swingIn = new SwingIn(2.0F);
    swingOut = new SwingOut(2.0F);
    bounce = new Bounce(4);
    bounceIn = new BounceIn(4);
    bounceOut = new BounceOut(4);
  }
  
  public abstract float apply(float paramFloat);
  
  public float apply(float paramFloat1, float paramFloat2, float paramFloat3) { return paramFloat1 + (paramFloat2 - paramFloat1) * apply(paramFloat3); }
  
  public static class Bounce extends BounceOut {
    public Bounce(int param1Int) { super(param1Int); }
    
    public Bounce(float[] param1ArrayOfFloat1, float[] param1ArrayOfFloat2) { super(param1ArrayOfFloat1, param1ArrayOfFloat2); }
    
    private float out(float param1Float) {
      float f = this.widths[0] / 2.0F + param1Float;
      return (f < this.widths[0]) ? (f / this.widths[0] / 2.0F - 1.0F) : super.apply(param1Float);
    }
    
    public float apply(float param1Float) { return (param1Float <= 0.5F) ? ((1.0F - out(1.0F - param1Float * 2.0F)) / 2.0F) : (out(param1Float * 2.0F - 1.0F) / 2.0F + 0.5F); }
  }
  
  public static class BounceIn extends BounceOut {
    public BounceIn(int param1Int) { super(param1Int); }
    
    public BounceIn(float[] param1ArrayOfFloat1, float[] param1ArrayOfFloat2) { super(param1ArrayOfFloat1, param1ArrayOfFloat2); }
    
    public float apply(float param1Float) { return 1.0F - super.apply(1.0F - param1Float); }
  }
  
  public static class BounceOut extends Interpolation {
    final float[] heights;
    
    final float[] widths;
    
    public BounceOut(int param1Int) {
      if (param1Int >= 2 && param1Int <= 5) {
        this.widths = new float[param1Int];
        this.heights = new float[param1Int];
        float[] arrayOfFloat = this.heights;
        arrayOfFloat[0] = 1.0F;
        if (param1Int != 2) {
          if (param1Int != 3) {
            if (param1Int != 4) {
              if (param1Int == 5) {
                float[] arrayOfFloat1 = this.widths;
                arrayOfFloat1[0] = 0.3F;
                arrayOfFloat1[1] = 0.3F;
                arrayOfFloat1[2] = 0.2F;
                arrayOfFloat1[3] = 0.1F;
                arrayOfFloat1[4] = 0.1F;
                arrayOfFloat[1] = 0.45F;
                arrayOfFloat[2] = 0.3F;
                arrayOfFloat[3] = 0.15F;
                arrayOfFloat[4] = 0.06F;
              } 
            } else {
              float[] arrayOfFloat1 = this.widths;
              arrayOfFloat1[0] = 0.34F;
              arrayOfFloat1[1] = 0.34F;
              arrayOfFloat1[2] = 0.2F;
              arrayOfFloat1[3] = 0.15F;
              arrayOfFloat[1] = 0.26F;
              arrayOfFloat[2] = 0.11F;
              arrayOfFloat[3] = 0.03F;
            } 
          } else {
            float[] arrayOfFloat1 = this.widths;
            arrayOfFloat1[0] = 0.4F;
            arrayOfFloat1[1] = 0.4F;
            arrayOfFloat1[2] = 0.2F;
            arrayOfFloat[1] = 0.33F;
            arrayOfFloat[2] = 0.1F;
          } 
        } else {
          float[] arrayOfFloat1 = this.widths;
          arrayOfFloat1[0] = 0.6F;
          arrayOfFloat1[1] = 0.4F;
          arrayOfFloat[1] = 0.33F;
        } 
        arrayOfFloat = this.widths;
        arrayOfFloat[0] = arrayOfFloat[0] * 2.0F;
        return;
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("bounces cannot be < 2 or > 5: ");
      stringBuilder.append(param1Int);
      throw new IllegalArgumentException(stringBuilder.toString());
    }
    
    public BounceOut(float[] param1ArrayOfFloat1, float[] param1ArrayOfFloat2) {
      if (param1ArrayOfFloat1.length == param1ArrayOfFloat2.length) {
        this.widths = param1ArrayOfFloat1;
        this.heights = param1ArrayOfFloat2;
        return;
      } 
      throw new IllegalArgumentException("Must be the same number of widths and heights.");
    }
    
    public float apply(float param1Float) {
      if (param1Float == 1.0F)
        return 1.0F; 
      float[] arrayOfFloat = this.widths;
      byte b = 0;
      float f1 = param1Float + arrayOfFloat[0] / 2.0F;
      int i = arrayOfFloat.length;
      float f2 = 0.0F;
      param1Float = 0.0F;
      while (true) {
        f3 = f2;
        if (b < i) {
          param1Float = this.widths[b];
          if (f1 <= param1Float) {
            f3 = this.heights[b];
            break;
          } 
          f1 -= param1Float;
          b++;
          continue;
        } 
        break;
      } 
      f1 /= param1Float;
      float f3 = 4.0F / param1Float * f3 * f1;
      return 1.0F - (f3 - f1 * f3) * param1Float;
    }
  }
  
  public static class Elastic extends Interpolation {
    final float bounces;
    
    final float power;
    
    final float scale;
    
    final float value;
    
    public Elastic(float param1Float1, float param1Float2, int param1Int, float param1Float3) {
      this.value = param1Float1;
      this.power = param1Float2;
      this.scale = param1Float3;
      param1Float1 = param1Int;
      if (param1Int % 2 == 0) {
        param1Int = 1;
      } else {
        param1Int = -1;
      } 
      this.bounces = param1Float1 * 3.1415927F * param1Int;
    }
    
    public float apply(float param1Float) {
      if (param1Float <= 0.5F) {
        param1Float *= 2.0F;
        return (float)Math.pow(this.value, (this.power * (param1Float - 1.0F))) * MathUtils.sin(param1Float * this.bounces) * this.scale / 2.0F;
      } 
      param1Float = (1.0F - param1Float) * 2.0F;
      return 1.0F - (float)Math.pow(this.value, (this.power * (param1Float - 1.0F))) * MathUtils.sin(param1Float * this.bounces) * this.scale / 2.0F;
    }
  }
  
  public static class ElasticIn extends Elastic {
    public ElasticIn(float param1Float1, float param1Float2, int param1Int, float param1Float3) { super(param1Float1, param1Float2, param1Int, param1Float3); }
    
    public float apply(float param1Float) { return (param1Float >= 0.99D) ? 1.0F : ((float)Math.pow(this.value, (this.power * (param1Float - 1.0F))) * MathUtils.sin(param1Float * this.bounces) * this.scale); }
  }
  
  public static class ElasticOut extends Elastic {
    public ElasticOut(float param1Float1, float param1Float2, int param1Int, float param1Float3) { super(param1Float1, param1Float2, param1Int, param1Float3); }
    
    public float apply(float param1Float) {
      if (param1Float == 0.0F)
        return 0.0F; 
      param1Float = 1.0F - param1Float;
      return 1.0F - (float)Math.pow(this.value, (this.power * (param1Float - 1.0F))) * MathUtils.sin(param1Float * this.bounces) * this.scale;
    }
  }
  
  public static class Exp extends Interpolation {
    final float min;
    
    final float power;
    
    final float scale;
    
    final float value;
    
    public Exp(float param1Float1, float param1Float2) {
      this.value = param1Float1;
      this.power = param1Float2;
      this.min = (float)Math.pow(param1Float1, -param1Float2);
      this.scale = 1.0F / (1.0F - this.min);
    }
    
    public float apply(float param1Float) {
      if (param1Float <= 0.5F) {
        param1Float = ((float)Math.pow(this.value, (this.power * (param1Float * 2.0F - 1.0F))) - this.min) * this.scale;
        return param1Float / 2.0F;
      } 
      param1Float = 2.0F - ((float)Math.pow(this.value, (-this.power * (param1Float * 2.0F - 1.0F))) - this.min) * this.scale;
      return param1Float / 2.0F;
    }
  }
  
  public static class ExpIn extends Exp {
    public ExpIn(float param1Float1, float param1Float2) { super(param1Float1, param1Float2); }
    
    public float apply(float param1Float) { return ((float)Math.pow(this.value, (this.power * (param1Float - 1.0F))) - this.min) * this.scale; }
  }
  
  public static class ExpOut extends Exp {
    public ExpOut(float param1Float1, float param1Float2) { super(param1Float1, param1Float2); }
    
    public float apply(float param1Float) { return 1.0F - ((float)Math.pow(this.value, (-this.power * param1Float)) - this.min) * this.scale; }
  }
  
  public static class Pow extends Interpolation {
    final int power;
    
    public Pow(int param1Int) { this.power = param1Int; }
    
    public float apply(float param1Float) {
      if (param1Float <= 0.5F)
        return (float)Math.pow((param1Float * 2.0F), this.power) / 2.0F; 
      param1Float = (float)Math.pow(((param1Float - 1.0F) * 2.0F), this.power);
      int i = this.power;
      byte b = 2;
      if (i % 2 == 0)
        b = -2; 
      return param1Float / b + 1.0F;
    }
  }
  
  public static class PowIn extends Pow {
    public PowIn(int param1Int) { super(param1Int); }
    
    public float apply(float param1Float) { return (float)Math.pow(param1Float, this.power); }
  }
  
  public static class PowOut extends Pow {
    public PowOut(int param1Int) { super(param1Int); }
    
    public float apply(float param1Float) {
      boolean bool;
      param1Float = (float)Math.pow((param1Float - 1.0F), this.power);
      if (this.power % 2 == 0) {
        bool = true;
      } else {
        bool = true;
      } 
      return param1Float * bool + 1.0F;
    }
  }
  
  public static class Swing extends Interpolation {
    private final float scale;
    
    public Swing(float param1Float) { this.scale = param1Float * 2.0F; }
    
    public float apply(float param1Float) {
      if (param1Float <= 0.5F) {
        float f1 = param1Float * 2.0F;
        param1Float = this.scale;
        return f1 * f1 * ((1.0F + param1Float) * f1 - param1Float) / 2.0F;
      } 
      float f = (param1Float - 1.0F) * 2.0F;
      param1Float = this.scale;
      return f * f * ((param1Float + 1.0F) * f + param1Float) / 2.0F + 1.0F;
    }
  }
  
  public static class SwingIn extends Interpolation {
    private final float scale;
    
    public SwingIn(float param1Float) { this.scale = param1Float; }
    
    public float apply(float param1Float) {
      float f = this.scale;
      return param1Float * param1Float * ((1.0F + f) * param1Float - f);
    }
  }
  
  public static class SwingOut extends Interpolation {
    private final float scale;
    
    public SwingOut(float param1Float) { this.scale = param1Float; }
    
    public float apply(float param1Float) {
      param1Float--;
      float f = this.scale;
      return param1Float * param1Float * ((f + 1.0F) * param1Float + f) + 1.0F;
    }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/math/Interpolation.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */