.class public Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;
.super Ljava/lang/Object;
.source "Decoder.java"


# static fields
.field static final kBitModelTotal:I = 0x800

.field static final kNumBitModelTotalBits:I = 0xb

.field static final kNumMoveBits:I = 0x5

.field static final kTopMask:I = -0x1000000


# instance fields
.field Code:I

.field Range:I

.field Stream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static InitBitModels([S)V
    .locals 2

    const/4 v0, 0x0

    .line 88
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    const/16 v1, 0x400

    .line 89
    aput-short v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public DecodeBit([SI)I
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    aget-short v0, p1, p2

    .line 66
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    ushr-int/lit8 v2, v1, 0xb

    mul-int v2, v2, v0

    .line 67
    iget v3, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    const/high16 v4, -0x80000000

    xor-int v5, v3, v4

    xor-int/2addr v4, v2

    const/high16 v6, -0x1000000

    if-ge v5, v4, :cond_1

    .line 68
    iput v2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    rsub-int v1, v0, 0x800

    ushr-int/lit8 v1, v1, 0x5

    add-int/2addr v0, v1

    int-to-short v0, v0

    .line 69
    aput-short v0, p1, p2

    .line 70
    iget p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    and-int/2addr p1, v6

    if-nez p1, :cond_0

    shl-int/lit8 p1, v3, 0x8

    .line 71
    iget-object p2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Stream:Ljava/io/InputStream;

    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    move-result p2

    or-int/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    .line 72
    iget p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    shl-int/lit8 p1, p1, 0x8

    iput p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    sub-int/2addr v1, v2

    .line 76
    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    sub-int/2addr v3, v2

    .line 77
    iput v3, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    ushr-int/lit8 v1, v0, 0x5

    sub-int/2addr v0, v1

    int-to-short v0, v0

    .line 78
    aput-short v0, p1, p2

    .line 79
    iget p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    and-int/2addr p1, v6

    if-nez p1, :cond_2

    .line 80
    iget p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    shl-int/lit8 p1, p1, 0x8

    iget-object p2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Stream:Ljava/io/InputStream;

    invoke-virtual {p2}, Ljava/io/InputStream;->read()I

    move-result p2

    or-int/2addr p1, p2

    iput p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    .line 81
    iget p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    shl-int/lit8 p1, p1, 0x8

    iput p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public final DecodeDirectBits(I)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 51
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    ushr-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    .line 52
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    iget v2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    sub-int v3, v1, v2

    ushr-int/lit8 v3, v3, 0x1f

    add-int/lit8 v4, v3, -0x1

    and-int/2addr v4, v2

    sub-int/2addr v1, v4

    .line 53
    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    shl-int/lit8 v0, v0, 0x1

    rsub-int/lit8 v1, v3, 0x1

    or-int/2addr v0, v1

    const/high16 v1, -0x1000000

    and-int/2addr v1, v2

    if-nez v1, :cond_0

    .line 57
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    shl-int/lit8 v1, v1, 0x8

    iget-object v2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Stream:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v2

    or-int/2addr v1, v2

    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    .line 58
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    shl-int/lit8 v1, v1, 0x8

    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    :cond_0
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public final Init()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 42
    iput v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    const/4 v1, -0x1

    .line 43
    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Range:I

    :goto_0
    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    .line 45
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    shl-int/lit8 v1, v1, 0x8

    iget-object v2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Stream:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v2

    or-int/2addr v1, v2

    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Code:I

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final ReleaseStream()V
    .locals 1

    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Stream:Ljava/io/InputStream;

    return-void
.end method

.method public final SetStream(Ljava/io/InputStream;)V
    .locals 0

    .line 34
    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Decoder;->Stream:Ljava/io/InputStream;

    return-void
.end method
