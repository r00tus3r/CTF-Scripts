.class public abstract Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;
.super Ljava/lang/Object;
.source "GLInterceptor.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/GL20;


# instance fields
.field protected calls:I

.field protected drawCalls:I

.field protected glProfiler:Lcom/badlogic/gdx/graphics/profiling/GLProfiler;

.field protected shaderSwitches:I

.field protected textureBindings:I

.field protected final vertexCount:Lcom/badlogic/gdx/math/FloatCounter;


# direct methods
.method protected constructor <init>(Lcom/badlogic/gdx/graphics/profiling/GLProfiler;)V
    .locals 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Lcom/badlogic/gdx/math/FloatCounter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/FloatCounter;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->vertexCount:Lcom/badlogic/gdx/math/FloatCounter;

    .line 33
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->glProfiler:Lcom/badlogic/gdx/graphics/profiling/GLProfiler;

    return-void
.end method

.method public static resolveErrorNumber(I)Ljava/lang/String;
    .locals 2

    packed-switch p0, :pswitch_data_0

    .line 49
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "number "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1
    const-string p0, "GL_INVALID_FRAMEBUFFER_OPERATION"

    return-object p0

    :pswitch_2
    const-string p0, "GL_OUT_OF_MEMORY"

    return-object p0

    :pswitch_3
    const-string p0, "GL_INVALID_OPERATION"

    return-object p0

    :pswitch_4
    const-string p0, "GL_INVALID_VALUE"

    return-object p0

    :pswitch_5
    const-string p0, "GL_INVALID_ENUM"

    return-object p0

    :pswitch_data_0
    .packed-switch 0x500
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public getCalls()I
    .locals 1

    .line 54
    iget v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->calls:I

    return v0
.end method

.method public getDrawCalls()I
    .locals 1

    .line 62
    iget v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->drawCalls:I

    return v0
.end method

.method public getShaderSwitches()I
    .locals 1

    .line 66
    iget v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->shaderSwitches:I

    return v0
.end method

.method public getTextureBindings()I
    .locals 1

    .line 58
    iget v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->textureBindings:I

    return v0
.end method

.method public getVertexCount()Lcom/badlogic/gdx/math/FloatCounter;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->vertexCount:Lcom/badlogic/gdx/math/FloatCounter;

    return-object v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x0

    .line 74
    iput v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->calls:I

    .line 75
    iput v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->textureBindings:I

    .line 76
    iput v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->drawCalls:I

    .line 77
    iput v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->shaderSwitches:I

    .line 78
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/profiling/GLInterceptor;->vertexCount:Lcom/badlogic/gdx/math/FloatCounter;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/FloatCounter;->reset()V

    return-void
.end method
