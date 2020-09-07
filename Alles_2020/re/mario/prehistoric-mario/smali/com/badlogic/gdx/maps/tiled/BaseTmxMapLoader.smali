.class public abstract Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "BaseTmxMapLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;",
        ">",
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/maps/tiled/TiledMap;",
        "TP;>;"
    }
.end annotation


# static fields
.field protected static final FLAG_FLIP_DIAGONALLY:I = 0x20000000

.field protected static final FLAG_FLIP_HORIZONTALLY:I = -0x80000000

.field protected static final FLAG_FLIP_VERTICALLY:I = 0x40000000

.field protected static final MASK_CLEAR:I = -0x20000000


# instance fields
.field protected convertObjectToTileSpace:Z

.field protected flipY:Z

.field protected map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

.field protected mapHeightInPixels:I

.field protected mapTileHeight:I

.field protected mapTileWidth:I

.field protected mapWidthInPixels:I

.field protected root:Lcom/badlogic/gdx/utils/XmlReader$Element;

.field protected xml:Lcom/badlogic/gdx/utils/XmlReader;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 56
    new-instance p1, Lcom/badlogic/gdx/utils/XmlReader;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/XmlReader;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->xml:Lcom/badlogic/gdx/utils/XmlReader;

    const/4 p1, 0x1

    .line 59
    iput-boolean p1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    return-void
.end method

.method private castProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 2

    if-nez p3, :cond_0

    return-object p2

    :cond_0
    const-string v0, "int"

    .line 432
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 433
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :cond_1
    const-string v0, "float"

    .line 434
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 435
    invoke-static {p2}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object p1

    return-object p1

    :cond_2
    const-string v0, "bool"

    .line 436
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 437
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_3
    const-string v0, "color"

    .line 438
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 p1, 0x3

    .line 440
    invoke-virtual {p2, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x1

    .line 441
    invoke-virtual {p2, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 442
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/badlogic/gdx/graphics/Color;->valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Color;

    move-result-object p1

    return-object p1

    .line 444
    :cond_4
    new-instance p2, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Wrong type given for property "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", given : "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ", supported : string, bool, int, float, color"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method protected static getRelativeFileHandle(Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
    .locals 2

    .line 531
    new-instance v0, Ljava/util/StringTokenizer;

    const-string v1, "\\/"

    invoke-direct {v0, p1, v1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 532
    invoke-virtual {p0}, Lcom/badlogic/gdx/files/FileHandle;->parent()Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p0

    .line 533
    :goto_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->hasMoreElements()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 534
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object p1

    const-string v1, ".."

    .line 535
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 536
    invoke-virtual {p0}, Lcom/badlogic/gdx/files/FileHandle;->parent()Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p0

    goto :goto_0

    .line 538
    :cond_0
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/files/FileHandle;->child(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p0

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public static getTileIds(Lcom/badlogic/gdx/utils/XmlReader$Element;II)[I
    .locals 8

    const-string v0, "data"

    .line 471
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object p0

    const/4 v0, 0x0

    const-string v1, "encoding"

    .line 472
    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_b

    mul-int v2, p1, p2

    .line 476
    new-array v2, v2, [I

    const-string v3, "csv"

    .line 477
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    .line 478
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getText()Ljava/lang/String;

    move-result-object p0

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 479
    :goto_0
    array-length p1, p0

    if-ge v4, p1, :cond_8

    .line 480
    aget-object p1, p0, v4

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    long-to-int p2, p1

    aput p2, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    const-string v3, "base64"

    .line 483
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const-string v5, ") for TMX Layer Data"

    if-eqz v3, :cond_a

    :try_start_0
    const-string v1, "compression"

    .line 486
    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 487
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getText()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/badlogic/gdx/utils/Base64Coder;->decode(Ljava/lang/String;)[B

    move-result-object p0

    if-nez v1, :cond_1

    .line 489
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-direct {v1, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    :goto_1
    move-object v0, v1

    goto :goto_2

    :cond_1
    const-string v3, "gzip"

    .line 490
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 491
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v3, Ljava/util/zip/GZIPInputStream;

    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    array-length p0, p0

    invoke-direct {v3, v5, p0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;I)V

    invoke-direct {v1, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_1

    :cond_2
    const-string v3, "zlib"

    .line 492
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 493
    new-instance v1, Ljava/io/BufferedInputStream;

    new-instance v3, Ljava/util/zip/InflaterInputStream;

    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v3, v5}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v3}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    goto :goto_1

    :goto_2
    const/4 p0, 0x4

    .line 497
    new-array p0, p0, [B

    const/4 v1, 0x0

    :goto_3
    if-ge v1, p2, :cond_7

    const/4 v3, 0x0

    :goto_4
    if-ge v3, p1, :cond_6

    .line 500
    invoke-virtual {v0, p0}, Ljava/io/InputStream;->read([B)I

    move-result v5

    .line 501
    :goto_5
    array-length v6, p0

    if-ge v5, v6, :cond_4

    .line 502
    array-length v6, p0

    sub-int/2addr v6, v5

    invoke-virtual {v0, p0, v5, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_3

    goto :goto_6

    :cond_3
    add-int/2addr v5, v6

    goto :goto_5

    .line 506
    :cond_4
    :goto_6
    array-length v6, p0

    if-ne v5, v6, :cond_5

    mul-int v5, v1, p1

    add-int/2addr v5, v3

    .line 508
    aget-byte v6, p0, v4

    invoke-static {v6}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->unsignedByteToInt(B)I

    move-result v6

    const/4 v7, 0x1

    aget-byte v7, p0, v7

    invoke-static {v7}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->unsignedByteToInt(B)I

    move-result v7

    shl-int/lit8 v7, v7, 0x8

    or-int/2addr v6, v7

    const/4 v7, 0x2

    aget-byte v7, p0, v7

    .line 509
    invoke-static {v7}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->unsignedByteToInt(B)I

    move-result v7

    shl-int/lit8 v7, v7, 0x10

    or-int/2addr v6, v7

    const/4 v7, 0x3

    aget-byte v7, p0, v7

    invoke-static {v7}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->unsignedByteToInt(B)I

    move-result v7

    shl-int/lit8 v7, v7, 0x18

    or-int/2addr v6, v7

    aput v6, v2, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    .line 507
    :cond_5
    new-instance p0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p1, "Error Reading TMX Layer Data: Premature end of tile data"

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_6
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 515
    :cond_7
    invoke-static {v0}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    :cond_8
    return-object v2

    .line 495
    :cond_9
    :try_start_1
    new-instance p0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Unrecognised compression ("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    goto :goto_7

    :catch_0
    move-exception p0

    .line 513
    :try_start_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error Reading TMX Layer Data - IOException: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 515
    :goto_7
    invoke-static {v0}, Lcom/badlogic/gdx/utils/StreamUtils;->closeQuietly(Ljava/io/Closeable;)V

    throw p0

    .line 520
    :cond_a
    new-instance p0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Unrecognised encoding ("

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 474
    :cond_b
    new-instance p0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p1, "Unsupported encoding (XML) for TMX Layer Data"

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_9

    :goto_8
    throw p0

    :goto_9
    goto :goto_8
.end method

.method protected static unsignedByteToInt(B)I
    .locals 0

    and-int/lit16 p0, p0, 0xff

    return p0
.end method


# virtual methods
.method protected addAnimatedTile(Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;Lcom/badlogic/gdx/maps/tiled/TiledMapTile;Lcom/badlogic/gdx/utils/XmlReader$Element;I)V
    .locals 4

    const-string v0, "animation"

    .line 651
    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object p3

    if-eqz p3, :cond_1

    .line 653
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 654
    new-instance v1, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    const-string v2, "frame"

    .line 655
    invoke-virtual {p3, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p3

    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v3, "tileid"

    .line 656
    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;)I

    move-result v3

    add-int/2addr v3, p4

    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;->getTile(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    const-string v3, "duration"

    .line 657
    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_0

    .line 660
    :cond_0
    new-instance p3, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;

    invoke-direct {p3, v1, v0}, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;-><init>(Lcom/badlogic/gdx/utils/IntArray;Lcom/badlogic/gdx/utils/Array;)V

    .line 661
    invoke-interface {p2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getId()I

    move-result p4

    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/maps/tiled/tiles/AnimatedTiledMapTile;->setId(I)V

    .line 662
    invoke-interface {p2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getId()I

    move-result p2

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;->putTile(ILcom/badlogic/gdx/maps/tiled/TiledMapTile;)V

    :cond_1
    return-void
.end method

.method protected addStaticTiledMapTile(Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;Lcom/badlogic/gdx/graphics/g2d/TextureRegion;IFF)V
    .locals 1

    .line 668
    new-instance v0, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;

    invoke-direct {v0, p2}, Lcom/badlogic/gdx/maps/tiled/tiles/StaticTiledMapTile;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 669
    invoke-interface {v0, p3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->setId(I)V

    .line 670
    invoke-interface {v0, p4}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->setOffsetX(F)V

    .line 671
    iget-boolean p2, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz p2, :cond_0

    neg-float p5, p5

    :cond_0
    invoke-interface {v0, p5}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->setOffsetY(F)V

    .line 672
    invoke-virtual {p1, p3, v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;->putTile(ILcom/badlogic/gdx/maps/tiled/TiledMapTile;)V

    return-void
.end method

.method protected abstract addStaticTiles(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/utils/Array;Ljava/lang/String;IIIIILjava/lang/String;IILjava/lang/String;IILcom/badlogic/gdx/files/FileHandle;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/maps/ImageResolver;",
            "Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;",
            "Lcom/badlogic/gdx/utils/XmlReader$Element;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/utils/XmlReader$Element;",
            ">;",
            "Ljava/lang/String;",
            "IIIII",
            "Ljava/lang/String;",
            "II",
            "Ljava/lang/String;",
            "II",
            "Lcom/badlogic/gdx/files/FileHandle;",
            ")V"
        }
    .end annotation
.end method

.method protected addTileObjectGroup(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    .locals 2

    const-string v0, "objectgroup"

    .line 642
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object p2

    if-eqz p2, :cond_0

    const-string v0, "object"

    .line 644
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/XmlReader$Element;

    .line 645
    iget-object v1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {p0, v1, p1, v0}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadObject(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/tiled/TiledMapTile;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected addTileProperties(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    .locals 4

    const/4 v0, 0x0

    const-string v1, "terrain"

    .line 627
    invoke-virtual {p2, v1, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 629
    invoke-interface {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    const-string v1, "probability"

    .line 631
    invoke-virtual {p2, v1, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 633
    invoke-interface {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    invoke-virtual {v2, v1, v0}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    const-string v0, "properties"

    .line 635
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 637
    invoke-interface {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    :cond_2
    return-void
.end method

.method protected createTileLayerCell(ZZZ)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;
    .locals 2

    .line 450
    new-instance v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;-><init>()V

    if-eqz p3, :cond_3

    const/4 p3, 0x1

    const/4 v1, 0x3

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 453
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setFlipHorizontally(Z)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    .line 454
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setRotation(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    .line 456
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setRotation(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_2

    .line 458
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setRotation(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    goto :goto_0

    .line 460
    :cond_2
    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setFlipVertically(Z)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    .line 461
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setRotation(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    goto :goto_0

    .line 464
    :cond_3
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setFlipHorizontally(Z)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    .line 465
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setFlipVertically(Z)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    :goto_0
    return-object v0
.end method

.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 35
    check-cast p3, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "TP;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    .line 74
    iget-object p1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->xml:Lcom/badlogic/gdx/utils/XmlReader;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/XmlReader;->parse(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    .line 76
    new-instance p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;

    invoke-direct {p1}, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;-><init>()V

    if-eqz p3, :cond_0

    .line 78
    iget-boolean v0, p3, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->generateMipMaps:Z

    iput-boolean v0, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->genMipMaps:Z

    .line 79
    iget-object v0, p3, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->textureMinFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object v0, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 80
    iget-object p3, p3, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->textureMagFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object p3, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 83
    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->getDependencyAssetDescriptors(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method protected abstract getDependencyAssetDescriptors(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;)Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation
.end method

.method protected loadBasicLayerInfo(Lcom/badlogic/gdx/maps/MapLayer;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    .locals 6

    const-string v0, "name"

    const/4 v1, 0x0

    .line 297
    invoke-virtual {p2, v0, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "opacity"

    const-string v2, "1.0"

    .line 298
    invoke-virtual {p2, v1, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    const/4 v2, 0x1

    const-string v3, "visible"

    .line 299
    invoke-virtual {p2, v3, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x0

    const-string v4, "offsetx"

    .line 300
    invoke-virtual {p2, v4, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v4

    const-string v5, "offsety"

    .line 301
    invoke-virtual {p2, v5, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result p2

    .line 303
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/maps/MapLayer;->setName(Ljava/lang/String;)V

    .line 304
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/maps/MapLayer;->setOpacity(F)V

    .line 305
    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/maps/MapLayer;->setVisible(Z)V

    .line 306
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/maps/MapLayer;->setOffsetX(F)V

    .line 307
    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/maps/MapLayer;->setOffsetY(F)V

    return-void
.end method

.method protected loadImageLayer(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V
    .locals 3

    .line 257
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object p1

    const-string v0, "imagelayer"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, "offsetx"

    .line 260
    invoke-virtual {p3, p1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "0"

    if-eqz v0, :cond_0

    .line 261
    invoke-virtual {p3, p1, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    goto :goto_0

    :cond_0
    const-string p1, "x"

    .line 263
    invoke-virtual {p3, p1, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    :goto_0
    const-string v0, "offsety"

    .line 265
    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->hasAttribute(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 266
    invoke-virtual {p3, v0, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    goto :goto_1

    :cond_1
    const-string v0, "y"

    .line 268
    invoke-virtual {p3, v0, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    .line 270
    :goto_1
    iget-boolean v1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapHeightInPixels:I

    int-to-float v1, v1

    sub-float v0, v1, v0

    :cond_2
    const/4 v1, 0x0

    const-string v2, "image"

    .line 274
    invoke-virtual {p3, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v2

    if-eqz v2, :cond_3

    const-string v1, "source"

    .line 277
    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 278
    invoke-static {p4, v1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->getRelativeFileHandle(Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p4

    .line 279
    invoke-virtual {p4}, Lcom/badlogic/gdx/files/FileHandle;->path()Ljava/lang/String;

    move-result-object p4

    invoke-interface {p5, p4}, Lcom/badlogic/gdx/maps/ImageResolver;->getImage(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v1

    .line 280
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result p4

    int-to-float p4, p4

    sub-float/2addr v0, p4

    .line 283
    :cond_3
    new-instance p4, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;

    invoke-direct {p4, v1, p1, v0}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;-><init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;FF)V

    .line 285
    invoke-virtual {p0, p4, p3}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadBasicLayerInfo(Lcom/badlogic/gdx/maps/MapLayer;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    const-string p1, "properties"

    .line 287
    invoke-virtual {p3, p1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object p1

    if-eqz p1, :cond_4

    .line 289
    invoke-virtual {p4}, Lcom/badlogic/gdx/maps/tiled/TiledMapImageLayer;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object p3

    invoke-virtual {p0, p3, p1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    .line 292
    :cond_4
    invoke-virtual {p2, p4}, Lcom/badlogic/gdx/maps/MapLayers;->add(Lcom/badlogic/gdx/maps/MapLayer;)V

    :cond_5
    return-void
.end method

.method protected loadLayer(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V
    .locals 2

    .line 168
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "group"

    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 170
    invoke-virtual/range {p0 .. p5}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadLayerGroup(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V

    goto :goto_0

    :cond_0
    const-string v1, "layer"

    .line 171
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 172
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    goto :goto_0

    :cond_1
    const-string v1, "objectgroup"

    .line 173
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 174
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadObjectGroup(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    goto :goto_0

    :cond_2
    const-string v1, "imagelayer"

    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 176
    invoke-virtual/range {p0 .. p5}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadImageLayer(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V

    :cond_3
    :goto_0
    return-void
.end method

.method protected loadLayerGroup(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V
    .locals 9

    .line 181
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "group"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 182
    new-instance v0, Lcom/badlogic/gdx/maps/MapGroupLayer;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/MapGroupLayer;-><init>()V

    .line 183
    invoke-virtual {p0, v0, p3}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadBasicLayerInfo(Lcom/badlogic/gdx/maps/MapLayer;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    const-string v1, "properties"

    .line 185
    invoke-virtual {p3, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 187
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapGroupLayer;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    :cond_0
    const/4 v1, 0x0

    .line 190
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildCount()I

    move-result v2

    :goto_0
    if-ge v1, v2, :cond_1

    .line 191
    invoke-virtual {p3, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChild(I)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v6

    .line 192
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapGroupLayer;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v5

    move-object v3, p0

    move-object v4, p1

    move-object v7, p4

    move-object v8, p5

    invoke-virtual/range {v3 .. v8}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadLayer(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 195
    :cond_1
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapGroupLayer;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/MapLayers;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/maps/MapLayer;

    .line 196
    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/maps/MapLayer;->setParent(Lcom/badlogic/gdx/maps/MapLayer;)V

    goto :goto_1

    .line 199
    :cond_2
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/maps/MapLayers;->add(Lcom/badlogic/gdx/maps/MapLayer;)V

    :cond_3
    return-void
.end method

.method protected loadObject(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayer;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    .locals 1

    .line 311
    invoke-virtual {p2}, Lcom/badlogic/gdx/maps/MapLayer;->getObjects()Lcom/badlogic/gdx/maps/MapObjects;

    move-result-object p2

    iget v0, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapHeightInPixels:I

    int-to-float v0, v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadObject(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapObjects;Lcom/badlogic/gdx/utils/XmlReader$Element;F)V

    return-void
.end method

.method protected loadObject(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapObjects;Lcom/badlogic/gdx/utils/XmlReader$Element;F)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    .line 319
    invoke-virtual/range {p3 .. p3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "object"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    .line 322
    iget-boolean v2, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->convertObjectToTileSpace:Z

    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v2, :cond_0

    iget v2, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapTileWidth:I

    int-to-float v2, v2

    div-float v2, v3, v2

    goto :goto_0

    :cond_0
    const/high16 v2, 0x3f800000    # 1.0f

    .line 323
    :goto_0
    iget-boolean v4, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->convertObjectToTileSpace:Z

    if-eqz v4, :cond_1

    iget v4, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapTileHeight:I

    int-to-float v4, v4

    div-float/2addr v3, v4

    :cond_1
    const-string v4, "x"

    const/4 v5, 0x0

    .line 325
    invoke-virtual {v1, v4, v5}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v6

    mul-float v6, v6, v2

    .line 326
    iget-boolean v7, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    const-string v8, "y"

    if-eqz v7, :cond_2

    invoke-virtual {v1, v8, v5}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v7

    sub-float v7, p4, v7

    goto :goto_1

    :cond_2
    invoke-virtual {v1, v8, v5}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v7

    :goto_1
    mul-float v7, v7, v3

    const-string v9, "width"

    .line 328
    invoke-virtual {v1, v9, v5}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v10

    mul-float v10, v10, v2

    const-string v11, "height"

    .line 329
    invoke-virtual {v1, v11, v5}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v12

    mul-float v12, v12, v3

    .line 331
    invoke-virtual/range {p3 .. p3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildCount()I

    move-result v13

    if-lez v13, :cond_a

    const-string v13, "polygon"

    .line 333
    invoke-virtual {v1, v13}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v13

    const-string v14, " "

    const-string v5, "points"

    if-eqz v13, :cond_5

    .line 334
    invoke-virtual {v13, v5}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 335
    array-length v13, v5

    mul-int/lit8 v13, v13, 0x2

    new-array v13, v13, [F

    const/4 v14, 0x0

    .line 336
    :goto_2
    array-length v15, v5

    if-ge v14, v15, :cond_4

    .line 337
    aget-object v15, v5, v14

    move-object/from16 v18, v5

    const-string v5, ","

    invoke-virtual {v15, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    mul-int/lit8 v15, v14, 0x2

    const/16 v17, 0x0

    .line 338
    aget-object v19, v5, v17

    invoke-static/range {v19 .. v19}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v19

    mul-float v19, v19, v2

    aput v19, v13, v15

    const/16 v16, 0x1

    add-int/lit8 v15, v15, 0x1

    .line 339
    aget-object v5, v5, v16

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    mul-float v5, v5, v3

    move-object/from16 v19, v8

    iget-boolean v8, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz v8, :cond_3

    const/4 v8, -0x1

    goto :goto_3

    :cond_3
    const/4 v8, 0x1

    :goto_3
    int-to-float v8, v8

    mul-float v5, v5, v8

    aput v5, v13, v15

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v5, v18

    move-object/from16 v8, v19

    goto :goto_2

    :cond_4
    move-object/from16 v19, v8

    .line 341
    new-instance v5, Lcom/badlogic/gdx/math/Polygon;

    invoke-direct {v5, v13}, Lcom/badlogic/gdx/math/Polygon;-><init>([F)V

    .line 342
    invoke-virtual {v5, v6, v7}, Lcom/badlogic/gdx/math/Polygon;->setPosition(FF)V

    .line 343
    new-instance v14, Lcom/badlogic/gdx/maps/objects/PolygonMapObject;

    invoke-direct {v14, v5}, Lcom/badlogic/gdx/maps/objects/PolygonMapObject;-><init>(Lcom/badlogic/gdx/math/Polygon;)V

    goto/16 :goto_7

    :cond_5
    move-object/from16 v19, v8

    const-string v8, "polyline"

    .line 344
    invoke-virtual {v1, v8}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v8

    if-eqz v8, :cond_8

    .line 345
    invoke-virtual {v8, v5}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 346
    array-length v8, v5

    mul-int/lit8 v8, v8, 0x2

    new-array v8, v8, [F

    const/4 v13, 0x0

    .line 347
    :goto_4
    array-length v14, v5

    if-ge v13, v14, :cond_7

    .line 348
    aget-object v14, v5, v13

    const-string v15, ","

    invoke-virtual {v14, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    mul-int/lit8 v15, v13, 0x2

    const/16 v17, 0x0

    .line 349
    aget-object v18, v14, v17

    invoke-static/range {v18 .. v18}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v18

    mul-float v18, v18, v2

    aput v18, v8, v15

    const/16 v16, 0x1

    add-int/lit8 v15, v15, 0x1

    .line 350
    aget-object v14, v14, v16

    invoke-static {v14}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v14

    mul-float v14, v14, v3

    move-object/from16 v18, v5

    iget-boolean v5, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz v5, :cond_6

    const/4 v5, -0x1

    goto :goto_5

    :cond_6
    const/4 v5, 0x1

    :goto_5
    int-to-float v5, v5

    mul-float v14, v14, v5

    aput v14, v8, v15

    add-int/lit8 v13, v13, 0x1

    move-object/from16 v5, v18

    goto :goto_4

    .line 352
    :cond_7
    new-instance v5, Lcom/badlogic/gdx/math/Polyline;

    invoke-direct {v5, v8}, Lcom/badlogic/gdx/math/Polyline;-><init>([F)V

    .line 353
    invoke-virtual {v5, v6, v7}, Lcom/badlogic/gdx/math/Polyline;->setPosition(FF)V

    .line 354
    new-instance v14, Lcom/badlogic/gdx/maps/objects/PolylineMapObject;

    invoke-direct {v14, v5}, Lcom/badlogic/gdx/maps/objects/PolylineMapObject;-><init>(Lcom/badlogic/gdx/math/Polyline;)V

    goto :goto_7

    :cond_8
    const-string v5, "ellipse"

    .line 355
    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v5

    if-eqz v5, :cond_b

    .line 356
    new-instance v14, Lcom/badlogic/gdx/maps/objects/EllipseMapObject;

    iget-boolean v5, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz v5, :cond_9

    sub-float v5, v7, v12

    goto :goto_6

    :cond_9
    move v5, v7

    :goto_6
    invoke-direct {v14, v6, v5, v10, v12}, Lcom/badlogic/gdx/maps/objects/EllipseMapObject;-><init>(FFFF)V

    goto :goto_7

    :cond_a
    move-object/from16 v19, v8

    :cond_b
    const/4 v14, 0x0

    :goto_7
    const-string v5, "rotation"

    if-nez v14, :cond_11

    const-string v8, "gid"

    const/4 v13, 0x0

    .line 361
    invoke-virtual {v1, v8, v13}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    if-eqz v14, :cond_f

    .line 362
    invoke-static {v14}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v13

    long-to-int v14, v13

    const/high16 v13, -0x80000000

    and-int/2addr v13, v14

    if-eqz v13, :cond_c

    const/4 v13, 0x1

    goto :goto_8

    :cond_c
    const/4 v13, 0x0

    :goto_8
    const/high16 v15, 0x40000000    # 2.0f

    and-int/2addr v15, v14

    if-eqz v15, :cond_d

    move-object/from16 v18, v4

    const/4 v15, 0x1

    goto :goto_9

    :cond_d
    move-object/from16 v18, v4

    const/4 v15, 0x0

    .line 366
    :goto_9
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getTileSets()Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;

    move-result-object v4

    const v20, 0x1fffffff

    move/from16 v21, v10

    and-int v10, v14, v20

    invoke-virtual {v4, v10}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;->getTile(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v4

    .line 367
    new-instance v10, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;

    invoke-direct {v10, v4, v13, v15}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;-><init>(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;ZZ)V

    .line 368
    invoke-virtual {v10}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v4

    .line 369
    invoke-virtual {v10}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v13

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v13, v8, v14}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 370
    invoke-virtual {v10, v6}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->setX(F)V

    .line 371
    iget-boolean v8, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz v8, :cond_e

    move v8, v7

    goto :goto_a

    :cond_e
    sub-float v8, v7, v12

    :goto_a
    invoke-virtual {v10, v8}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->setY(F)V

    .line 372
    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v1, v9, v8}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v8

    .line 373
    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v13

    int-to-float v13, v13

    invoke-virtual {v1, v11, v13}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v13

    .line 374
    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v14

    int-to-float v14, v14

    div-float/2addr v8, v14

    mul-float v2, v2, v8

    invoke-virtual {v10, v2}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->setScaleX(F)V

    .line 375
    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v13, v2

    mul-float v3, v3, v13

    invoke-virtual {v10, v3}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->setScaleY(F)V

    const/4 v2, 0x0

    .line 376
    invoke-virtual {v1, v5, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getFloatAttribute(Ljava/lang/String;F)F

    move-result v2

    invoke-virtual {v10, v2}, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;->setRotation(F)V

    move-object v14, v10

    move/from16 v10, v21

    goto :goto_c

    :cond_f
    move-object/from16 v18, v4

    move/from16 v21, v10

    .line 379
    new-instance v14, Lcom/badlogic/gdx/maps/objects/RectangleMapObject;

    iget-boolean v2, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz v2, :cond_10

    sub-float v2, v7, v12

    goto :goto_b

    :cond_10
    move v2, v7

    :goto_b
    move/from16 v10, v21

    invoke-direct {v14, v6, v2, v10, v12}, Lcom/badlogic/gdx/maps/objects/RectangleMapObject;-><init>(FFFF)V

    goto :goto_c

    :cond_11
    move-object/from16 v18, v4

    :goto_c
    const-string v2, "name"

    const/4 v3, 0x0

    .line 382
    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v14, v2}, Lcom/badlogic/gdx/maps/MapObject;->setName(Ljava/lang/String;)V

    .line 383
    invoke-virtual {v1, v5, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_12

    .line 385
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-virtual {v4, v5, v2}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_12
    const-string v2, "type"

    .line 387
    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_13

    .line 389
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_13
    const-string v2, "id"

    const/4 v3, 0x0

    .line 391
    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_14

    .line 393
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v5, "id"

    invoke-virtual {v4, v5, v2}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 395
    :cond_14
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v5, v18

    invoke-virtual {v2, v5, v4}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 397
    instance-of v2, v14, Lcom/badlogic/gdx/maps/tiled/objects/TiledMapTileMapObject;

    if-eqz v2, :cond_15

    .line 398
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    move-object/from16 v5, v19

    invoke-virtual {v2, v5, v4}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_d

    :cond_15
    move-object/from16 v5, v19

    .line 400
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    iget-boolean v4, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz v4, :cond_16

    sub-float/2addr v7, v12

    :cond_16
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v2, v5, v4}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 402
    :goto_d
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v2, v9, v4}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 403
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v2, v11, v4}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "visible"

    const/4 v4, 0x1

    .line 404
    invoke-virtual {v1, v2, v4}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v4, :cond_17

    const/4 v3, 0x1

    :cond_17
    invoke-virtual {v14, v3}, Lcom/badlogic/gdx/maps/MapObject;->setVisible(Z)V

    const-string v2, "properties"

    .line 405
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v1

    if-eqz v1, :cond_18

    .line 407
    invoke-virtual {v14}, Lcom/badlogic/gdx/maps/MapObject;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    :cond_18
    move-object/from16 v1, p2

    .line 409
    invoke-virtual {v1, v14}, Lcom/badlogic/gdx/maps/MapObjects;->add(Lcom/badlogic/gdx/maps/MapObject;)V

    :cond_19
    return-void
.end method

.method protected loadObject(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/tiled/TiledMapTile;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    .locals 1

    .line 315
    invoke-interface {p2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getObjects()Lcom/badlogic/gdx/maps/MapObjects;

    move-result-object v0

    invoke-interface {p2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile;->getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p0, p1, v0, p3, p2}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadObject(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapObjects;Lcom/badlogic/gdx/utils/XmlReader$Element;F)V

    return-void
.end method

.method protected loadObjectGroup(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    .locals 3

    .line 240
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "objectgroup"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 241
    new-instance v0, Lcom/badlogic/gdx/maps/MapLayer;

    invoke-direct {v0}, Lcom/badlogic/gdx/maps/MapLayer;-><init>()V

    .line 242
    invoke-virtual {p0, v0, p3}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadBasicLayerInfo(Lcom/badlogic/gdx/maps/MapLayer;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    const-string v1, "properties"

    .line 243
    invoke-virtual {p3, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 245
    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/MapLayer;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    :cond_0
    const-string v1, "object"

    .line 248
    invoke-virtual {p3, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p3

    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/XmlReader$Element;

    .line 249
    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadObject(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayer;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    goto :goto_0

    .line 252
    :cond_1
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/maps/MapLayers;->add(Lcom/badlogic/gdx/maps/MapLayer;)V

    :cond_2
    return-void
.end method

.method protected loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    .locals 5

    if-nez p2, :cond_0

    return-void

    .line 415
    :cond_0
    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "properties"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "property"

    .line 416
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/XmlReader$Element;

    const/4 v1, 0x0

    const-string v2, "name"

    .line 417
    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "value"

    .line 418
    invoke-virtual {v0, v3, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "type"

    .line 419
    invoke-virtual {v0, v4, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v3, :cond_1

    .line 421
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getText()Ljava/lang/String;

    move-result-object v3

    .line 423
    :cond_1
    invoke-direct {p0, v2, v3, v1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->castProperty(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 424
    invoke-virtual {p1, v2, v0}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method protected loadTileLayer(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;)V
    .locals 12

    .line 204
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "layer"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 v0, 0x0

    const-string v1, "width"

    .line 205
    invoke-virtual {p3, v1, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v1

    const-string v2, "height"

    .line 206
    invoke-virtual {p3, v2, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v2

    .line 207
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v3

    const-class v4, Ljava/lang/Integer;

    const-string v5, "tilewidth"

    invoke-virtual {v3, v5, v4}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 208
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v4

    const-class v5, Ljava/lang/Integer;

    const-string v6, "tileheight"

    invoke-virtual {v4, v6, v5}, Lcom/badlogic/gdx/maps/MapProperties;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 209
    new-instance v5, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;

    invoke-direct {v5, v1, v2, v3, v4}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;-><init>(IIII)V

    .line 211
    invoke-virtual {p0, v5, p3}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadBasicLayerInfo(Lcom/badlogic/gdx/maps/MapLayer;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    .line 213
    invoke-static {p3, v1, v2}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->getTileIds(Lcom/badlogic/gdx/utils/XmlReader$Element;II)[I

    move-result-object v3

    .line 214
    invoke-virtual {p1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getTileSets()Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;

    move-result-object p1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_6

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v1, :cond_5

    mul-int v7, v4, v1

    add-int/2addr v7, v6

    .line 217
    aget v7, v3, v7

    const/high16 v8, -0x80000000

    and-int/2addr v8, v7

    const/4 v9, 0x1

    if-eqz v8, :cond_0

    const/4 v8, 0x1

    goto :goto_2

    :cond_0
    const/4 v8, 0x0

    :goto_2
    const/high16 v10, 0x40000000    # 2.0f

    and-int/2addr v10, v7

    if-eqz v10, :cond_1

    const/4 v10, 0x1

    goto :goto_3

    :cond_1
    const/4 v10, 0x0

    :goto_3
    const/high16 v11, 0x20000000

    and-int/2addr v11, v7

    if-eqz v11, :cond_2

    goto :goto_4

    :cond_2
    const/4 v9, 0x0

    :goto_4
    const v11, 0x1fffffff

    and-int/2addr v7, v11

    .line 222
    invoke-virtual {p1, v7}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;->getTile(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 224
    invoke-virtual {p0, v8, v10, v9}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->createTileLayerCell(ZZZ)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    move-result-object v8

    .line 225
    invoke-virtual {v8, v7}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;->setTile(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;)Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;

    .line 226
    iget-boolean v7, p0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    if-eqz v7, :cond_3

    add-int/lit8 v7, v2, -0x1

    sub-int/2addr v7, v4

    goto :goto_5

    :cond_3
    move v7, v4

    :goto_5
    invoke-virtual {v5, v6, v7, v8}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->setCell(IILcom/badlogic/gdx/maps/tiled/TiledMapTileLayer$Cell;)V

    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_6
    const-string p1, "properties"

    .line 231
    invoke-virtual {p3, p1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 233
    invoke-virtual {v5}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileLayer;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object p3

    invoke-virtual {p0, p3, p1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    .line 235
    :cond_7
    invoke-virtual {p2, v5}, Lcom/badlogic/gdx/maps/MapLayers;->add(Lcom/badlogic/gdx/maps/MapLayer;)V

    :cond_8
    return-void
.end method

.method protected loadTileSet(Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V
    .locals 26

    move-object/from16 v15, p0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 545
    invoke-virtual/range {p1 .. p1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "tileset"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string v2, ""

    const-string v3, "source"

    const/4 v4, 0x0

    .line 551
    invoke-virtual {v0, v3, v4}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    const-string v5, "height"

    const-string v6, "width"

    const-string v7, "image"

    const/4 v14, 0x0

    if-eqz v12, :cond_1

    .line 553
    invoke-static {v1, v12}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->getRelativeFileHandle(Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    .line 555
    :try_start_0
    iget-object v8, v15, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->xml:Lcom/badlogic/gdx/utils/XmlReader;

    invoke-virtual {v8, v0}, Lcom/badlogic/gdx/utils/XmlReader;->parse(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v8

    .line 556
    invoke-virtual {v8, v7}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v7

    if-eqz v7, :cond_0

    .line 558
    invoke-virtual {v7, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 559
    invoke-virtual {v7, v6, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v3

    .line 560
    invoke-virtual {v7, v5, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v5

    .line 561
    invoke-static {v0, v2}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->getRelativeFileHandle(Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/SerializationException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_0
    move-object v0, v4

    const/4 v3, 0x0

    const/4 v5, 0x0

    :goto_0
    move-object/from16 v18, v0

    move-object/from16 v16, v2

    move/from16 v19, v3

    move/from16 v17, v5

    goto :goto_1

    .line 564
    :catch_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Error parsing external tileset."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 567
    :cond_1
    invoke-virtual {v0, v7}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 569
    invoke-virtual {v7, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 570
    invoke-virtual {v7, v6, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v3

    .line 571
    invoke-virtual {v7, v5, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v5

    .line 572
    invoke-static {v1, v2}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->getRelativeFileHandle(Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v6

    move-object v8, v0

    move-object/from16 v16, v2

    move/from16 v19, v3

    move/from16 v17, v5

    move-object/from16 v18, v6

    goto :goto_1

    :cond_2
    move-object v8, v0

    move-object/from16 v16, v2

    move-object/from16 v18, v4

    const/16 v17, 0x0

    const/16 v19, 0x0

    :goto_1
    const-string v0, "name"

    .line 576
    invoke-virtual {v8, v0, v4}, Lcom/badlogic/gdx/utils/XmlReader$Element;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const/4 v0, 0x1

    const-string v2, "firstgid"

    .line 577
    invoke-virtual {v8, v2, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v13

    const-string v0, "tilewidth"

    .line 578
    invoke-virtual {v8, v0, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v9

    const-string v0, "tileheight"

    .line 579
    invoke-virtual {v8, v0, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v10

    const-string v0, "spacing"

    .line 580
    invoke-virtual {v8, v0, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v11

    const-string v0, "margin"

    .line 581
    invoke-virtual {v8, v0, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v20

    const-string v0, "tileoffset"

    .line 583
    invoke-virtual {v8, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v0

    if-eqz v0, :cond_3

    const-string v3, "x"

    .line 587
    invoke-virtual {v0, v3, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v3

    const-string v4, "y"

    .line 588
    invoke-virtual {v0, v4, v14}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v0

    move/from16 v22, v0

    move/from16 v21, v3

    goto :goto_2

    :cond_3
    const/16 v21, 0x0

    const/16 v22, 0x0

    .line 591
    :goto_2
    new-instance v7, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;

    invoke-direct {v7}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;-><init>()V

    .line 594
    invoke-virtual {v7, v6}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;->setName(Ljava/lang/String;)V

    .line 595
    invoke-virtual {v7}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v0

    const-string v3, "properties"

    .line 596
    invoke-virtual {v8, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 598
    invoke-virtual {v15, v0, v3}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    .line 600
    :cond_4
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "tile"

    .line 603
    invoke-virtual {v8, v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/Array;

    move-result-object v23

    move-object/from16 v5, v23

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object v3, v7

    move-object v4, v8

    move-object v8, v7

    move v7, v13

    move-object/from16 v24, v8

    move v8, v9

    move v9, v10

    move v10, v11

    move/from16 v11, v20

    move/from16 v25, v13

    move/from16 v13, v21

    move/from16 v14, v22

    move-object/from16 v15, v16

    move/from16 v16, v19

    .line 605
    invoke-virtual/range {v0 .. v18}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->addStaticTiles(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/utils/Array;Ljava/lang/String;IIIIILjava/lang/String;IILjava/lang/String;IILcom/badlogic/gdx/files/FileHandle;)V

    .line 608
    invoke-virtual/range {v23 .. v23}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v2, "id"

    const/4 v3, 0x0

    .line 609
    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v2

    move/from16 v4, v25

    add-int v13, v4, v2

    move-object/from16 v2, v24

    .line 610
    invoke-virtual {v2, v13}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;->getTile(I)Lcom/badlogic/gdx/maps/tiled/TiledMapTile;

    move-result-object v5

    if-eqz v5, :cond_5

    move-object/from16 v6, p0

    .line 612
    invoke-virtual {v6, v5, v1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->addTileProperties(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    .line 613
    invoke-virtual {v6, v5, v1}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->addTileObjectGroup(Lcom/badlogic/gdx/maps/tiled/TiledMapTile;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    .line 614
    invoke-virtual {v6, v2, v5, v1, v4}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->addAnimatedTile(Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;Lcom/badlogic/gdx/maps/tiled/TiledMapTile;Lcom/badlogic/gdx/utils/XmlReader$Element;I)V

    goto :goto_4

    :cond_5
    move-object/from16 v6, p0

    :goto_4
    move-object/from16 v24, v2

    move/from16 v25, v4

    goto :goto_3

    :cond_6
    move-object/from16 v6, p0

    move-object/from16 v2, v24

    .line 618
    iget-object v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getTileSets()Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTileSets;->addTileSet(Lcom/badlogic/gdx/maps/tiled/TiledMapTileSet;)V

    goto :goto_5

    :cond_7
    move-object v6, v15

    :goto_5
    return-void
.end method

.method protected loadTiledMap(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;Lcom/badlogic/gdx/maps/ImageResolver;)Lcom/badlogic/gdx/maps/tiled/TiledMap;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "TP;",
            "Lcom/badlogic/gdx/maps/ImageResolver;",
            ")",
            "Lcom/badlogic/gdx/maps/tiled/TiledMap;"
        }
    .end annotation

    move-object/from16 v6, p0

    move-object/from16 v0, p2

    .line 97
    new-instance v1, Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-direct {v1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;-><init>()V

    iput-object v1, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 100
    iget-boolean v3, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->convertObjectToTileSpace:Z

    iput-boolean v3, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->convertObjectToTileSpace:Z

    .line 101
    iget-boolean v0, v0, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader$Parameters;->flipY:Z

    iput-boolean v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    goto :goto_0

    .line 103
    :cond_0
    iput-boolean v2, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->convertObjectToTileSpace:Z

    .line 104
    iput-boolean v1, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->flipY:Z

    .line 107
    :goto_0
    iget-object v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v3, "orientation"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 108
    iget-object v5, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v7, "width"

    invoke-virtual {v5, v7, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v5

    .line 109
    iget-object v8, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v9, "height"

    invoke-virtual {v8, v9, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v8

    .line 110
    iget-object v10, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v11, "tilewidth"

    invoke-virtual {v10, v11, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v10

    .line 111
    iget-object v12, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v13, "tileheight"

    invoke-virtual {v12, v13, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v12

    .line 112
    iget-object v14, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v15, "hexsidelength"

    invoke-virtual {v14, v15, v2}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getIntAttribute(Ljava/lang/String;I)I

    move-result v14

    .line 113
    iget-object v2, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v1, "staggeraxis"

    invoke-virtual {v2, v1, v4}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 p2, v1

    .line 114
    iget-object v1, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-object/from16 v16, v2

    const-string v2, "staggerindex"

    invoke-virtual {v1, v2, v4}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v17, v2

    .line 115
    iget-object v2, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-object/from16 v18, v1

    const-string v1, "backgroundcolor"

    invoke-virtual {v2, v1, v4}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 117
    iget-object v4, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v4}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v4

    if-eqz v0, :cond_1

    .line 119
    invoke-virtual {v4, v3, v0}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 121
    :cond_1
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v7, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 122
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v9, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 123
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v11, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 124
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v13, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v15, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz v16, :cond_2

    move-object/from16 v7, p2

    move-object/from16 v3, v16

    .line 127
    invoke-virtual {v4, v7, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    if-eqz v18, :cond_3

    move-object/from16 v7, v17

    move-object/from16 v3, v18

    .line 130
    invoke-virtual {v4, v7, v3}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    if-eqz v2, :cond_4

    .line 133
    invoke-virtual {v4, v1, v2}, Lcom/badlogic/gdx/maps/MapProperties;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 135
    :cond_4
    iput v10, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapTileWidth:I

    .line 136
    iput v12, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapTileHeight:I

    mul-int v5, v5, v10

    .line 137
    iput v5, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapWidthInPixels:I

    mul-int v1, v8, v12

    .line 138
    iput v1, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapHeightInPixels:I

    if-eqz v0, :cond_5

    const-string v1, "staggered"

    .line 141
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x1

    if-le v8, v0, :cond_5

    .line 143
    iget v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapWidthInPixels:I

    div-int/lit8 v10, v10, 0x2

    add-int/2addr v0, v10

    iput v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapWidthInPixels:I

    .line 144
    iget v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapHeightInPixels:I

    div-int/lit8 v0, v0, 0x2

    div-int/lit8 v12, v12, 0x2

    add-int/2addr v0, v12

    iput v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->mapHeightInPixels:I

    .line 149
    :cond_5
    iget-object v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v1, "properties"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v0

    if-eqz v0, :cond_6

    .line 151
    iget-object v1, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getProperties()Lcom/badlogic/gdx/maps/MapProperties;

    move-result-object v1

    invoke-virtual {v6, v1, v0}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadProperties(Lcom/badlogic/gdx/maps/MapProperties;Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    .line 154
    :cond_6
    iget-object v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    const-string v1, "tileset"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Lcom/badlogic/gdx/utils/Array;

    move-result-object v0

    .line 155
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-object/from16 v7, p1

    move-object/from16 v8, p3

    .line 156
    invoke-virtual {v6, v1, v7, v8}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadTileSet(Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V

    .line 157
    iget-object v2, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/XmlReader$Element;->removeChild(Lcom/badlogic/gdx/utils/XmlReader$Element;)V

    goto :goto_1

    :cond_7
    move-object/from16 v7, p1

    move-object/from16 v8, p3

    .line 160
    iget-object v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChildCount()I

    move-result v9

    const/4 v10, 0x0

    :goto_2
    if-ge v10, v9, :cond_8

    .line 161
    iget-object v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->root:Lcom/badlogic/gdx/utils/XmlReader$Element;

    invoke-virtual {v0, v10}, Lcom/badlogic/gdx/utils/XmlReader$Element;->getChild(I)Lcom/badlogic/gdx/utils/XmlReader$Element;

    move-result-object v3

    .line 162
    iget-object v1, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    invoke-virtual {v1}, Lcom/badlogic/gdx/maps/tiled/TiledMap;->getLayers()Lcom/badlogic/gdx/maps/MapLayers;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->loadLayer(Lcom/badlogic/gdx/maps/tiled/TiledMap;Lcom/badlogic/gdx/maps/MapLayers;Lcom/badlogic/gdx/utils/XmlReader$Element;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/maps/ImageResolver;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    .line 164
    :cond_8
    iget-object v0, v6, Lcom/badlogic/gdx/maps/tiled/BaseTmxMapLoader;->map:Lcom/badlogic/gdx/maps/tiled/TiledMap;

    return-object v0
.end method
