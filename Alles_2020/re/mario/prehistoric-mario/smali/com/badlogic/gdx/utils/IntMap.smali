.class public Lcom/badlogic/gdx/utils/IntMap;
.super Ljava/lang/Object;
.source "IntMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/IntMap$Keys;,
        Lcom/badlogic/gdx/utils/IntMap$Values;,
        Lcom/badlogic/gdx/utils/IntMap$Entries;,
        Lcom/badlogic/gdx/utils/IntMap$MapIterator;,
        Lcom/badlogic/gdx/utils/IntMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/IntMap$Entry<",
        "TV;>;>;"
    }
.end annotation


# static fields
.field private static final EMPTY:I = 0x0

.field private static final PRIME1:I = -0x41e0eb4f

.field private static final PRIME2:I = -0x4b47d1c7

.field private static final PRIME3:I = -0x312e3dbf


# instance fields
.field capacity:I

.field private entries1:Lcom/badlogic/gdx/utils/IntMap$Entries;

.field private entries2:Lcom/badlogic/gdx/utils/IntMap$Entries;

.field hasZeroValue:Z

.field private hashShift:I

.field keyTable:[I

.field private keys1:Lcom/badlogic/gdx/utils/IntMap$Keys;

.field private keys2:Lcom/badlogic/gdx/utils/IntMap$Keys;

.field private loadFactor:F

.field private mask:I

.field private pushIterations:I

.field public size:I

.field private stashCapacity:I

.field stashSize:I

.field private threshold:I

.field valueTable:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TV;"
        }
    .end annotation
.end field

.field private values1:Lcom/badlogic/gdx/utils/IntMap$Values;

.field private values2:Lcom/badlogic/gdx/utils/IntMap$Values;

.field zeroValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x33

    const v1, 0x3f4ccccd    # 0.8f

    .line 56
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/IntMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const v0, 0x3f4ccccd    # 0.8f

    .line 62
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/IntMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 2

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p1, :cond_2

    int-to-float p1, p1

    div-float/2addr p1, p2

    float-to-double v0, p1

    .line 70
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    if-gt p1, v0, :cond_1

    .line 72
    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    const/4 p1, 0x0

    cmpg-float p1, p2, p1

    if-lez p1, :cond_0

    .line 75
    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->loadFactor:F

    .line 77
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    int-to-float v0, p1

    mul-float v0, v0, p2

    float-to-int p2, v0

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    add-int/lit8 p2, p1, -0x1

    .line 78
    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    .line 79
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x1f

    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->hashShift:I

    const/4 p1, 0x3

    .line 80
    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    int-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p2, v0

    mul-int/lit8 p2, p2, 0x2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->stashCapacity:I

    .line 81
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    const/16 p2, 0x8

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    div-int/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->pushIterations:I

    .line 83
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->stashCapacity:I

    add-int/2addr p1, p2

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 84
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    array-length p1, p1

    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    return-void

    .line 74
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

    .line 71
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

    .line 69
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

.method public constructor <init>(Lcom/badlogic/gdx/utils/IntMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/IntMap<",
            "+TV;>;)V"
        }
    .end annotation

    .line 89
    iget v0, p1, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    int-to-float v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/IntMap;->loadFactor:F

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/IntMap;->loadFactor:F

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/IntMap;-><init>(IF)V

    .line 90
    iget v0, p1, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    .line 91
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    iget v0, p1, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    .line 94
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    .line 95
    iget-boolean p1, p1, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    return-void
.end method

