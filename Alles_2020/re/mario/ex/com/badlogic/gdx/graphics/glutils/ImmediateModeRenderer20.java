package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.Mesh;
import com.badlogic.gdx.graphics.VertexAttribute;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.utils.Array;

public class ImmediateModeRenderer20 implements ImmediateModeRenderer {
  private final int colorOffset;
  
  private final int maxVertices;
  
  private final Mesh mesh;
  
  private final int normalOffset;
  
  private int numSetTexCoords;
  
  private final int numTexCoords;
  
  private int numVertices;
  
  private boolean ownsShader;
  
  private int primitiveType;
  
  private final Matrix4 projModelView = new Matrix4();
  
  private ShaderProgram shader;
  
  private final String[] shaderUniformNames;
  
  private final int texCoordOffset;
  
  private int vertexIdx;
  
  private final int vertexSize;
  
  private final float[] vertices;
  
  public ImmediateModeRenderer20(int paramInt1, boolean paramBoolean1, boolean paramBoolean2, int paramInt2) {
    this(paramInt1, paramBoolean1, paramBoolean2, paramInt2, createDefaultShader(paramBoolean1, paramBoolean2, paramInt2));
    this.ownsShader = true;
  }
  
  public ImmediateModeRenderer20(int paramInt1, boolean paramBoolean1, boolean paramBoolean2, int paramInt2, ShaderProgram paramShaderProgram) {
    this.maxVertices = paramInt1;
    this.numTexCoords = paramInt2;
    this.shader = paramShaderProgram;
    VertexAttribute[] arrayOfVertexAttribute = buildVertexAttributes(paramBoolean1, paramBoolean2, paramInt2);
    int i = 0;
    this.mesh = new Mesh(false, paramInt1, false, arrayOfVertexAttribute);
    this.vertices = new float[paramInt1 * (this.mesh.getVertexAttributes()).vertexSize / 4];
    this.vertexSize = (this.mesh.getVertexAttributes()).vertexSize / 4;
    if (this.mesh.getVertexAttribute(8) != null) {
      paramInt1 = (this.mesh.getVertexAttribute(8)).offset / 4;
    } else {
      paramInt1 = 0;
    } 
    this.normalOffset = paramInt1;
    if (this.mesh.getVertexAttribute(4) != null) {
      paramInt1 = (this.mesh.getVertexAttribute(4)).offset / 4;
    } else {
      paramInt1 = 0;
    } 
    this.colorOffset = paramInt1;
    if (this.mesh.getVertexAttribute(16) != null) {
      paramInt1 = (this.mesh.getVertexAttribute(16)).offset / 4;
    } else {
      paramInt1 = 0;
    } 
    this.texCoordOffset = paramInt1;
    this.shaderUniformNames = new String[paramInt2];
    for (paramInt1 = i; paramInt1 < paramInt2; paramInt1++) {
      String[] arrayOfString = this.shaderUniformNames;
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("u_sampler");
      stringBuilder.append(paramInt1);
      arrayOfString[paramInt1] = stringBuilder.toString();
    } 
  }
  
  public ImmediateModeRenderer20(boolean paramBoolean1, boolean paramBoolean2, int paramInt) {
    this(5000, paramBoolean1, paramBoolean2, paramInt, createDefaultShader(paramBoolean1, paramBoolean2, paramInt));
    this.ownsShader = true;
  }
  
