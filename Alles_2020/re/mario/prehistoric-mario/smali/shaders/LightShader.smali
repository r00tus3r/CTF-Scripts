.class public final Lshaders/LightShader;
.super Ljava/lang/Object;
.source "LightShader.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final createLightShader()Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;
    .locals 4

    .line 11
    invoke-static {}, Lbox2dLight/RayHandler;->getGammaCorrection()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "sqrt"

    goto :goto_0

    :cond_0
    const-string v0, ""

    .line 25
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "#ifdef GL_ES\nprecision lowp float;\n#define MED mediump\n#else\n#define MED \n#endif\nvarying vec4 v_color;\nvoid main()\n{\n  gl_FragColor = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "(v_color);\n"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "}"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 37
    sput-boolean v1, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->pedantic:Z

    .line 38
    new-instance v1, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const-string v2, "attribute vec4 vertex_positions;\nattribute vec4 quad_colors;\nattribute float s;\nuniform mat4 u_projTrans;\nvarying vec4 v_color;\nvoid main()\n{\n   v_color = s * quad_colors;\n   gl_Position =  u_projTrans * vertex_positions;\n}\n"

    invoke-direct {v1, v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->isCompiled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 41
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getLog()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ERROR"

    invoke-interface {v0, v3, v2}, Lcom/badlogic/gdx/Application;->log(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v1
.end method