.method private containsKeyStash(I)Z
    .locals 4

    .line 487
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 488
    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 489
    aget v3, v0, v1

    if-ne v3, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private getStash(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    .line 333
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 334
    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 335
    aget v3, v0, v1

    if-ne v3, p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p2
.end method

.method private hash2(I)I
    .locals 1

    const v0, -0x4b47d1c7

    mul-int p1, p1, v0

    .line 553
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private hash3(I)I
    .locals 1

    const v0, -0x312e3dbf

    mul-int p1, p1, v0

    .line 558
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private push(ILjava/lang/Object;IIIIII)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;IIIIII)V"
        }
    .end annotation

    .line 216
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 218
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    .line 219
    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    .line 224
    iget v3, p0, Lcom/badlogic/gdx/utils/IntMap;->pushIterations:I

    const/4 v4, 0x0

    :cond_0
    const/4 v5, 0x2

    .line 227
    invoke-static {v5}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_2

    if-eq v5, v6, :cond_1

    .line 242
    aget-object p3, v1, p7

    .line 243
    aput p1, v0, p7

    .line 244
    aput-object p2, v1, p7

    move-object p2, p3

    move p1, p8

    goto :goto_0

    .line 236
    :cond_1
    aget-object p3, v1, p5

    .line 237
    aput p1, v0, p5

    .line 238
    aput-object p2, v1, p5

    move-object p2, p3

    move p1, p6

    goto :goto_0

    .line 230
    :cond_2
    aget-object p5, v1, p3

    .line 231
    aput p1, v0, p3

    .line 232
    aput-object p2, v1, p3

    move p1, p4

    move-object p2, p5

    :goto_0
    and-int p3, p1, v2

    .line 250
    aget p4, v0, p3

    if-nez p4, :cond_4

    .line 252
    aput p1, v0, p3

    .line 253
    aput-object p2, v1, p3

    .line 254
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_3

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_3
    return-void

    .line 258
    :cond_4
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash2(I)I

    move-result p5

    .line 259
    aget p6, v0, p5

    if-nez p6, :cond_6

    .line 261
    aput p1, v0, p5

    .line 262
    aput-object p2, v1, p5

    .line 263
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_5
    return-void

    .line 267
    :cond_6
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash3(I)I

    move-result p7

    .line 268
    aget p8, v0, p7

    if-nez p8, :cond_8

    .line 270
    aput p1, v0, p7

    .line 271
    aput-object p2, v1, p7

    .line 272
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v6

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    add-int/2addr v4, v6

    if-ne v4, v3, :cond_0

    .line 282
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntMap;->putStash(ILjava/lang/Object;)V

    return-void
.end method

.method private putResize(ILjava/lang/Object;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)V"
        }
    .end annotation

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 179
    iput-object p2, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    .line 180
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    return-void

    .line 185
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    and-int v5, p1, v1

    .line 186
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v6, v1, v5

    if-nez v6, :cond_2

    .line 188
    aput p1, v1, v5

    .line 189
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v5

    .line 190
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_1

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_1
    return-void

    .line 194
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash2(I)I

    move-result v7

    .line 195
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v8, v1, v7

    if-nez v8, :cond_4

    .line 197
    aput p1, v1, v7

    .line 198
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v7

    .line 199
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_3

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_3
    return-void

    .line 203
    :cond_4
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash3(I)I

    move-result v9

    .line 204
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v10, v1, v9

    if-nez v10, :cond_6

    .line 206
    aput p1, v1, v9

    .line 207
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v9

    .line 208
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_5
    return-void

    :cond_6
    move-object v2, p0

    move v3, p1

    move-object v4, p2

    .line 212
    invoke-direct/range {v2 .. v10}, Lcom/badlogic/gdx/utils/IntMap;->push(ILjava/lang/Object;IIIIII)V

    return-void
.end method

.method private putStash(ILjava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)V"
        }
    .end annotation

    .line 286
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->stashCapacity:I

    if-ne v0, v1, :cond_0

    .line 288
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    .line 289
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntMap;->putResize(ILjava/lang/Object;)V

    return-void

    .line 293
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    add-int/2addr v1, v0

    .line 294
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aput p1, v2, v1

    .line 295
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v1

    add-int/lit8 v0, v0, 0x1

    .line 296
    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    .line 297
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    return-void
.end method

.method private resize(I)V
    .locals 5

    .line 525
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v0, v1

    .line 527
    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    int-to-float v1, p1

    .line 528
    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->loadFactor:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    add-int/lit8 v1, p1, -0x1

    .line 529
    iput v1, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    .line 530
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x1f

    iput v1, p0, Lcom/badlogic/gdx/utils/IntMap;->hashShift:I

    int-to-double v1, p1

    .line 531
    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    mul-int/lit8 v3, v3, 0x2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/badlogic/gdx/utils/IntMap;->stashCapacity:I

    const/16 v3, 0x8

    .line 532
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-int v1, v1

    div-int/2addr v1, v3

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/utils/IntMap;->pushIterations:I

    .line 534
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 535
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    .line 537
    iget v3, p0, Lcom/badlogic/gdx/utils/IntMap;->stashCapacity:I

    add-int v4, p1, v3

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    add-int/2addr p1, v3

    .line 538
    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    .line 540
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    .line 541
    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    iput v3, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    const/4 v3, 0x0

    .line 542
    iput v3, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    if-lez p1, :cond_1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 545
    aget p1, v1, v3

    if-eqz p1, :cond_0

    .line 546
    aget-object v4, v2, v3

    invoke-direct {p0, p1, v4}, Lcom/badlogic/gdx/utils/IntMap;->putResize(ILjava/lang/Object;)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 6

    .line 437
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    if-nez v0, :cond_0

    return-void

    .line 438
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 439
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    .line 440
    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-lez v2, :cond_1

    .line 441
    aput v5, v0, v3

    .line 442
    aput-object v4, v1, v3

    move v2, v3

    goto :goto_0

    .line 444
    :cond_1
    iput v5, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    .line 445
    iput v5, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    .line 446
    iput-object v4, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    .line 447
    iput-boolean v5, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 426
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    if-gt v0, p1, :cond_0

    .line 427
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntMap;->clear()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 430
    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 431
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    .line 432
    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    .line 433
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    return-void
.end method

.method public containsKey(I)Z
    .locals 2

    if-nez p1, :cond_0

    .line 474
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    return p1

    .line 475
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    and-int/2addr v0, p1

    .line 476
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    .line 477
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash2(I)I

    move-result v0

    .line 478
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    .line 479
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash3(I)I

    move-result v0

    .line 480
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v0, v1, v0

    if-eq v0, p1, :cond_1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->containsKeyStash(I)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;Z)Z
    .locals 3

    .line 455
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    const/4 v1, 0x1

    if-nez p1, :cond_2

    .line 457
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    if-nez p1, :cond_0

    return v1

    .line 458
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 459
    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_0
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_8

    .line 460
    aget p2, p1, v2

    if-eqz p2, :cond_1

    aget-object p2, v0, v2

    if-nez p2, :cond_1

    return v1

    :cond_1
    move p2, v2

    goto :goto_0

    :cond_2
    if-eqz p2, :cond_5

    .line 462
    iget-object p2, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    if-ne p1, p2, :cond_3

    return v1

    .line 463
    :cond_3
    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_1
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_8

    .line 464
    aget-object p2, v0, v2

    if-ne p2, p1, :cond_4

    return v1

    :cond_4
    move p2, v2

    goto :goto_1

    .line 466
    :cond_5
    iget-boolean p2, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    return v1

    .line 467
    :cond_6
    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_2
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_8

    .line 468
    aget-object p2, v0, v2

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    return v1

    :cond_7
    move p2, v2

    goto :goto_2

    :cond_8
    const/4 p1, 0x0

    return p1
.end method

.method public ensureCapacity(I)V
    .locals 3

    if-ltz p1, :cond_1

    .line 520
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/2addr v0, p1

    .line 521
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt v0, p1, :cond_0

    int-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->loadFactor:F

    div-float/2addr p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_0
    return-void

    .line 519
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

.method public entries()Lcom/badlogic/gdx/utils/IntMap$Entries;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/IntMap$Entries<",
            "TV;>;"
        }
    .end annotation

    .line 669
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    return-object v0

    .line 670
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->entries1:Lcom/badlogic/gdx/utils/IntMap$Entries;

    if-nez v0, :cond_1

    .line 671
    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->entries1:Lcom/badlogic/gdx/utils/IntMap$Entries;

    .line 672
    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->entries2:Lcom/badlogic/gdx/utils/IntMap$Entries;

    .line 674
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->entries1:Lcom/badlogic/gdx/utils/IntMap$Entries;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntMap$Entries;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 675
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->entries1:Lcom/badlogic/gdx/utils/IntMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntMap$Entries;->reset()V

    .line 676
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->entries1:Lcom/badlogic/gdx/utils/IntMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntMap$Entries;->valid:Z

    .line 677
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->entries2:Lcom/badlogic/gdx/utils/IntMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntMap$Entries;->valid:Z

    return-object v0

    .line 680
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->entries2:Lcom/badlogic/gdx/utils/IntMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntMap$Entries;->reset()V

    .line 681
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->entries2:Lcom/badlogic/gdx/utils/IntMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntMap$Entries;->valid:Z

    .line 682
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->entries1:Lcom/badlogic/gdx/utils/IntMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntMap$Entries;->valid:Z

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 584
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/IntMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 585
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/IntMap;

    .line 586
    iget v1, p1, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 587
    :cond_2
    iget-boolean v1, p1, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    if-eqz v3, :cond_5

    .line 589
    iget-object v1, p1, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    if-nez v1, :cond_4

    .line 590
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    if-eqz v1, :cond_5

    return v2

    .line 592
    :cond_4
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    .line 595
    :cond_5
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 596
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    .line 597
    iget v4, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_8

    .line 598
    aget v6, v1, v5

    if-eqz v6, :cond_7

    .line 600
    aget-object v7, v3, v5

    if-nez v7, :cond_6

    .line 602
    sget-object v7, Lcom/badlogic/gdx/utils/ObjectMap;->dummy:Ljava/lang/Object;

    invoke-virtual {p1, v6, v7}, Lcom/badlogic/gdx/utils/IntMap;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_7

    return v2

    .line 604
    :cond_6
    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/utils/IntMap;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7

    return v2

    :cond_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_8
    return v0
