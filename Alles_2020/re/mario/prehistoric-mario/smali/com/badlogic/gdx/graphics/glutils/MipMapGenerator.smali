.class public Lcom/badlogic/gdx/graphics/glutils/MipMapGenerator;
.super Ljava/lang/Object;
.source "MipMapGenerator.java"


# static fields
.field private static useHWMipMap:Z = true


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static generateMipMap(ILcom/badlogic/gdx/graphics/Pixmap;II)V
    .locals 2

    .line 49
    sget-boolean v0, Lcom/badlogic/gdx/graphics/glutils/MipMapGenerator;->useHWMipMap:Z

    if-nez v0, :cond_0

    .line 50
    invoke-static {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/MipMapGenerator;->generateMipMapCPU(ILcom/badlogic/gdx/graphics/Pixmap;II)V

    return-void

    .line 54
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v0}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v0

    sget-object v1, Lcom/badlogic/gdx/Application$ApplicationType;->Android:Lcom/badlogic/gdx/Application$ApplicationType;

    if-eq v0, v1, :cond_2

    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v0}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v0

    sget-object v1, Lcom/badlogic/gdx/Application$ApplicationType;->WebGL:Lcom/badlogic/gdx/Application$ApplicationType;

    if-eq v0, v1, :cond_2

    sget-object v0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    .line 55
    invoke-interface {v0}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v0

    sget-object v1, Lcom/badlogic/gdx/Application$ApplicationType;->iOS:Lcom/badlogic/gdx/Application$ApplicationType;

    if-ne v0, v1, :cond_1

    goto :goto_0

    .line 58
    :cond_1
    invoke-static {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/MipMapGenerator;->generateMipMapDesktop(ILcom/badlogic/gdx/graphics/Pixmap;II)V

    goto :goto_1

    .line 56
    :cond_2
    :goto_0
    invoke-static {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/MipMapGenerator;->generateMipMapGLES20(ILcom/badlogic/gdx/graphics/Pixmap;)V

    :goto_1
    return-void
.end method

.method public static generateMipMap(Lcom/badlogic/gdx/graphics/Pixmap;II)V
    .locals 1

    const/16 v0, 0xde1

    .line 43
    invoke-static {v0, p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/MipMapGenerator;->generateMipMap(ILcom/badlogic/gdx/graphics/Pixmap;II)V

    return-void
.end method

.method private static generateMipMapCPU(ILcom/badlogic/gdx/graphics/Pixmap;II)V
    .locals 23

    .line 80
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLInternalFormat()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v5

    .line 81
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLFormat()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLType()I

    move-result v8

    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v9

    const/4 v2, 0x0

    const/4 v6, 0x0

    move/from16 v1, p0

    .line 80
    invoke-interface/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/GL20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 82
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    if-nez v0, :cond_1

    move/from16 v0, p2

    move/from16 v1, p3

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 83
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "texture width and height must be square when using mipmapping."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 84
    :cond_1
    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    .line 85
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    const/4 v2, 0x1

    move v11, v0

    move v12, v1

    const/4 v1, 0x1

    move-object/from16 v0, p1

    :goto_1
    if-lez v11, :cond_3

    if-lez v12, :cond_3

    .line 88
    new-instance v15, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v3

    invoke-direct {v15, v11, v12, v3}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 89
    sget-object v3, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->None:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    invoke-virtual {v15, v3}, Lcom/badlogic/gdx/graphics/Pixmap;->setBlending(Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 90
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v7

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v3, v15

    move-object v4, v0

    invoke-virtual/range {v3 .. v12}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V

    if-le v1, v2, :cond_2

    .line 91
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    .line 94
    :cond_2
    sget-object v13, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-virtual {v15}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLInternalFormat()I

    move-result v16

    invoke-virtual {v15}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v17

    invoke-virtual {v15}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v18

    const/16 v19, 0x0

    .line 95
    invoke-virtual {v15}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLFormat()I

    move-result v20

    invoke-virtual {v15}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLType()I

    move-result v21

    invoke-virtual {v15}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v22

    move/from16 v14, p0

    move-object v0, v15

    move v15, v1

    .line 94
    invoke-interface/range {v13 .. v22}, Lcom/badlogic/gdx/graphics/GL20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 97
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v3

    div-int/lit8 v11, v3, 0x2

    .line 98
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v3

    div-int/lit8 v12, v3, 0x2

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method private static generateMipMapDesktop(ILcom/badlogic/gdx/graphics/Pixmap;II)V
    .locals 11

    .line 69
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    const-string v1, "GL_ARB_framebuffer_object"

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Graphics;->supportsExtension(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    const-string v1, "GL_EXT_framebuffer_object"

    .line 70
    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Graphics;->supportsExtension(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 75
    :cond_0
    invoke-static {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/MipMapGenerator;->generateMipMapCPU(ILcom/badlogic/gdx/graphics/Pixmap;II)V

    goto :goto_1

    .line 71
    :cond_1
    :goto_0
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLInternalFormat()I

    move-result v4

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v5

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v6

    const/4 v7, 0x0

    .line 72
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLFormat()I

    move-result v8

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLType()I

    move-result v9

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v10

    move v2, p0

    .line 71
    invoke-interface/range {v1 .. v10}, Lcom/badlogic/gdx/graphics/GL20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 73
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p1, p0}, Lcom/badlogic/gdx/graphics/GL20;->glGenerateMipmap(I)V

    :goto_1
    return-void
.end method

.method private static generateMipMapGLES20(ILcom/badlogic/gdx/graphics/Pixmap;)V
    .locals 10

    .line 63
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLInternalFormat()I

    move-result v3

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v5

    .line 64
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLFormat()I

    move-result v7

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLType()I

    move-result v8

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v9

    const/4 v2, 0x0

    const/4 v6, 0x0

    move v1, p0

    .line 63
    invoke-interface/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/GL20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    .line 65
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p1, p0}, Lcom/badlogic/gdx/graphics/GL20;->glGenerateMipmap(I)V

    return-void
.end method

.method public static setUseHardwareMipMap(Z)V
    .locals 0

    .line 36
    sput-boolean p0, Lcom/badlogic/gdx/graphics/glutils/MipMapGenerator;->useHWMipMap:Z

    return-void
.end method
