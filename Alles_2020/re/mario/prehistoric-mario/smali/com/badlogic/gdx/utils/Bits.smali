.class public Lcom/badlogic/gdx/utils/Bits;
.super Ljava/lang/Object;
.source "Bits.java"


# instance fields
.field bits:[J


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 27
    new-array v0, v0, [J

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    aput-wide v2, v0, v1

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    return-void
.end method

.method public constructor <init>(I)V
    .locals 4

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 27
    new-array v0, v0, [J

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    aput-wide v2, v0, v1

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    ushr-int/lit8 p1, p1, 0x6

    .line 36
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Bits;->checkCapacity(I)V

    return-void
.end method

.method private checkCapacity(I)V
    .locals 3

    .line 88
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v1, v0

    if-lt p1, v1, :cond_0

    add-int/lit8 p1, p1, 0x1

    .line 89
    new-array p1, p1, [J

    .line 90
    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    iput-object p1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    :cond_0
    return-void
.end method


# virtual methods
.method public and(Lcom/badlogic/gdx/utils/Bits;)V
    .locals 8

    .line 214
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v0, v0

    iget-object v1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-le v0, v1, :cond_0

    .line 216
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v3, v2, v1

    iget-object v5, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v6, v5, v1

    and-long/2addr v3, v6

    aput-wide v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 219
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v1, p1

    if-le v1, v0, :cond_1

    .line 220
    array-length p1, p1

    :goto_1
    if-le p1, v0, :cond_1

    .line 221
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    const-wide/16 v2, 0x0

    aput-wide v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method public andNot(Lcom/badlogic/gdx/utils/Bits;)V
    .locals 11

    .line 230
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v0, v0

    iget-object v1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v1, v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    if-ge v2, v1, :cond_0

    .line 231
    iget-object v3, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v4, v3, v2

    iget-object v6, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v7, v6, v2

    const-wide/16 v9, -0x1

    xor-long/2addr v7, v9

    and-long/2addr v4, v7

    aput-wide v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public clear()V
    .locals 5

    .line 105
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    .line 106
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    const-wide/16 v3, 0x0

    .line 108
    aput-wide v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public clear(I)V
    .locals 8

    ushr-int/lit8 v0, p1, 0x6

    .line 99
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v2, v1

    if-lt v0, v2, :cond_0

    return-void

    .line 100
    :cond_0
    aget-wide v2, v1, v0

    const-wide/16 v4, 0x1

    and-int/lit8 p1, p1, 0x3f

    shl-long/2addr v4, p1

    const-wide/16 v6, -0x1

    xor-long/2addr v4, v6

    and-long/2addr v2, v4

    aput-wide v2, v1, v0

    return-void
.end method

.method public containsAll(Lcom/badlogic/gdx/utils/Bits;)Z
    .locals 10

    .line 296
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    .line 297
    iget-object p1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    .line 298
    array-length v1, p1

    .line 299
    array-length v2, v0

    move v3, v2

    :goto_0
    const/4 v4, 0x0

    if-ge v3, v1, :cond_1

    .line 302
    aget-wide v5, p1, v3

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-eqz v9, :cond_0

    return v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 306
    :cond_1
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_1
    if-ltz v1, :cond_3

    .line 307
    aget-wide v5, v0, v1

    aget-wide v7, p1, v1

    and-long/2addr v5, v7

    aget-wide v7, p1, v1

    cmp-long v3, v5, v7

    if-eqz v3, :cond_2

    return v4

    :cond_2
    add-int/lit8 v1, v1, -0x1

    goto :goto_1

    :cond_3
    return v2
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 10

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 330
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 333
    :cond_2
    check-cast p1, Lcom/badlogic/gdx/utils/Bits;

    .line 334
    iget-object v2, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    .line 336
    iget-object v3, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v3, v3

    array-length v4, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x0

    :goto_0
    if-le v3, v4, :cond_4

    .line 338
    iget-object v5, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v6, v5, v4

    aget-wide v8, v2, v4

    cmp-long v5, v6, v8

    if-eqz v5, :cond_3

    return v1

    :cond_3
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 342
    :cond_4
    iget-object v3, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v3, v3

    array-length v2, v2

    if-ne v3, v2, :cond_5

    return v0

    .line 345
    :cond_5
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/Bits;->length()I

    move-result v2

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Bits;->length()I

    move-result p1

    if-ne v2, p1, :cond_6

    goto :goto_1

    :cond_6
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method public flip(I)V
    .locals 6

    ushr-int/lit8 v0, p1, 0x6

    .line 83
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/Bits;->checkCapacity(I)V

    .line 84
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v2, v1, v0

    and-int/lit8 p1, p1, 0x3f

    const-wide/16 v4, 0x1

    shl-long/2addr v4, p1

    xor-long/2addr v2, v4

    aput-wide v2, v1, v0

    return-void
.end method

.method public get(I)Z
    .locals 6

    ushr-int/lit8 v0, p1, 0x6

    .line 44
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v2, v1

    const/4 v3, 0x0

    if-lt v0, v2, :cond_0

    return v3

    .line 45
    :cond_0
    aget-wide v0, v1, v0

    const-wide/16 v4, 0x1

    and-int/lit8 p1, p1, 0x3f

    shl-long/2addr v4, p1

    and-long/2addr v0, v4

    const-wide/16 v4, 0x0

    cmp-long p1, v0, v4

    if-eqz p1, :cond_1

    const/4 v3, 0x1

    :cond_1
    return v3
.end method

.method public getAndClear(I)Z
    .locals 12

    ushr-int/lit8 v0, p1, 0x6

    .line 54
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v2, v1

    const/4 v3, 0x0

    if-lt v0, v2, :cond_0

    return v3

    .line 55
    :cond_0
    aget-wide v4, v1, v0

    .line 56
    aget-wide v6, v1, v0

    const-wide/16 v8, 0x1

    and-int/lit8 p1, p1, 0x3f

    shl-long/2addr v8, p1

    const-wide/16 v10, -0x1

    xor-long/2addr v8, v10

    and-long/2addr v6, v8

    aput-wide v6, v1, v0

    .line 57
    aget-wide v0, v1, v0

    cmp-long p1, v0, v4

    if-eqz p1, :cond_1

    const/4 v3, 0x1

    :cond_1
    return v3
.end method

.method public getAndSet(I)Z
    .locals 8

    ushr-int/lit8 v0, p1, 0x6

    .line 66
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/Bits;->checkCapacity(I)V

    .line 67
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v2, v1, v0

    .line 68
    aget-wide v4, v1, v0

    and-int/lit8 p1, p1, 0x3f

    const-wide/16 v6, 0x1

    shl-long/2addr v6, p1

    or-long/2addr v4, v6

    aput-wide v4, v1, v0

    .line 69
    aget-wide v0, v1, v0

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public hashCode()I
    .locals 8

    .line 316
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/Bits;->length()I

    move-result v0

    ushr-int/lit8 v0, v0, 0x6

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-lt v0, v1, :cond_0

    mul-int/lit8 v2, v2, 0x7f

    .line 319
    iget-object v3, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v4, v3, v1

    aget-wide v6, v3, v1

    const/16 v3, 0x20

    ushr-long/2addr v6, v3

    xor-long/2addr v4, v6

    long-to-int v3, v4

    add-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return v2
.end method

.method public intersects(Lcom/badlogic/gdx/utils/Bits;)Z
    .locals 8

    .line 280
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    .line 281
    iget-object p1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    .line 282
    array-length v1, v0

    array-length v2, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_0
    if-ltz v1, :cond_1

    .line 283
    aget-wide v3, v0, v1

    aget-wide v5, p1, v1

    and-long/2addr v3, v5

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-eqz v7, :cond_0

    return v2

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public isEmpty()Z
    .locals 9

    .line 143
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    .line 144
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 146
    aget-wide v4, v0, v3

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-eqz v8, :cond_0

    return v2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public length()I
    .locals 10

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    .line 123
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_2

    .line 124
    aget-wide v2, v0, v1

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-eqz v6, :cond_1

    const/16 v6, 0x3f

    :goto_1
    if-ltz v6, :cond_1

    const-wide/16 v7, 0x1

    and-int/lit8 v9, v6, 0x3f

    shl-long/2addr v7, v9

    and-long/2addr v7, v2

    cmp-long v9, v7, v4

    if-eqz v9, :cond_0

    shl-int/lit8 v0, v1, 0x6

    add-int/2addr v0, v6

    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v6, v6, -0x1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method public nextClearBit(I)I
    .locals 13

    .line 185
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    ushr-int/lit8 v1, p1, 0x6

    .line 187
    array-length v2, v0

    if-lt v1, v2, :cond_0

    .line 188
    array-length p1, v0

    :goto_0
    shl-int/lit8 p1, p1, 0x6

    return p1

    .line 189
    :cond_0
    aget-wide v3, v0, v1

    and-int/lit8 p1, p1, 0x3f

    :goto_1
    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x1

    const/16 v9, 0x40

    if-ge p1, v9, :cond_2

    and-int/lit8 v9, p1, 0x3f

    shl-long/2addr v7, v9

    and-long/2addr v7, v3

    cmp-long v9, v7, v5

    if-nez v9, :cond_1

    :goto_2
    shl-int/lit8 v0, v1, 0x6

    add-int/2addr v0, p1

    return v0

    :cond_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    if-ge v1, v2, :cond_5

    if-nez v1, :cond_3

    shl-int/lit8 p1, v1, 0x6

    return p1

    .line 199
    :cond_3
    aget-wide v3, v0, v1

    const/4 p1, 0x0

    :goto_3
    if-ge p1, v9, :cond_2

    and-int/lit8 v10, p1, 0x3f

    shl-long v10, v7, v10

    and-long/2addr v10, v3

    cmp-long v12, v10, v5

    if-nez v12, :cond_4

    goto :goto_2

    :cond_4
    add-int/lit8 p1, p1, 0x1

    goto :goto_3

    .line 206
    :cond_5
    array-length p1, v0

    goto :goto_0
.end method

.method public nextSetBit(I)I
    .locals 14

    .line 156
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    ushr-int/lit8 v1, p1, 0x6

    .line 158
    array-length v2, v0

    const/4 v3, -0x1

    if-lt v1, v2, :cond_0

    return v3

    .line 160
    :cond_0
    aget-wide v4, v0, v1

    const-wide/16 v6, 0x1

    const/16 v8, 0x40

    const-wide/16 v9, 0x0

    cmp-long v11, v4, v9

    if-eqz v11, :cond_2

    and-int/lit8 p1, p1, 0x3f

    :goto_0
    if-ge p1, v8, :cond_2

    and-int/lit8 v11, p1, 0x3f

    shl-long v11, v6, v11

    and-long/2addr v11, v4

    cmp-long v13, v11, v9

    if-eqz v13, :cond_1

    :goto_1
    shl-int/lit8 v0, v1, 0x6

    add-int/2addr v0, p1

    return v0

    :cond_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    if-ge v1, v2, :cond_4

    if-eqz v1, :cond_2

    .line 170
    aget-wide v4, v0, v1

    cmp-long p1, v4, v9

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    :goto_2
    if-ge p1, v8, :cond_2

    and-int/lit8 v11, p1, 0x3f

    shl-long v11, v6, v11

    and-long/2addr v11, v4

    cmp-long v13, v11, v9

    if-eqz v13, :cond_3

    goto :goto_1

    :cond_3
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    :cond_4
    return v3
.end method

.method public notEmpty()Z
    .locals 1

    .line 138
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/Bits;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public numBits()I
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v0, v0

    shl-int/lit8 v0, v0, 0x6

    return v0
.end method

.method public or(Lcom/badlogic/gdx/utils/Bits;)V
    .locals 8

    .line 240
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v0, v0

    iget-object v1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-le v0, v1, :cond_0

    .line 242
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v3, v2, v1

    iget-object v5, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v6, v5, v1

    or-long/2addr v3, v6

    aput-wide v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 245
    :cond_0
    iget-object v1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 246
    array-length v1, v1

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/Bits;->checkCapacity(I)V

    .line 247
    iget-object v1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v1, v1

    :goto_1
    if-le v1, v0, :cond_1

    .line 248
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    iget-object v3, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v4, v3, v0

    aput-wide v4, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method public set(I)V
    .locals 6

    ushr-int/lit8 v0, p1, 0x6

    .line 76
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/Bits;->checkCapacity(I)V

    .line 77
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v2, v1, v0

    and-int/lit8 p1, p1, 0x3f

    const-wide/16 v4, 0x1

    shl-long/2addr v4, p1

    or-long/2addr v2, v4

    aput-wide v2, v1, v0

    return-void
.end method

.method public xor(Lcom/badlogic/gdx/utils/Bits;)V
    .locals 8

    .line 261
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v0, v0

    iget-object v1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-le v0, v1, :cond_0

    .line 264
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v3, v2, v1

    iget-object v5, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v6, v5, v1

    xor-long/2addr v3, v6

    aput-wide v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 267
    :cond_0
    iget-object v1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 268
    array-length v1, v1

    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/Bits;->checkCapacity(I)V

    .line 269
    iget-object v1, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    array-length v1, v1

    :goto_1
    if-le v1, v0, :cond_1

    .line 270
    iget-object v2, p0, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    iget-object v3, p1, Lcom/badlogic/gdx/utils/Bits;->bits:[J

    aget-wide v4, v3, v0

    aput-wide v4, v2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method
