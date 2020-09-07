package shaders;

import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;

public class DiffuseShader {
  public static final ShaderProgram createShadowShader() {
    ShaderProgram.pedantic = false;
    ShaderProgram shaderProgram = new ShaderProgram("attribute vec4 a_position;\nattribute vec2 a_texCoord;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_texCoords = a_texCoord;\n   gl_Position = a_position;\n}\n", "#ifdef GL_ES\nprecision lowp float;\n#define MED mediump\n#else\n#define MED \n#endif\nvarying MED vec2 v_texCoords;\nuniform sampler2D u_texture;\nuniform  vec4 ambient;\nvoid main()\n{\ngl_FragColor.rgb = (ambient.rgb + texture2D(u_texture, v_texCoords).rgb);\ngl_FragColor.a = 1.0;\n}\n");
    if (!shaderProgram.isCompiled())
      Gdx.app.log("ERROR", shaderProgram.getLog()); 
    return shaderProgram;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/shaders/DiffuseShader.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */