.class public Lcom/badlogic/gdx/math/RandomXS128;
.super Ljava/util/Random;
.source "RandomXS128.java"


# static fields
.field private static final NORM_DOUBLE:D = 1.1102230246251565E-16

.field private static final NORM_FLOAT:D = 5.9604644775390625E-8


# instance fields
.field private seed0:J

.field private seed1:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 48
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 49
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/math/RandomXS128;->setSeed(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 55
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/math/RandomXS128;->setSeed(J)V

    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/util/Random;-><init>()V

    .line 62
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/RandomXS128;->setState(JJ)V

    return-void
.end method

.method private static final murmurHash3(J)J
    .locals 3

    const/16 v0, 0x21

    ushr-long v1, p0, v0

    xor-long/2addr p0, v1

    const-wide v1, -0xae502812aa7333L

    mul-long p0, p0, v1

    ushr-long v1, p0, v0

    xor-long/2addr p0, v1

    const-wide v1, -0x3b314601e57a13adL    # -2.902039044684214E23

    mul-long p0, p0, v1

    ushr-long v0, p0, v0

    xor-long/2addr p0, v0

    return-wide p0
.end method


# virtual methods
.method public getState(I)J
    .locals 2

    if-nez p1, :cond_0

    .line 184
    iget-wide v0, p0, Lcom/badlogic/gdx/math/RandomXS128;->seed0:J

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/badlogic/gdx/math/RandomXS128;->seed1:J

    :goto_0
    return-wide v0
.end method

.method protected final next(I)I
    .locals 6

    .line 80
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/RandomXS128;->nextLong()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    shl-long v4, v2, p1

    sub-long/2addr v4, v2

    and-long/2addr v0, v4

    long-to-int p1, v0

    return p1
.end method

.method public nextBoolean()Z
    .locals 5

    .line 141
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/RandomXS128;->nextLong()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public nextBytes([B)V
    .locals 6

    .line 151
    array-length v0, p1

    :cond_0
    if-eqz v0, :cond_2

    const/16 v1, 0x8

    if-ge v0, v1, :cond_1

    move v2, v0

    goto :goto_0

    :cond_1
    const/16 v2, 0x8

    .line 154
    :goto_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/RandomXS128;->nextLong()J

    move-result-wide v3

    :goto_1
    add-int/lit8 v5, v2, -0x1

    if-eqz v2, :cond_0

    add-int/lit8 v0, v0, -0x1

    long-to-int v2, v3

    int-to-byte v2, v2

    .line 155
    aput-byte v2, p1, v0

    shr-long/2addr v3, v1

    move v2, v5

    goto :goto_1

    :cond_2
    return-void
.end method

.method public nextDouble()D
    .locals 4

    .line 124
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/RandomXS128;->nextLong()J

    move-result-wide v0

    const/16 v2, 0xb

    ushr-long/2addr v0, v2

    long-to-double v0, v0

    const-wide/high16 v2, 0x3ca0000000000000L

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    return-wide v0
.end method

.method public nextFloat()F
    .locals 4

    .line 133
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/RandomXS128;->nextLong()J

    move-result-wide v0

    const/16 v2, 0x28

    ushr-long/2addr v0, v2

    long-to-double v0, v0

    const-wide/high16 v2, 0x3e70000000000000L    # 5.9604644775390625E-8

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    double-to-float v0, v0

    return v0
.end method

.method public nextInt()I
    .locals 2

    .line 88
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/RandomXS128;->nextLong()J

    move-result-wide v0

    long-to-int v1, v0

    return v1
.end method

.method public nextInt(I)I
    .locals 2

    int-to-long v0, p1

    .line 99
    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/math/RandomXS128;->nextLong(J)J

    move-result-wide v0

    long-to-int p1, v0

    return p1
.end method

.method public nextLong()J
    .locals 7

    .line 70
    iget-wide v0, p0, Lcom/badlogic/gdx/math/RandomXS128;->seed0:J

    .line 71
    iget-wide v2, p0, Lcom/badlogic/gdx/math/RandomXS128;->seed1:J

    .line 72
    iput-wide v2, p0, Lcom/badlogic/gdx/math/RandomXS128;->seed0:J

    const/16 v4, 0x17

    shl-long v4, v0, v4

    xor-long/2addr v0, v4

    xor-long v4, v0, v2

    const/16 v6, 0x11

    ushr-long/2addr v0, v6

    xor-long/2addr v0, v4

    const/16 v4, 0x1a

    ushr-long v4, v2, v4

    xor-long/2addr v0, v4

    .line 74
    iput-wide v0, p0, Lcom/badlogic/gdx/math/RandomXS128;->seed1:J

    add-long/2addr v0, v2

    return-wide v0
.end method

.method public nextLong(J)J
    .locals 8

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_1

    .line 112
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/RandomXS128;->nextLong()J

    move-result-wide v2

    const/4 v4, 0x1

    ushr-long/2addr v2, v4

    .line 113
    rem-long v4, v2, p1

    sub-long/2addr v2, v4

    const-wide/16 v6, 0x1

    sub-long v6, p1, v6

    add-long/2addr v2, v6

    cmp-long v6, v2, v0

    if-ltz v6, :cond_0

    return-wide v4

    .line 110
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "n must be positive"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :goto_0
    throw p1

    :goto_1
    goto :goto_0
.end method

.method public setSeed(J)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    const-wide/high16 p1, -0x8000000000000000L

    .line 166
    :cond_0
    invoke-static {p1, p2}, Lcom/badlogic/gdx/math/RandomXS128;->murmurHash3(J)J

    move-result-wide p1

    .line 167
    invoke-static {p1, p2}, Lcom/badlogic/gdx/math/RandomXS128;->murmurHash3(J)J

    move-result-wide v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/badlogic/gdx/math/RandomXS128;->setState(JJ)V

    return-void
.end method

.method public setState(JJ)V
    .locals 0

    .line 174
    iput-wide p1, p0, Lcom/badlogic/gdx/math/RandomXS128;->seed0:J

    .line 175
    iput-wide p3, p0, Lcom/badlogic/gdx/math/RandomXS128;->seed1:J

    return-void
.end method
