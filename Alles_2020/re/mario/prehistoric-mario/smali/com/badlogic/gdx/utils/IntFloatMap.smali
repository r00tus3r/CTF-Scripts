.class public Lcom/badlogic/gdx/utils/IntFloatMap;
.super Ljava/lang/Object;
.source "IntFloatMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/IntFloatMap$Keys;,
        Lcom/badlogic/gdx/utils/IntFloatMap$Values;,
        Lcom/badlogic/gdx/utils/IntFloatMap$Entries;,
        Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;,
        Lcom/badlogic/gdx/utils/IntFloatMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/IntFloatMap$Entry;",
        ">;"
    }
.end annotation


# static fields
.field private static final EMPTY:I = 0x0

.field private static final PRIME1:I = -0x41e0eb4f

.field private static final PRIME2:I = -0x4b47d1c7

.field private static final PRIME3:I = -0x312e3dbf


# instance fields
.field capacity:I

.field private entries1:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

.field private entries2:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

.field hasZeroValue:Z

.field private hashShift:I

.field keyTable:[I

.field private keys1:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

.field private keys2:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

.field private loadFactor:F

.field private mask:I

.field private pushIterations:I

.field public size:I

.field private stashCapacity:I

.field stashSize:I

.field private threshold:I

.field valueTable:[F

.field private values1:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

.field private values2:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

.field zeroValue:F


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x33

    const v1, 0x3f4ccccd    # 0.8f

    .line 57
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/IntFloatMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const v0, 0x3f4ccccd    # 0.8f

    .line 63
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/IntFloatMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 2

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p1, :cond_2

    int-to-float p1, p1

    div-float/2addr p1, p2

    float-to-double v0, p1

    .line 71
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    if-gt p1, v0, :cond_1

    .line 73
    iput p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    const/4 p1, 0x0

    cmpg-float p1, p2, p1

    if-lez p1, :cond_0

    .line 76
    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->loadFactor:F

    .line 78
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    int-to-float v0, p1

    mul-float v0, v0, p2

    float-to-int p2, v0

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    add-int/lit8 p2, p1, -0x1

    .line 79
    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    .line 80
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x1f

    iput p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hashShift:I

    const/4 p1, 0x3

    .line 81
    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    int-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p2, v0

    mul-int/lit8 p2, p2, 0x2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashCapacity:I

    .line 82
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    const/16 p2, 0x8

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    div-int/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->pushIterations:I

    .line 84
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashCapacity:I

    add-int/2addr p1, p2

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 85
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    array-length p1, p1

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    return-void

    .line 75
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "loadFactor must be > 0: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 72
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initialCapacity is too large: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 70
    :cond_2
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "initialCapacity must be >= 0: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V
    .locals 4

    .line 90
    iget v0, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    int-to-float v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->loadFactor:F

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->loadFactor:F

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/IntFloatMap;-><init>(IF)V

    .line 91
    iget v0, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    .line 92
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 94
    iget v0, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    .line 95
    iget v0, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    .line 96
    iget-boolean p1, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    return-void
.end method

.method private containsKeyStash(I)Z
    .locals 4

    .line 492
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 493
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 494
    aget v3, v0, v1

    if-ne p1, v3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private getAndIncrementStash(IFF)F
    .locals 4

    .line 347
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 348
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 349
    aget v3, v0, v1

    if-ne p1, v3, :cond_0

    .line 350
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget p2, p1, v1

    add-float/2addr p3, p2

    .line 351
    aput p3, p1, v1

    return p2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    add-float/2addr p3, p2

    .line 354
    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/utils/IntFloatMap;->put(IF)V

    return p2
.end method

.method private getStash(IF)F
    .locals 4

    .line 312
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 313
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 314
    aget v3, v0, v1

    if-ne p1, v3, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget p1, p1, v1

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method private hash2(I)I
    .locals 1

    const v0, -0x4b47d1c7

    mul-int p1, p1, v0

    .line 546
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private hash3(I)I
    .locals 1

    const v0, -0x312e3dbf

    mul-int p1, p1, v0

    .line 551
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private push(IFIIIIII)V
    .locals 7

    .line 211
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 212
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 213
    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    .line 218
    iget v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->pushIterations:I

    const/4 v4, 0x0

    :cond_0
    const/4 v5, 0x2

    .line 221
    invoke-static {v5}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_2

    if-eq v5, v6, :cond_1

    .line 236
    aget p3, v1, p7

    .line 237
    aput p1, v0, p7

    .line 238
    aput p2, v1, p7

    move p2, p3

    move p1, p8

    goto :goto_0

    .line 230
    :cond_1
    aget p3, v1, p5

    .line 231
    aput p1, v0, p5

    .line 232
    aput p2, v1, p5

    move p2, p3

    move p1, p6

    goto :goto_0

    .line 224
    :cond_2
    aget p5, v1, p3

    .line 225
    aput p1, v0, p3

    .line 226
    aput p2, v1, p3

    move p1, p4

    move p2, p5

    :goto_0
    and-int p3, p1, v2

    .line 244
    aget p4, v0, p3

    if-nez p4, :cond_4

    .line 246
    aput p1, v0, p3

    .line 247
    aput p2, v1, p3

    .line 248
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_3

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_3
    return-void

    .line 252
    :cond_4
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash2(I)I

    move-result p5

    .line 253
    aget p6, v0, p5

    if-nez p6, :cond_6

    .line 255
    aput p1, v0, p5

    .line 256
    aput p2, v1, p5

    .line 257
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_5
    return-void

    .line 261
    :cond_6
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash3(I)I

    move-result p7

    .line 262
    aget p8, v0, p7

    if-nez p8, :cond_8

    .line 264
    aput p1, v0, p7

    .line 265
    aput p2, v1, p7

    .line 266
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    add-int/2addr v4, v6

    if-ne v4, v3, :cond_0

    .line 276
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntFloatMap;->putStash(IF)V

    return-void
.end method

.method private putResize(IF)V
    .locals 11

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 174
    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    .line 175
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    return-void

    .line 180
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    and-int v5, p1, v1

    .line 181
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v6, v1, v5

    if-nez v6, :cond_2

    .line 183
    aput p1, v1, v5

    .line 184
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v5

    .line 185
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_1
    return-void

    .line 189
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash2(I)I

    move-result v7

    .line 190
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v8, v1, v7

    if-nez v8, :cond_4

    .line 192
    aput p1, v1, v7

    .line 193
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v7

    .line 194
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_3

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_3
    return-void

    .line 198
    :cond_4
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash3(I)I

    move-result v9

    .line 199
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v10, v1, v9

    if-nez v10, :cond_6

    .line 201
    aput p1, v1, v9

    .line 202
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v9

    .line 203
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_5
    return-void

    :cond_6
    move-object v2, p0

    move v3, p1

    move v4, p2

    .line 207
    invoke-direct/range {v2 .. v10}, Lcom/badlogic/gdx/utils/IntFloatMap;->push(IFIIIIII)V

    return-void
.end method

.method private putStash(IF)V
    .locals 3

    .line 280
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashCapacity:I

    if-ne v0, v1, :cond_0

    .line 282
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    .line 283
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntFloatMap;->putResize(IF)V

    return-void

    .line 287
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    add-int/2addr v1, v0

    .line 288
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aput p1, v2, v1

    .line 289
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v1

    add-int/lit8 v0, v0, 0x1

    .line 290
    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    .line 291
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    return-void
.end method

.method private resize(I)V
    .locals 5

    .line 518
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v0, v1

    .line 520
    iput p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    int-to-float v1, p1

    .line 521
    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->loadFactor:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    add-int/lit8 v1, p1, -0x1

    .line 522
    iput v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    .line 523
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x1f

    iput v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hashShift:I

    int-to-double v1, p1

    .line 524
    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    mul-int/lit8 v3, v3, 0x2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashCapacity:I

    const/16 v3, 0x8

    .line 525
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-int v1, v1

    div-int/2addr v1, v3

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->pushIterations:I

    .line 527
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 528
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 530
    iget v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashCapacity:I

    add-int v4, p1, v3

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    add-int/2addr p1, v3

    .line 531
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 533
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    .line 534
    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    iput v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    const/4 v3, 0x0

    .line 535
    iput v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    if-lez p1, :cond_1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 538
    aget p1, v1, v3

    if-eqz p1, :cond_0

    .line 539
    aget v4, v2, v3

    invoke-direct {p0, p1, v4}, Lcom/badlogic/gdx/utils/IntFloatMap;->putResize(IF)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 4

    .line 448
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    if-nez v0, :cond_0

    return-void

    .line 449
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 450
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v1, v2

    :goto_0
    add-int/lit8 v2, v1, -0x1

    const/4 v3, 0x0

    if-lez v1, :cond_1

    .line 451
    aput v3, v0, v2

    move v1, v2

    goto :goto_0

    .line 452
    :cond_1
    iput-boolean v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    .line 453
    iput v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    .line 454
    iput v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 438
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    if-gt v0, p1, :cond_0

    .line 439
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap;->clear()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 442
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    .line 443
    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    .line 444
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    return-void
.end method

.method public containsKey(I)Z
    .locals 2

    if-nez p1, :cond_0

    .line 479
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    return p1

    .line 480
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    and-int/2addr v0, p1

    .line 481
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    .line 482
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash2(I)I

    move-result v0

    .line 483
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    .line 484
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash3(I)I

    move-result v0

    .line 485
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->containsKeyStash(I)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public containsValue(F)Z
    .locals 5

    .line 460
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    return v1

    .line 461
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 462
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 463
    iget v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v4, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v3, v4

    :goto_0
    add-int/lit8 v4, v3, -0x1

    if-lez v3, :cond_2

    .line 464
    aget v3, v0, v4

    if-eqz v3, :cond_1

    aget v3, v2, v4

    cmpl-float v3, v3, p1

    if-nez v3, :cond_1

    return v1

    :cond_1
    move v3, v4

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public containsValue(FF)Z
    .locals 4

    .line 471
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, p2

    if-gtz v0, :cond_0

    return v1

    .line 472
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 473
    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_2

    .line 474
    aget v2, v0, v3

    sub-float/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v2

    cmpg-float v2, v2, p2

    if-gtz v2, :cond_1

    return v1

    :cond_1
    move v2, v3

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public ensureCapacity(I)V
    .locals 3

    if-ltz p1, :cond_1

    .line 513
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/2addr v0, p1

    .line 514
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt v0, p1, :cond_0

    int-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->loadFactor:F

    div-float/2addr p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_0
    return-void

    .line 512
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "additionalCapacity must be >= 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public entries()Lcom/badlogic/gdx/utils/IntFloatMap$Entries;
    .locals 3

    .line 637
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    return-object v0

    .line 638
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries1:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    if-nez v0, :cond_1

    .line 639
    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries1:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    .line 640
    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries2:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    .line 642
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries1:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 643
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries1:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;->reset()V

    .line 644
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries1:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;->valid:Z

    .line 645
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries2:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;->valid:Z

    return-object v0

    .line 648
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries2:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;->reset()V

    .line 649
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries2:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;->valid:Z

    .line 650
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->entries1:Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;->valid:Z

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 9

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 575
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/IntFloatMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 576
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/IntFloatMap;

    .line 577
    iget v1, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 578
    :cond_2
    iget-boolean v1, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    if-eqz v3, :cond_4

    .line 579
    iget v1, p1, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    iget v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    cmpl-float v1, v1, v3

    if-eqz v1, :cond_4

    return v2

    .line 582
    :cond_4
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 583
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 584
    iget v4, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_7

    .line 585
    aget v6, v1, v5

    if-eqz v6, :cond_6

    const/4 v7, 0x0

    .line 587
    invoke-virtual {p1, v6, v7}, Lcom/badlogic/gdx/utils/IntFloatMap;->get(IF)F

    move-result v8

    cmpl-float v7, v8, v7

    if-nez v7, :cond_5

    .line 588
    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/utils/IntFloatMap;->containsKey(I)Z

    move-result v6

    if-nez v6, :cond_5

    return v2

    .line 589
    :cond_5
    aget v6, v3, v5

    cmpl-float v6, v8, v6

    if-eqz v6, :cond_6

    return v2

    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_7
    return v0
.end method

.method public findKey(FI)I
    .locals 4

    .line 501
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 502
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 503
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 504
    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_2

    .line 505
    aget v2, v0, v3

    if-eqz v2, :cond_1

    aget v2, v1, v3

    cmpl-float v2, v2, p1

    if-nez v2, :cond_1

    aget p1, v0, v3

    return p1

    :cond_1
    move v2, v3

    goto :goto_0

    :cond_2
    return p2
.end method

.method public get(IF)F
    .locals 2

    if-nez p1, :cond_1

    .line 297
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return p2

    .line 298
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    return p1

    .line 300
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    and-int/2addr v0, p1

    .line 301
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    .line 302
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash2(I)I

    move-result v0

    .line 303
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    .line 304
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash3(I)I

    move-result v0

    .line 305
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntFloatMap;->getStash(IF)F

    move-result p1

    return p1

    .line 308
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget p1, p1, v0

    return p1
.end method

.method public getAndIncrement(IFF)F
    .locals 2

    if-nez p1, :cond_1

    .line 322
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    if-eqz p1, :cond_0

    .line 323
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    add-float/2addr p3, p1

    .line 324
    iput p3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    return p1

    :cond_0
    const/4 p1, 0x1

    .line 327
    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    add-float/2addr p3, p2

    .line 328
    iput p3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    .line 329
    iget p3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/2addr p3, p1

    iput p3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    return p2

    .line 333
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    and-int/2addr v0, p1

    .line 334
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v1, v1, v0

    if-eq p1, v1, :cond_2

    .line 335
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash2(I)I

    move-result v0

    .line 336
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v1, v1, v0

    if-eq p1, v1, :cond_2

    .line 337
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash3(I)I

    move-result v0

    .line 338
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v1, v1, v0

    if-eq p1, v1, :cond_2

    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/IntFloatMap;->getAndIncrementStash(IFF)F

    move-result p1

    return p1

    .line 341
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget p2, p1, v0

    add-float/2addr p3, p2

    .line 342
    aput p3, p1, v0

    return p2
.end method

.method public hashCode()I
    .locals 6

    .line 556
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 557
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 559
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 560
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 561
    iget v4, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v4, v5

    :goto_1
    if-ge v1, v4, :cond_2

    .line 562
    aget v5, v2, v1

    if-eqz v5, :cond_1

    mul-int/lit8 v5, v5, 0x1f

    add-int/2addr v0, v5

    .line 566
    aget v5, v3, v1

    .line 567
    invoke-static {v5}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v5

    add-int/2addr v0, v5

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 423
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/badlogic/gdx/utils/IntFloatMap$Entry;",
            ">;"
        }
    .end annotation

    .line 629
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap;->entries()Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/badlogic/gdx/utils/IntFloatMap$Keys;
    .locals 3

    .line 681
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    return-object v0

    .line 682
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys1:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    if-nez v0, :cond_1

    .line 683
    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys1:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    .line 684
    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys2:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    .line 686
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys1:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 687
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys1:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->reset()V

    .line 688
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys1:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->valid:Z

    .line 689
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys2:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->valid:Z

    return-object v0

    .line 692
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys2:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->reset()V

    .line 693
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys2:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->valid:Z

    .line 694
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keys1:Lcom/badlogic/gdx/utils/IntFloatMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->valid:Z

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 418
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(IF)V
    .locals 12

    const/4 v0, 0x1

    if-nez p1, :cond_1

    .line 101
    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    .line 102
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    .line 103
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    .line 104
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    :cond_0
    return-void

    .line 109
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 112
    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    and-int v6, p1, v2

    .line 113
    aget v7, v1, v6

    if-ne p1, v7, :cond_2

    .line 115
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v6

    return-void

    .line 119
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash2(I)I

    move-result v8

    .line 120
    aget v9, v1, v8

    if-ne p1, v9, :cond_3

    .line 122
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v8

    return-void

    .line 126
    :cond_3
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash3(I)I

    move-result v10

    .line 127
    aget v11, v1, v10

    if-ne p1, v11, :cond_4

    .line 129
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v10

    return-void

    .line 134
    :cond_4
    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v3, v2

    :goto_0
    if-ge v2, v3, :cond_6

    .line 135
    aget v4, v1, v2

    if-ne p1, v4, :cond_5

    .line 136
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v2

    return-void

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    if-nez v7, :cond_8

    .line 143
    aput p1, v1, v6

    .line 144
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v6

    .line 145
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    if-nez v9, :cond_a

    .line 150
    aput p1, v1, v8

    .line 151
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v8

    .line 152
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_9

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_9
    return-void

    :cond_a
    if-nez v11, :cond_c

    .line 157
    aput p1, v1, v10

    .line 158
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aput p2, p1, v10

    .line 159
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->threshold:I

    if-lt p1, p2, :cond_b

    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    :cond_b
    return-void

    :cond_c
    move-object v3, p0

    move v4, p1

    move v5, p2

    .line 163
    invoke-direct/range {v3 .. v11}, Lcom/badlogic/gdx/utils/IntFloatMap;->push(IFIIIIII)V

    return-void
.end method

.method public putAll(Lcom/badlogic/gdx/utils/IntFloatMap;)V
    .locals 2

    .line 167
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->entries()Lcom/badlogic/gdx/utils/IntFloatMap$Entries;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/IntFloatMap$Entries;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entry;

    .line 168
    iget v1, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entry;->key:I

    iget v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Entry;->value:F

    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/utils/IntFloatMap;->put(IF)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public remove(IF)F
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 360
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return p2

    .line 361
    :cond_0
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    .line 362
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    .line 363
    iget p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    return p1

    .line 366
    :cond_1
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->mask:I

    and-int/2addr v1, p1

    .line 367
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v3, v2, v1

    if-ne p1, v3, :cond_2

    .line 368
    aput v0, v2, v1

    .line 369
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget p1, p1, v1

    .line 370
    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    return p1

    .line 374
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash2(I)I

    move-result v1

    .line 375
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v3, v2, v1

    if-ne p1, v3, :cond_3

    .line 376
    aput v0, v2, v1

    .line 377
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget p1, p1, v1

    .line 378
    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    return p1

    .line 382
    :cond_3
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->hash3(I)I

    move-result v1

    .line 383
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v3, v2, v1

    if-ne p1, v3, :cond_4

    .line 384
    aput v0, v2, v1

    .line 385
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget p1, p1, v1

    .line 386
    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    return p1

    .line 390
    :cond_4
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntFloatMap;->removeStash(IF)F

    move-result p1

    return p1
.end method

.method removeStash(IF)F
    .locals 4

    .line 394
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 395
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 396
    aget v3, v0, v1

    if-ne p1, v3, :cond_0

    .line 397
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget p1, p1, v1

    .line 398
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/IntFloatMap;->removeStashIndex(I)V

    .line 399
    iget p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method removeStashIndex(I)V
    .locals 3

    .line 408
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    .line 409
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    .line 411
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    aget v2, v1, v0

    aput v2, v1, p1

    .line 412
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    aget v0, v1, v0

    aput v0, v1, p1

    :cond_0
    return-void
.end method

.method public shrink(I)V
    .locals 3

    if-ltz p1, :cond_2

    .line 430
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    if-le v0, p1, :cond_0

    move p1, v0

    .line 431
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    if-gt v0, p1, :cond_1

    return-void

    .line 432
    :cond_1
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    .line 433
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap;->resize(I)V

    return-void

    .line 429
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maximumCapacity must be >= 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .line 597
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    if-nez v0, :cond_0

    const-string v0, "{}"

    return-object v0

    .line 598
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v1, 0x7b

    .line 599
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 600
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 601
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    .line 602
    array-length v3, v1

    .line 603
    iget-boolean v4, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    const/16 v5, 0x3d

    if-eqz v4, :cond_1

    const-string v4, "0="

    .line 604
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 605
    iget v4, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(F)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_2

    :cond_1
    :goto_0
    add-int/lit8 v4, v3, -0x1

    if-lez v3, :cond_3

    .line 608
    aget v3, v1, v4

    if-nez v3, :cond_2

    move v3, v4

    goto :goto_0

    .line 610
    :cond_2
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 611
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 612
    aget v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(F)Lcom/badlogic/gdx/utils/StringBuilder;

    :cond_3
    :goto_1
    move v3, v4

    :goto_2
    add-int/lit8 v4, v3, -0x1

    if-lez v3, :cond_5

    .line 617
    aget v3, v1, v4

    if-nez v3, :cond_4

    goto :goto_1

    :cond_4
    const-string v6, ", "

    .line 619
    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 620
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 621
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 622
    aget v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(F)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_1

    :cond_5
    const/16 v1, 0x7d

    .line 624
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 625
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Lcom/badlogic/gdx/utils/IntFloatMap$Values;
    .locals 3

    .line 659
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    return-object v0

    .line 660
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values1:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    if-nez v0, :cond_1

    .line 661
    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values1:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    .line 662
    new-instance v0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values2:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    .line 664
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values1:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 665
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values1:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->reset()V

    .line 666
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values1:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->valid:Z

    .line 667
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values2:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->valid:Z

    return-object v0

    .line 670
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values2:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->reset()V

    .line 671
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values2:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->valid:Z

    .line 672
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap;->values1:Lcom/badlogic/gdx/utils/IntFloatMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->valid:Z

    return-object v0
.end method
