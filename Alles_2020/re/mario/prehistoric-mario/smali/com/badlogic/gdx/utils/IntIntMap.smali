.class public Lcom/badlogic/gdx/utils/IntIntMap;
.super Ljava/lang/Object;
.source "IntIntMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/IntIntMap$Keys;,
        Lcom/badlogic/gdx/utils/IntIntMap$Values;,
        Lcom/badlogic/gdx/utils/IntIntMap$Entries;,
        Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;,
        Lcom/badlogic/gdx/utils/IntIntMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/IntIntMap$Entry;",
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

.field private entries1:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

.field private entries2:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

.field hasZeroValue:Z

.field private hashShift:I

.field keyTable:[I

.field private keys1:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

.field private keys2:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

.field private loadFactor:F

.field private mask:I

.field private pushIterations:I

.field public size:I

.field private stashCapacity:I

.field stashSize:I

.field private threshold:I

.field valueTable:[I

.field private values1:Lcom/badlogic/gdx/utils/IntIntMap$Values;

.field private values2:Lcom/badlogic/gdx/utils/IntIntMap$Values;

.field zeroValue:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x33

    const v1, 0x3f4ccccd    # 0.8f

    .line 55
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/IntIntMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const v0, 0x3f4ccccd    # 0.8f

    .line 61
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/IntIntMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 2

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p1, :cond_2

    int-to-float p1, p1

    div-float/2addr p1, p2

    float-to-double v0, p1

    .line 69
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    if-gt p1, v0, :cond_1

    .line 71
    iput p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    const/4 p1, 0x0

    cmpg-float p1, p2, p1

    if-lez p1, :cond_0

    .line 74
    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->loadFactor:F

    .line 76
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    int-to-float v0, p1

    mul-float v0, v0, p2

    float-to-int p2, v0

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    add-int/lit8 p2, p1, -0x1

    .line 77
    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    .line 78
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x1f

    iput p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hashShift:I

    const/4 p1, 0x3

    .line 79
    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    int-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p2, v0

    mul-int/lit8 p2, p2, 0x2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashCapacity:I

    .line 80
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    const/16 p2, 0x8

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    div-int/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->pushIterations:I

    .line 82
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashCapacity:I

    add-int/2addr p1, p2

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 83
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    array-length p1, p1

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    return-void

    .line 73
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

    .line 70
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

    .line 68
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

.method public constructor <init>(Lcom/badlogic/gdx/utils/IntIntMap;)V
    .locals 4

    .line 88
    iget v0, p1, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    int-to-float v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/IntIntMap;->loadFactor:F

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/IntIntMap;->loadFactor:F

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/IntIntMap;-><init>(IF)V

    .line 89
    iget v0, p1, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    .line 90
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    iget v0, p1, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    .line 93
    iget v0, p1, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    .line 94
    iget-boolean p1, p1, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    return-void
.end method

.method private containsKeyStash(I)Z
    .locals 4

    .line 479
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 480
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 481
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

.method private getAndIncrementStash(III)I
    .locals 4

    .line 345
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 346
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 347
    aget v3, v0, v1

    if-ne p1, v3, :cond_0

    .line 348
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aget p2, p1, v1

    add-int/2addr p3, p2

    .line 349
    aput p3, p1, v1

    return p2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    add-int/2addr p3, p2

    .line 352
    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/utils/IntIntMap;->put(II)V

    return p2
.end method

.method private getStash(II)I
    .locals 4

    .line 310
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 311
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 312
    aget v3, v0, v1

    if-ne p1, v3, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

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

    .line 532
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private hash3(I)I
    .locals 1

    const v0, -0x312e3dbf

    mul-int p1, p1, v0

    .line 537
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private push(IIIIIIII)V
    .locals 7

    .line 209
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 210
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    .line 211
    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    .line 216
    iget v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->pushIterations:I

    const/4 v4, 0x0

    :cond_0
    const/4 v5, 0x2

    .line 219
    invoke-static {v5}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_2

    if-eq v5, v6, :cond_1

    .line 234
    aget p3, v1, p7

    .line 235
    aput p1, v0, p7

    .line 236
    aput p2, v1, p7

    move p2, p3

    move p1, p8

    goto :goto_0

    .line 228
    :cond_1
    aget p3, v1, p5

    .line 229
    aput p1, v0, p5

    .line 230
    aput p2, v1, p5

    move p2, p3

    move p1, p6

    goto :goto_0

    .line 222
    :cond_2
    aget p5, v1, p3

    .line 223
    aput p1, v0, p3

    .line 224
    aput p2, v1, p3

    move p1, p4

    move p2, p5

    :goto_0
    and-int p3, p1, v2

    .line 242
    aget p4, v0, p3

    if-nez p4, :cond_4

    .line 244
    aput p1, v0, p3

    .line 245
    aput p2, v1, p3

    .line 246
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_3

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_3
    return-void

    .line 250
    :cond_4
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash2(I)I

    move-result p5

    .line 251
    aget p6, v0, p5

    if-nez p6, :cond_6

    .line 253
    aput p1, v0, p5

    .line 254
    aput p2, v1, p5

    .line 255
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_5
    return-void

    .line 259
    :cond_6
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash3(I)I

    move-result p7

    .line 260
    aget p8, v0, p7

    if-nez p8, :cond_8

    .line 262
    aput p1, v0, p7

    .line 263
    aput p2, v1, p7

    .line 264
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    add-int/2addr v4, v6

    if-ne v4, v3, :cond_0

    .line 274
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntIntMap;->putStash(II)V

    return-void
.end method

.method private putResize(II)V
    .locals 11

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 172
    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    .line 173
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    return-void

    .line 178
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    and-int v5, p1, v1

    .line 179
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v6, v1, v5

    if-nez v6, :cond_2

    .line 181
    aput p1, v1, v5

    .line 182
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v5

    .line 183
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_1
    return-void

    .line 187
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash2(I)I

    move-result v7

    .line 188
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v8, v1, v7

    if-nez v8, :cond_4

    .line 190
    aput p1, v1, v7

    .line 191
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v7

    .line 192
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_3

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_3
    return-void

    .line 196
    :cond_4
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash3(I)I

    move-result v9

    .line 197
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v10, v1, v9

    if-nez v10, :cond_6

    .line 199
    aput p1, v1, v9

    .line 200
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v9

    .line 201
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_5
    return-void

    :cond_6
    move-object v2, p0

    move v3, p1

    move v4, p2

    .line 205
    invoke-direct/range {v2 .. v10}, Lcom/badlogic/gdx/utils/IntIntMap;->push(IIIIIIII)V

    return-void
.end method

.method private putStash(II)V
    .locals 3

    .line 278
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashCapacity:I

    if-ne v0, v1, :cond_0

    .line 280
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    .line 281
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntIntMap;->putResize(II)V

    return-void

    .line 285
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    add-int/2addr v1, v0

    .line 286
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aput p1, v2, v1

    .line 287
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v1

    add-int/lit8 v0, v0, 0x1

    .line 288
    iput v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    .line 289
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    return-void
.end method

.method private resize(I)V
    .locals 5

    .line 504
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v0, v1

    .line 506
    iput p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    int-to-float v1, p1

    .line 507
    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->loadFactor:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    add-int/lit8 v1, p1, -0x1

    .line 508
    iput v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    .line 509
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x1f

    iput v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hashShift:I

    int-to-double v1, p1

    .line 510
    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    mul-int/lit8 v3, v3, 0x2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashCapacity:I

    const/16 v3, 0x8

    .line 511
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-int v1, v1

    div-int/2addr v1, v3

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->pushIterations:I

    .line 513
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 514
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    .line 516
    iget v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashCapacity:I

    add-int v4, p1, v3

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    add-int/2addr p1, v3

    .line 517
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    .line 519
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    .line 520
    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    iput v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    const/4 v3, 0x0

    .line 521
    iput v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    if-lez p1, :cond_1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 524
    aget p1, v1, v3

    if-eqz p1, :cond_0

    .line 525
    aget v4, v2, v3

    invoke-direct {p0, p1, v4}, Lcom/badlogic/gdx/utils/IntIntMap;->putResize(II)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 4

    .line 446
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    if-nez v0, :cond_0

    return-void

    .line 447
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 448
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v1, v2

    :goto_0
    add-int/lit8 v2, v1, -0x1

    const/4 v3, 0x0

    if-lez v1, :cond_1

    .line 449
    aput v3, v0, v2

    move v1, v2

    goto :goto_0

    .line 450
    :cond_1
    iput v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    .line 451
    iput v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    .line 452
    iput-boolean v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 436
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    if-gt v0, p1, :cond_0

    .line 437
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntIntMap;->clear()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 440
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    .line 441
    iput v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    .line 442
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    return-void
.end method

.method public containsKey(I)Z
    .locals 2

    if-nez p1, :cond_0

    .line 466
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    return p1

    .line 467
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    and-int/2addr v0, p1

    .line 468
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    .line 469
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash2(I)I

    move-result v0

    .line 470
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    .line 471
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash3(I)I

    move-result v0

    .line 472
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->containsKeyStash(I)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public containsValue(I)Z
    .locals 5

    .line 458
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    if-ne v0, p1, :cond_0

    return v1

    .line 459
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    .line 460
    iget v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v4, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v3, v4

    :goto_0
    add-int/lit8 v4, v3, -0x1

    if-lez v3, :cond_2

    .line 461
    aget v3, v0, v4

    if-eqz v3, :cond_1

    aget v3, v2, v4

    if-ne v3, p1, :cond_1

    return v1

    :cond_1
    move v3, v4

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method public ensureCapacity(I)V
    .locals 3

    if-ltz p1, :cond_1

    .line 499
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/2addr v0, p1

    .line 500
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt v0, p1, :cond_0

    int-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->loadFactor:F

    div-float/2addr p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_0
    return-void

    .line 498
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

.method public entries()Lcom/badlogic/gdx/utils/IntIntMap$Entries;
    .locals 3

    .line 623
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    return-object v0

    .line 624
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries1:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    if-nez v0, :cond_1

    .line 625
    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries1:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    .line 626
    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries2:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    .line 628
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries1:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 629
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries1:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->reset()V

    .line 630
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries1:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->valid:Z

    .line 631
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries2:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->valid:Z

    return-object v0

    .line 634
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries2:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->reset()V

    .line 635
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries2:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->valid:Z

    .line 636
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->entries1:Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->valid:Z

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 561
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/IntIntMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 562
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/IntIntMap;

    .line 563
    iget v1, p1, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 564
    :cond_2
    iget-boolean v1, p1, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    if-eqz v3, :cond_4

    .line 565
    iget v1, p1, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    if-eq v1, v3, :cond_4

    return v2

    .line 568
    :cond_4
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 569
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    .line 570
    iget v4, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_7

    .line 571
    aget v6, v1, v5

    if-eqz v6, :cond_6

    .line 573
    invoke-virtual {p1, v6, v2}, Lcom/badlogic/gdx/utils/IntIntMap;->get(II)I

    move-result v7

    if-nez v7, :cond_5

    .line 574
    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/utils/IntIntMap;->containsKey(I)Z

    move-result v6

    if-nez v6, :cond_5

    return v2

    .line 575
    :cond_5
    aget v6, v3, v5

    if-eq v7, v6, :cond_6

    return v2

    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_7
    return v0
.end method

.method public findKey(II)I
    .locals 4

    .line 488
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 489
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    .line 490
    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_2

    .line 491
    aget v2, v0, v3

    if-eqz v2, :cond_1

    aget v2, v1, v3

    if-ne v2, p1, :cond_1

    aget p1, v0, v3

    return p1

    :cond_1
    move v2, v3

    goto :goto_0

    :cond_2
    return p2
.end method

.method public get(II)I
    .locals 2

    if-nez p1, :cond_1

    .line 295
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return p2

    .line 296
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    return p1

    .line 298
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    and-int/2addr v0, p1

    .line 299
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    .line 300
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash2(I)I

    move-result v0

    .line 301
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    .line 302
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash3(I)I

    move-result v0

    .line 303
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntIntMap;->getStash(II)I

    move-result p1

    return p1

    .line 306
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aget p1, p1, v0

    return p1
.end method

.method public getAndIncrement(III)I
    .locals 2

    if-nez p1, :cond_1

    .line 320
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    if-eqz p1, :cond_0

    .line 321
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    add-int/2addr p3, p1

    .line 322
    iput p3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    return p1

    :cond_0
    const/4 p1, 0x1

    .line 325
    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    add-int/2addr p3, p2

    .line 326
    iput p3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    .line 327
    iget p3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/2addr p3, p1

    iput p3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    return p2

    .line 331
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    and-int/2addr v0, p1

    .line 332
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq p1, v1, :cond_2

    .line 333
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash2(I)I

    move-result v0

    .line 334
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq p1, v1, :cond_2

    .line 335
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash3(I)I

    move-result v0

    .line 336
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq p1, v1, :cond_2

    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/IntIntMap;->getAndIncrementStash(III)I

    move-result p1

    return p1

    .line 339
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aget p2, p1, v0

    add-int/2addr p3, p2

    .line 340
    aput p3, p1, v0

    return p2
.end method

.method public hashCode()I
    .locals 6

    .line 542
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 543
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    int-to-float v0, v0

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 545
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 546
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    .line 547
    iget v4, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v4, v5

    :goto_1
    if-ge v1, v4, :cond_2

    .line 548
    aget v5, v2, v1

    if-eqz v5, :cond_1

    mul-int/lit8 v5, v5, 0x1f

    add-int/2addr v0, v5

    .line 552
    aget v5, v3, v1

    add-int/2addr v0, v5

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 421
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

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
            "Lcom/badlogic/gdx/utils/IntIntMap$Entry;",
            ">;"
        }
    .end annotation

    .line 615
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntIntMap;->entries()Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/badlogic/gdx/utils/IntIntMap$Keys;
    .locals 3

    .line 667
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    return-object v0

    .line 668
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys1:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    if-nez v0, :cond_1

    .line 669
    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys1:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    .line 670
    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys2:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    .line 672
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys1:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntIntMap$Keys;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 673
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys1:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntIntMap$Keys;->reset()V

    .line 674
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys1:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntIntMap$Keys;->valid:Z

    .line 675
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys2:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntIntMap$Keys;->valid:Z

    return-object v0

    .line 678
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys2:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntIntMap$Keys;->reset()V

    .line 679
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys2:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntIntMap$Keys;->valid:Z

    .line 680
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keys1:Lcom/badlogic/gdx/utils/IntIntMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntIntMap$Keys;->valid:Z

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 416
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(II)V
    .locals 12

    const/4 v0, 0x1

    if-nez p1, :cond_1

    .line 99
    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    .line 100
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    .line 101
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    .line 102
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    :cond_0
    return-void

    .line 107
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 110
    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    and-int v6, p1, v2

    .line 111
    aget v7, v1, v6

    if-ne p1, v7, :cond_2

    .line 113
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v6

    return-void

    .line 117
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash2(I)I

    move-result v8

    .line 118
    aget v9, v1, v8

    if-ne p1, v9, :cond_3

    .line 120
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v8

    return-void

    .line 124
    :cond_3
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash3(I)I

    move-result v10

    .line 125
    aget v11, v1, v10

    if-ne p1, v11, :cond_4

    .line 127
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v10

    return-void

    .line 132
    :cond_4
    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v3, v2

    :goto_0
    if-ge v2, v3, :cond_6

    .line 133
    aget v4, v1, v2

    if-ne p1, v4, :cond_5

    .line 134
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v2

    return-void

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    if-nez v7, :cond_8

    .line 141
    aput p1, v1, v6

    .line 142
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v6

    .line 143
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    if-nez v9, :cond_a

    .line 148
    aput p1, v1, v8

    .line 149
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v8

    .line 150
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_9

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_9
    return-void

    :cond_a
    if-nez v11, :cond_c

    .line 155
    aput p1, v1, v10

    .line 156
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aput p2, p1, v10

    .line 157
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->threshold:I

    if-lt p1, p2, :cond_b

    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    :cond_b
    return-void

    :cond_c
    move-object v3, p0

    move v4, p1

    move v5, p2

    .line 161
    invoke-direct/range {v3 .. v11}, Lcom/badlogic/gdx/utils/IntIntMap;->push(IIIIIIII)V

    return-void
.end method

.method public putAll(Lcom/badlogic/gdx/utils/IntIntMap;)V
    .locals 2

    .line 165
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/IntIntMap;->entries()Lcom/badlogic/gdx/utils/IntIntMap$Entries;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/IntIntMap$Entry;

    .line 166
    iget v1, v0, Lcom/badlogic/gdx/utils/IntIntMap$Entry;->key:I

    iget v0, v0, Lcom/badlogic/gdx/utils/IntIntMap$Entry;->value:I

    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/utils/IntIntMap;->put(II)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public remove(II)I
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 358
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return p2

    .line 359
    :cond_0
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    .line 360
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    .line 361
    iget p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    return p1

    .line 364
    :cond_1
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->mask:I

    and-int/2addr v1, p1

    .line 365
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v3, v2, v1

    if-ne p1, v3, :cond_2

    .line 366
    aput v0, v2, v1

    .line 367
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aget p1, p1, v1

    .line 368
    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    return p1

    .line 372
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash2(I)I

    move-result v1

    .line 373
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v3, v2, v1

    if-ne p1, v3, :cond_3

    .line 374
    aput v0, v2, v1

    .line 375
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aget p1, p1, v1

    .line 376
    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    return p1

    .line 380
    :cond_3
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->hash3(I)I

    move-result v1

    .line 381
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v3, v2, v1

    if-ne p1, v3, :cond_4

    .line 382
    aput v0, v2, v1

    .line 383
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aget p1, p1, v1

    .line 384
    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    return p1

    .line 388
    :cond_4
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntIntMap;->removeStash(II)I

    move-result p1

    return p1
.end method

.method removeStash(II)I
    .locals 4

    .line 392
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 393
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 394
    aget v3, v0, v1

    if-ne p1, v3, :cond_0

    .line 395
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aget p1, p1, v1

    .line 396
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/IntIntMap;->removeStashIndex(I)V

    .line 397
    iget p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method removeStashIndex(I)V
    .locals 3

    .line 406
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    .line 407
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->stashSize:I

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    .line 409
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    aget v2, v1, v0

    aput v2, v1, p1

    .line 410
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    aget v0, v1, v0

    aput v0, v1, p1

    :cond_0
    return-void
.end method

.method public shrink(I)V
    .locals 3

    if-ltz p1, :cond_2

    .line 428
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    if-le v0, p1, :cond_0

    move p1, v0

    .line 429
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->capacity:I

    if-gt v0, p1, :cond_1

    return-void

    .line 430
    :cond_1
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    .line 431
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap;->resize(I)V

    return-void

    .line 427
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

    .line 583
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    if-nez v0, :cond_0

    const-string v0, "{}"

    return-object v0

    .line 584
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v1, 0x7b

    .line 585
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 586
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 587
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    .line 588
    array-length v3, v1

    .line 589
    iget-boolean v4, p0, Lcom/badlogic/gdx/utils/IntIntMap;->hasZeroValue:Z

    const/16 v5, 0x3d

    if-eqz v4, :cond_1

    const-string v4, "0="

    .line 590
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 591
    iget v4, p0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_2

    :cond_1
    :goto_0
    add-int/lit8 v4, v3, -0x1

    if-lez v3, :cond_3

    .line 594
    aget v3, v1, v4

    if-nez v3, :cond_2

    move v3, v4

    goto :goto_0

    .line 596
    :cond_2
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 597
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 598
    aget v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    :cond_3
    :goto_1
    move v3, v4

    :goto_2
    add-int/lit8 v4, v3, -0x1

    if-lez v3, :cond_5

    .line 603
    aget v3, v1, v4

    if-nez v3, :cond_4

    goto :goto_1

    :cond_4
    const-string v6, ", "

    .line 605
    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 606
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 607
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 608
    aget v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_1

    :cond_5
    const/16 v1, 0x7d

    .line 610
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 611
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Lcom/badlogic/gdx/utils/IntIntMap$Values;
    .locals 3

    .line 645
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    return-object v0

    .line 646
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values1:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    if-nez v0, :cond_1

    .line 647
    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values1:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    .line 648
    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntIntMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values2:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    .line 650
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values1:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 651
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values1:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntIntMap$Values;->reset()V

    .line 652
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values1:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->valid:Z

    .line 653
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values2:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntIntMap$Values;->valid:Z

    return-object v0

    .line 656
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values2:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntIntMap$Values;->reset()V

    .line 657
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values2:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->valid:Z

    .line 658
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntIntMap;->values1:Lcom/badlogic/gdx/utils/IntIntMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntIntMap$Values;->valid:Z

    return-object v0
.end method
