.class public Lcom/badlogic/gdx/graphics/PixmapIO$PNG;
.super Ljava/lang/Object;
.source "PixmapIO.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/PixmapIO;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PNG"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;
    }
.end annotation


# static fields
.field private static final COLOR_ARGB:B = 0x6t

.field private static final COMPRESSION_DEFLATE:B = 0x0t

.field private static final FILTER_NONE:B = 0x0t

.field private static final IDAT:I = 0x49444154

.field private static final IEND:I = 0x49454e44

.field private static final IHDR:I = 0x49484452

.field private static final INTERLACE_NONE:B = 0x0t

.field private static final PAETH:B = 0x4t

.field private static final SIGNATURE:[B


# instance fields
.field private final buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

.field private curLineBytes:Lcom/badlogic/gdx/utils/ByteArray;

.field private final deflater:Ljava/util/zip/Deflater;

.field private flipY:Z

.field private lastLineLen:I

.field private lineOutBytes:Lcom/badlogic/gdx/utils/ByteArray;

.field private prevLineBytes:Lcom/badlogic/gdx/utils/ByteArray;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    .line 188
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->SIGNATURE:[B

    return-void

    :array_0
    .array-data 1
        -0x77t
        0x50t
        0x4et
        0x47t
        0xdt
        0xat
        0x1at
        0xat
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x4000

    .line 203
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 206
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 199
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->flipY:Z

    .line 207
    new-instance v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    .line 208
    new-instance p1, Ljava/util/zip/Deflater;

    invoke-direct {p1}, Ljava/util/zip/Deflater;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->deflater:Ljava/util/zip/Deflater;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 325
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->end()V

    return-void
.end method

.method public setCompression(I)V
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0, p1}, Ljava/util/zip/Deflater;->setLevel(I)V

    return-void
.end method

.method public setFlipY(Z)V
    .locals 0

    .line 213
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->flipY:Z

    return-void
.end method

.method public write(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 222
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/files/FileHandle;->write(Z)Ljava/io/OutputStream;

    move-result-object p1

    .line 224
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->write(Ljava/io/OutputStream;Lcom/badlogic/gdx/graphics/Pixmap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 226
    invoke-static {p1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    return-void

    :catchall_0
    move-exception p2

    invoke-static {p1}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p2
.end method

.method public write(Ljava/io/OutputStream;Lcom/badlogic/gdx/graphics/Pixmap;)V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 232
    new-instance v1, Ljava/util/zip/DeflaterOutputStream;

    iget-object v2, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    iget-object v3, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->deflater:Ljava/util/zip/Deflater;

    invoke-direct {v1, v2, v3}, Ljava/util/zip/DeflaterOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/zip/Deflater;)V

    .line 233
    new-instance v2, Ljava/io/DataOutputStream;

    move-object/from16 v3, p1

    invoke-direct {v2, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 234
    sget-object v4, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->SIGNATURE:[B

    invoke-virtual {v2, v4}, Ljava/io/DataOutputStream;->write([B)V

    .line 236
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    const v5, 0x49484452

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeInt(I)V

    .line 237
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    invoke-virtual/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeInt(I)V

    .line 238
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    invoke-virtual/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeInt(I)V

    .line 239
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    const/16 v5, 0x8

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeByte(I)V

    .line 240
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    const/4 v5, 0x6

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeByte(I)V

    .line 241
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeByte(I)V

    .line 242
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeByte(I)V

    .line 243
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeByte(I)V

    .line 244
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    invoke-virtual {v4, v2}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->endChunk(Ljava/io/DataOutputStream;)V

    .line 246
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    const v6, 0x49444154    # 803861.25f

    invoke-virtual {v4, v6}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeInt(I)V

    .line 247
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v4}, Ljava/util/zip/Deflater;->reset()V

    .line 249
    invoke-virtual/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v4

    const/4 v6, 0x4

    mul-int/lit8 v4, v4, 0x4

    .line 251
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->lineOutBytes:Lcom/badlogic/gdx/utils/ByteArray;

    if-nez v7, :cond_0

    .line 252
    new-instance v7, Lcom/badlogic/gdx/utils/ByteArray;

    invoke-direct {v7, v4}, Lcom/badlogic/gdx/utils/ByteArray;-><init>(I)V

    iput-object v7, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->lineOutBytes:Lcom/badlogic/gdx/utils/ByteArray;

    iget-object v7, v7, Lcom/badlogic/gdx/utils/ByteArray;->items:[B

    .line 253
    new-instance v8, Lcom/badlogic/gdx/utils/ByteArray;

    invoke-direct {v8, v4}, Lcom/badlogic/gdx/utils/ByteArray;-><init>(I)V

    iput-object v8, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->curLineBytes:Lcom/badlogic/gdx/utils/ByteArray;

    iget-object v8, v8, Lcom/badlogic/gdx/utils/ByteArray;->items:[B

    .line 254
    new-instance v9, Lcom/badlogic/gdx/utils/ByteArray;

    invoke-direct {v9, v4}, Lcom/badlogic/gdx/utils/ByteArray;-><init>(I)V

    iput-object v9, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->prevLineBytes:Lcom/badlogic/gdx/utils/ByteArray;

    iget-object v9, v9, Lcom/badlogic/gdx/utils/ByteArray;->items:[B

    goto :goto_1

    .line 256
    :cond_0
    invoke-virtual {v7, v4}, Lcom/badlogic/gdx/utils/ByteArray;->ensureCapacity(I)[B

    move-result-object v7

    .line 257
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->curLineBytes:Lcom/badlogic/gdx/utils/ByteArray;

    invoke-virtual {v8, v4}, Lcom/badlogic/gdx/utils/ByteArray;->ensureCapacity(I)[B

    move-result-object v8

    .line 258
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->prevLineBytes:Lcom/badlogic/gdx/utils/ByteArray;

    invoke-virtual {v9, v4}, Lcom/badlogic/gdx/utils/ByteArray;->ensureCapacity(I)[B

    move-result-object v9

    .line 259
    iget v10, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->lastLineLen:I

    const/4 v11, 0x0

    :goto_0
    if-ge v11, v10, :cond_1

    .line 260
    aput-byte v5, v9, v11

    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 262
    :cond_1
    :goto_1
    iput v4, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->lastLineLen:I

    .line 264
    invoke-virtual/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v10

    .line 265
    invoke-virtual {v10}, Ljava/nio/ByteBuffer;->position()I

    move-result v11

    .line 266
    invoke-virtual/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v12

    sget-object v13, Lcom/badlogic/gdx/graphics/Pixmap$Format;->RGBA8888:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    const/4 v14, 0x1

    if-ne v12, v13, :cond_2

    const/4 v12, 0x1

    goto :goto_2

    :cond_2
    const/4 v12, 0x0

    .line 267
    :goto_2
    invoke-virtual/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v13

    move-object v15, v9

    move-object v9, v8

    const/4 v8, 0x0

    :goto_3
    if-ge v8, v13, :cond_c

    .line 268
    iget-boolean v6, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->flipY:Z

    if-eqz v6, :cond_3

    sub-int v6, v13, v8

    sub-int/2addr v6, v14

    goto :goto_4

    :cond_3
    move v6, v8

    :goto_4
    if-eqz v12, :cond_5

    mul-int v6, v6, v4

    .line 270
    invoke-virtual {v10, v6}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 271
    invoke-virtual {v10, v9, v5, v4}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    :cond_4
    move/from16 v18, v12

    const/4 v3, 0x0

    goto :goto_6

    :cond_5
    const/4 v14, 0x0

    const/16 v17, 0x0

    .line 273
    :goto_5
    invoke-virtual/range {p2 .. p2}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v5

    if-ge v14, v5, :cond_4

    move-object/from16 v5, p2

    .line 274
    invoke-virtual {v5, v14, v6}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixel(II)I

    move-result v3

    add-int/lit8 v18, v17, 0x1

    shr-int/lit8 v5, v3, 0x18

    and-int/lit16 v5, v5, 0xff

    int-to-byte v5, v5

    .line 275
    aput-byte v5, v9, v17

    add-int/lit8 v5, v18, 0x1

    move/from16 v17, v6

    shr-int/lit8 v6, v3, 0x10

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    .line 276
    aput-byte v6, v9, v18

    add-int/lit8 v6, v5, 0x1

    move/from16 v18, v12

    shr-int/lit8 v12, v3, 0x8

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    .line 277
    aput-byte v12, v9, v5

    add-int/lit8 v5, v6, 0x1

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    .line 278
    aput-byte v3, v9, v6

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v3, p1

    move/from16 v6, v17

    move/from16 v12, v18

    move/from16 v17, v5

    goto :goto_5

    .line 282
    :goto_6
    aget-byte v5, v9, v3

    aget-byte v6, v15, v3

    sub-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v7, v3

    const/4 v3, 0x1

    .line 283
    aget-byte v5, v9, v3

    aget-byte v6, v15, v3

    sub-int/2addr v5, v6

    int-to-byte v5, v5

    aput-byte v5, v7, v3

    const/4 v5, 0x2

    .line 284
    aget-byte v6, v9, v5

    aget-byte v12, v15, v5

    sub-int/2addr v6, v12

    int-to-byte v6, v6

    aput-byte v6, v7, v5

    const/4 v5, 0x3

    .line 285
    aget-byte v6, v9, v5

    aget-byte v12, v15, v5

    sub-int/2addr v6, v12

    int-to-byte v6, v6

    aput-byte v6, v7, v5

    const/4 v5, 0x4

    :goto_7
    if-ge v5, v4, :cond_b

    add-int/lit8 v6, v5, -0x4

    .line 288
    aget-byte v12, v9, v6

    and-int/lit16 v12, v12, 0xff

    .line 289
    aget-byte v14, v15, v5

    and-int/lit16 v14, v14, 0xff

    .line 290
    aget-byte v6, v15, v6

    and-int/lit16 v6, v6, 0xff

    add-int v16, v12, v14

    sub-int v16, v16, v6

    sub-int v3, v16, v12

    if-gez v3, :cond_6

    neg-int v3, v3

    :cond_6
    move/from16 v19, v12

    sub-int v12, v16, v14

    if-gez v12, :cond_7

    neg-int v12, v12

    :cond_7
    move/from16 v20, v13

    sub-int v13, v16, v6

    if-gez v13, :cond_8

    neg-int v13, v13

    :cond_8
    if-gt v3, v12, :cond_9

    if-gt v3, v13, :cond_9

    move/from16 v14, v19

    goto :goto_8

    :cond_9
    if-gt v12, v13, :cond_a

    goto :goto_8

    :cond_a
    move v14, v6

    .line 302
    :goto_8
    aget-byte v3, v9, v5

    sub-int/2addr v3, v14

    int-to-byte v3, v3

    aput-byte v3, v7, v5

    add-int/lit8 v5, v5, 0x1

    move/from16 v13, v20

    const/4 v3, 0x1

    goto :goto_7

    :cond_b
    move/from16 v20, v13

    const/4 v3, 0x4

    .line 305
    invoke-virtual {v1, v3}, Ljava/util/zip/DeflaterOutputStream;->write(I)V

    const/4 v5, 0x0

    .line 306
    invoke-virtual {v1, v7, v5, v4}, Ljava/util/zip/DeflaterOutputStream;->write([BII)V

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v3, p1

    move/from16 v12, v18

    const/4 v6, 0x4

    const/4 v14, 0x1

    move-object/from16 v21, v15

    move-object v15, v9

    move-object/from16 v9, v21

    goto/16 :goto_3

    .line 312
    :cond_c
    invoke-virtual {v10, v11}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 313
    invoke-virtual {v1}, Ljava/util/zip/DeflaterOutputStream;->finish()V

    .line 314
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->endChunk(Ljava/io/DataOutputStream;)V

    .line 316
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    const v3, 0x49454e44    # 808164.25f

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->writeInt(I)V

    .line 317
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/PixmapIO$PNG;->buffer:Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/PixmapIO$PNG$ChunkBuffer;->endChunk(Ljava/io/DataOutputStream;)V

    .line 319
    invoke-virtual/range {p1 .. p1}, Ljava/io/OutputStream;->flush()V

    return-void
.end method