.end method

.method public equalsIdentity(Ljava/lang/Object;)Z
    .locals 9

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 614
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/IntMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 615
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/IntMap;

    .line 616
    iget v1, p1, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 617
    :cond_2
    iget-boolean v1, p1, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    if-eqz v3, :cond_4

    .line 618
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    iget-object v3, p1, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    if-eq v1, v3, :cond_4

    return v2

    .line 619
    :cond_4
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 620
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    .line 621
    iget v4, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_6

    .line 622
    aget v6, v1, v5

    if-eqz v6, :cond_5

    .line 623
    aget-object v7, v3, v5

    sget-object v8, Lcom/badlogic/gdx/utils/ObjectMap;->dummy:Ljava/lang/Object;

    invoke-virtual {p1, v6, v8}, Lcom/badlogic/gdx/utils/IntMap;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eq v7, v6, :cond_5

    return v2

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_6
    return v0
.end method

.method public findKey(Ljava/lang/Object;ZI)I
    .locals 2

    .line 498
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez p1, :cond_2

    .line 500
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    if-nez p1, :cond_0

    return v1

    .line 501
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 502
    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_0
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_8

    .line 503
    aget p2, p1, v1

    if-eqz p2, :cond_1

    aget-object p2, v0, v1

    if-nez p2, :cond_1

    aget p1, p1, v1

    return p1

    :cond_1
    move p2, v1

    goto :goto_0

    :cond_2
    if-eqz p2, :cond_5

    .line 505
    iget-object p2, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    if-ne p1, p2, :cond_3

    return v1

    .line 506
    :cond_3
    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_1
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_8

    .line 507
    aget-object p2, v0, v1

    if-ne p2, p1, :cond_4

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget p1, p1, v1

    return p1

    :cond_4
    move p2, v1

    goto :goto_1

    .line 509
    :cond_5
    iget-boolean p2, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    return v1

    .line 510
    :cond_6
    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_2
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_8

    .line 511
    aget-object p2, v0, v1

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget p1, p1, v1

    return p1

    :cond_7
    move p2, v1

    goto :goto_2

    :cond_8
    return p3
.end method

.method public get(I)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_1

    .line 302
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return-object v0

    .line 303
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    return-object p1

    .line 305
    :cond_1
    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    and-int/2addr v1, p1

    .line 306
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v2, v2, v1

    if-eq v2, p1, :cond_2

    .line 307
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash2(I)I

    move-result v1

    .line 308
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v2, v2, v1

    if-eq v2, p1, :cond_2

    .line 309
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash3(I)I

    move-result v1

    .line 310
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v2, v2, v1

    if-eq v2, p1, :cond_2

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/IntMap;->getStash(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 313
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1
.end method

.method public get(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    if-nez p1, :cond_1

    .line 318
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return-object p2

    .line 319
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    return-object p1

    .line 321
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    and-int/2addr v0, p1

    .line 322
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    .line 323
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash2(I)I

    move-result v0

    .line 324
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    .line 325
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash3(I)I

    move-result v0

    .line 326
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v1, v1, v0

    if-eq v1, p1, :cond_2

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IntMap;->getStash(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 329
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v0

    return-object p1
.end method

.method public hashCode()I
    .locals 6

    .line 563
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 564
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 566
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 567
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    .line 568
    iget v4, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v4, v5

    :goto_1
    if-ge v1, v4, :cond_2

    .line 569
    aget v5, v2, v1

    if-eqz v5, :cond_1

    mul-int/lit8 v5, v5, 0x1f

    add-int/2addr v0, v5

    .line 573
    aget-object v5, v3, v1

    if-eqz v5, :cond_1

    .line 575
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

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

    .line 411
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

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
            "Lcom/badlogic/gdx/utils/IntMap$Entry<",
            "TV;>;>;"
        }
    .end annotation

    .line 661
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntMap;->entries()Lcom/badlogic/gdx/utils/IntMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/badlogic/gdx/utils/IntMap$Keys;
    .locals 3

    .line 713
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    return-object v0

    .line 714
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keys1:Lcom/badlogic/gdx/utils/IntMap$Keys;

    if-nez v0, :cond_1

    .line 715
    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keys1:Lcom/badlogic/gdx/utils/IntMap$Keys;

    .line 716
    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keys2:Lcom/badlogic/gdx/utils/IntMap$Keys;

    .line 718
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keys1:Lcom/badlogic/gdx/utils/IntMap$Keys;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntMap$Keys;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 719
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keys1:Lcom/badlogic/gdx/utils/IntMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntMap$Keys;->reset()V

    .line 720
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keys1:Lcom/badlogic/gdx/utils/IntMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntMap$Keys;->valid:Z

    .line 721
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->keys2:Lcom/badlogic/gdx/utils/IntMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntMap$Keys;->valid:Z

    return-object v0

    .line 724
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keys2:Lcom/badlogic/gdx/utils/IntMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntMap$Keys;->reset()V

    .line 725
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keys2:Lcom/badlogic/gdx/utils/IntMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntMap$Keys;->valid:Z

    .line 726
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->keys1:Lcom/badlogic/gdx/utils/IntMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntMap$Keys;->valid:Z

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 406
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITV;)TV;"
        }
    .end annotation

    const/4 v0, 0x1

    if-nez p1, :cond_1

    .line 100
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    .line 101
    iput-object p2, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    .line 102
    iget-boolean p2, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-nez p2, :cond_0

    .line 103
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    .line 104
    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/2addr p2, v0

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    :cond_0
    return-object p1

    .line 109
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 112
    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    and-int v6, p1, v2

    .line 113
    aget v7, v1, v6

    if-ne v7, p1, :cond_2

    .line 115
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v6

    .line 116
    aput-object p2, p1, v6

    return-object v0

    .line 120
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash2(I)I

    move-result v8

    .line 121
    aget v9, v1, v8

    if-ne v9, p1, :cond_3

    .line 123
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v8

    .line 124
    aput-object p2, p1, v8

    return-object v0

    .line 128
    :cond_3
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash3(I)I

    move-result v10

    .line 129
    aget v11, v1, v10

    if-ne v11, p1, :cond_4

    .line 131
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v10

    .line 132
    aput-object p2, p1, v10

    return-object v0

    .line 137
    :cond_4
    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v3, v2

    :goto_0
    if-ge v2, v3, :cond_6

    .line 138
    aget v4, v1, v2

    if-ne v4, p1, :cond_5

    .line 139
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v2

    .line 140
    aput-object p2, p1, v2

    return-object v0

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_6
    const/4 v2, 0x0

    if-nez v7, :cond_8

    .line 147
    aput p1, v1, v6

    .line 148
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v6

    .line 149
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_7
    return-object v2

    :cond_8
    if-nez v9, :cond_a

    .line 154
    aput p1, v1, v8

    .line 155
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v8

    .line 156
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_9

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_9
    return-object v2

    :cond_a
    if-nez v11, :cond_c

    .line 161
    aput p1, v1, v10

    .line 162
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v10

    .line 163
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IntMap;->threshold:I

    if-lt p1, p2, :cond_b

    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    shl-int/2addr p1, v0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    :cond_b
    return-object v2

    :cond_c
    move-object v3, p0

    move v4, p1

    move-object v5, p2

    .line 167
    invoke-direct/range {v3 .. v11}, Lcom/badlogic/gdx/utils/IntMap;->push(ILjava/lang/Object;IIIIII)V

    return-object v2
.end method

.method public putAll(Lcom/badlogic/gdx/utils/IntMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/IntMap<",
            "+TV;>;)V"
        }
    .end annotation

    .line 172
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/IntMap;->entries()Lcom/badlogic/gdx/utils/IntMap$Entries;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/IntMap$Entries;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/IntMap$Entry;

    .line 173
    iget v1, v0, Lcom/badlogic/gdx/utils/IntMap$Entry;->key:I

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntMap$Entry;->value:Ljava/lang/Object;

    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/utils/IntMap;->put(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public remove(I)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-nez p1, :cond_1

    .line 341
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return-object v1

    .line 342
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    .line 343
    iput-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    .line 344
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    .line 345
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    return-object p1

    .line 349
    :cond_1
    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->mask:I

    and-int/2addr v2, p1

    .line 350
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v4, v3, v2

    if-ne v4, p1, :cond_2

    .line 351
    aput v0, v3, v2

    .line 352
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v2

    .line 353
    aput-object v1, p1, v2

    .line 354
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    return-object v0

    .line 358
    :cond_2
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash2(I)I

    move-result v2

    .line 359
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v4, v3, v2

    if-ne v4, p1, :cond_3

    .line 360
    aput v0, v3, v2

    .line 361
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v2

    .line 362
    aput-object v1, p1, v2

    .line 363
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    return-object v0

    .line 367
    :cond_3
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->hash3(I)I

    move-result v2

    .line 368
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v4, v3, v2

    if-ne v4, p1, :cond_4

    .line 369
    aput v0, v3, v2

    .line 370
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v2

    .line 371
    aput-object v1, p1, v2

    .line 372
    iget p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    return-object v0

    .line 376
    :cond_4
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->removeStash(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method removeStash(I)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 380
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 381
    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 382
    aget v3, v0, v1

    if-ne v3, p1, :cond_0

    .line 383
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    .line 384
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/IntMap;->removeStashIndex(I)V

    .line 385
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    return-object p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method removeStashIndex(I)V
    .locals 4

    .line 394
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    .line 395
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v0, v1

    const/4 v1, 0x0

    if-ge p1, v0, :cond_0

    .line 397
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    aget v3, v2, v0

    aput v3, v2, p1

    .line 398
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aget-object v3, v2, v0

    aput-object v3, v2, p1

    .line 399
    aput-object v1, v2, v0

    goto :goto_0

    .line 401
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    aput-object v1, v0, p1

    :goto_0
    return-void
.end method

.method public shrink(I)V
    .locals 3

    if-ltz p1, :cond_2

    .line 418
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    if-le v0, p1, :cond_0

    move p1, v0

    .line 419
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    if-gt v0, p1, :cond_1

    return-void

    .line 420
    :cond_1
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    .line 421
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap;->resize(I)V

    return-void

    .line 417
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

    .line 629
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    if-nez v0, :cond_0

    const-string v0, "[]"

    return-object v0

    .line 630
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v1, 0x5b

    .line 631
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 632
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 633
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    .line 634
    array-length v3, v1

    .line 635
    iget-boolean v4, p0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    const/16 v5, 0x3d

    if-eqz v4, :cond_1

    const-string v4, "0="

    .line 636
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 637
    iget-object v4, p0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_2

    :cond_1
    :goto_0
    add-int/lit8 v4, v3, -0x1

    if-lez v3, :cond_3

    .line 640
    aget v3, v1, v4

    if-nez v3, :cond_2

    move v3, v4

    goto :goto_0

    .line 642
    :cond_2
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 643
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 644
    aget-object v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    :cond_3
    :goto_1
    move v3, v4

    :goto_2
    add-int/lit8 v4, v3, -0x1

    if-lez v3, :cond_5

    .line 649
    aget v3, v1, v4

    if-nez v3, :cond_4

    goto :goto_1

    :cond_4
    const-string v6, ", "

    .line 651
    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 652
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 653
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 654
    aget-object v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_1

    :cond_5
    const/16 v1, 0x5d

    .line 656
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 657
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Lcom/badlogic/gdx/utils/IntMap$Values;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/IntMap$Values<",
            "TV;>;"
        }
    .end annotation

    .line 691
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    return-object v0

    .line 692
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->values1:Lcom/badlogic/gdx/utils/IntMap$Values;

    if-nez v0, :cond_1

    .line 693
    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->values1:Lcom/badlogic/gdx/utils/IntMap$Values;

    .line 694
    new-instance v0, Lcom/badlogic/gdx/utils/IntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IntMap$Values;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->values2:Lcom/badlogic/gdx/utils/IntMap$Values;

    .line 696
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->values1:Lcom/badlogic/gdx/utils/IntMap$Values;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntMap$Values;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 697
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->values1:Lcom/badlogic/gdx/utils/IntMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntMap$Values;->reset()V

    .line 698
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->values1:Lcom/badlogic/gdx/utils/IntMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntMap$Values;->valid:Z

    .line 699
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->values2:Lcom/badlogic/gdx/utils/IntMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntMap$Values;->valid:Z

    return-object v0

    .line 702
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->values2:Lcom/badlogic/gdx/utils/IntMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntMap$Values;->reset()V

    .line 703
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap;->values2:Lcom/badlogic/gdx/utils/IntMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IntMap$Values;->valid:Z

    .line 704
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap;->values1:Lcom/badlogic/gdx/utils/IntMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IntMap$Values;->valid:Z

    return-object v0
.end method
