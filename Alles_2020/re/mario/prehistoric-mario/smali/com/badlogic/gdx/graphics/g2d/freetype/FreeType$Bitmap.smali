.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;
.super Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;
.source "FreeType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Bitmap"
.end annotation


# direct methods
.method constructor <init>(J)V
    .locals 0

    .line 563
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Pointer;-><init>(J)V

    return-void
.end method

.method private static native getBuffer(J)Ljava/nio/ByteBuffer;
.end method

.method private static native getNumGray(J)I
.end method

.method private static native getPitch(J)I
.end method

.method private static native getPixelMode(J)I
.end method

.method private static native getRows(J)I
.end method

.method private static native getWidth(J)I
.end method


# virtual methods
.method public getBuffer()Ljava/nio/ByteBuffer;
    .locals 2

    .line 591
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getRows()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 597
    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->newByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0

    .line 598
    :cond_0
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getBuffer(J)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getNumGray()I
    .locals 2

    .line 649
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getNumGray(J)I

    move-result v0

    return v0
.end method

.method public getPitch()I
    .locals 2

    .line 583
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getPitch(J)I

    move-result v0

    return v0
.end method

.method public getPixelMode()I
    .locals 2

    .line 657
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getPixelMode(J)I

    move-result v0

    return v0
.end method

.method public getPixmap(Lcom/badlogic/gdx/graphics/Pixmap$Format;)Lcom/badlogic/gdx/graphics/Pixmap;
    .locals 1

    .line 605
    sget-object v0, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getPixmap(Lcom/badlogic/gdx/graphics/Pixmap$Format;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Pixmap;

    move-result-object p1

    return-object p1
.end method

.method public getPixmap(Lcom/badlogic/gdx/graphics/Pixmap$Format;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Pixmap;
    .locals 16

    move-object/from16 v0, p1

    .line 609
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getWidth()I

    move-result v1

    .line 610
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 612
    sget-object v3, Lcom/badlogic/gdx/graphics/Color;->WHITE:Lcom/badlogic/gdx/graphics/Color;

    const/4 v4, 0x0

    move-object/from16 v5, p2

    if-ne v5, v3, :cond_0

    .line 613
    new-instance v3, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getRows()I

    move-result v5

    sget-object v6, Lcom/badlogic/gdx/graphics/Pixmap$Format;->Alpha:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    invoke-direct {v3, v1, v5, v6}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 614
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    invoke-static {v2, v1, v5}, Lcom/badlogic/gdx/utils/BufferUtils;->copy(Ljava/nio/Buffer;Ljava/nio/Buffer;I)V

    goto :goto_2

    .line 616
    :cond_0
    new-instance v3, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getRows()I

    move-result v6

    sget-object v7, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    invoke-direct {v3, v1, v6, v7}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 617
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getPitch()I

    move-result v6

    .line 618
    invoke-static/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/Color;->rgba8888(Lcom/badlogic/gdx/graphics/Color;)I

    move-result v5

    .line 619
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->asIntBuffer()Ljava/nio/IntBuffer;

    move-result-object v7

    const/4 v8, 0x0

    .line 620
    :goto_0
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getRows()I

    move-result v9

    if-ge v8, v9, :cond_2

    mul-int v9, v8, v6

    mul-int v10, v8, v1

    const/4 v11, 0x0

    :goto_1
    if-ge v11, v1, :cond_1

    add-int v12, v9, v11

    .line 625
    invoke-virtual {v2, v12}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v12

    add-int v13, v10, v11

    and-int/lit16 v14, v5, -0x100

    and-int/lit16 v15, v5, 0xff

    and-int/lit16 v12, v12, 0xff

    mul-int v15, v15, v12

    int-to-float v12, v15

    const/high16 v15, 0x437f0000    # 255.0f

    div-float/2addr v12, v15

    float-to-int v12, v12

    or-int/2addr v12, v14

    .line 626
    invoke-virtual {v7, v13, v12}, Ljava/nio/IntBuffer;->put(II)Ljava/nio/IntBuffer;

    add-int/lit8 v11, v11, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 632
    :cond_2
    :goto_2
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Pixmap;->getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v1

    if-eq v0, v1, :cond_3

    .line 633
    new-instance v1, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v2

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v5

    invoke-direct {v1, v2, v5, v0}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 634
    invoke-static {}, Lcom/badlogic/gdx/graphics/Pixmap;->getBlending()Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    move-result-object v0

    .line 635
    sget-object v2, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->None:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    invoke-static {v2}, Lcom/badlogic/gdx/graphics/Pixmap;->setBlending(Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V

    .line 636
    invoke-virtual {v1, v3, v4, v4}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;II)V

    .line 637
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->setBlending(Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V

    .line 638
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    goto :goto_3

    :cond_3
    move-object v1, v3

    :goto_3
    return-object v1
.end method

.method public getRows()I
    .locals 2

    .line 567
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getRows(J)I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 2

    .line 575
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->address:J

    invoke-static {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeType$Bitmap;->getWidth(J)I

    move-result v0

    return v0
.end method
