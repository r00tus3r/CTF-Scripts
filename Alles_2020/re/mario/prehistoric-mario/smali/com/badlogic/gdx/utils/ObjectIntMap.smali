.class public Lcom/badlogic/gdx/utils/ObjectIntMap;
.super Ljava/lang/Object;
.source "ObjectIntMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;,
        Lcom/badlogic/gdx/utils/ObjectIntMap$Values;,
        Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;,
        Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;,
        Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/ObjectIntMap$Entry<",
        "TK;>;>;"
    }
.end annotation


# static fields
.field private static final PRIME1:I = -0x41e0eb4f

.field private static final PRIME2:I = -0x4b47d1c7

.field private static final PRIME3:I = -0x312e3dbf


# instance fields
.field capacity:I

.field private entries1:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

.field private entries2:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

.field private hashShift:I

.field keyTable:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TK;"
        }
    .end annotation
.end field

.field private keys1:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

.field private keys2:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

.field private loadFactor:F

.field private mask:I

.field private pushIterations:I

.field public size:I

.field private stashCapacity:I

.field stashSize:I

.field private threshold:I

.field valueTable:[I

.field private values1:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

.field private values2:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x33

    const v1, 0x3f4ccccd    # 0.8f

    .line 53
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const v0, 0x3f4ccccd    # 0.8f

    .line 59
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 2

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p1, :cond_2

    int-to-float p1, p1

    div-float/2addr p1, p2

    float-to-double v0, p1

    .line 67
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    if-gt p1, v0, :cond_1

    .line 69
    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    const/4 p1, 0x0

    cmpg-float p1, p2, p1

    if-lez p1, :cond_0

    .line 72
    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->loadFactor:F

    .line 74
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    int-to-float v0, p1

    mul-float v0, v0, p2

    float-to-int p2, v0

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    add-int/lit8 p2, p1, -0x1

    .line 75
    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    .line 76
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x1f

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->hashShift:I

    const/4 p1, 0x3

    .line 77
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    int-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p2, v0

    mul-int/lit8 p2, p2, 0x2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashCapacity:I

    .line 78
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    const/16 p2, 0x8

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    div-int/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->pushIterations:I

    .line 80
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashCapacity:I

    add-int/2addr p1, p2

    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 81
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    array-length p1, p1

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    return-void

    .line 71
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

    .line 68
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

    .line 66
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

.method public constructor <init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectIntMap<",
            "+TK;>;)V"
        }
    .end annotation

    .line 86
    iget v0, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    int-to-float v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;->loadFactor:F

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;->loadFactor:F

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;-><init>(IF)V

    .line 87
    iget v0, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    .line 88
    iget-object v0, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 89
    iget-object v0, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 90
    iget p1, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    return-void
.end method

.method private containsKeyStash(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 444
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 445
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 446
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private getAndIncrementStash(Ljava/lang/Object;II)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;II)I"
        }
    .end annotation

    .line 316
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 317
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 318
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 319
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aget p2, p1, v1

    add-int/2addr p3, p2

    .line 320
    aput p3, p1, v1

    return p2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    add-int/2addr p3, p2

    .line 323
    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/utils/ObjectIntMap;->put(Ljava/lang/Object;I)V

    return p2
.end method

.method private getStash(Ljava/lang/Object;I)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)I"
        }
    .end annotation

    .line 292
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 293
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 294
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

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

    .line 497
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private hash3(I)I
    .locals 1

    const v0, -0x312e3dbf

    mul-int p1, p1, v0

    .line 502
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private push(Ljava/lang/Object;IILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;IITK;ITK;ITK;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 193
    iget-object v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 194
    iget-object v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    .line 195
    iget v3, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    .line 200
    iget v4, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->pushIterations:I

    const/4 v5, 0x0

    move-object/from16 v7, p1

    move/from16 v8, p2

    move/from16 v10, p3

    move-object/from16 v9, p4

    move/from16 v12, p5

    move-object/from16 v11, p6

    move/from16 v6, p7

    move-object/from16 v5, p8

    const/4 v13, 0x0

    :cond_0
    const/4 v14, 0x2

    .line 203
    invoke-static {v14}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v14

    const/4 v15, 0x1

    if-eqz v14, :cond_2

    if-eq v14, v15, :cond_1

    .line 218
    aget v9, v2, v6

    .line 219
    aput-object v7, v1, v6

    .line 220
    aput v8, v2, v6

    move-object v7, v5

    move v8, v9

    goto :goto_0

    .line 212
    :cond_1
    aget v5, v2, v12

    .line 213
    aput-object v7, v1, v12

    .line 214
    aput v8, v2, v12

    move v8, v5

    move-object v7, v11

    goto :goto_0

    .line 206
    :cond_2
    aget v5, v2, v10

    .line 207
    aput-object v7, v1, v10

    .line 208
    aput v8, v2, v10

    move v8, v5

    move-object v7, v9

    .line 225
    :goto_0
    invoke-virtual {v7}, Ljava/lang/Object;->hashCode()I

    move-result v5

    and-int v10, v5, v3

    .line 227
    aget-object v9, v1, v10

    if-nez v9, :cond_4

    .line 229
    aput-object v7, v1, v10

    .line 230
    aput v8, v2, v10

    .line 231
    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt v1, v2, :cond_3

    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_3
    return-void

    .line 235
    :cond_4
    invoke-direct {v0, v5}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash2(I)I

    move-result v12

    .line 236
    aget-object v11, v1, v12

    if-nez v11, :cond_6

    .line 238
    aput-object v7, v1, v12

    .line 239
    aput v8, v2, v12

    .line 240
    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt v1, v2, :cond_5

    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_5
    return-void

    .line 244
    :cond_6
    invoke-direct {v0, v5}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash3(I)I

    move-result v6

    .line 245
    aget-object v5, v1, v6

    if-nez v5, :cond_8

    .line 247
    aput-object v7, v1, v6

    .line 248
    aput v8, v2, v6

    .line 249
    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt v1, v2, :cond_7

    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    add-int/2addr v13, v15

    if-ne v13, v4, :cond_0

    .line 259
    invoke-direct {v0, v7, v8}, Lcom/badlogic/gdx/utils/ObjectIntMap;->putStash(Ljava/lang/Object;I)V

    return-void
.end method

.method private putResize(Ljava/lang/Object;I)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)V"
        }
    .end annotation

    .line 161
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 162
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    and-int v5, v0, v1

    .line 163
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v6, v1, v5

    if-nez v6, :cond_1

    .line 165
    aput-object p1, v1, v5

    .line 166
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v5

    .line 167
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt p1, p2, :cond_0

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_0
    return-void

    .line 171
    :cond_1
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash2(I)I

    move-result v7

    .line 172
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v8, v1, v7

    if-nez v8, :cond_3

    .line 174
    aput-object p1, v1, v7

    .line 175
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v7

    .line 176
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt p1, p2, :cond_2

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_2
    return-void

    .line 180
    :cond_3
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash3(I)I

    move-result v9

    .line 181
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v10, v0, v9

    if-nez v10, :cond_5

    .line 183
    aput-object p1, v0, v9

    .line 184
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v9

    .line 185
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt p1, p2, :cond_4

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_4
    return-void

    :cond_5
    move-object v2, p0

    move-object v3, p1

    move v4, p2

    .line 189
    invoke-direct/range {v2 .. v10}, Lcom/badlogic/gdx/utils/ObjectIntMap;->push(Ljava/lang/Object;IILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V

    return-void
.end method

.method private putStash(Ljava/lang/Object;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)V"
        }
    .end annotation

    .line 263
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashCapacity:I

    if-ne v0, v1, :cond_0

    .line 265
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    .line 266
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectIntMap;->putResize(Ljava/lang/Object;I)V

    return-void

    .line 270
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    add-int/2addr v1, v0

    .line 271
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aput-object p1, v2, v1

    .line 272
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v1

    add-int/lit8 v0, v0, 0x1

    .line 273
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    .line 274
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    return-void
.end method

.method private resize(I)V
    .locals 5

    .line 469
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v0, v1

    .line 471
    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    int-to-float v1, p1

    .line 472
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->loadFactor:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    add-int/lit8 v1, p1, -0x1

    .line 473
    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    .line 474
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x1f

    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->hashShift:I

    int-to-double v1, p1

    .line 475
    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    mul-int/lit8 v3, v3, 0x2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashCapacity:I

    const/16 v3, 0x8

    .line 476
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-int v1, v1

    div-int/2addr v1, v3

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->pushIterations:I

    .line 478
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 479
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    .line 481
    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashCapacity:I

    add-int v4, p1, v3

    new-array v4, v4, [Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Object;

    iput-object v4, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    add-int/2addr p1, v3

    .line 482
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    .line 484
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    const/4 v3, 0x0

    .line 485
    iput v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    .line 486
    iput v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    if-lez p1, :cond_1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 489
    aget-object p1, v1, v3

    if-eqz p1, :cond_0

    .line 490
    aget v4, v2, v3

    invoke-direct {p0, p1, v4}, Lcom/badlogic/gdx/utils/ObjectIntMap;->putResize(Ljava/lang/Object;I)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 3

    .line 411
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    if-nez v0, :cond_0

    return-void

    .line 412
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 413
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v1, v2

    :goto_0
    add-int/lit8 v2, v1, -0x1

    if-lez v1, :cond_1

    const/4 v1, 0x0

    .line 414
    aput-object v1, v0, v2

    move v1, v2

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 415
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    .line 416
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 402
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    if-gt v0, p1, :cond_0

    .line 403
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->clear()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 406
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    .line 407
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 431
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 432
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    and-int/2addr v1, v0

    .line 433
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v1, v2, v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 434
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash2(I)I

    move-result v1

    .line 435
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v1, v2, v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 436
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash3(I)I

    move-result v0

    .line 437
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v1, v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->containsKeyStash(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public containsValue(I)Z
    .locals 4

    .line 422
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 423
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    .line 424
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_1

    .line 425
    aget-object v2, v0, v3

    if-eqz v2, :cond_0

    aget v2, v1, v3

    if-ne v2, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    move v2, v3

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public ensureCapacity(I)V
    .locals 3

    if-ltz p1, :cond_1

    .line 464
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/2addr v0, p1

    .line 465
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt v0, p1, :cond_0

    int-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->loadFactor:F

    div-float/2addr p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_0
    return-void

    .line 463
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

.method public entries()Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectIntMap$Entries<",
            "TK;>;"
        }
    .end annotation

    .line 576
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    return-object v0

    .line 577
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries1:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    if-nez v0, :cond_1

    .line 578
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries1:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    .line 579
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries2:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    .line 581
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries1:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 582
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries1:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->reset()V

    .line 583
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries1:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->valid:Z

    .line 584
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries2:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->valid:Z

    return-object v0

    .line 587
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries2:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->reset()V

    .line 588
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries2:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->valid:Z

    .line 589
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries1:Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->valid:Z

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 523
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 524
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/ObjectIntMap;

    .line 525
    iget v1, p1, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 526
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 527
    iget-object v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    .line 528
    iget v4, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_5

    .line 529
    aget-object v6, v1, v5

    if-eqz v6, :cond_4

    .line 531
    invoke-virtual {p1, v6, v2}, Lcom/badlogic/gdx/utils/ObjectIntMap;->get(Ljava/lang/Object;I)I

    move-result v7

    if-nez v7, :cond_3

    .line 532
    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/utils/ObjectIntMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    return v2

    .line 533
    :cond_3
    aget v6, v3, v5

    if-eq v7, v6, :cond_4

    return v2

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_5
    return v0
.end method

.method public findKey(I)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TK;"
        }
    .end annotation

    .line 453
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 454
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    .line 455
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_1

    .line 456
    aget-object v2, v0, v3

    if-eqz v2, :cond_0

    aget v2, v1, v3

    if-ne v2, p1, :cond_0

    aget-object p1, v0, v3

    return-object p1

    :cond_0
    move v2, v3

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public get(Ljava/lang/Object;I)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)I"
        }
    .end annotation

    .line 279
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 280
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    and-int/2addr v1, v0

    .line 281
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 282
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash2(I)I

    move-result v1

    .line 283
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 284
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash3(I)I

    move-result v1

    .line 285
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectIntMap;->getStash(Ljava/lang/Object;I)I

    move-result p1

    return p1

    .line 288
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aget p1, p1, v1

    return p1
.end method

.method public getAndIncrement(Ljava/lang/Object;II)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;II)I"
        }
    .end annotation

    .line 301
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 302
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    and-int/2addr v1, v0

    .line 303
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 304
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash2(I)I

    move-result v1

    .line 305
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 306
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash3(I)I

    move-result v1

    .line 307
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/ObjectIntMap;->getAndIncrementStash(Ljava/lang/Object;II)I

    move-result p1

    return p1

    .line 310
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aget p2, p1, v1

    add-int/2addr p3, p2

    .line 311
    aput p3, p1, v1

    return p2
.end method

.method public hashCode()I
    .locals 6

    .line 507
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 508
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    .line 509
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    .line 510
    aget-object v5, v0, v3

    if-eqz v5, :cond_0

    .line 512
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    mul-int/lit8 v5, v5, 0x1f

    add-int/2addr v4, v5

    .line 514
    aget v5, v1, v3

    add-int/2addr v4, v5

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v4
.end method

.method public isEmpty()Z
    .locals 1

    .line 387
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectIntMap$Entries<",
            "TK;>;"
        }
    .end annotation

    .line 568
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries()Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 31
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->iterator()Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectIntMap$Keys<",
            "TK;>;"
        }
    .end annotation

    .line 620
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    return-object v0

    .line 621
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys1:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    if-nez v0, :cond_1

    .line 622
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys1:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    .line 623
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys2:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    .line 625
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys1:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 626
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys1:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;->reset()V

    .line 627
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys1:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;->valid:Z

    .line 628
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys2:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;->valid:Z

    return-object v0

    .line 631
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys2:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;->reset()V

    .line 632
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys2:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;->valid:Z

    .line 633
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keys1:Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectIntMap$Keys;->valid:Z

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 382
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(Ljava/lang/Object;I)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)V"
        }
    .end annotation

    if-eqz p1, :cond_b

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 98
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    .line 99
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    and-int v6, v1, v2

    .line 100
    aget-object v7, v0, v6

    .line 101
    invoke-virtual {p1, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 102
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v6

    return-void

    .line 106
    :cond_0
    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash2(I)I

    move-result v8

    .line 107
    aget-object v9, v0, v8

    .line 108
    invoke-virtual {p1, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 109
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v8

    return-void

    .line 113
    :cond_1
    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash3(I)I

    move-result v10

    .line 114
    aget-object v11, v0, v10

    .line 115
    invoke-virtual {p1, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 116
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v10

    return-void

    .line 121
    :cond_2
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_4

    .line 122
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 123
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v1

    return-void

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    if-nez v7, :cond_6

    .line 130
    aput-object p1, v0, v6

    .line 131
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v6

    .line 132
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_5
    return-void

    :cond_6
    if-nez v9, :cond_8

    .line 137
    aput-object p1, v0, v8

    .line 138
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v8

    .line 139
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    if-nez v11, :cond_a

    .line 144
    aput-object p1, v0, v10

    .line 145
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aput p2, p1, v10

    .line 146
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->threshold:I

    if-lt p1, p2, :cond_9

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    :cond_9
    return-void

    :cond_a
    move-object v3, p0

    move-object v4, p1

    move v5, p2

    .line 150
    invoke-direct/range {v3 .. v11}, Lcom/badlogic/gdx/utils/ObjectIntMap;->push(Ljava/lang/Object;IILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V

    return-void

    .line 94
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "key cannot be null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public putAll(Lcom/badlogic/gdx/utils/ObjectIntMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectIntMap<",
            "+TK;>;)V"
        }
    .end annotation

    .line 154
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->entries()Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->iterator()Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;

    .line 155
    iget-object v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;->key:Ljava/lang/Object;

    iget v0, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;->value:I

    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->put(Ljava/lang/Object;I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public remove(Ljava/lang/Object;I)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)I"
        }
    .end annotation

    .line 328
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 329
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->mask:I

    and-int/2addr v1, v0

    .line 330
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 331
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aput-object v3, p1, v1

    .line 332
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aget p1, p1, v1

    .line 333
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    return p1

    .line 337
    :cond_0
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash2(I)I

    move-result v1

    .line 338
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 339
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aput-object v3, p1, v1

    .line 340
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aget p1, p1, v1

    .line 341
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    return p1

    .line 345
    :cond_1
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectIntMap;->hash3(I)I

    move-result v0

    .line 346
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 347
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aput-object v3, p1, v0

    .line 348
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aget p1, p1, v0

    .line 349
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    return p1

    .line 353
    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectIntMap;->removeStash(Ljava/lang/Object;I)I

    move-result p1

    return p1
.end method

.method removeStash(Ljava/lang/Object;I)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)I"
        }
    .end annotation

    .line 357
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 358
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 359
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 360
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aget p1, p1, v1

    .line 361
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->removeStashIndex(I)V

    .line 362
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return p2
.end method

.method removeStashIndex(I)V
    .locals 4

    .line 371
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    .line 372
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    .line 374
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v1, v0

    aput-object v2, v1, p1

    .line 375
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    aget v3, v2, v0

    aput v3, v2, p1

    const/4 p1, 0x0

    .line 376
    aput-object p1, v1, v0

    :cond_0
    return-void
.end method

.method public shrink(I)V
    .locals 3

    if-ltz p1, :cond_2

    .line 394
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    if-le v0, p1, :cond_0

    move p1, v0

    .line 395
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    if-gt v0, p1, :cond_1

    return-void

    .line 396
    :cond_1
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    .line 397
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->resize(I)V

    return-void

    .line 393
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

    .line 541
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    if-nez v0, :cond_0

    const-string v0, "{}"

    return-object v0

    .line 542
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v1, 0x7b

    .line 543
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 544
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 545
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    .line 546
    array-length v3, v1

    :goto_0
    add-int/lit8 v4, v3, -0x1

    const/16 v5, 0x3d

    if-lez v3, :cond_2

    .line 548
    aget-object v3, v1, v4

    if-nez v3, :cond_1

    move v3, v4

    goto :goto_0

    .line 550
    :cond_1
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 551
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 552
    aget v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    :cond_2
    :goto_1
    add-int/lit8 v3, v4, -0x1

    if-lez v4, :cond_4

    .line 556
    aget-object v4, v1, v3

    if-nez v4, :cond_3

    goto :goto_2

    :cond_3
    const-string v6, ", "

    .line 558
    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 559
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 560
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 561
    aget v4, v2, v3

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_2
    move v4, v3

    goto :goto_1

    :cond_4
    const/16 v1, 0x7d

    .line 563
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 564
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Lcom/badlogic/gdx/utils/ObjectIntMap$Values;
    .locals 3

    .line 598
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    return-object v0

    .line 599
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values1:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    if-nez v0, :cond_1

    .line 600
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values1:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    .line 601
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values2:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    .line 603
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values1:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 604
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values1:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->reset()V

    .line 605
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values1:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->valid:Z

    .line 606
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values2:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->valid:Z

    return-object v0

    .line 609
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values2:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->reset()V

    .line 610
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values2:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->valid:Z

    .line 611
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap;->values1:Lcom/badlogic/gdx/utils/ObjectIntMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->valid:Z

    return-object v0
.end method
