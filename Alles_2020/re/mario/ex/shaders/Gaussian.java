package shaders;

import box2dLight.RayHandler;
import com.badlogic.gdx.Gdx;
import com.badlogic.gdx.graphics.glutils.ShaderProgram;

public class Gaussian {
  public static ShaderProgram createBlurShader(int paramInt1, int paramInt2) {
    String str1 = Integer.toString(paramInt1);
    String str2 = Integer.toString(paramInt2);
    if (RayHandler.isDiffuse) {
      str3 = ".rgb";
    } else {
      str3 = "";
    } 
    StringBuilder stringBuilder2 = new StringBuilder();
    stringBuilder2.append("attribute vec4 a_position;\nuniform vec2  dir;\nattribute vec2 a_texCoord;\nvarying vec2 v_texCoords0;\nvarying vec2 v_texCoords1;\nvarying vec2 v_texCoords2;\nvarying vec2 v_texCoords3;\nvarying vec2 v_texCoords4;\n#define FBO_W ");
    stringBuilder2.append(str1);
    stringBuilder2.append(".0\n");
    stringBuilder2.append("#define FBO_H ");
    stringBuilder2.append(str2);
    stringBuilder2.append(".0\n");
    stringBuilder2.append("const vec2 futher = vec2(3.2307692308 / FBO_W, 3.2307692308 / FBO_H );\n");
    stringBuilder2.append("const vec2 closer = vec2(1.3846153846 / FBO_W, 1.3846153846 / FBO_H );\n");
    stringBuilder2.append("void main()\n");
    stringBuilder2.append("{\n");
    stringBuilder2.append("vec2 f = futher * dir;\n");
    stringBuilder2.append("vec2 c = closer * dir;\n");
    stringBuilder2.append("v_texCoords0 = a_texCoord - f;\n");
    stringBuilder2.append("v_texCoords1 = a_texCoord - c;\n");
    stringBuilder2.append("v_texCoords2 = a_texCoord;\n");
    stringBuilder2.append("v_texCoords3 = a_texCoord + c;\n");
    stringBuilder2.append("v_texCoords4 = a_texCoord + f;\n");
    stringBuilder2.append("gl_Position = a_position;\n");
    stringBuilder2.append("}\n");
    str1 = stringBuilder2.toString();
    StringBuilder stringBuilder1 = new StringBuilder();
    stringBuilder1.append("#ifdef GL_ES\nprecision lowp float;\n#define MED mediump\n#else\n#define MED \n#endif\nuniform sampler2D u_texture;\nvarying MED vec2 v_texCoords0;\nvarying MED vec2 v_texCoords1;\nvarying MED vec2 v_texCoords2;\nvarying MED vec2 v_texCoords3;\nvarying MED vec2 v_texCoords4;\nconst float center = 0.2270270270;\nconst float close  = 0.3162162162;\nconst float far    = 0.0702702703;\nvoid main()\n{\t \ngl_FragColor");
    stringBuilder1.append(str3);
    stringBuilder1.append(" = far    * texture2D(u_texture, v_texCoords0)");
    stringBuilder1.append(str3);
    stringBuilder1.append("\n");
    stringBuilder1.append("\t      \t\t+ close  * texture2D(u_texture, v_texCoords1)");
    stringBuilder1.append(str3);
    stringBuilder1.append("\n");
    stringBuilder1.append("\t\t\t\t+ center * texture2D(u_texture, v_texCoords2)");
    stringBuilder1.append(str3);
    stringBuilder1.append("\n");
    stringBuilder1.append("\t\t\t\t+ close  * texture2D(u_texture, v_texCoords3)");
    stringBuilder1.append(str3);
    stringBuilder1.append("\n");
    stringBuilder1.append("\t\t\t\t+ far    * texture2D(u_texture, v_texCoords4)");
    stringBuilder1.append(str3);
    stringBuilder1.append(";\n");
    stringBuilder1.append("}\n");
    String str3 = stringBuilder1.toString();
    ShaderProgram.pedantic = false;
    ShaderProgram shaderProgram = new ShaderProgram(str1, str3);
    if (!shaderProgram.isCompiled())
      Gdx.app.log("ERROR", shaderProgram.getLog()); 
    return shaderProgram;
  }
}


/* Location:              /home/r00tus3r/ctfs/2020/alles/re/prehistoric-mario-dex2jar.jar!/shaders/Gaussian.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       1.0.6
 */