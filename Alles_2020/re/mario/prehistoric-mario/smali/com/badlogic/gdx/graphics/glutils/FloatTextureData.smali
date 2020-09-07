.class public Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;
.super Ljava/lang/Object;
.source "FloatTextureData.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/TextureData;


# instance fields
.field buffer:Ljava/nio/FloatBuffer;

.field format:I

.field height:I

.field internalFormat:I

.field isGpuOnly:Z

.field isPrepared:Z

.field type:I

.field width:I


# direct methods
.method public constructor <init>(IIIIIZ)V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 35
    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->width:I

    .line 36
    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->height:I

    .line 44
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->isPrepared:Z

    .line 48
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->width:I

    .line 49
    iput p2, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->height:I

    .line 50
    iput p3, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->internalFormat:I

    .line 51
    iput p4, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->format:I

    .line 52
    iput p5, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->type:I

    .line 53
    iput-boolean p6, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->isGpuOnly:Z

    return-void
.end method


# virtual methods
.method public consumeCustomData(I)V
    .locals 11

    .line 84
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v0}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v0

    sget-object v1, Lcom/badlogic/gdx/Application$ApplicationType;->Android:Lcom/badlogic/gdx/Application$ApplicationType;

    if-eq v0, v1, :cond_3

    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v0}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v0

    sget-object v1, Lcom/badlogic/gdx/Application$ApplicationType;->iOS:Lcom/badlogic/gdx/Application$ApplicationType;

    if-eq v0, v1, :cond_3

    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    .line 85
    invoke-interface {v0}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v0

    sget-object v1, Lcom/badlogic/gdx/Application$ApplicationType;->WebGL:Lcom/badlogic/gdx/Application$ApplicationType;

    if-ne v0, v1, :cond_0

    goto :goto_1

    .line 95
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->isGL30Available()Z

    move-result v0

    if-nez v0, :cond_2

    .line 96
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    const-string v1, "GL_ARB_texture_float"

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Graphics;->supportsExtension(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    .line 97
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Extension GL_ARB_texture_float not supported!"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 101
    :cond_2
    :goto_0
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v3, 0x0

    iget v4, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->internalFormat:I

    iget v5, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->width:I

    iget v6, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->height:I

    const/4 v7, 0x0

    iget v8, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->format:I

    const/16 v9, 0x1406

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->buffer:Ljava/nio/FloatBuffer;

    move v2, p1

    invoke-interface/range {v1 .. v10}, Lcom/badlogic/gdx/graphics/GL20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    goto :goto_2

    .line 87
    :cond_3
    :goto_1
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    const-string v1, "OES_texture_float"

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Graphics;->supportsExtension(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 92
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v3, 0x0

    const/16 v4, 0x1908

    iget v5, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->width:I

    iget v6, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->height:I

    const/4 v7, 0x0

    const/16 v8, 0x1908

    const/16 v9, 0x1406

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->buffer:Ljava/nio/FloatBuffer;

    move v2, p1

    invoke-interface/range {v1 .. v10}, Lcom/badlogic/gdx/graphics/GL20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    :goto_2
    return-void

    .line 88
    :cond_4
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Extension OES_texture_float not supported!"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public consumePixmap()Lcom/badlogic/gdx/graphics/Pixmap;
    .locals 2

    .line 107
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "This TextureData implementation does not return a Pixmap"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public disposePixmap()Z
    .locals 2

    .line 112
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "This TextureData implementation does not return a Pixmap"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->buffer:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;
    .locals 1

    .line 127
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    return-object v0
.end method

.method public getHeight()I
    .locals 1

    .line 122
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->height:I

    return v0
.end method

.method public getType()Lcom/badlogic/gdx/graphics/TextureData$TextureDataType;
    .locals 1

    .line 58
    sget-object v0, Lcom/badlogic/gdx/graphics/TextureData$TextureDataType;->Custom:Lcom/badlogic/gdx/graphics/TextureData$TextureDataType;

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .line 117
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->width:I

    return v0
.end method

.method public isManaged()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isPrepared()Z
    .locals 1

    .line 63
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->isPrepared:Z

    return v0
.end method

.method public prepare()V
    .locals 4

    .line 68
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->isPrepared:Z

    if-nez v0, :cond_9

    .line 69
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->isGpuOnly:Z

    const/4 v1, 0x1

    if-nez v0, :cond_8

    .line 71
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getGLVersion()Lcom/badlogic/gdx/graphics/glutils/GLVersion;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/GLVersion;->getType()Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    move-result-object v0

    sget-object v2, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->OpenGL:Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/graphics/glutils/GLVersion$Type;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v2, 0x4

    if-eqz v0, :cond_6

    .line 72
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->internalFormat:I

    const v3, 0x881a

    if-eq v0, v3, :cond_0

    const v3, 0x8814

    .line 73
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->internalFormat:I

    const v3, 0x881b

    if-eq v0, v3, :cond_1

    const v3, 0x8815

    if-ne v0, v3, :cond_2

    :cond_1
    const/4 v2, 0x3

    .line 74
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->internalFormat:I

    const v3, 0x822f

    if-eq v0, v3, :cond_4

    const v3, 0x8230

    if-ne v0, v3, :cond_3

    goto :goto_0

    :cond_3
    move v0, v2

    goto :goto_1

    :cond_4
    :goto_0
    const/4 v0, 0x2

    .line 75
    :goto_1
    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->internalFormat:I

    const v3, 0x822d

    if-eq v2, v3, :cond_5

    const v3, 0x822e

    if-ne v2, v3, :cond_7

    :cond_5
    const/4 v0, 0x1

    goto :goto_2

    :cond_6
    const/4 v0, 0x4

    .line 77
    :cond_7
    :goto_2
    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->width:I

    iget v3, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->height:I

    mul-int v2, v2, v3

    mul-int v2, v2, v0

    invoke-static {v2}, Lcom/badlogic/gdx/utils/BufferUtils;->newFloatBuffer(I)Ljava/nio/FloatBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->buffer:Ljava/nio/FloatBuffer;

    .line 79
    :cond_8
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/FloatTextureData;->isPrepared:Z

    return-void

    .line 68
    :cond_9
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Already prepared"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public useMipMaps()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
