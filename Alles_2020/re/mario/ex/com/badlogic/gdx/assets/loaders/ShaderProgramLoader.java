package com.badlogic.gdx.assets.loaders;

import com.badlogic.gdx.assets.AssetDescriptor;
import com.badlogic.gdx.assets.AssetLoaderParameters;
import com.badlogic.gdx.assets.AssetManager;
import com.badlogic.gdx.files.FileHandle;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;
import com.badlogic.gdx.utils.Array;
import com.badlogic.gdx.utils.Logger;

public class ShaderProgramLoader extends AsynchronousAssetLoader<ShaderProgram, ShaderProgramLoader.ShaderProgramParameter> {
  private String fragmentFileSuffix = ".frag";
  
  private String vertexFileSuffix = ".vert";
  
  public ShaderProgramLoader(FileHandleResolver paramFileHandleResolver) { super(paramFileHandleResolver); }
  
  public ShaderProgramLoader(FileHandleResolver paramFileHandleResolver, String paramString1, String paramString2) {
    super(paramFileHandleResolver);
    this.vertexFileSuffix = paramString1;
    this.fragmentFileSuffix = paramString2;
  }
  
  public Array<AssetDescriptor> getDependencies(String paramString, FileHandle paramFileHandle, ShaderProgramParameter paramShaderProgramParameter) { return null; }
  
  public void loadAsync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, ShaderProgramParameter paramShaderProgramParameter) {}
  
  public ShaderProgram loadSync(AssetManager paramAssetManager, String paramString, FileHandle paramFileHandle, ShaderProgramParameter paramShaderProgramParameter) {
    String str2 = null;
    if (paramShaderProgramParameter != null) {
      Object object;
      if (paramShaderProgramParameter.vertexFile != null) {
        object = paramShaderProgramParameter.vertexFile;
      } else {
        object = null;
      } 
      str3 = object;
      if (paramShaderProgramParameter.fragmentFile != null) {
        str2 = paramShaderProgramParameter.fragmentFile;
        str3 = object;
      } 
    } else {
      str3 = null;
    } 
    String str4 = str3;
    if (str3 == null) {
      str4 = str3;
      if (paramString.endsWith(this.fragmentFileSuffix)) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(paramString.substring(0, paramString.length() - this.fragmentFileSuffix.length()));
        stringBuilder.append(this.vertexFileSuffix);
        str4 = stringBuilder.toString();
      } 
    } 
    FileHandle fileHandle = str2;
    if (str2 == null) {
      fileHandle = str2;
      if (paramString.endsWith(this.vertexFileSuffix)) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(paramString.substring(0, paramString.length() - this.vertexFileSuffix.length()));
        stringBuilder.append(this.fragmentFileSuffix);
        fileHandle = stringBuilder.toString();
      } 
    } 
    if (str4 == null) {
      FileHandle fileHandle1 = paramFileHandle;
    } else {
      str2 = resolve(str4);
    } 
    if (fileHandle == null) {
      fileHandle = paramFileHandle;
    } else {
      fileHandle = resolve(fileHandle);
    } 
    String str1 = str2.readString();
    if (str2.equals(fileHandle)) {
      String str = str1;
    } else {
      str2 = fileHandle.readString();
    } 
    String str3 = str1;
    str4 = str2;
    if (paramShaderProgramParameter != null) {
      String str = str1;
      if (paramShaderProgramParameter.prependVertexCode != null) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(paramShaderProgramParameter.prependVertexCode);
        stringBuilder.append(str1);
        str = stringBuilder.toString();
      } 
      str3 = str;
      str4 = str2;
      if (paramShaderProgramParameter.prependFragmentCode != null) {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(paramShaderProgramParameter.prependFragmentCode);
        stringBuilder.append(str2);
        str4 = stringBuilder.toString();
        str3 = str;
      } 
    } 
    ShaderProgram shaderProgram = new ShaderProgram(str3, str4);
    if ((paramShaderProgramParameter == null || paramShaderProgramParameter.logOnCompileFailure) && !shaderProgram.isCompiled()) {
      Logger logger = paramAssetManager.getLogger();
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append("ShaderProgram ");
      stringBuilder.append(paramString);
      stringBuilder.append(" failed to compile:\n");
      stringBuilder.append(shaderProgram.getLog());
      logger.error(stringBuilder.toString());
    } 
    return shaderProgram;
  }
  
  public static class ShaderProgramParameter extends AssetLoaderParameters<ShaderProgram> {
    public String fragmentFile;
    
    public boolean logOnCompileFailure = true;
    
    public String prependFragmentCode;
    
    public String prependVertexCode;
    
    public String vertexFile;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/com/badlogic/gdx/assets/loaders/ShaderProgramLoader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */