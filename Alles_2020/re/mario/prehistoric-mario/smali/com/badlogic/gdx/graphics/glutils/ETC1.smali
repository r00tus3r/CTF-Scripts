.class public Lcom/badlogic/gdx/graphics/glutils/ETC1;
.super Ljava/lang/Object;
.source "ETC1.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;
    }
.end annotation


# static fields
.field public static ETC1_RGB8_OES:I = 0x8d64

.field public static PKM_HEADER_SIZE:I = 0x10


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decodeImage(Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;Lcom/badlogic/gdx/graphics/Pixmap$Format;)Lcom/badlogic/gdx/graphics/Pixmap;
    .locals 10

    .line 179
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;->hasPKMHeader()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/16 v0, 0x10

    .line 181
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;->compressedData:Ljava/nio/ByteBuffer;

    invoke-static {v2, v1}, Lcom/badlogic/gdx/graphics/glutils/ETC1;->getWidthPKM(Ljava/nio/ByteBuffer;I)I

    move-result v2

    .line 182
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;->compressedData:Ljava/nio/ByteBuffer;

    invoke-static {v3, v1}, Lcom/badlogic/gdx/graphics/glutils/ETC1;->getHeightPKM(Ljava/nio/ByteBuffer;I)I

    move-result v1

    move v8, v1

    move v7, v2

    const/16 v4, 0x10

    goto :goto_0

    .line 185
    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;->width:I

    .line 186
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;->height:I

    move v8, v0

    move v7, v2

    const/4 v4, 0x0

    .line 189
    :goto_0
    invoke-static {p1}, Lcom/badlogic/gdx/graphics/glutils/ETC1;->getPixelSize(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I

    move-result v9

    .line 190
    new-instance v0, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-direct {v0, v7, v8, p1}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 191
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;->compressedData:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v5

    const/4 v6, 0x0

    invoke-static/range {v3 .. v9}, Lcom/badlogic/gdx/graphics/glutils/ETC1;->decodeImage(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIII)V

    return-object v0
.end method

.method private static native decodeImage(Ljava/nio/ByteBuffer;ILjava/nio/ByteBuffer;IIII)V
.end method

.method public static encodeImage(Lcom/badlogic/gdx/graphics/Pixmap;)Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;
    .locals 5

    .line 152
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/glutils/ETC1;->getPixelSize(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I

    move-result v0

    .line 153
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v1, v4, v2, v3, v0}, Lcom/badlogic/gdx/graphics/glutils/ETC1;->encodeImage(Ljava/nio/ByteBuffer;IIII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 154
    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 155
    new-instance v1, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result p0

    invoke-direct {v1, v2, p0, v0, v4}, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;-><init>(IILjava/nio/ByteBuffer;I)V

    return-object v1
.end method

.method private static native encodeImage(Ljava/nio/ByteBuffer;IIII)Ljava/nio/ByteBuffer;
.end method

.method public static encodeImagePKM(Lcom/badlogic/gdx/graphics/Pixmap;)Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;
    .locals 5

    .line 163
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/glutils/ETC1;->getPixelSize(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I

    move-result v0

    .line 164
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v1, v4, v2, v3, v0}, Lcom/badlogic/gdx/graphics/glutils/ETC1;->encodeImagePKM(Ljava/nio/ByteBuffer;IIII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 165
    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 166
    new-instance v1, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result p0

    const/16 v3, 0x10

    invoke-direct {v1, v2, p0, v0, v3}, Lcom/badlogic/gdx/graphics/glutils/ETC1$ETC1Data;-><init>(IILjava/nio/ByteBuffer;I)V

    return-object v1
.end method

.method private static native encodeImagePKM(Ljava/nio/ByteBuffer;IIII)Ljava/nio/ByteBuffer;
.end method

.method public static native formatHeader(Ljava/nio/ByteBuffer;III)V
.end method

.method public static native getCompressedDataSize(II)I
.end method

.method static native getHeightPKM(Ljava/nio/ByteBuffer;I)I
.end method

.method private static getPixelSize(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I
    .locals 1

    .line 143
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGB565:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x2

    return p0

    .line 144
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGB888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    if-ne p0, v0, :cond_1

    const/4 p0, 0x3

    return p0

    .line 145
    :cond_1
    new-instance p0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Can only handle RGB565 or RGB888 images"

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static native getWidthPKM(Ljava/nio/ByteBuffer;I)I
.end method

.method static native isValidPKM(Ljava/nio/ByteBuffer;I)Z
.end method