  private VertexAttribute[] buildVertexAttributes(boolean paramBoolean1, boolean paramBoolean2, int paramInt) {
    Array array = new Array();
    array.add(new VertexAttribute(true, 3, "a_position"));
    if (paramBoolean1)
      array.add(new VertexAttribute(8, 3, "a_normal")); 
    if (paramBoolean2)
      array.add(new VertexAttribute(4, 4, "a_color")); 
    int i = 0;
    for (byte b = 0; b < paramInt; b++) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("a_texCoord");
      stringBuilder.append(b);
      array.add(new VertexAttribute(16, 2, stringBuilder.toString()));
    } 
    VertexAttribute[] arrayOfVertexAttribute = new VertexAttribute[array.size];
    for (paramInt = i; paramInt < array.size; paramInt++)
      arrayOfVertexAttribute[paramInt] = (VertexAttribute)array.get(paramInt); 
    return arrayOfVertexAttribute;
  }
  
  public static ShaderProgram createDefaultShader(boolean paramBoolean1, boolean paramBoolean2, int paramInt) { return new ShaderProgram(createVertexShader(paramBoolean1, paramBoolean2, paramInt), createFragmentShader(paramBoolean1, paramBoolean2, paramInt)); }
  
  private static String createFragmentShader(boolean paramBoolean1, boolean paramBoolean2, int paramInt) {
    String str1 = "#ifdef GL_ES\nprecision mediump float;\n#endif\n";
    if (paramBoolean2) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("#ifdef GL_ES\nprecision mediump float;\n#endif\n");
      stringBuilder.append("varying vec4 v_col;\n");
      str1 = stringBuilder.toString();
    } 
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < paramInt; b2++) {
      StringBuilder stringBuilder4 = new StringBuilder();
      stringBuilder4.append(str1);
      stringBuilder4.append("varying vec2 v_tex");
      stringBuilder4.append(b2);
      stringBuilder4.append(";\n");
      String str = stringBuilder4.toString();
      StringBuilder stringBuilder3 = new StringBuilder();
      stringBuilder3.append(str);
      stringBuilder3.append("uniform sampler2D u_sampler");
      stringBuilder3.append(b2);
      stringBuilder3.append(";\n");
      str1 = stringBuilder3.toString();
    } 
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str1);
    stringBuilder2.append("void main() {\n   gl_FragColor = ");
    if (paramBoolean2) {
      str1 = "v_col";
    } else {
      str1 = "vec4(1, 1, 1, 1)";
    } 
    stringBuilder2.append(str1);
    String str2 = stringBuilder2.toString();
    b2 = b1;
    str1 = str2;
    if (paramInt > 0) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str2);
      stringBuilder.append(" * ");
      str1 = stringBuilder.toString();
      b2 = b1;
    } 
    while (b2 < paramInt) {
      if (b2 == paramInt - 1) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str1);
        stringBuilder.append(" texture2D(u_sampler");
        stringBuilder.append(b2);
        stringBuilder.append(",  v_tex");
        stringBuilder.append(b2);
        stringBuilder.append(")");
        str1 = stringBuilder.toString();
      } else {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(str1);
        stringBuilder.append(" texture2D(u_sampler");
        stringBuilder.append(b2);
        stringBuilder.append(",  v_tex");
        stringBuilder.append(b2);
        stringBuilder.append(") *");
        str1 = stringBuilder.toString();
      } 
      b2++;
    } 
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append(str1);
    stringBuilder1.append(";\n}");
    return stringBuilder1.toString();
  }
  
  private static String createVertexShader(boolean paramBoolean1, boolean paramBoolean2, int paramInt) {
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append("attribute vec4 a_position;\n");
    String str2 = "";
    if (paramBoolean1) {
      str3 = "attribute vec3 a_normal;\n";
    } else {
      str3 = "";
    } 
    stringBuilder1.append(str3);
    if (paramBoolean2) {
      str3 = "attribute vec4 a_color;\n";
    } else {
      str3 = "";
    } 
    stringBuilder1.append(str3);
    String str3 = stringBuilder1.toString();
    byte b1 = 0;
    byte b2;
    for (b2 = 0; b2 < paramInt; b2++) {
      stringBuilder1 = new StringBuilder();
      stringBuilder1.append(str3);
      stringBuilder1.append("attribute vec2 a_texCoord");
      stringBuilder1.append(b2);
      stringBuilder1.append(";\n");
      str3 = stringBuilder1.toString();
    } 
    stringBuilder1 = new StringBuilder();
    stringBuilder1.append(str3);
    stringBuilder1.append("uniform mat4 u_projModelView;\n");
    str3 = stringBuilder1.toString();
    stringBuilder1 = new StringBuilder();
    stringBuilder1.append(str3);
    if (paramBoolean2) {
      str3 = "varying vec4 v_col;\n";
    } else {
      str3 = "";
    } 
    stringBuilder1.append(str3);
    str3 = stringBuilder1.toString();
    for (b2 = 0; b2 < paramInt; b2++) {
      stringBuilder1 = new StringBuilder();
      stringBuilder1.append(str3);
      stringBuilder1.append("varying vec2 v_tex");
      stringBuilder1.append(b2);
      stringBuilder1.append(";\n");
      str3 = stringBuilder1.toString();
    } 
    stringBuilder1 = new StringBuilder();
    stringBuilder1.append(str3);
    stringBuilder1.append("void main() {\n   gl_Position = u_projModelView * a_position;\n");
    str3 = str2;
    if (paramBoolean2)
      str3 = "   v_col = a_color;\n"; 
    stringBuilder1.append(str3);
    str3 = stringBuilder1.toString();
    for (b2 = b1; b2 < paramInt; b2++) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(str3);
      stringBuilder.append("   v_tex");
      stringBuilder.append(b2);
      stringBuilder.append(" = ");
      stringBuilder.append("a_texCoord");
      stringBuilder.append(b2);
      stringBuilder.append(";\n");
      str3 = stringBuilder.toString();
    } 
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append(str3);
    stringBuilder2.append("   gl_PointSize = 1.0;\n");
    String str1 = stringBuilder2.toString();
    StringBuilder stringBuilder3 = new StringBuilder();
    stringBuilder3.append(str1);
    stringBuilder3.append("}\n");
    return stringBuilder3.toString();
  }
  
  public void begin(Matrix4 paramMatrix4, int paramInt) {
    this.projModelView.set(paramMatrix4);
    this.primitiveType = paramInt;
  }
  
  public void color(float paramFloat) { this.vertices[this.vertexIdx + this.colorOffset] = paramFloat; }
  
  public void color(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { this.vertices[this.vertexIdx + this.colorOffset] = Color.toFloatBits(paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void color(Color paramColor) { this.vertices[this.vertexIdx + this.colorOffset] = paramColor.toFloatBits(); }
  
  public void dispose() {
    if (this.ownsShader) {
      ShaderProgram shaderProgram = this.shader;
      if (shaderProgram != null)
        shaderProgram.dispose(); 
    } 
    this.mesh.dispose();
  }
  
  public void end() { flush(); }
  
  public void flush() {
    if (this.numVertices == 0)
      return; 
    this.shader.begin();
    this.shader.setUniformMatrix("u_projModelView", this.projModelView);
    for (byte b = 0; b < this.numTexCoords; b++)
      this.shader.setUniformi(this.shaderUniformNames[b], b); 
    this.mesh.setVertices(this.vertices, 0, this.vertexIdx);
    this.mesh.render(this.shader, this.primitiveType);
    this.shader.end();
    this.numSetTexCoords = 0;
    this.vertexIdx = 0;
    this.numVertices = 0;
  }
  
  public int getMaxVertices() { return this.maxVertices; }
  
  public int getNumVertices() { return this.numVertices; }
  
  public void normal(float paramFloat1, float paramFloat2, float paramFloat3) {
    int i = this.vertexIdx + this.normalOffset;
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[i] = paramFloat1;
    arrayOfFloat[i + 1] = paramFloat2;
    arrayOfFloat[i + 2] = paramFloat3;
  }
  
  public void setShader(ShaderProgram paramShaderProgram) {
    if (this.ownsShader)
      this.shader.dispose(); 
    this.shader = paramShaderProgram;
    this.ownsShader = false;
  }
  
  public void texCoord(float paramFloat1, float paramFloat2) {
    int i = this.vertexIdx + this.texCoordOffset;
    float[] arrayOfFloat = this.vertices;
    int j = this.numSetTexCoords;
    arrayOfFloat[i + j] = paramFloat1;
    arrayOfFloat[i + j + 1] = paramFloat2;
    this.numSetTexCoords = j + 2;
  }
  
  public void vertex(float paramFloat1, float paramFloat2, float paramFloat3) {
    int i = this.vertexIdx;
    float[] arrayOfFloat = this.vertices;
    arrayOfFloat[i] = paramFloat1;
    arrayOfFloat[i + 1] = paramFloat2;
    arrayOfFloat[i + 2] = paramFloat3;
    this.numSetTexCoords = 0;
    this.vertexIdx = i + this.vertexSize;
    this.numVertices++;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/ImmediateModeRenderer20.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */