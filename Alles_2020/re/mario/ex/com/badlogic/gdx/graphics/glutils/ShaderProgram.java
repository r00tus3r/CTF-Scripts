package com.badlogic.gdx.graphics.glutils;

import com.badlogic.gdx.Application;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.Color;
import com.badlogic.gdx.graphics.GL20;
import com.badlogic.gdx.math.Matrix3;
import com.badlogic.gdx.math.Matrix4;
import com.badlogic.gdx.math.Vector2;
import com.badlogic.gdx.math.Vector3;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.BufferUtils;
import com.badlogic.gdx.utils.Disposable;
import com.badlogic.gdx.utils.ObjectIntMap;
import com.badlogic.gdx.utils.ObjectMap;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

public class ShaderProgram implements Disposable {
  public static final String BINORMAL_ATTRIBUTE = "a_binormal";
  
  public static final String BONEWEIGHT_ATTRIBUTE = "a_boneWeight";
  
  public static final String COLOR_ATTRIBUTE = "a_color";
  
  public static final String NORMAL_ATTRIBUTE = "a_normal";
  
  public static final String POSITION_ATTRIBUTE = "a_position";
  
  public static final String TANGENT_ATTRIBUTE = "a_tangent";
  
  public static final String TEXCOORD_ATTRIBUTE = "a_texCoord";
  
  static final IntBuffer intbuf;
  
  public static boolean pedantic = true;
  
  public static String prependFragmentCode = "";
  
  public static String prependVertexCode = "";
  
  private static final ObjectMap<Application, Array<ShaderProgram>> shaders = new ObjectMap();
  
  private String[] attributeNames;
  
  private final ObjectIntMap<String> attributeSizes = new ObjectIntMap();
  
  private final ObjectIntMap<String> attributeTypes = new ObjectIntMap();
  
  private final ObjectIntMap<String> attributes = new ObjectIntMap();
  
  private int fragmentShaderHandle;
  
  private final String fragmentShaderSource;
  
  private boolean invalidated;
  
  private boolean isCompiled;
  
  private String log = "";
  
  private final FloatBuffer matrix;
  
  IntBuffer params = BufferUtils.newIntBuffer(1);
  
  private int program;
  
  private int refCount = 0;
  
  IntBuffer type = BufferUtils.newIntBuffer(1);
  
  private String[] uniformNames;
  
  private final ObjectIntMap<String> uniformSizes = new ObjectIntMap();
  
  private final ObjectIntMap<String> uniformTypes = new ObjectIntMap();
  
  private final ObjectIntMap<String> uniforms = new ObjectIntMap();
  
  private int vertexShaderHandle;
  
  private final String vertexShaderSource;
  
  static  {
    intbuf = BufferUtils.newIntBuffer(1);
  }
  
  public ShaderProgram(FileHandle paramFileHandle1, FileHandle paramFileHandle2) { this(paramFileHandle1.readString(), paramFileHandle2.readString()); }
  
  public ShaderProgram(String paramString1, String paramString2) {
    if (paramString1 != null) {
      if (paramString2 != null) {
        String str1;
        String str2 = prependVertexCode;
        String str3 = paramString1;
        if (str2 != null) {
          str3 = paramString1;
          if (str2.length() > 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(prependVertexCode);
            stringBuilder.append(paramString1);
            str3 = stringBuilder.toString();
          } 
        } 
        str2 = prependFragmentCode;
        paramString1 = paramString2;
        if (str2 != null) {
          paramString1 = paramString2;
          if (str2.length() > 0) {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append(prependFragmentCode);
            stringBuilder.append(paramString2);
            str1 = stringBuilder.toString();
          } 
        } 
        this.vertexShaderSource = str3;
        this.fragmentShaderSource = str1;
        this.matrix = BufferUtils.newFloatBuffer(16);
        compileShaders(str3, str1);
        if (isCompiled()) {
          fetchAttributes();
          fetchUniforms();
          addManagedShader(Gdx.app, this);
        } 
        return;
      } 
      throw new IllegalArgumentException("fragment shader must not be null");
    } 
    throw new IllegalArgumentException("vertex shader must not be null");
  }
  
  private void addManagedShader(Application paramApplication, ShaderProgram paramShaderProgram) {
    Array array1 = (Array)shaders.get(paramApplication);
    Array array2 = array1;
    if (array1 == null)
      array2 = new Array(); 
    array2.add(paramShaderProgram);
    shaders.put(paramApplication, array2);
  }
  
  private void checkManaged() {
    if (this.invalidated) {
      compileShaders(this.vertexShaderSource, this.fragmentShaderSource);
      this.invalidated = false;
    } 
  }
  
  public static void clearAllShaderPrograms(Application paramApplication) { shaders.remove(paramApplication); }
  
  private void compileShaders(String paramString1, String paramString2) {
    this.vertexShaderHandle = loadShader(35633, paramString1);
    this.fragmentShaderHandle = loadShader(35632, paramString2);
    if (this.vertexShaderHandle == -1 || this.fragmentShaderHandle == -1) {
      this.isCompiled = false;
      return;
    } 
    this.program = linkProgram(createProgram());
    if (this.program == -1) {
      this.isCompiled = false;
      return;
    } 
    this.isCompiled = true;
  }
  
  private int fetchAttributeLocation(String paramString) {
    GL20 gL20 = Gdx.gl20;
    int i = this.attributes.get(paramString, -2);
    int j = i;
    if (i == -2) {
      j = gL20.glGetAttribLocation(this.program, paramString);
      this.attributes.put(paramString, j);
    } 
    return j;
  }
  
  private void fetchAttributes() {
    this.params.clear();
    Gdx.gl20.glGetProgramiv(this.program, 35721, this.params);
    int i = this.params.get(0);
    this.attributeNames = new String[i];
    for (byte b = 0; b < i; b++) {
      this.params.clear();
      this.params.put(0, 1);
      this.type.clear();
      String str = Gdx.gl20.glGetActiveAttrib(this.program, b, this.params, this.type);
      int j = Gdx.gl20.glGetAttribLocation(this.program, str);
      this.attributes.put(str, j);
      this.attributeTypes.put(str, this.type.get(0));
      this.attributeSizes.put(str, this.params.get(0));
      this.attributeNames[b] = str;
    } 
  }
  
  private int fetchUniformLocation(String paramString) { return fetchUniformLocation(paramString, pedantic); }
  
  private void fetchUniforms() {
    this.params.clear();
    Gdx.gl20.glGetProgramiv(this.program, 35718, this.params);
    int i = this.params.get(0);
    this.uniformNames = new String[i];
    for (byte b = 0; b < i; b++) {
      this.params.clear();
      this.params.put(0, 1);
      this.type.clear();
      String str = Gdx.gl20.glGetActiveUniform(this.program, b, this.params, this.type);
      int j = Gdx.gl20.glGetUniformLocation(this.program, str);
      this.uniforms.put(str, j);
      this.uniformTypes.put(str, this.type.get(0));
      this.uniformSizes.put(str, this.params.get(0));
      this.uniformNames[b] = str;
    } 
  }
  
  public static String getManagedStatus() {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("Managed shaders/app: { ");
    ObjectMap.Keys keys = shaders.keys().iterator();
    while (keys.hasNext()) {
      Application application = (Application)keys.next();
      stringBuilder.append(((Array)shaders.get(application)).size);
      stringBuilder.append(" ");
    } 
    stringBuilder.append("}");
    return stringBuilder.toString();
  }
  
  public static int getNumManagedShaderPrograms() { return ((Array)shaders.get(Gdx.app)).size; }
  
  public static void invalidateAllShaderPrograms(Application paramApplication) {
    if (Gdx.gl20 == null)
      return; 
    Array array = (Array)shaders.get(paramApplication);
    if (array == null)
      return; 
    for (byte b = 0; b < array.size; b++) {
      ((ShaderProgram)array.get(b)).invalidated = true;
      ((ShaderProgram)array.get(b)).checkManaged();
    } 
  }
  
  private int linkProgram(int paramInt) {
    GL20 gL20 = Gdx.gl20;
    if (paramInt == -1)
      return -1; 
    gL20.glAttachShader(paramInt, this.vertexShaderHandle);
    gL20.glAttachShader(paramInt, this.fragmentShaderHandle);
    gL20.glLinkProgram(paramInt);
    ByteBuffer byteBuffer = ByteBuffer.allocateDirect(4);
    byteBuffer.order(ByteOrder.nativeOrder());
    IntBuffer intBuffer = byteBuffer.asIntBuffer();
    gL20.glGetProgramiv(paramInt, 35714, intBuffer);
    if (intBuffer.get(0) == 0) {
      this.log = Gdx.gl20.glGetProgramInfoLog(paramInt);
      return -1;
    } 
    return paramInt;
  }
  
  private int loadShader(int paramInt, String paramString) {
    GL20 gL20 = Gdx.gl20;
    IntBuffer intBuffer = BufferUtils.newIntBuffer(1);
    int i = gL20.glCreateShader(paramInt);
    if (i == 0)
      return -1; 
    gL20.glShaderSource(i, paramString);
    gL20.glCompileShader(i);
    gL20.glGetShaderiv(i, 35713, intBuffer);
    if (intBuffer.get(0) == 0) {
      String str = gL20.glGetShaderInfoLog(i);
      StringBuilder stringBuilder2 = new StringBuilder();
      stringBuilder2.append(this.log);
      if (paramInt == 35633) {
        paramString = "Vertex shader\n";
      } else {
        paramString = "Fragment shader:\n";
      } 
      stringBuilder2.append(paramString);
      this.log = stringBuilder2.toString();
      StringBuilder stringBuilder1 = new StringBuilder();
      stringBuilder1.append(this.log);
      stringBuilder1.append(str);
      this.log = stringBuilder1.toString();
      return -1;
    } 
    return i;
  }
  
  public void begin() {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUseProgram(this.program);
  }
  
  protected int createProgram() {
    int i = Gdx.gl20.glCreateProgram();
    if (i == 0)
      i = -1; 
    return i;
  }
  
  public void disableVertexAttribute(int paramInt) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glDisableVertexAttribArray(paramInt);
  }
  
  public void disableVertexAttribute(String paramString) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    int i = fetchAttributeLocation(paramString);
    if (i == -1)
      return; 
    gL20.glDisableVertexAttribArray(i);
  }
  
  public void dispose() {
    GL20 gL20 = Gdx.gl20;
    gL20.glUseProgram(0);
    gL20.glDeleteShader(this.vertexShaderHandle);
    gL20.glDeleteShader(this.fragmentShaderHandle);
    gL20.glDeleteProgram(this.program);
    if (shaders.get(Gdx.app) != null)
      ((Array)shaders.get(Gdx.app)).removeValue(this, true); 
  }
  
  public void enableVertexAttribute(int paramInt) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glEnableVertexAttribArray(paramInt);
  }
  
  public void enableVertexAttribute(String paramString) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    int i = fetchAttributeLocation(paramString);
    if (i == -1)
      return; 
    gL20.glEnableVertexAttribArray(i);
  }
  
  public void end() { Gdx.gl20.glUseProgram(0); }
  
  public int fetchUniformLocation(String paramString, boolean paramBoolean) {
    GL20 gL20 = Gdx.gl20;
    int i = this.uniforms.get(paramString, -2);
    int j = i;
    if (i == -2) {
      j = gL20.glGetUniformLocation(this.program, paramString);
      if (j != -1 || !paramBoolean) {
        this.uniforms.put(paramString, j);
        return j;
      } 
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("no uniform with name '");
      stringBuilder.append(paramString);
      stringBuilder.append("' in shader");
      throw new IllegalArgumentException(stringBuilder.toString());
    } 
    return j;
  }
  
  public int getAttributeLocation(String paramString) { return this.attributes.get(paramString, -1); }
  
  public int getAttributeSize(String paramString) { return this.attributeSizes.get(paramString, 0); }
  
  public int getAttributeType(String paramString) { return this.attributeTypes.get(paramString, 0); }
  
  public String[] getAttributes() { return this.attributeNames; }
  
  public String getFragmentShaderSource() { return this.fragmentShaderSource; }
  
  public String getLog() {
    if (this.isCompiled) {
      this.log = Gdx.gl20.glGetProgramInfoLog(this.program);
      return this.log;
    } 
    return this.log;
  }
  
  public int getUniformLocation(String paramString) { return this.uniforms.get(paramString, -1); }
  
  public int getUniformSize(String paramString) { return this.uniformSizes.get(paramString, 0); }
  
  public int getUniformType(String paramString) { return this.uniformTypes.get(paramString, 0); }
  
  public String[] getUniforms() { return this.uniformNames; }
  
  public String getVertexShaderSource() { return this.vertexShaderSource; }
  
  public boolean hasAttribute(String paramString) { return this.attributes.containsKey(paramString); }
  
  public boolean hasUniform(String paramString) { return this.uniforms.containsKey(paramString); }
  
  public boolean isCompiled() { return this.isCompiled; }
  
  public void setAttributef(String paramString, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) { Gdx.gl20.glVertexAttrib4f(fetchAttributeLocation(paramString), paramFloat1, paramFloat2, paramFloat3, paramFloat4); }
  
  public void setUniform1fv(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform1fv(paramInt1, paramInt3, paramArrayOfFloat, paramInt2);
  }
  
  public void setUniform1fv(String paramString, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform1fv(fetchUniformLocation(paramString), paramInt2, paramArrayOfFloat, paramInt1);
  }
  
  public void setUniform2fv(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform2fv(paramInt1, paramInt3 / 2, paramArrayOfFloat, paramInt2);
  }
  
  public void setUniform2fv(String paramString, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform2fv(fetchUniformLocation(paramString), paramInt2 / 2, paramArrayOfFloat, paramInt1);
  }
  
  public void setUniform3fv(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform3fv(paramInt1, paramInt3 / 3, paramArrayOfFloat, paramInt2);
  }
  
  public void setUniform3fv(String paramString, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform3fv(fetchUniformLocation(paramString), paramInt2 / 3, paramArrayOfFloat, paramInt1);
  }
  
  public void setUniform4fv(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform4fv(paramInt1, paramInt3 / 4, paramArrayOfFloat, paramInt2);
  }
  
  public void setUniform4fv(String paramString, float[] paramArrayOfFloat, int paramInt1, int paramInt2) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform4fv(fetchUniformLocation(paramString), paramInt2 / 4, paramArrayOfFloat, paramInt1);
  }
  
  public void setUniformMatrix(int paramInt, Matrix3 paramMatrix3) { setUniformMatrix(paramInt, paramMatrix3, false); }
  
  public void setUniformMatrix(int paramInt, Matrix3 paramMatrix3, boolean paramBoolean) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniformMatrix3fv(paramInt, 1, paramBoolean, paramMatrix3.val, 0);
  }
  
  public void setUniformMatrix(int paramInt, Matrix4 paramMatrix4) { setUniformMatrix(paramInt, paramMatrix4, false); }
  
  public void setUniformMatrix(int paramInt, Matrix4 paramMatrix4, boolean paramBoolean) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniformMatrix4fv(paramInt, 1, paramBoolean, paramMatrix4.val, 0);
  }
  
  public void setUniformMatrix(String paramString, Matrix3 paramMatrix3) { setUniformMatrix(paramString, paramMatrix3, false); }
  
  public void setUniformMatrix(String paramString, Matrix3 paramMatrix3, boolean paramBoolean) { setUniformMatrix(fetchUniformLocation(paramString), paramMatrix3, paramBoolean); }
  
  public void setUniformMatrix(String paramString, Matrix4 paramMatrix4) { setUniformMatrix(paramString, paramMatrix4, false); }
  
  public void setUniformMatrix(String paramString, Matrix4 paramMatrix4, boolean paramBoolean) { setUniformMatrix(fetchUniformLocation(paramString), paramMatrix4, paramBoolean); }
  
  public void setUniformMatrix3fv(String paramString, FloatBuffer paramFloatBuffer, int paramInt, boolean paramBoolean) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    paramFloatBuffer.position(0);
    gL20.glUniformMatrix3fv(fetchUniformLocation(paramString), paramInt, paramBoolean, paramFloatBuffer);
  }
  
  public void setUniformMatrix4fv(int paramInt1, float[] paramArrayOfFloat, int paramInt2, int paramInt3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniformMatrix4fv(paramInt1, paramInt3 / 16, false, paramArrayOfFloat, paramInt2);
  }
  
  public void setUniformMatrix4fv(String paramString, FloatBuffer paramFloatBuffer, int paramInt, boolean paramBoolean) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    paramFloatBuffer.position(0);
    gL20.glUniformMatrix4fv(fetchUniformLocation(paramString), paramInt, paramBoolean, paramFloatBuffer);
  }
  
  public void setUniformMatrix4fv(String paramString, float[] paramArrayOfFloat, int paramInt1, int paramInt2) { setUniformMatrix4fv(fetchUniformLocation(paramString), paramArrayOfFloat, paramInt1, paramInt2); }
  
  public void setUniformf(int paramInt, float paramFloat) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform1f(paramInt, paramFloat);
  }
  
  public void setUniformf(int paramInt, float paramFloat1, float paramFloat2) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform2f(paramInt, paramFloat1, paramFloat2);
  }
  
  public void setUniformf(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform3f(paramInt, paramFloat1, paramFloat2, paramFloat3);
  }
  
  public void setUniformf(int paramInt, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform4f(paramInt, paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void setUniformf(int paramInt, Color paramColor) { setUniformf(paramInt, paramColor.r, paramColor.g, paramColor.b, paramColor.a); }
  
  public void setUniformf(int paramInt, Vector2 paramVector2) { setUniformf(paramInt, paramVector2.x, paramVector2.y); }
  
  public void setUniformf(int paramInt, Vector3 paramVector3) { setUniformf(paramInt, paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public void setUniformf(String paramString, float paramFloat) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform1f(fetchUniformLocation(paramString), paramFloat);
  }
  
  public void setUniformf(String paramString, float paramFloat1, float paramFloat2) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform2f(fetchUniformLocation(paramString), paramFloat1, paramFloat2);
  }
  
  public void setUniformf(String paramString, float paramFloat1, float paramFloat2, float paramFloat3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform3f(fetchUniformLocation(paramString), paramFloat1, paramFloat2, paramFloat3);
  }
  
  public void setUniformf(String paramString, float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform4f(fetchUniformLocation(paramString), paramFloat1, paramFloat2, paramFloat3, paramFloat4);
  }
  
  public void setUniformf(String paramString, Color paramColor) { setUniformf(paramString, paramColor.r, paramColor.g, paramColor.b, paramColor.a); }
  
  public void setUniformf(String paramString, Vector2 paramVector2) { setUniformf(paramString, paramVector2.x, paramVector2.y); }
  
  public void setUniformf(String paramString, Vector3 paramVector3) { setUniformf(paramString, paramVector3.x, paramVector3.y, paramVector3.z); }
  
  public void setUniformi(int paramInt1, int paramInt2) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform1i(paramInt1, paramInt2);
  }
  
  public void setUniformi(int paramInt1, int paramInt2, int paramInt3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform2i(paramInt1, paramInt2, paramInt3);
  }
  
  public void setUniformi(int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform3i(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void setUniformi(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform4i(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
  }
  
  public void setUniformi(String paramString, int paramInt) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform1i(fetchUniformLocation(paramString), paramInt);
  }
  
  public void setUniformi(String paramString, int paramInt1, int paramInt2) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform2i(fetchUniformLocation(paramString), paramInt1, paramInt2);
  }
  
  public void setUniformi(String paramString, int paramInt1, int paramInt2, int paramInt3) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform3i(fetchUniformLocation(paramString), paramInt1, paramInt2, paramInt3);
  }
  
  public void setUniformi(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glUniform4i(fetchUniformLocation(paramString), paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void setVertexAttribute(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, int paramInt5) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glVertexAttribPointer(paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramInt5);
  }
  
  public void setVertexAttribute(int paramInt1, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, Buffer paramBuffer) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    gL20.glVertexAttribPointer(paramInt1, paramInt2, paramInt3, paramBoolean, paramInt4, paramBuffer);
  }
  
  public void setVertexAttribute(String paramString, int paramInt1, int paramInt2, boolean paramBoolean, int paramInt3, int paramInt4) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    int i = fetchAttributeLocation(paramString);
    if (i == -1)
      return; 
    gL20.glVertexAttribPointer(i, paramInt1, paramInt2, paramBoolean, paramInt3, paramInt4);
  }
  
  public void setVertexAttribute(String paramString, int paramInt1, int paramInt2, boolean paramBoolean, int paramInt3, Buffer paramBuffer) {
    GL20 gL20 = Gdx.gl20;
    checkManaged();
    int i = fetchAttributeLocation(paramString);
    if (i == -1)
      return; 
    gL20.glVertexAttribPointer(i, paramInt1, paramInt2, paramBoolean, paramInt3, paramBuffer);
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/graphics/glutils/ShaderProgram.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */