.class public Lcom/badlogic/gdx/backends/android/ZipResourceFile;
.super Ljava/lang/Object;
.source "ZipResourceFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;
    }
.end annotation


# static fields
.field static final LOGV:Z = false

.field static final LOG_TAG:Ljava/lang/String; = "zipro"

.field static final kCDECRC:I = 0x10

.field static final kCDECommentLen:I = 0x20

.field static final kCDECompLen:I = 0x14

.field static final kCDEExtraLen:I = 0x1e

.field static final kCDELen:I = 0x2e

.field static final kCDELocalOffset:I = 0x2a

.field static final kCDEMethod:I = 0xa

.field static final kCDEModWhen:I = 0xc

.field static final kCDENameLen:I = 0x1c

.field static final kCDESignature:I = 0x2014b50

.field static final kCDEUncompLen:I = 0x18

.field static final kCompressDeflated:I = 0x8

.field static final kCompressStored:I = 0x0

.field static final kEOCDFileOffset:I = 0x10

.field static final kEOCDLen:I = 0x16

.field static final kEOCDNumEntries:I = 0x8

.field static final kEOCDSignature:I = 0x6054b50

.field static final kEOCDSize:I = 0xc

.field static final kLFHExtraLen:I = 0x1c

.field static final kLFHLen:I = 0x1e

.field static final kLFHNameLen:I = 0x1a

.field static final kLFHSignature:I = 0x4034b50

.field static final kMaxCommentLen:I = 0xffff

.field static final kMaxEOCDSearch:I = 0x10015

.field static final kZipEntryAdj:I = 0x2710


# instance fields
.field private mHashMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;",
            ">;"
        }
    .end annotation
.end field

.field mLEByteBuffer:Ljava/nio/ByteBuffer;

.field public mZipFiles:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/io/File;",
            "Ljava/util/zip/ZipFile;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 184
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mHashMap:Ljava/util/HashMap;

    .line 187
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mZipFiles:Ljava/util/HashMap;

    const/4 v0, 0x4

    .line 263
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mLEByteBuffer:Ljava/nio/ByteBuffer;

    .line 190
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->addPatchFile(Ljava/lang/String;)V

    return-void
.end method

.method private static read4LE(Ljava/io/RandomAccessFile;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 267
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readInt()I

    move-result p0

    invoke-static {p0}, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->swapEndian(I)I

    move-result p0

    return p0
.end method

.method private static swapEndian(I)I
    .locals 2

    and-int/lit16 v0, p0, 0xff

    shl-int/lit8 v0, v0, 0x18

    const v1, 0xff00

    and-int/2addr v1, p0

    shl-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    const/high16 v1, 0xff0000

    and-int/2addr v1, p0

    ushr-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    ushr-int/lit8 p0, p0, 0x18

    and-int/lit16 p0, p0, 0xff

    add-int/2addr v0, p0

    return v0
.end method

.method private static swapEndian(S)I
    .locals 2

    and-int/lit16 v0, p0, 0xff

    shl-int/lit8 v0, v0, 0x8

    const v1, 0xff00

    and-int/2addr p0, v1

    ushr-int/lit8 p0, p0, 0x8

    or-int/2addr p0, v0

    return p0
.end method


# virtual methods
.method addPatchFile(Ljava/lang/String;)V
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p1

    .line 275
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 276
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v3, "r"

    invoke-direct {v2, v1, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 277
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    const-wide/16 v5, 0x16

    cmp-long v7, v3, v5

    if-ltz v7, :cond_a

    const-wide/32 v5, 0x10015

    cmp-long v7, v5, v3

    if-lez v7, :cond_0

    move-wide v5, v3

    :cond_0
    const-wide/16 v7, 0x0

    .line 291
    invoke-virtual {v2, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 293
    invoke-static {v2}, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->read4LE(Ljava/io/RandomAccessFile;)I

    move-result v7

    const v8, 0x6054b50

    const-string v9, "zipro"

    if-eq v7, v8, :cond_9

    const v10, 0x4034b50

    if-ne v7, v10, :cond_8

    sub-long v10, v3, v5

    .line 313
    invoke-virtual {v2, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    long-to-int v6, v5

    .line 314
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 315
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    .line 316
    invoke-virtual {v2, v6}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 317
    sget-object v7, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v5, v7}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 328
    array-length v7, v6

    add-int/lit8 v7, v7, -0x16

    :goto_0
    if-ltz v7, :cond_2

    .line 329
    aget-byte v10, v6, v7

    const/16 v11, 0x50

    if-ne v10, v11, :cond_1

    .line 330
    invoke-virtual {v5, v7}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v10

    if-ne v10, v8, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v7, v7, -0x1

    goto :goto_0

    :cond_2
    :goto_1
    if-gez v7, :cond_3

    .line 339
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Zip: EOCD not found, "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " is not zip"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v9, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    add-int/lit8 v6, v7, 0x8

    .line 348
    invoke-virtual {v5, v6}, Ljava/nio/ByteBuffer;->getShort(I)S

    move-result v6

    add-int/lit8 v8, v7, 0xc

    .line 349
    invoke-virtual {v5, v8}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v8

    int-to-long v10, v8

    const-wide v12, 0xffffffffL

    and-long/2addr v10, v12

    add-int/lit8 v8, v7, 0x10

    .line 350
    invoke-virtual {v5, v8}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v5

    int-to-long v14, v5

    and-long/2addr v14, v12

    add-long v16, v14, v10

    const-string v5, ")"

    cmp-long v8, v16, v3

    if-gtz v8, :cond_7

    if-eqz v6, :cond_6

    .line 368
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    sget-object v4, Ljava/nio/channels/FileChannel$MapMode;->READ_ONLY:Ljava/nio/channels/FileChannel$MapMode;

    move-wide v7, v14

    move-object v14, v3

    move-object v15, v4

    move-wide/from16 v16, v7

    move-wide/from16 v18, v10

    invoke-virtual/range {v14 .. v19}, Ljava/nio/channels/FileChannel;->map(Ljava/nio/channels/FileChannel$MapMode;JJ)Ljava/nio/MappedByteBuffer;

    move-result-object v3

    .line 370
    sget-object v4, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v3, v4}, Ljava/nio/MappedByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const v4, 0xffff

    .line 372
    new-array v7, v4, [B

    const/16 v8, 0x1e

    .line 383
    invoke-static {v8}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 384
    sget-object v10, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v8, v10}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v14, 0x0

    :goto_2
    if-ge v11, v6, :cond_5

    .line 387
    invoke-virtual {v3, v14}, Ljava/nio/MappedByteBuffer;->getInt(I)I

    move-result v15

    const v12, 0x2014b50

    if-ne v15, v12, :cond_4

    add-int/lit8 v12, v14, 0x1c

    .line 395
    invoke-virtual {v3, v12}, Ljava/nio/MappedByteBuffer;->getShort(I)S

    move-result v12

    and-int/2addr v12, v4

    add-int/lit8 v13, v14, 0x1e

    .line 396
    invoke-virtual {v3, v13}, Ljava/nio/MappedByteBuffer;->getShort(I)S

    move-result v13

    and-int/2addr v13, v4

    add-int/lit8 v15, v14, 0x20

    .line 397
    invoke-virtual {v3, v15}, Ljava/nio/MappedByteBuffer;->getShort(I)S

    move-result v15

    and-int/2addr v15, v4

    add-int/lit8 v4, v14, 0x2e

    .line 402
    invoke-virtual {v3, v4}, Ljava/nio/MappedByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 403
    invoke-virtual {v3, v7, v10, v12}, Ljava/nio/MappedByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 404
    invoke-virtual {v3, v10}, Ljava/nio/MappedByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 407
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v7, v10, v12}, Ljava/lang/String;-><init>([BII)V

    .line 412
    new-instance v10, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;

    invoke-direct {v10, v0, v1, v4}, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V

    add-int/lit8 v0, v14, 0xa

    .line 413
    invoke-virtual {v3, v0}, Ljava/nio/MappedByteBuffer;->getShort(I)S

    move-result v0

    const v18, 0xffff

    and-int v0, v0, v18

    iput v0, v10, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->mMethod:I

    add-int/lit8 v0, v14, 0xc

    .line 414
    invoke-virtual {v3, v0}, Ljava/nio/MappedByteBuffer;->getInt(I)I

    move-result v0

    move-object/from16 v20, v1

    int-to-long v0, v0

    const-wide v16, 0xffffffffL

    and-long v0, v0, v16

    iput-wide v0, v10, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->mWhenModified:J

    add-int/lit8 v0, v14, 0x10

    .line 415
    invoke-virtual {v3, v0}, Ljava/nio/MappedByteBuffer;->getLong(I)J

    move-result-wide v0

    and-long v0, v0, v16

    iput-wide v0, v10, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->mCRC32:J

    add-int/lit8 v0, v14, 0x14

    .line 416
    invoke-virtual {v3, v0}, Ljava/nio/MappedByteBuffer;->getLong(I)J

    move-result-wide v0

    and-long v0, v0, v16

    iput-wide v0, v10, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->mCompressedLength:J

    add-int/lit8 v0, v14, 0x18

    .line 418
    invoke-virtual {v3, v0}, Ljava/nio/MappedByteBuffer;->getLong(I)J

    move-result-wide v0

    and-long v0, v0, v16

    iput-wide v0, v10, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->mUncompressedLength:J

    add-int/lit8 v0, v14, 0x2a

    .line 420
    invoke-virtual {v3, v0}, Ljava/nio/MappedByteBuffer;->getInt(I)I

    move-result v0

    int-to-long v0, v0

    and-long v0, v0, v16

    iput-wide v0, v10, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->mLocalHdrOffset:J

    .line 424
    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 425
    invoke-virtual {v10, v2, v8}, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->setOffsetFromFile(Ljava/io/RandomAccessFile;Ljava/nio/ByteBuffer;)V

    move-object/from16 v0, p0

    .line 428
    iget-object v1, v0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v1, v4, v10}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v12, v12, 0x2e

    add-int/2addr v12, v13

    add-int/2addr v12, v15

    add-int/2addr v14, v12

    add-int/lit8 v11, v11, 0x1

    move-object/from16 v0, p1

    move-wide/from16 v12, v16

    move-object/from16 v1, v20

    const v4, 0xffff

    const/4 v10, 0x0

    goto/16 :goto_2

    :cond_4
    move-object/from16 v0, p0

    .line 388
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Missed a central dir sig (at "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 390
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    :cond_5
    move-object/from16 v0, p0

    return-void

    :cond_6
    move-object/from16 v0, p0

    const-string v1, "empty archive?"

    .line 359
    invoke-static {v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    :cond_7
    move-object/from16 v0, p0

    move-wide v1, v14

    .line 354
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "bad offsets (dir "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", size "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", eocd "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    :cond_8
    move-object/from16 v0, p0

    const-string v1, "Not a Zip archive"

    .line 298
    invoke-static {v9, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    :cond_9
    move-object/from16 v0, p0

    const-string v1, "Found Zip archive, but it looks empty"

    .line 295
    invoke-static {v9, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    throw v1

    :cond_a
    move-object/from16 v0, p0

    .line 280
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V

    .line 281
    new-instance v1, Ljava/io/IOException;

    invoke-direct {v1}, Ljava/io/IOException;-><init>()V

    goto :goto_4

    :goto_3
    throw v1

    :goto_4
    goto :goto_3
.end method

.method public getAllEntries()[Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;
    .locals 2

    .line 211
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    .line 212
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v1, v1, [Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;

    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;

    return-object v0
.end method

.method public getAssetFileDescriptor(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;

    if-eqz p1, :cond_0

    .line 229
    invoke-virtual {p1}, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->getAssetFileDescriptor()Landroid/content/res/AssetFileDescriptor;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method getEntriesAt(Ljava/lang/String;)[Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;
    .locals 7

    .line 194
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    .line 195
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    if-nez p1, :cond_0

    const-string p1, ""

    .line 198
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 199
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;

    .line 200
    iget-object v4, v3, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->mFileName:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const/4 v4, -0x1

    .line 201
    iget-object v5, v3, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->mFileName:Ljava/lang/String;

    const/16 v6, 0x2f

    invoke-virtual {v5, v6, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    if-ne v4, v5, :cond_1

    .line 202
    invoke-virtual {v0, v3}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 206
    :cond_2
    invoke-virtual {v0}, Ljava/util/Vector;->size()I

    move-result p1

    new-array p1, p1, [Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;

    .line 207
    invoke-virtual {v0, p1}, Ljava/util/Vector;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;

    return-object p1
.end method

.method public getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 244
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;

    if-eqz v0, :cond_2

    .line 246
    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->isUncompressed()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 247
    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->getAssetFileDescriptor()Landroid/content/res/AssetFileDescriptor;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->createInputStream()Ljava/io/FileInputStream;

    move-result-object p1

    return-object p1

    .line 249
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mZipFiles:Ljava/util/HashMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->getZipFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/zip/ZipFile;

    if-nez v1, :cond_1

    .line 252
    new-instance v1, Ljava/util/zip/ZipFile;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->getZipFile()Ljava/io/File;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;I)V

    .line 253
    iget-object v2, p0, Lcom/badlogic/gdx/backends/android/ZipResourceFile;->mZipFiles:Ljava/util/HashMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/ZipResourceFile$ZipEntryRO;->getZipFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    :cond_1
    invoke-virtual {v1, p1}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 257
    invoke-virtual {v1, p1}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method
