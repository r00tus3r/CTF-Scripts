.class public Lcom/badlogic/gdx/graphics/Pixmap;
.super Ljava/lang/Object;
.source "Pixmap.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/Pixmap$Filter;,
        Lcom/badlogic/gdx/graphics/Pixmap$Blending;,
        Lcom/badlogic/gdx/graphics/Pixmap$Format;
    }
.end annotation


# instance fields
.field private blending:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

.field color:I

.field private disposed:Z

.field private filter:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

.field final pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;


# direct methods
.method public constructor <init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V
    .locals 1

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->SourceOver:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->blending:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    .line 91
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Filter;->BiLinear:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->filter:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    const/4 v0, 0x0

    .line 94
    iput v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    .line 118
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-static {p3}, Lcom/badlogic/gdx/graphics/Pixmap$Format;->toGdx2DPixmapFormat(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I

    move-result p3

    invoke-direct {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;-><init>(III)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    const/4 p1, 0x0

    .line 119
    invoke-virtual {p0, p1, p1, p1, p1}, Lcom/badlogic/gdx/graphics/Pixmap;->setColor(FFFF)V

    .line 120
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->fill()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 4

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->SourceOver:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->blending:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    .line 91
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Filter;->BiLinear:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->filter:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    const/4 v0, 0x0

    .line 94
    iput v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    .line 141
    :try_start_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->readBytes()[B

    move-result-object v1

    .line 142
    new-instance v2, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    array-length v3, v1

    invoke-direct {v2, v1, v0, v3, v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;-><init>([BIII)V

    iput-object v2, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 144
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Couldn\'t load file: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;)V
    .locals 1

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->SourceOver:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->blending:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    .line 91
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Filter;->BiLinear:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->filter:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    const/4 v0, 0x0

    .line 94
    iput v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    .line 151
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    return-void
.end method

.method public constructor <init>([BII)V
    .locals 2

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->SourceOver:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->blending:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    .line 91
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Filter;->BiLinear:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->filter:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    const/4 v0, 0x0

    .line 94
    iput v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    .line 129
    :try_start_0
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-direct {v1, p1, p2, p3, v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;-><init>([BIII)V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 131
    new-instance p2, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p3, "Couldn\'t load pixmap from image data"

    invoke-direct {p2, p3, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 311
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->disposed:Z

    if-nez v0, :cond_0

    .line 312
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->dispose()V

    const/4 v0, 0x1

    .line 313
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->disposed:Z

    return-void

    .line 311
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Pixmap already disposed!"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public drawCircle(III)V
    .locals 2

    .line 266
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawCircle(IIII)V

    return-void
.end method

.method public drawLine(IIII)V
    .locals 6

    .line 195
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v5, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawLine(IIIII)V

    return-void
.end method

.method public drawPixel(II)V
    .locals 2

    .line 325
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    invoke-virtual {v0, p1, p2, v1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->setPixel(III)V

    return-void
.end method

.method public drawPixel(III)V
    .locals 1

    .line 334
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->setPixel(III)V

    return-void
.end method

.method public drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;II)V
    .locals 8

    .line 215
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v6

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v7

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;IIIIII)V

    return-void
.end method

.method public drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;IIIIII)V
    .locals 8

    .line 228
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    move v2, p4

    move v3, p5

    move v4, p2

    move v5, p3

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;IIIIII)V

    return-void
.end method

.method public drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;IIIIIIII)V
    .locals 11

    move-object v0, p0

    .line 246
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    move-object v2, p1

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    move v3, p2

    move v4, p3

    move v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    invoke-virtual/range {v1 .. v10}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;IIIIIIII)V

    return-void
.end method

.method public drawRectangle(IIII)V
    .locals 6

    .line 206
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v5, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->drawRect(IIIII)V

    return-void
.end method

.method public fill()V
    .locals 2

    .line 178
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->clear(I)V

    return-void
.end method

.method public fillCircle(III)V
    .locals 2

    .line 275
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->fillCircle(IIII)V

    return-void
.end method

.method public fillRectangle(IIII)V
    .locals 6

    .line 257
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v5, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->fillRect(IIIII)V

    return-void
.end method

.method public fillTriangle(IIIIII)V
    .locals 8

    .line 287
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    iget v7, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->fillTriangle(IIIIIII)V

    return-void
.end method

.method public getBlending()Lcom/badlogic/gdx/graphics/Pixmap$Blending;
    .locals 1

    .line 375
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->blending:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    return-object v0
.end method

.method public getFilter()Lcom/badlogic/gdx/graphics/Pixmap$Filter;
    .locals 1

    .line 380
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->filter:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    return-object v0
.end method

.method public getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;
    .locals 1

    .line 370
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getFormat()I

    move-result v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/Pixmap$Format;->fromGdx2DPixmapFormat(I)Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v0

    return-object v0
.end method

.method public getGLFormat()I
    .locals 1

    .line 341
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getGLFormat()I

    move-result v0

    return v0
.end method

.method public getGLInternalFormat()I
    .locals 1

    .line 348
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getGLInternalFormat()I

    move-result v0

    return v0
.end method

.method public getGLType()I
    .locals 1

    .line 355
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getGLType()I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .locals 1

    .line 306
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getHeight()I

    move-result v0

    return v0
.end method

.method public getPixel(II)I
    .locals 1

    .line 296
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getPixel(II)I

    move-result p1

    return p1
.end method

.method public getPixels()Ljava/nio/ByteBuffer;
    .locals 2

    .line 364
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->disposed:Z

    if-nez v0, :cond_0

    .line 365
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0

    .line 364
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Pixmap already disposed"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getWidth()I
    .locals 1

    .line 301
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->getWidth()I

    move-result v0

    return v0
.end method

.method public isDisposed()Z
    .locals 1

    .line 317
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->disposed:Z

    return v0
.end method

.method public setBlending(Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V
    .locals 2

    .line 101
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->blending:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    .line 102
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    sget-object v1, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->None:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    if-ne p1, v1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->setBlend(I)V

    return-void
.end method

.method public setColor(FFFF)V
    .locals 0

    .line 167
    invoke-static {p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->rgba8888(FFFF)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    return-void
.end method

.method public setColor(I)V
    .locals 0

    .line 157
    iput p1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    .line 173
    iget v0, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v2, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-static {v0, v1, v2, p1}, Lcom/badlogic/gdx/graphics/Color;->rgba8888(FFFF)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->color:I

    return-void
.end method

.method public setFilter(Lcom/badlogic/gdx/graphics/Pixmap$Filter;)V
    .locals 2

    .line 109
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/Pixmap;->filter:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    .line 110
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/Pixmap;->pixmap:Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;

    sget-object v1, Lcom/badlogic/gdx/graphics/Pixmap$Filter;->NearestNeighbour:Lcom/badlogic/gdx/graphics/Pixmap$Filter;

    if-ne p1, v1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/Gdx2DPixmap;->setScale(I)V

    return-void
.end method
