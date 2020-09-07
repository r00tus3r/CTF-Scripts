.class public Lshaders/DiffuseShader;
.super Ljava/lang/Object;
.source "DiffuseShader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final createShadowShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;
    .locals 4

    const/4 v0, 0x0

    .line 33
    sput-boolean v0, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->pedantic:Z

    .line 34
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const-string v1, "attribute vec4 a_position;\nattribute vec2 a_texCoord;\nvarying vec2 v_texCoords;\n\nvoid main()\n{\n   v_texCoords = a_texCoord;\n   gl_Position = a_position;\n}\n"

    const-string v2, "#ifdef GL_ES\nprecision lowp float;\n#define MED mediump\n#else\n#define MED \n#endif\nvarying MED vec2 v_texCoords;\nuniform sampler2D u_texture;\nuniform  vec4 ambient;\nvoid main()\n{\ngl_FragColor.rgb = (ambient.rgb + texture2D(u_texture, v_texCoords).rgb);\ngl_FragColor.a = 1.0;\n}\n"

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->isCompiled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 37
    sget-object v1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getLog()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ERROR"

    invoke-interface {v1, v3, v2}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method
