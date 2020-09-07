package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.math.MathUtils;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Disposable;

public class ShapeRenderer implements Disposable {
  private boolean autoShapeType;
  
  private final Color color = new Color(1.0F, 1.0F, 1.0F, 1.0F);
  
  private final Matrix4 combinedMatrix = new Matrix4();
  
  private float defaultRectLineWidth = 0.75F;
  
  private boolean matrixDirty = false;
  
  private final Matrix4 projectionMatrix = new Matrix4();
  
  private final ImmediateModeRenderer renderer;
  
  private ShapeType shapeType;
  
  private final Vector2 tmp = new Vector2();
  
  private final Matrix4 transformMatrix = new Matrix4();
  
  public ShapeRenderer() { this(5000); }
  
  public ShapeRenderer(int paramInt) { this(paramInt, null); }
  
  public ShapeRenderer(int paramInt, ShaderProgram paramShaderProgram) {
    if (paramShaderProgram == null) {
      this.renderer = new ImmediateModeRenderer20(paramInt, false, true, false);
    } else {
      this.renderer = new ImmediateModeRenderer20(paramInt, false, true, false, paramShaderProgram);
    } 
    this.projectionMatrix.setToOrtho2D(0.0F, 0.0F, Gdx.graphics.getWidth(), Gdx.graphics.getHeight());
    this.matrixDirty = true;
  }
  
  private void check(ShapeType paramShapeType1, ShapeType paramShapeType2, int paramInt) {
    ShapeType shapeType1 = this.shapeType;
    if (shapeType1 != null) {
      if (shapeType1 != paramShapeType1 && shapeType1 != paramShapeType2) {
        if (!this.autoShapeType) {
          StringBuilder stringBuilder1;
          if (paramShapeType2 == null) {
            stringBuilder1 = new StringBuilder();
            stringBuilder1.append("Must call begin(ShapeType.");
            stringBuilder1.append(paramShapeType1);
            stringBuilder1.append(").");
            throw new IllegalStateException(stringBuilder1.toString());
          } 
          StringBuilder stringBuilder2 = new StringBuilder();
          stringBuilder2.append("Must call begin(ShapeType.");
          stringBuilder2.append(paramShapeType1);
          stringBuilder2.append(") or begin(ShapeType.");
          stringBuilder2.append(stringBuilder1);
          stringBuilder2.append(").");
          throw new IllegalStateException(stringBuilder2.toString());
        } 
        end();
        begin(paramShapeType1);
      } else if (this.matrixDirty) {
        paramShapeType1 = this.shapeType;
        end();
        begin(paramShapeType1);
      } else if (this.renderer.getMaxVertices() - this.renderer.getNumVertices() < paramInt) {
        paramShapeType1 = this.shapeType;
        end();
        begin(paramShapeType1);
      } 
      return;
    } 
    throw new IllegalStateException("begin must be called first.");
  }
  
  public void arc(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) { arc(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, Math.max(1, (int)((float)Math.cbrt(paramFloat3) * 6.0F * paramFloat5 / 360.0F))); }
  
  public void arc(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, int paramInt) {
    if (paramInt > 0) {
      float f1 = this.color.toFloatBits();
      paramFloat5 = paramFloat5 / 360.0F * 6.2831855F / paramInt;
      float f2 = MathUtils.cos(paramFloat5);
      float f3 = MathUtils.sin(paramFloat5);
      paramFloat5 = paramFloat4 * 0.017453292F;
      paramFloat4 = MathUtils.cos(paramFloat5) * paramFloat3;
      paramFloat3 *= MathUtils.sin(paramFloat5);
      ShapeType shapeType1 = this.shapeType;
      ShapeType shapeType2 = ShapeType.Line;
      byte b1 = 0;
      byte b2 = 0;
      if (shapeType1 == shapeType2) {
        check(ShapeType.Line, ShapeType.Filled, paramInt * 2 + 2);
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat1 + paramFloat4, paramFloat2 + paramFloat3, 0.0F);
        while (b2 < paramInt) {
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + paramFloat4, paramFloat2 + paramFloat3, 0.0F);
          paramFloat5 = f2 * paramFloat4 - f3 * paramFloat3;
          paramFloat3 = paramFloat3 * f2 + paramFloat4 * f3;
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + paramFloat5, paramFloat2 + paramFloat3, 0.0F);
          b2++;
          paramFloat4 = paramFloat5;
        } 
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat4 + paramFloat1, paramFloat3 + paramFloat2, 0.0F);
      } else {
        check(ShapeType.Line, ShapeType.Filled, paramInt * 3 + 3);
        b2 = b1;
        while (b2 < paramInt) {
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + paramFloat4, paramFloat2 + paramFloat3, 0.0F);
          paramFloat5 = f2 * paramFloat4 - f3 * paramFloat3;
          paramFloat3 = paramFloat3 * f2 + paramFloat4 * f3;
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + paramFloat5, paramFloat2 + paramFloat3, 0.0F);
          b2++;
          paramFloat4 = paramFloat5;
        } 
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat4 + paramFloat1, paramFloat3 + paramFloat2, 0.0F);
      } 
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat1 + 0.0F, paramFloat2 + 0.0F, 0.0F);
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("segments must be > 0.");
    throw illegalArgumentException;
  }
  
  public void begin() {
    if (this.autoShapeType) {
      begin(ShapeType.Line);
      return;
    } 
    throw new IllegalStateException("autoShapeType must be true to use this method.");
  }
  
  public void begin(ShapeType paramShapeType) {
    if (this.shapeType == null) {
      this.shapeType = paramShapeType;
      if (this.matrixDirty) {
        this.combinedMatrix.set(this.projectionMatrix).mul(this.combinedMatrix.val, this.transformMatrix.val);
        this.matrixDirty = false;
      } 
      this.renderer.begin(this.combinedMatrix, this.shapeType.getGlType());
      return;
    } 
    throw new IllegalStateException("Call end() before beginning a new shape batch.");
  }
  
  public void box(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    float f = -paramFloat6;
    paramFloat6 = this.color.toFloatBits();
    if (this.shapeType == ShapeType.Line) {
      check(ShapeType.Line, ShapeType.Filled, 24);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      paramFloat4 += paramFloat1;
      immediateModeRenderer.vertex(paramFloat4, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      immediateModeRenderer = this.renderer;
      f += paramFloat3;
      immediateModeRenderer.vertex(paramFloat4, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      immediateModeRenderer = this.renderer;
      paramFloat5 += paramFloat2;
      immediateModeRenderer.vertex(paramFloat1, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, f);
    } else {
      check(ShapeType.Line, ShapeType.Filled, 36);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      paramFloat4 += paramFloat1;
      immediateModeRenderer.vertex(paramFloat4, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      immediateModeRenderer = this.renderer;
      paramFloat5 += paramFloat2;
      immediateModeRenderer.vertex(paramFloat4, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      immediateModeRenderer = this.renderer;
      f += paramFloat3;
      immediateModeRenderer.vertex(paramFloat4, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat5, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, f);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat4, paramFloat2, paramFloat3);
      this.renderer.color(paramFloat6);
      this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
    } 
  }
  
  public void circle(float paramFloat1, float paramFloat2, float paramFloat3) { circle(paramFloat1, paramFloat2, paramFloat3, Math.max(1, (int)((float)Math.cbrt(paramFloat3) * 6.0F))); }
  
  public void circle(float paramFloat1, float paramFloat2, float paramFloat3, int paramInt) {
    if (paramInt > 0) {
      float f1 = this.color.toFloatBits();
      float f2 = 6.2831855F / paramInt;
      float f3 = MathUtils.cos(f2);
      float f4 = MathUtils.sin(f2);
      ShapeType shapeType1 = this.shapeType;
      ShapeType shapeType2 = ShapeType.Line;
      byte b1 = 0;
      byte b2 = 0;
      if (shapeType1 == shapeType2) {
        check(ShapeType.Line, ShapeType.Filled, paramInt * 2 + 2);
        float f = paramFloat3;
        f2 = 0.0F;
        while (b2 < paramInt) {
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + f, paramFloat2 + f2, 0.0F);
          float f5 = f3 * f - f4 * f2;
          f2 = f2 * f3 + f * f4;
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + f5, paramFloat2 + f2, 0.0F);
          b2++;
          f = f5;
        } 
        this.renderer.color(f1);
        this.renderer.vertex(f + paramFloat1, f2 + paramFloat2, 0.0F);
      } else {
        check(ShapeType.Line, ShapeType.Filled, paramInt * 3 + 3);
        f2 = paramFloat3;
        float f = 0.0F;
        b2 = b1;
        while (b2 < paramInt - 1) {
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + f2, paramFloat2 + f, 0.0F);
          float f5 = f3 * f2 - f4 * f;
          f = f * f3 + f2 * f4;
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + f5, paramFloat2 + f, 0.0F);
          b2++;
          f2 = f5;
        } 
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
        this.renderer.color(f1);
        this.renderer.vertex(f2 + paramFloat1, f + paramFloat2, 0.0F);
      } 
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat1 + paramFloat3, paramFloat2 + 0.0F, 0.0F);
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("segments must be > 0.");
    throw illegalArgumentException;
  }
  
  public void cone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) { cone(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, Math.max(1, (int)((float)Math.sqrt(paramFloat4) * 4.0F))); }
  
  public void cone(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, int paramInt) {
    if (paramInt > 0) {
      float f6;
      float f5;
      check(ShapeType.Line, ShapeType.Filled, paramInt * 4 + 2);
      float f1 = this.color.toFloatBits();
      float f2 = 6.2831855F / paramInt;
      float f3 = MathUtils.cos(f2);
      float f4 = MathUtils.sin(f2);
      ShapeType shapeType1 = this.shapeType;
      ShapeType shapeType2 = ShapeType.Line;
      byte b1 = 0;
      byte b2 = 0;
      if (shapeType1 == shapeType2) {
        f5 = paramFloat4;
        f2 = 0.0F;
        while (b2 < paramInt) {
          this.renderer.color(f1);
          ImmediateModeRenderer immediateModeRenderer1 = this.renderer;
          float f7 = paramFloat1 + f5;
          float f8 = paramFloat2 + f2;
          immediateModeRenderer1.vertex(f7, f8, paramFloat3);
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3 + paramFloat5);
          this.renderer.color(f1);
          this.renderer.vertex(f7, f8, paramFloat3);
          f7 = f3 * f5 - f4 * f2;
          f2 = f2 * f3 + f5 * f4;
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1 + f7, paramFloat2 + f2, paramFloat3);
          b2++;
          f5 = f7;
        } 
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat1 + f5, paramFloat2 + f2, paramFloat3);
        f6 = f2;
      } else {
        f2 = paramFloat4;
        f5 = 0.0F;
        b2 = b1;
        while (b2 < paramInt - 1) {
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
          this.renderer.color(f1);
          ImmediateModeRenderer immediateModeRenderer1 = this.renderer;
          float f9 = paramFloat1 + f2;
          float f8 = paramFloat2 + f5;
          immediateModeRenderer1.vertex(f9, f8, paramFloat3);
          float f7 = f3 * f2 - f4 * f5;
          f5 = f5 * f3 + f2 * f4;
          this.renderer.color(f1);
          immediateModeRenderer1 = this.renderer;
          f2 = paramFloat1 + f7;
          float f10 = paramFloat2 + f5;
          immediateModeRenderer1.vertex(f2, f10, paramFloat3);
          this.renderer.color(f1);
          this.renderer.vertex(f9, f8, paramFloat3);
          this.renderer.color(f1);
          this.renderer.vertex(f2, f10, paramFloat3);
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3 + paramFloat5);
          b2++;
          f2 = f7;
        } 
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat1 + f2, paramFloat2 + f5, paramFloat3);
        f6 = f5;
        f5 = f2;
      } 
      this.renderer.color(f1);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      f2 = paramFloat1 + paramFloat4;
      paramFloat4 = 0.0F + paramFloat2;
      immediateModeRenderer.vertex(f2, paramFloat4, paramFloat3);
      if (this.shapeType != ShapeType.Line) {
        this.renderer.color(f1);
        this.renderer.vertex(f5 + paramFloat1, f6 + paramFloat2, paramFloat3);
        this.renderer.color(f1);
        this.renderer.vertex(f2, paramFloat4, paramFloat3);
        this.renderer.color(f1);
        this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3 + paramFloat5);
      } 
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("segments must be > 0.");
    throw illegalArgumentException;
  }
  
  public void curve(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, int paramInt) {
    check(ShapeType.Line, null, paramInt * 2 + 2);
    float f1 = this.color.toFloatBits();
    float f2 = 1.0F / paramInt;
    float f3 = f2 * f2;
    float f4 = f3 * f2;
    float f5 = f2 * 3.0F;
    float f6 = f3 * 3.0F;
    f2 = f3 * 6.0F;
    float f7 = 6.0F * f4;
    float f8 = paramFloat1 - paramFloat3 * 2.0F + paramFloat5;
    float f9 = paramFloat2 - 2.0F * paramFloat4 + paramFloat6;
    float f10 = (paramFloat3 - paramFloat5) * 3.0F - paramFloat1 + paramFloat7;
    paramFloat5 = (paramFloat4 - paramFloat6) * 3.0F - paramFloat2 + paramFloat8;
    f3 = (paramFloat3 - paramFloat1) * f5 + f8 * f6 + f10 * f4;
    paramFloat3 = (paramFloat4 - paramFloat2) * f5 + f6 * f9 + f4 * paramFloat5;
    f4 = f10 * f7;
    paramFloat4 = f8 * f2 + f4;
    f7 = paramFloat5 * f7;
    f2 = f9 * f2 + f7;
    paramFloat6 = paramFloat1;
    paramFloat5 = paramFloat2;
    paramFloat2 = paramFloat4;
    paramFloat1 = f2;
    paramFloat4 = f3;
    while (paramInt > 0) {
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat6, paramFloat5, 0.0F);
      paramFloat6 += paramFloat4;
      paramFloat5 += paramFloat3;
      paramFloat4 += paramFloat2;
      paramFloat3 += paramFloat1;
      paramFloat2 += f4;
      paramFloat1 += f7;
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat6, paramFloat5, 0.0F);
      paramInt--;
    } 
    this.renderer.color(f1);
    this.renderer.vertex(paramFloat6, paramFloat5, 0.0F);
    this.renderer.color(f1);
    this.renderer.vertex(paramFloat7, paramFloat8, 0.0F);
  }
  
  public void dispose() { this.renderer.dispose(); }
  
  public void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { ellipse(paramFloat1, paramFloat2, paramFloat3, paramFloat4, Math.max(1, (int)((float)Math.cbrt(Math.max(paramFloat3 * 0.5F, 0.5F * paramFloat4)) * 12.0F))); }
  
  public void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) { ellipse(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, Math.max(1, (int)((float)Math.cbrt(Math.max(paramFloat3 * 0.5F, 0.5F * paramFloat4)) * 12.0F))); }
  
  public void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, int paramInt) {
    if (paramInt > 0) {
      check(ShapeType.Line, ShapeType.Filled, paramInt * 3);
      float f1 = this.color.toFloatBits();
      float f2 = 6.2831855F / paramInt;
      paramFloat5 = 3.1415927F * paramFloat5 / 180.0F;
      float f3 = MathUtils.sin(paramFloat5);
      float f4 = MathUtils.cos(paramFloat5);
      float f5 = paramFloat1 + paramFloat3 / 2.0F;
      float f6 = paramFloat2 + paramFloat4 / 2.0F;
      paramFloat1 = paramFloat3 * 0.5F;
      ShapeType shapeType1 = this.shapeType;
      ShapeType shapeType2 = ShapeType.Line;
      byte b1 = 0;
      byte b2 = 0;
      if (shapeType1 == shapeType2) {
        paramFloat3 = paramFloat1;
        paramFloat2 = 0.0F;
        while (b2 < paramInt) {
          this.renderer.color(f1);
          this.renderer.vertex(f4 * paramFloat3 + f5 - f3 * paramFloat2, paramFloat3 * f3 + f6 + paramFloat2 * f4, 0.0F);
          paramFloat2 = ++b2 * f2;
          paramFloat3 = MathUtils.cos(paramFloat2) * paramFloat1;
          paramFloat2 = MathUtils.sin(paramFloat2) * paramFloat4 * 0.5F;
          this.renderer.color(f1);
          this.renderer.vertex(f4 * paramFloat3 + f5 - f3 * paramFloat2, f6 + f3 * paramFloat3 + f4 * paramFloat2, 0.0F);
        } 
      } else {
        paramFloat2 = paramFloat1;
        paramFloat5 = 0.0F;
        b2 = b1;
        paramFloat3 = paramFloat2;
        while (b2 < paramInt) {
          this.renderer.color(f1);
          this.renderer.vertex(f4 * paramFloat3 + f5 - f3 * paramFloat5, paramFloat3 * f3 + f6 + paramFloat5 * f4, 0.0F);
          this.renderer.color(f1);
          this.renderer.vertex(f5, f6, 0.0F);
          paramFloat2 = ++b2 * f2;
          paramFloat3 = MathUtils.cos(paramFloat2) * paramFloat1;
          paramFloat2 = MathUtils.sin(paramFloat2) * paramFloat4 * 0.5F;
          this.renderer.color(f1);
          this.renderer.vertex(f4 * paramFloat3 + f5 - f3 * paramFloat2, f6 + f3 * paramFloat3 + f4 * paramFloat2, 0.0F);
          paramFloat5 = paramFloat2;
        } 
      } 
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("segments must be > 0.");
    throw illegalArgumentException;
  }
  
  public void ellipse(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, int paramInt) {
    if (paramInt > 0) {
      check(ShapeType.Line, ShapeType.Filled, paramInt * 3);
      float f1 = this.color.toFloatBits();
      float f2 = 6.2831855F / paramInt;
      paramFloat1 += paramFloat3 / 2.0F;
      paramFloat2 += paramFloat4 / 2.0F;
      ShapeType shapeType1 = this.shapeType;
      ShapeType shapeType2 = ShapeType.Line;
      byte b1 = 0;
      byte b2 = 0;
      if (shapeType1 == shapeType2) {
        b1 = b2;
        while (b1 < paramInt) {
          this.renderer.color(f1);
          ImmediateModeRenderer immediateModeRenderer = this.renderer;
          float f3 = paramFloat3 * 0.5F;
          float f4 = b1 * f2;
          float f5 = MathUtils.cos(f4);
          float f6 = paramFloat4 * 0.5F;
          immediateModeRenderer.vertex(f5 * f3 + paramFloat1, MathUtils.sin(f4) * f6 + paramFloat2, 0.0F);
          this.renderer.color(f1);
          immediateModeRenderer = this.renderer;
          f5 = ++b1 * f2;
          immediateModeRenderer.vertex(f3 * MathUtils.cos(f5) + paramFloat1, f6 * MathUtils.sin(f5) + paramFloat2, 0.0F);
        } 
      } else {
        while (b1 < paramInt) {
          this.renderer.color(f1);
          ImmediateModeRenderer immediateModeRenderer = this.renderer;
          float f6 = paramFloat3 * 0.5F;
          float f5 = b1 * f2;
          float f4 = MathUtils.cos(f5);
          float f3 = paramFloat4 * 0.5F;
          immediateModeRenderer.vertex(f4 * f6 + paramFloat1, MathUtils.sin(f5) * f3 + paramFloat2, 0.0F);
          this.renderer.color(f1);
          this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
          this.renderer.color(f1);
          immediateModeRenderer = this.renderer;
          f5 = ++b1 * f2;
          immediateModeRenderer.vertex(f6 * MathUtils.cos(f5) + paramFloat1, f3 * MathUtils.sin(f5) + paramFloat2, 0.0F);
        } 
      } 
      return;
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("segments must be > 0.");
    throw illegalArgumentException;
  }
  
  public void end() {
    this.renderer.end();
    this.shapeType = null;
  }
  
  public void flush() {
    ShapeType shapeType1 = this.shapeType;
    if (shapeType1 == null)
      return; 
    end();
    begin(shapeType1);
  }
  
  public Color getColor() { return this.color; }
  
  public ShapeType getCurrentType() { return this.shapeType; }
  
  public Matrix4 getProjectionMatrix() { return this.projectionMatrix; }
  
  public ImmediateModeRenderer getRenderer() { return this.renderer; }
  
  public Matrix4 getTransformMatrix() { return this.transformMatrix; }
  
  public void identity() {
    this.transformMatrix.idt();
    this.matrixDirty = true;
  }
  
  public boolean isDrawing() {
    boolean bool;
    if (this.shapeType != null) {
      bool = true;
    } else {
      bool = false;
    } 
    return bool;
  }
  
  public final void line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    Color color1 = this.color;
    line(paramFloat1, paramFloat2, 0.0F, paramFloat3, paramFloat4, 0.0F, color1, color1);
  }
  
  public final void line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    Color color1 = this.color;
    line(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, color1, color1);
  }
  
  public void line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, Color paramColor1, Color paramColor2) {
    if (this.shapeType == ShapeType.Filled) {
      rectLine(paramFloat1, paramFloat2, paramFloat4, paramFloat5, this.defaultRectLineWidth, paramColor1, paramColor2);
      return;
    } 
    check(ShapeType.Line, null, 2);
    this.renderer.color(paramColor1.r, paramColor1.g, paramColor1.b, paramColor1.a);
    this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
    this.renderer.color(paramColor2.r, paramColor2.g, paramColor2.b, paramColor2.a);
    this.renderer.vertex(paramFloat4, paramFloat5, paramFloat6);
  }
  
  public final void line(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, Color paramColor1, Color paramColor2) { line(paramFloat1, paramFloat2, 0.0F, paramFloat3, paramFloat4, 0.0F, paramColor1, paramColor2); }
  
  public final void line(Vector2 paramVector21, Vector2 paramVector22) {
    float f1 = paramVector21.x;
    float f2 = paramVector21.y;
    float f3 = paramVector22.x;
    float f4 = paramVector22.y;
    Color color1 = this.color;
    line(f1, f2, 0.0F, f3, f4, 0.0F, color1, color1);
  }
  
  public final void line(Vector3 paramVector31, Vector3 paramVector32) {
    float f1 = paramVector31.x;
    float f2 = paramVector31.y;
    float f3 = paramVector31.z;
    float f4 = paramVector32.x;
    float f5 = paramVector32.y;
    float f6 = paramVector32.z;
    Color color1 = this.color;
    line(f1, f2, f3, f4, f5, f6, color1, color1);
  }
  
  public void point(float paramFloat1, float paramFloat2, float paramFloat3) {
    if (this.shapeType == ShapeType.Line) {
      float f = this.defaultRectLineWidth * 0.5F;
      line(paramFloat1 - f, paramFloat2 - f, paramFloat3, paramFloat1 + f, paramFloat2 + f, paramFloat3);
      return;
    } 
    if (this.shapeType == ShapeType.Filled) {
      float f1 = this.defaultRectLineWidth;
      float f2 = 0.5F * f1;
      box(paramFloat1 - f2, paramFloat2 - f2, paramFloat3 - f2, f1, f1, f1);
      return;
    } 
    check(ShapeType.Point, null, 1);
    this.renderer.color(this.color);
    this.renderer.vertex(paramFloat1, paramFloat2, paramFloat3);
  }
  
  public void polygon(float[] paramArrayOfFloat) { polygon(paramArrayOfFloat, 0, paramArrayOfFloat.length); }
  
  public void polygon(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    if (paramInt2 >= 6) {
      if (paramInt2 % 2 == 0) {
        check(ShapeType.Line, null, paramInt2);
        float f1 = this.color.toFloatBits();
        float f2 = paramArrayOfFloat[0];
        float f3 = paramArrayOfFloat[1];
        int i = paramInt1;
        while (true) {
          int j = i;
          if (j < paramInt1 + paramInt2) {
            float f7;
            float f6;
            float f4 = paramArrayOfFloat[j];
            float f5 = paramArrayOfFloat[j + 1];
            i = j + 2;
            if (i >= paramInt2) {
              f6 = f2;
              f7 = f3;
            } else {
              f6 = paramArrayOfFloat[i];
              f7 = paramArrayOfFloat[j + 3];
            } 
            this.renderer.color(f1);
            this.renderer.vertex(f4, f5, 0.0F);
            this.renderer.color(f1);
            this.renderer.vertex(f6, f7, 0.0F);
            continue;
          } 
          break;
        } 
        return;
      } 
      throw new IllegalArgumentException("Polygons must have an even number of vertices.");
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("Polygons must contain at least 3 points.");
    throw illegalArgumentException;
  }
  
  public void polyline(float[] paramArrayOfFloat) { polyline(paramArrayOfFloat, 0, paramArrayOfFloat.length); }
  
  public void polyline(float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    if (paramInt2 >= 4) {
      if (paramInt2 % 2 == 0) {
        check(ShapeType.Line, null, paramInt2);
        float f = this.color.toFloatBits();
        int i;
        for (i = paramInt1; i < paramInt2 + paramInt1 - 2; i = j) {
          float f1 = paramArrayOfFloat[i];
          float f2 = paramArrayOfFloat[i + 1];
          int j = i + 2;
          float f3 = paramArrayOfFloat[j];
          float f4 = paramArrayOfFloat[i + 3];
          this.renderer.color(f);
          this.renderer.vertex(f1, f2, 0.0F);
          this.renderer.color(f);
          this.renderer.vertex(f3, f4, 0.0F);
        } 
        return;
      } 
      throw new IllegalArgumentException("Polylines must have an even number of vertices.");
    } 
    IllegalArgumentException illegalArgumentException = new IllegalArgumentException("Polylines must contain at least 2 points.");
    throw illegalArgumentException;
  }
  
  public void rect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    check(ShapeType.Line, ShapeType.Filled, 8);
    float f = this.color.toFloatBits();
    if (this.shapeType == ShapeType.Line) {
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(f);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      paramFloat3 += paramFloat1;
      immediateModeRenderer.vertex(paramFloat3, paramFloat2, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat3, paramFloat2, 0.0F);
      this.renderer.color(f);
      immediateModeRenderer = this.renderer;
      paramFloat4 += paramFloat2;
      immediateModeRenderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
    } else {
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(f);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      paramFloat3 += paramFloat1;
      immediateModeRenderer.vertex(paramFloat3, paramFloat2, 0.0F);
      this.renderer.color(f);
      immediateModeRenderer = this.renderer;
      paramFloat4 += paramFloat2;
      immediateModeRenderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
    } 
  }
  
  public void rect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9) {
    Color color1 = this.color;
    rect(paramFloat1, paramFloat2, paramFloat3, paramFloat4, paramFloat5, paramFloat6, paramFloat7, paramFloat8, paramFloat9, color1, color1, color1, color1);
  }
  
  public void rect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, float paramFloat7, float paramFloat8, float paramFloat9, Color paramColor1, Color paramColor2, Color paramColor3, Color paramColor4) { // Byte code:
    //   0: aload_0
    //   1: getstatic com/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType.Line : Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
    //   4: getstatic com/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType.Filled : Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
    //   7: bipush #8
    //   9: invokespecial check : (Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V
    //   12: fload #9
    //   14: invokestatic cosDeg : (F)F
    //   17: fstore #14
    //   19: fload #9
    //   21: invokestatic sinDeg : (F)F
    //   24: fstore #15
    //   26: fload_3
    //   27: fneg
    //   28: fstore #16
    //   30: fload #4
    //   32: fneg
    //   33: fstore #17
    //   35: fload #5
    //   37: fload_3
    //   38: fsub
    //   39: fstore #18
    //   41: fload #6
    //   43: fload #4
    //   45: fsub
    //   46: fstore #19
    //   48: fload #7
    //   50: fconst_1
    //   51: fcmpl
    //   52: ifne -> 78
    //   55: fload #16
    //   57: fstore #20
    //   59: fload #17
    //   61: fstore #9
    //   63: fload #18
    //   65: fstore #6
    //   67: fload #19
    //   69: fstore #5
    //   71: fload #8
    //   73: fconst_1
    //   74: fcmpl
    //   75: ifeq -> 106
    //   78: fload #16
    //   80: fload #7
    //   82: fmul
    //   83: fstore #20
    //   85: fload #17
    //   87: fload #8
    //   89: fmul
    //   90: fstore #9
    //   92: fload #18
    //   94: fload #7
    //   96: fmul
    //   97: fstore #6
    //   99: fload #19
    //   101: fload #8
    //   103: fmul
    //   104: fstore #5
    //   106: fload_1
    //   107: fload_3
    //   108: fadd
    //   109: fstore_3
    //   110: fload_2
    //   111: fload #4
    //   113: fadd
    //   114: fstore #7
    //   116: fload #15
    //   118: fload #9
    //   120: fmul
    //   121: fstore #4
    //   123: fload #14
    //   125: fload #20
    //   127: fmul
    //   128: fload #4
    //   130: fsub
    //   131: fload_3
    //   132: fadd
    //   133: fstore_1
    //   134: fload #9
    //   136: fload #14
    //   138: fmul
    //   139: fstore #9
    //   141: fload #20
    //   143: fload #15
    //   145: fmul
    //   146: fload #9
    //   148: fadd
    //   149: fload #7
    //   151: fadd
    //   152: fstore_2
    //   153: fload #14
    //   155: fload #6
    //   157: fmul
    //   158: fstore #8
    //   160: fload #8
    //   162: fload #4
    //   164: fsub
    //   165: fload_3
    //   166: fadd
    //   167: fstore #4
    //   169: fload #6
    //   171: fload #15
    //   173: fmul
    //   174: fstore #20
    //   176: fload #9
    //   178: fload #20
    //   180: fadd
    //   181: fload #7
    //   183: fadd
    //   184: fstore #6
    //   186: fload #8
    //   188: fload #15
    //   190: fload #5
    //   192: fmul
    //   193: fsub
    //   194: fload_3
    //   195: fadd
    //   196: fstore_3
    //   197: fload #20
    //   199: fload #14
    //   201: fload #5
    //   203: fmul
    //   204: fadd
    //   205: fload #7
    //   207: fadd
    //   208: fstore #7
    //   210: fload_3
    //   211: fload #4
    //   213: fsub
    //   214: fload_1
    //   215: fadd
    //   216: fstore #5
    //   218: fload #7
    //   220: fload #6
    //   222: fload_2
    //   223: fsub
    //   224: fsub
    //   225: fstore #8
    //   227: aload_0
    //   228: getfield shapeType : Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
    //   231: getstatic com/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType.Line : Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
    //   234: if_acmpne -> 578
    //   237: aload_0
    //   238: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   241: aload #10
    //   243: getfield r : F
    //   246: aload #10
    //   248: getfield g : F
    //   251: aload #10
    //   253: getfield b : F
    //   256: aload #10
    //   258: getfield a : F
    //   261: invokeinterface color : (FFFF)V
    //   266: aload_0
    //   267: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   270: fload_1
    //   271: fload_2
    //   272: fconst_0
    //   273: invokeinterface vertex : (FFF)V
    //   278: aload_0
    //   279: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   282: aload #11
    //   284: getfield r : F
    //   287: aload #11
    //   289: getfield g : F
    //   292: aload #11
    //   294: getfield b : F
    //   297: aload #11
    //   299: getfield a : F
    //   302: invokeinterface color : (FFFF)V
    //   307: aload_0
    //   308: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   311: fload #4
    //   313: fload #6
    //   315: fconst_0
    //   316: invokeinterface vertex : (FFF)V
    //   321: aload_0
    //   322: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   325: aload #11
    //   327: getfield r : F
    //   330: aload #11
    //   332: getfield g : F
    //   335: aload #11
    //   337: getfield b : F
    //   340: aload #11
    //   342: getfield a : F
    //   345: invokeinterface color : (FFFF)V
    //   350: aload_0
    //   351: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   354: fload #4
    //   356: fload #6
    //   358: fconst_0
    //   359: invokeinterface vertex : (FFF)V
    //   364: aload_0
    //   365: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   368: aload #12
    //   370: getfield r : F
    //   373: aload #12
    //   375: getfield g : F
    //   378: aload #12
    //   380: getfield b : F
    //   383: aload #12
    //   385: getfield a : F
    //   388: invokeinterface color : (FFFF)V
    //   393: aload_0
    //   394: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   397: fload_3
    //   398: fload #7
    //   400: fconst_0
    //   401: invokeinterface vertex : (FFF)V
    //   406: aload_0
    //   407: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   410: aload #12
    //   412: getfield r : F
    //   415: aload #12
    //   417: getfield g : F
    //   420: aload #12
    //   422: getfield b : F
    //   425: aload #12
    //   427: getfield a : F
    //   430: invokeinterface color : (FFFF)V
    //   435: aload_0
    //   436: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   439: fload_3
    //   440: fload #7
    //   442: fconst_0
    //   443: invokeinterface vertex : (FFF)V
    //   448: aload_0
    //   449: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   452: aload #13
    //   454: getfield r : F
    //   457: aload #13
    //   459: getfield g : F
    //   462: aload #13
    //   464: getfield b : F
    //   467: aload #13
    //   469: getfield a : F
    //   472: invokeinterface color : (FFFF)V
    //   477: aload_0
    //   478: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   481: fload #5
    //   483: fload #8
    //   485: fconst_0
    //   486: invokeinterface vertex : (FFF)V
    //   491: aload_0
    //   492: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   495: aload #13
    //   497: getfield r : F
    //   500: aload #13
    //   502: getfield g : F
    //   505: aload #13
    //   507: getfield b : F
    //   510: aload #13
    //   512: getfield a : F
    //   515: invokeinterface color : (FFFF)V
    //   520: aload_0
    //   521: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   524: fload #5
    //   526: fload #8
    //   528: fconst_0
    //   529: invokeinterface vertex : (FFF)V
    //   534: aload_0
    //   535: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   538: aload #10
    //   540: getfield r : F
    //   543: aload #10
    //   545: getfield g : F
    //   548: aload #10
    //   550: getfield b : F
    //   553: aload #10
    //   555: getfield a : F
    //   558: invokeinterface color : (FFFF)V
    //   563: aload_0
    //   564: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   567: fload_1
    //   568: fload_2
    //   569: fconst_0
    //   570: invokeinterface vertex : (FFF)V
    //   575: goto -> 830
    //   578: aload_0
    //   579: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   582: aload #10
    //   584: getfield r : F
    //   587: aload #10
    //   589: getfield g : F
    //   592: aload #10
    //   594: getfield b : F
    //   597: aload #10
    //   599: getfield a : F
    //   602: invokeinterface color : (FFFF)V
    //   607: aload_0
    //   608: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   611: fload_1
    //   612: fload_2
    //   613: fconst_0
    //   614: invokeinterface vertex : (FFF)V
    //   619: aload_0
    //   620: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   623: aload #11
    //   625: getfield r : F
    //   628: aload #11
    //   630: getfield g : F
    //   633: aload #11
    //   635: getfield b : F
    //   638: aload #11
    //   640: getfield a : F
    //   643: invokeinterface color : (FFFF)V
    //   648: aload_0
    //   649: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   652: fload #4
    //   654: fload #6
    //   656: fconst_0
    //   657: invokeinterface vertex : (FFF)V
    //   662: aload_0
    //   663: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   666: aload #12
    //   668: getfield r : F
    //   671: aload #12
    //   673: getfield g : F
    //   676: aload #12
    //   678: getfield b : F
    //   681: aload #12
    //   683: getfield a : F
    //   686: invokeinterface color : (FFFF)V
    //   691: aload_0
    //   692: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   695: fload_3
    //   696: fload #7
    //   698: fconst_0
    //   699: invokeinterface vertex : (FFF)V
    //   704: aload_0
    //   705: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   708: aload #12
    //   710: getfield r : F
    //   713: aload #12
    //   715: getfield g : F
    //   718: aload #12
    //   720: getfield b : F
    //   723: aload #12
    //   725: getfield a : F
    //   728: invokeinterface color : (FFFF)V
    //   733: aload_0
    //   734: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   737: fload_3
    //   738: fload #7
    //   740: fconst_0
    //   741: invokeinterface vertex : (FFF)V
    //   746: aload_0
    //   747: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   750: aload #13
    //   752: getfield r : F
    //   755: aload #13
    //   757: getfield g : F
    //   760: aload #13
    //   762: getfield b : F
    //   765: aload #13
    //   767: getfield a : F
    //   770: invokeinterface color : (FFFF)V
    //   775: aload_0
    //   776: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   779: fload #5
    //   781: fload #8
    //   783: fconst_0
    //   784: invokeinterface vertex : (FFF)V
    //   789: aload_0
    //   790: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   793: aload #10
    //   795: getfield r : F
    //   798: aload #10
    //   800: getfield g : F
    //   803: aload #10
    //   805: getfield b : F
    //   808: aload #10
    //   810: getfield a : F
    //   813: invokeinterface color : (FFFF)V
    //   818: aload_0
    //   819: getfield renderer : Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    //   822: fload_1
    //   823: fload_2
    //   824: fconst_0
    //   825: invokeinterface vertex : (FFF)V
    //   830: return }
  
  public void rect(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, Color paramColor1, Color paramColor2, Color paramColor3, Color paramColor4) {
    ImmediateModeRenderer immediateModeRenderer;
    check(ShapeType.Line, ShapeType.Filled, 8);
    if (this.shapeType == ShapeType.Line) {
      this.renderer.color(paramColor1.r, paramColor1.g, paramColor1.b, paramColor1.a);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(paramColor2.r, paramColor2.g, paramColor2.b, paramColor2.a);
      ImmediateModeRenderer immediateModeRenderer1 = this.renderer;
      paramFloat3 += paramFloat1;
      immediateModeRenderer1.vertex(paramFloat3, paramFloat2, 0.0F);
      this.renderer.color(paramColor2.r, paramColor2.g, paramColor2.b, paramColor2.a);
      this.renderer.vertex(paramFloat3, paramFloat2, 0.0F);
      this.renderer.color(paramColor3.r, paramColor3.g, paramColor3.b, paramColor3.a);
      immediateModeRenderer = this.renderer;
      paramFloat4 += paramFloat2;
      immediateModeRenderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(paramColor3.r, paramColor3.g, paramColor3.b, paramColor3.a);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(paramColor4.r, paramColor4.g, paramColor4.b, paramColor4.a);
      this.renderer.vertex(paramFloat1, paramFloat4, 0.0F);
      this.renderer.color(paramColor4.r, paramColor4.g, paramColor4.b, paramColor4.a);
      this.renderer.vertex(paramFloat1, paramFloat4, 0.0F);
      this.renderer.color(paramColor1.r, paramColor1.g, paramColor1.b, paramColor1.a);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
    } else {
      this.renderer.color(paramColor1.r, paramColor1.g, paramColor1.b, paramColor1.a);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(immediateModeRenderer.r, immediateModeRenderer.g, immediateModeRenderer.b, immediateModeRenderer.a);
      immediateModeRenderer = this.renderer;
      paramFloat3 += paramFloat1;
      immediateModeRenderer.vertex(paramFloat3, paramFloat2, 0.0F);
      this.renderer.color(paramColor3.r, paramColor3.g, paramColor3.b, paramColor3.a);
      immediateModeRenderer = this.renderer;
      paramFloat4 += paramFloat2;
      immediateModeRenderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(paramColor3.r, paramColor3.g, paramColor3.b, paramColor3.a);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(paramColor4.r, paramColor4.g, paramColor4.b, paramColor4.a);
      this.renderer.vertex(paramFloat1, paramFloat4, 0.0F);
      this.renderer.color(paramColor1.r, paramColor1.g, paramColor1.b, paramColor1.a);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
    } 
  }
  
  public void rectLine(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5) {
    check(ShapeType.Line, ShapeType.Filled, 8);
    float f1 = this.color.toFloatBits();
    Vector2 vector2 = this.tmp.set(paramFloat4 - paramFloat2, paramFloat1 - paramFloat3).nor();
    float f2 = paramFloat5 * 0.5F;
    paramFloat5 = vector2.x * f2;
    f2 = vector2.y * f2;
    if (this.shapeType == ShapeType.Line) {
      this.renderer.color(f1);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      float f3 = paramFloat1 + paramFloat5;
      float f4 = paramFloat2 + f2;
      immediateModeRenderer.vertex(f3, f4, 0.0F);
      this.renderer.color(f1);
      immediateModeRenderer = this.renderer;
      paramFloat1 -= paramFloat5;
      float f5 = paramFloat2 - f2;
      immediateModeRenderer.vertex(paramFloat1, f5, 0.0F);
      this.renderer.color(f1);
      immediateModeRenderer = this.renderer;
      float f6 = paramFloat3 + paramFloat5;
      paramFloat2 = paramFloat4 + f2;
      immediateModeRenderer.vertex(f6, paramFloat2, 0.0F);
      this.renderer.color(f1);
      immediateModeRenderer = this.renderer;
      paramFloat3 -= paramFloat5;
      paramFloat4 -= f2;
      immediateModeRenderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(f6, paramFloat2, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(f3, f4, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat1, f5, 0.0F);
    } else {
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat1 + paramFloat5, paramFloat2 + f2, 0.0F);
      this.renderer.color(f1);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      paramFloat1 -= paramFloat5;
      float f4 = paramFloat2 - f2;
      immediateModeRenderer.vertex(paramFloat1, f4, 0.0F);
      this.renderer.color(f1);
      immediateModeRenderer = this.renderer;
      float f3 = paramFloat3 + paramFloat5;
      paramFloat2 = paramFloat4 + f2;
      immediateModeRenderer.vertex(f3, paramFloat2, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat3 - paramFloat5, paramFloat4 - f2, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(f3, paramFloat2, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat1, f4, 0.0F);
    } 
  }
  
  public void rectLine(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, Color paramColor1, Color paramColor2) {
    check(ShapeType.Line, ShapeType.Filled, 8);
    float f1 = paramColor1.toFloatBits();
    float f2 = paramColor2.toFloatBits();
    Vector2 vector2 = this.tmp.set(paramFloat4 - paramFloat2, paramFloat1 - paramFloat3).nor();
    paramFloat5 *= 0.5F;
    float f3 = vector2.x * paramFloat5;
    paramFloat5 = vector2.y * paramFloat5;
    if (this.shapeType == ShapeType.Line) {
      this.renderer.color(f1);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      float f4 = paramFloat1 + f3;
      float f5 = paramFloat2 + paramFloat5;
      immediateModeRenderer.vertex(f4, f5, 0.0F);
      this.renderer.color(f1);
      immediateModeRenderer = this.renderer;
      paramFloat1 -= f3;
      paramFloat2 -= paramFloat5;
      immediateModeRenderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(f2);
      immediateModeRenderer = this.renderer;
      float f6 = paramFloat3 + f3;
      float f7 = paramFloat4 + paramFloat5;
      immediateModeRenderer.vertex(f6, f7, 0.0F);
      this.renderer.color(f2);
      immediateModeRenderer = this.renderer;
      paramFloat3 -= f3;
      paramFloat4 -= paramFloat5;
      immediateModeRenderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f2);
      this.renderer.vertex(f6, f7, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(f4, f5, 0.0F);
      this.renderer.color(f2);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
    } else {
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat1 + f3, paramFloat2 + paramFloat5, 0.0F);
      this.renderer.color(f1);
      ImmediateModeRenderer immediateModeRenderer = this.renderer;
      paramFloat1 -= f3;
      paramFloat2 -= paramFloat5;
      immediateModeRenderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(f2);
      immediateModeRenderer = this.renderer;
      float f4 = paramFloat3 + f3;
      float f5 = paramFloat4 + paramFloat5;
      immediateModeRenderer.vertex(f4, f5, 0.0F);
      this.renderer.color(f2);
      this.renderer.vertex(paramFloat3 - f3, paramFloat4 - paramFloat5, 0.0F);
      this.renderer.color(f2);
      this.renderer.vertex(f4, f5, 0.0F);
      this.renderer.color(f1);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
    } 
  }
  
  public void rectLine(Vector2 paramVector21, Vector2 paramVector22, float paramFloat) { rectLine(paramVector21.x, paramVector21.y, paramVector22.x, paramVector22.y, paramFloat); }
  
  public void rotate(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    this.transformMatrix.rotate(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
    this.matrixDirty = true;
  }
  
  public void scale(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.transformMatrix.scale(paramFloat1, paramFloat2, paramFloat3);
    this.matrixDirty = true;
  }
  
  public void set(ShapeType paramShapeType) {
    ShapeType shapeType1 = this.shapeType;
    if (shapeType1 == paramShapeType)
      return; 
    if (shapeType1 != null) {
      if (this.autoShapeType) {
        end();
        begin(paramShapeType);
        return;
      } 
      throw new IllegalStateException("autoShapeType must be enabled.");
    } 
    throw new IllegalStateException("begin must be called first.");
  }
  
  public void setAutoShapeType(boolean paramBoolean) { this.autoShapeType = paramBoolean; }
  
  public void setColor(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.color.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void setColor(Color paramColor) { this.color.set(paramColor); }
  
  public void setProjectionMatrix(Matrix4 paramMatrix4) {
    this.projectionMatrix.set(paramMatrix4);
    this.matrixDirty = true;
  }
  
  public void setTransformMatrix(Matrix4 paramMatrix4) {
    this.transformMatrix.set(paramMatrix4);
    this.matrixDirty = true;
  }
  
  public void translate(float paramFloat1, float paramFloat2, float paramFloat3) {
    this.transformMatrix.translate(paramFloat1, paramFloat2, paramFloat3);
    this.matrixDirty = true;
  }
  
  public void triangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6) {
    check(ShapeType.Line, ShapeType.Filled, 6);
    float f = this.color.toFloatBits();
    if (this.shapeType == ShapeType.Line) {
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat5, paramFloat6, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat5, paramFloat6, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
    } else {
      this.renderer.color(f);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(f);
      this.renderer.vertex(paramFloat5, paramFloat6, 0.0F);
    } 
  }
  
  public void triangle(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, float paramFloat5, float paramFloat6, Color paramColor1, Color paramColor2, Color paramColor3) {
    check(ShapeType.Line, ShapeType.Filled, 6);
    if (this.shapeType == ShapeType.Line) {
      this.renderer.color(paramColor1.r, paramColor1.g, paramColor1.b, paramColor1.a);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(paramColor2.r, paramColor2.g, paramColor2.b, paramColor2.a);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(paramColor2.r, paramColor2.g, paramColor2.b, paramColor2.a);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(paramColor3.r, paramColor3.g, paramColor3.b, paramColor3.a);
      this.renderer.vertex(paramFloat5, paramFloat6, 0.0F);
      this.renderer.color(paramColor3.r, paramColor3.g, paramColor3.b, paramColor3.a);
      this.renderer.vertex(paramFloat5, paramFloat6, 0.0F);
      this.renderer.color(paramColor1.r, paramColor1.g, paramColor1.b, paramColor1.a);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
    } else {
      this.renderer.color(paramColor1.r, paramColor1.g, paramColor1.b, paramColor1.a);
      this.renderer.vertex(paramFloat1, paramFloat2, 0.0F);
      this.renderer.color(paramColor2.r, paramColor2.g, paramColor2.b, paramColor2.a);
      this.renderer.vertex(paramFloat3, paramFloat4, 0.0F);
      this.renderer.color(paramColor3.r, paramColor3.g, paramColor3.b, paramColor3.a);
      this.renderer.vertex(paramFloat5, paramFloat6, 0.0F);
    } 
  }
  
  public void updateMatrices() { this.matrixDirty = true; }
  
  public void x(float paramFloat1, float paramFloat2, float paramFloat3) {
    float f1 = paramFloat1 - paramFloat3;
    float f2 = paramFloat2 - paramFloat3;
    paramFloat1 += paramFloat3;
    paramFloat2 += paramFloat3;
    line(f1, f2, paramFloat1, paramFloat2);
    line(f1, paramFloat2, paramFloat1, f2);
  }
  
  public void x(Vector2 paramVector2, float paramFloat) { x(paramVector2.x, paramVector2.y, paramFloat); }
  
  public enum ShapeType {
    Filled,
    Line,
    Point(false);
    
    private final int glType;
    
    static  {
      Line = new ShapeType("Line", true, true);
      Filled = new ShapeType("Filled", 2, 4);
      $VALUES = new ShapeType[] { Point, Line, Filled };
    }
    
    ShapeType(int param1Int1) { this.glType = param1Int1; }
    
    public int getGlType() { return this.glType; }
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/ShapeRenderer.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */