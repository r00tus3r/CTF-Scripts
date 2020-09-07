package shaders;

import box2dLight.RayHandler;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;

public final class LightShader {
  public static final ShaderProgram createLightShader() {
    if (RayHandler.getGammaCorrection()) {
      str = "sqrt";
    } else {
      str = "";
    } 
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append("#ifdef GL_ES\nprecision lowp float;\n#define MED mediump\n#else\n#define MED \n#endif\nvarying vec4 v_color;\nvoid main()\n{\n  gl_FragColor = ");
    stringBuilder.append(str);
    stringBuilder.append("(v_color);\n");
    stringBuilder.append("}");
    String str = stringBuilder.toString();
    ShaderProgram.pedantic = false;
    ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 vertex_positions;\nattribute vec4 quad_colors;\nattribute float s;\nuniform mat4 u_projTrans;\nvarying vec4 v_color;\nvoid main()\n{\n   v_color = s * quad_colors;\n   gl_Position =  u_projTrans * vertex_positions;\n}\n", str);
    if (!shaderProgram.isCompiled())
      Gdx.app.log("ERROR", shaderProgram.getLog()); 
    return shaderProgram;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/shaders/LightShader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */