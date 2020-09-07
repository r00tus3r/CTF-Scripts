.class public Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;
.super Ljava/lang/Object;
.source "Encoder.java"


# static fields
.field private static ProbPrices:[I = null

.field static final kBitModelTotal:I = 0x800

.field static final kNumBitModelTotalBits:I = 0xb

.field public static final kNumBitPriceShiftBits:I = 0x6

.field static final kNumMoveBits:I = 0x5

.field static final kNumMoveReducingBits:I = 0x2

.field static final kTopMask:I = -0x1000000


# instance fields
.field Low:J

.field Range:I

.field Stream:Ljava/io/OutputStream;

.field _cache:I

.field _cacheSize:I

.field _position:J


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const/16 v0, 0x200

    .line 117
    new-array v0, v0, [I

    sput-object v0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->ProbPrices:[I

    const/16 v0, 0x8

    :goto_0
    if-ltz v0, :cond_1

    rsub-int/lit8 v1, v0, 0x9

    add-int/lit8 v2, v1, -0x1

    const/4 v3, 0x1

    shl-int v4, v3, v2

    shl-int v1, v3, v1

    :goto_1
    if-ge v4, v1, :cond_0

    .line 125
    sget-object v3, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->ProbPrices:[I

    shl-int/lit8 v5, v0, 0x6

    sub-int v6, v1, v4

    shl-int/lit8 v6, v6, 0x6

    ushr-int/2addr v6, v2

    add-int/2addr v5, v6

    aput v5, v3, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static GetPrice(II)I
    .locals 1

    .line 130
    sget-object v0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->ProbPrices:[I

    sub-int/2addr p0, p1

    neg-int p1, p1

    xor-int/2addr p0, p1

    and-int/lit16 p0, p0, 0x7ff

    ushr-int/lit8 p0, p0, 0x2

    aget p0, v0, p0

    return p0
.end method

.method public static GetPrice0(I)I
    .locals 1

    .line 134
    sget-object v0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->ProbPrices:[I

    ushr-int/lit8 p0, p0, 0x2

    aget p0, v0, p0

    return p0
.end method

.method public static GetPrice1(I)I
    .locals 1

    .line 138
    sget-object v0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->ProbPrices:[I

    rsub-int p0, p0, 0x800

    ushr-int/lit8 p0, p0, 0x2

    aget p0, v0, p0

    return p0
.end method

.method public static InitBitModels([S)V
    .locals 2

    const/4 v0, 0x0

    .line 96
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    const/16 v1, 0x400

    .line 97
    aput-short v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public Encode([SII)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    aget-short v0, p1, p2

    .line 102
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    ushr-int/lit8 v2, v1, 0xb

    mul-int v2, v2, v0

    if-nez p3, :cond_0

    .line 104
    iput v2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    rsub-int p3, v0, 0x800

    ushr-int/lit8 p3, p3, 0x5

    add-int/2addr v0, p3

    int-to-short p3, v0

    .line 105
    aput-short p3, p1, p2

    goto :goto_0

    .line 107
    :cond_0
    iget-wide v3, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    int-to-long v5, v2

    const-wide v7, 0xffffffffL

    and-long/2addr v5, v7

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    sub-int/2addr v1, v2

    .line 108
    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    ushr-int/lit8 p3, v0, 0x5

    sub-int/2addr v0, p3

    int-to-short p3, v0

    .line 109
    aput-short p3, p1, p2

    .line 111
    :goto_0
    iget p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    const/high16 p2, -0x1000000

    and-int/2addr p2, p1

    if-nez p2, :cond_1

    shl-int/lit8 p1, p1, 0x8

    .line 112
    iput p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    .line 113
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->ShiftLow()V

    :cond_1
    return-void
.end method

.method public EncodeDirectBits(II)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    sub-int/2addr p2, v0

    :goto_0
    if-ltz p2, :cond_2

    .line 79
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    ushr-int/2addr v1, v0

    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    ushr-int v1, p1, p2

    and-int/2addr v1, v0

    if-ne v1, v0, :cond_0

    .line 80
    iget-wide v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    iget v3, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    int-to-long v3, v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    .line 81
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    const/high16 v2, -0x1000000

    and-int/2addr v2, v1

    if-nez v2, :cond_1

    shl-int/lit8 v1, v1, 0x8

    .line 82
    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    .line 83
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->ShiftLow()V

    :cond_1
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public FlushData()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->ShiftLow()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public FlushStream()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Stream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method public GetProcessedSizeAdd()J
    .locals 4

    .line 89
    iget v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cacheSize:I

    int-to-long v0, v0

    iget-wide v2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_position:J

    add-long/2addr v0, v2

    const-wide/16 v2, 0x4

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public Init()V
    .locals 2

    const-wide/16 v0, 0x0

    .line 46
    iput-wide v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_position:J

    .line 47
    iput-wide v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    const/4 v0, -0x1

    .line 48
    iput v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Range:I

    const/4 v0, 0x1

    .line 49
    iput v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cacheSize:I

    const/4 v0, 0x0

    .line 50
    iput v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cache:I

    return-void
.end method

.method public ReleaseStream()V
    .locals 1

    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Stream:Ljava/io/OutputStream;

    return-void
.end method

.method public SetStream(Ljava/io/OutputStream;)V
    .locals 0

    .line 38
    iput-object p1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Stream:Ljava/io/OutputStream;

    return-void
.end method

.method public ShiftLow()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    iget-wide v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    const/16 v2, 0x20

    ushr-long v2, v0, v2

    long-to-int v3, v2

    if-nez v3, :cond_0

    const-wide v4, 0xff000000L

    cmp-long v2, v0, v4

    if-gez v2, :cond_2

    .line 65
    :cond_0
    iget-wide v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_position:J

    iget v2, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cacheSize:I

    int-to-long v4, v2

    add-long/2addr v0, v4

    iput-wide v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_position:J

    .line 66
    iget v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cache:I

    .line 68
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Stream:Ljava/io/OutputStream;

    add-int/2addr v0, v3

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write(I)V

    const/16 v0, 0xff

    .line 70
    iget v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cacheSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cacheSize:I

    if-nez v1, :cond_1

    .line 71
    iget-wide v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    long-to-int v1, v0

    ushr-int/lit8 v0, v1, 0x18

    iput v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cache:I

    .line 73
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cacheSize:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->_cacheSize:I

    .line 74
    iget-wide v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    const-wide/32 v2, 0xffffff

    and-long/2addr v0, v2

    const/16 v2, 0x8

    shl-long/2addr v0, v2

    iput-wide v0, p0, Lcom/badlogic/gdx/utils/compression/rangecoder/Encoder;->Low:J

    return-void
.end method
