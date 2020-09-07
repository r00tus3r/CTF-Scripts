.class public final Lcom/badlogic/gdx/utils/ScreenUtils;
.super Ljava/lang/Object;
.source "ScreenUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFrameBufferPixels(IIIIZ)[B
    .locals 11

    .line 103
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x1

    const/16 v2, 0xd05

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glPixelStorei(II)V

    mul-int v0, p2, p3

    mul-int/lit8 v0, v0, 0x4

    .line 104
    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->newByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 105
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v7, 0x1908

    const/16 v8, 0x1401

    move v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move-object v9, v10

    invoke-interface/range {v2 .. v9}, Lcom/badlogic/gdx/graphics/GL20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    .line 107
    new-array p0, v0, [B

    if-eqz p4, :cond_0

    mul-int/lit8 p2, p2, 0x4

    const/4 p1, 0x0

    :goto_0
    if-ge p1, p3, :cond_1

    sub-int p4, p3, p1

    sub-int/2addr p4, v1

    mul-int p4, p4, p2

    .line 111
    invoke-virtual {v10, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    mul-int p4, p1, p2

    .line 112
    invoke-virtual {v10, p0, p4, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 115
    :cond_0
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 116
    invoke-virtual {v10, p0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    :cond_1
    return-object p0
.end method

.method public static getFrameBufferPixels(Z)[B
    .locals 3

    .line 89
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getBackBufferWidth()I

    move-result v0

    .line 90
    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getBackBufferHeight()I

    move-result v1

    const/4 v2, 0x0

    .line 91
    invoke-static {v2, v2, v0, v1, p0}, Lcom/badlogic/gdx/utils/ScreenUtils;->getFrameBufferPixels(IIIIZ)[B

    move-result-object p0

    return-object p0
.end method

.method public static getFrameBufferPixmap(IIII)Lcom/badlogic/gdx/graphics/Pixmap;
    .locals 10

    .line 73
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v1, 0xd05

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glPixelStorei(II)V

    .line 75
    new-instance v0, Lcom/badlogic/gdx/graphics/Pixmap;

    sget-object v1, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    invoke-direct {v0, p2, p3, v1}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 76
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v9

    .line 77
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const/16 v7, 0x1908

    const/16 v8, 0x1401

    move v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-interface/range {v2 .. v9}, Lcom/badlogic/gdx/graphics/GL20;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    return-object v0
.end method

.method public static getFrameBufferTexture()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 3

    .line 41
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getBackBufferWidth()I

    move-result v0

    .line 42
    sget-object v1, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v1}, Lcom/badlogic/gdx/Graphics;->getBackBufferHeight()I

    move-result v1

    const/4 v2, 0x0

    .line 43
    invoke-static {v2, v2, v0, v1}, Lcom/badlogic/gdx/utils/ScreenUtils;->getFrameBufferTexture(IIII)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v0

    return-object v0
.end method

.method public static getFrameBufferTexture(IIII)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 7

    .line 57
    invoke-static {p2}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result v0

    .line 58
    invoke-static {p3}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result v1

    .line 60
    invoke-static {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/ScreenUtils;->getFrameBufferPixmap(IIII)Lcom/badlogic/gdx/graphics/Pixmap;

    move-result-object p0

    .line 61
    new-instance p1, Lcom/badlogic/gdx/graphics/Pixmap;

    sget-object v2, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    invoke-direct {p1, v0, v1, v2}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 62
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->None:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/Pixmap;->setBlending(Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V

    const/4 v0, 0x0

    .line 63
    invoke-virtual {p1, p0, v0, v0}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;II)V

    .line 64
    new-instance v2, Lcom/badlogic/gdx/graphics/Texture;

    invoke-direct {v2, p1}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Lcom/badlogic/gdx/graphics/Pixmap;)V

    .line 65
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    neg-int v6, p3

    const/4 v3, 0x0

    move-object v1, v0

    move v4, p3

    move v5, p2

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;IIII)V

    .line 66
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    .line 67
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    return-object v0
.end method
