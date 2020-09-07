.class public Lcom/badlogic/gdx/utils/LongMap;
.super Ljava/lang/Object;
.source "LongMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/LongMap$Keys;,
        Lcom/badlogic/gdx/utils/LongMap$Values;,
        Lcom/badlogic/gdx/utils/LongMap$Entries;,
        Lcom/badlogic/gdx/utils/LongMap$MapIterator;,
        Lcom/badlogic/gdx/utils/LongMap$Entry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/LongMap$Entry<",
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

.field private entries1:Lcom/badlogic/gdx/utils/LongMap$Entries;

.field private entries2:Lcom/badlogic/gdx/utils/LongMap$Entries;

.field hasZeroValue:Z

.field private hashShift:I

.field keyTable:[J

.field private keys1:Lcom/badlogic/gdx/utils/LongMap$Keys;

.field private keys2:Lcom/badlogic/gdx/utils/LongMap$Keys;

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

.field private values1:Lcom/badlogic/gdx/utils/LongMap$Values;

.field private values2:Lcom/badlogic/gdx/utils/LongMap$Values;

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
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/LongMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const v0, 0x3f4ccccd    # 0.8f

    .line 62
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/LongMap;-><init>(IF)V

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
    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    const/4 p1, 0x0

    cmpg-float p1, p2, p1

    if-lez p1, :cond_0

    .line 75
    iput p2, p0, Lcom/badlogic/gdx/utils/LongMap;->loadFactor:F

    .line 77
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    int-to-float v0, p1

    mul-float v0, v0, p2

    float-to-int p2, v0

    iput p2, p0, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    add-int/lit8 p2, p1, -0x1

    .line 78
    iput p2, p0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long p1, p1

    .line 79
    invoke-static {p1, p2}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x3f

    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->hashShift:I

    const/4 p1, 0x3

    .line 80
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    int-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p2, v0

    mul-int/lit8 p2, p2, 0x2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->stashCapacity:I

    .line 81
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    const/16 p2, 0x8

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    div-int/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->pushIterations:I

    .line 83
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->stashCapacity:I

    add-int/2addr p1, p2

    new-array p1, p1, [J

    iput-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 84
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    array-length p1, p1

    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

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

.method public constructor <init>(Lcom/badlogic/gdx/utils/LongMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/LongMap<",
            "+TV;>;)V"
        }
    .end annotation

    .line 89
    iget v0, p1, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    int-to-float v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/LongMap;->loadFactor:F

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/LongMap;->loadFactor:F

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/LongMap;-><init>(IF)V

    .line 90
    iget v0, p1, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    iput v0, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    .line 91
    iget-object v0, p1, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    iget-object v0, p1, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    iget v0, p1, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iput v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    .line 94
    iget-object v0, p1, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    .line 95
    iget-boolean p1, p1, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    return-void
.end method

.method private containsKeyStash(J)Z
    .locals 6

    .line 484
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 485
    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 486
    aget-wide v3, v0, v1

    cmp-long v5, v3, p1

    if-nez v5, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private getStash(JLjava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTV;)TV;"
        }
    .end annotation

    .line 332
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 333
    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 334
    aget-wide v3, v0, v1

    cmp-long v5, v3, p1

    if-nez v5, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p3
.end method

.method private hash2(J)I
    .locals 2

    const-wide/32 v0, -0x4b47d1c7

    mul-long p1, p1, v0

    .line 550
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->hashShift:I

    ushr-long v0, p1, v0

    xor-long/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v0, v0

    and-long/2addr p1, v0

    long-to-int p2, p1

    return p2
.end method

.method private hash3(J)I
    .locals 2

    const-wide/32 v0, -0x312e3dbf

    mul-long p1, p1, v0

    .line 555
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->hashShift:I

    ushr-long v0, p1, v0

    xor-long/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v0, v0

    and-long/2addr p1, v0

    long-to-int p2, p1

    return p2
.end method

.method private push(JLjava/lang/Object;IJIJIJ)V
    .locals 22
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTV;IJIJIJ)V"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 216
    iget-object v1, v0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 217
    iget-object v2, v0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    .line 218
    iget v3, v0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    .line 223
    iget v4, v0, Lcom/badlogic/gdx/utils/LongMap;->pushIterations:I

    const/4 v5, 0x0

    move-wide/from16 v8, p1

    move-object/from16 v10, p3

    move/from16 v13, p4

    move-wide/from16 v11, p5

    move/from16 v16, p7

    move-wide/from16 v14, p8

    move/from16 v7, p10

    move-wide/from16 v5, p11

    const/16 v17, 0x0

    :goto_0
    const/16 v18, 0x2

    move-wide/from16 p1, v5

    .line 226
    invoke-static/range {v18 .. v18}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_1

    if-eq v5, v6, :cond_0

    .line 241
    aget-object v5, v2, v7

    .line 242
    aput-wide v8, v1, v7

    .line 243
    aput-object v10, v2, v7

    move-wide/from16 v8, p1

    move-object v10, v5

    goto :goto_1

    .line 235
    :cond_0
    aget-object v5, v2, v16

    .line 236
    aput-wide v8, v1, v16

    .line 237
    aput-object v10, v2, v16

    move-object v10, v5

    move-wide v8, v14

    goto :goto_1

    .line 229
    :cond_1
    aget-object v5, v2, v13

    .line 230
    aput-wide v8, v1, v13

    .line 231
    aput-object v10, v2, v13

    move-object v10, v5

    move-wide v8, v11

    :goto_1
    int-to-long v11, v3

    and-long/2addr v11, v8

    long-to-int v13, v11

    .line 249
    aget-wide v11, v1, v13

    const-wide/16 v14, 0x0

    cmp-long v5, v11, v14

    if-nez v5, :cond_3

    .line 251
    aput-wide v8, v1, v13

    .line 252
    aput-object v10, v2, v13

    .line 253
    iget v1, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v1, v2, :cond_2

    iget v1, v0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    shl-int/2addr v1, v6

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_2
    return-void

    .line 257
    :cond_3
    invoke-direct {v0, v8, v9}, Lcom/badlogic/gdx/utils/LongMap;->hash2(J)I

    move-result v16

    .line 258
    aget-wide v18, v1, v16

    cmp-long v5, v18, v14

    if-nez v5, :cond_5

    .line 260
    aput-wide v8, v1, v16

    .line 261
    aput-object v10, v2, v16

    .line 262
    iget v1, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v1, v2, :cond_4

    iget v1, v0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    shl-int/2addr v1, v6

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_4
    return-void

    .line 266
    :cond_5
    invoke-direct {v0, v8, v9}, Lcom/badlogic/gdx/utils/LongMap;->hash3(J)I

    move-result v7

    .line 267
    aget-wide v20, v1, v7

    cmp-long v5, v20, v14

    if-nez v5, :cond_7

    .line 269
    aput-wide v8, v1, v7

    .line 270
    aput-object v10, v2, v7

    .line 271
    iget v1, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v1, v2, :cond_6

    iget v1, v0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    shl-int/2addr v1, v6

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_6
    return-void

    :cond_7
    add-int/lit8 v5, v17, 0x1

    if-ne v5, v4, :cond_8

    .line 281
    invoke-direct {v0, v8, v9, v10}, Lcom/badlogic/gdx/utils/LongMap;->putStash(JLjava/lang/Object;)V

    return-void

    :cond_8
    move/from16 v17, v5

    move-wide/from16 v14, v18

    move-wide/from16 v5, v20

    goto/16 :goto_0
.end method

.method private putResize(JLjava/lang/Object;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTV;)V"
        }
    .end annotation

    move-object/from16 v13, p0

    move-object/from16 v3, p3

    const-wide/16 v0, 0x0

    const/4 v2, 0x1

    cmp-long v4, p1, v0

    if-nez v4, :cond_0

    .line 179
    iput-object v3, v13, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    .line 180
    iput-boolean v2, v13, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    return-void

    .line 185
    :cond_0
    iget v4, v13, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v4, v4

    and-long v4, p1, v4

    long-to-int v4, v4

    .line 186
    iget-object v5, v13, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v6, v5, v4

    cmp-long v8, v6, v0

    if-nez v8, :cond_2

    .line 188
    aput-wide p1, v5, v4

    .line 189
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aput-object v3, v0, v4

    .line 190
    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v1, v13, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v0, v1, :cond_1

    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    shl-int/2addr v0, v2

    invoke-direct {v13, v0}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_1
    return-void

    .line 194
    :cond_2
    invoke-direct/range {p0 .. p2}, Lcom/badlogic/gdx/utils/LongMap;->hash2(J)I

    move-result v8

    .line 195
    iget-object v5, v13, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v9, v5, v8

    cmp-long v11, v9, v0

    if-nez v11, :cond_4

    .line 197
    aput-wide p1, v5, v8

    .line 198
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aput-object v3, v0, v8

    .line 199
    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v1, v13, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v0, v1, :cond_3

    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    shl-int/2addr v0, v2

    invoke-direct {v13, v0}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_3
    return-void

    .line 203
    :cond_4
    invoke-direct/range {p0 .. p2}, Lcom/badlogic/gdx/utils/LongMap;->hash3(J)I

    move-result v11

    .line 204
    iget-object v5, v13, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v14, v5, v11

    cmp-long v12, v14, v0

    if-nez v12, :cond_6

    .line 206
    aput-wide p1, v5, v11

    .line 207
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aput-object v3, v0, v11

    .line 208
    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v1, v13, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v0, v1, :cond_5

    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    shl-int/2addr v0, v2

    invoke-direct {v13, v0}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_5
    return-void

    :cond_6
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    move-wide v5, v6

    move v7, v8

    move-wide v8, v9

    move v10, v11

    move-wide v11, v14

    .line 212
    invoke-direct/range {v0 .. v12}, Lcom/badlogic/gdx/utils/LongMap;->push(JLjava/lang/Object;IJIJIJ)V

    return-void
.end method

.method private putStash(JLjava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTV;)V"
        }
    .end annotation

    .line 285
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->stashCapacity:I

    if-ne v0, v1, :cond_0

    .line 287
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    .line 288
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/LongMap;->putResize(JLjava/lang/Object;)V

    return-void

    .line 292
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    add-int/2addr v1, v0

    .line 293
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aput-wide p1, v2, v1

    .line 294
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aput-object p3, p1, v1

    add-int/lit8 v0, v0, 0x1

    .line 295
    iput v0, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    .line 296
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    return-void
.end method

.method private resize(I)V
    .locals 8

    .line 522
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v0, v1

    .line 524
    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    int-to-float v1, p1

    .line 525
    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap;->loadFactor:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    add-int/lit8 v1, p1, -0x1

    .line 526
    iput v1, p0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v1, p1

    .line 527
    invoke-static {v1, v2}, Ljava/lang/Long;->numberOfTrailingZeros(J)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x3f

    iput v1, p0, Lcom/badlogic/gdx/utils/LongMap;->hashShift:I

    int-to-double v1, p1

    .line 528
    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    mul-int/lit8 v3, v3, 0x2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/badlogic/gdx/utils/LongMap;->stashCapacity:I

    const/16 v3, 0x8

    .line 529
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-int v1, v1

    div-int/2addr v1, v3

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/utils/LongMap;->pushIterations:I

    .line 531
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 532
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    .line 534
    iget v3, p0, Lcom/badlogic/gdx/utils/LongMap;->stashCapacity:I

    add-int v4, p1, v3

    new-array v4, v4, [J

    iput-object v4, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    add-int/2addr p1, v3

    .line 535
    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    .line 537
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    .line 538
    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    iput v3, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    const/4 v3, 0x0

    .line 539
    iput v3, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    if-lez p1, :cond_1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 542
    aget-wide v4, v1, v3

    const-wide/16 v6, 0x0

    cmp-long p1, v4, v6

    if-eqz p1, :cond_0

    .line 543
    aget-object p1, v2, v3

    invoke-direct {p0, v4, v5, p1}, Lcom/badlogic/gdx/utils/LongMap;->putResize(JLjava/lang/Object;)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 7

    .line 436
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    if-nez v0, :cond_0

    return-void

    .line 437
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 438
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    .line 439
    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    const/4 v4, 0x0

    if-lez v2, :cond_1

    const-wide/16 v5, 0x0

    .line 440
    aput-wide v5, v0, v3

    .line 441
    aput-object v4, v1, v3

    move v2, v3

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 443
    iput v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    .line 444
    iput v0, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    .line 445
    iput-object v4, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    .line 446
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 425
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    if-gt v0, p1, :cond_0

    .line 426
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/LongMap;->clear()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 429
    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 430
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    .line 431
    iput v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    .line 432
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    return-void
.end method

.method public containsKey(J)Z
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 471
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    return p1

    .line 472
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v0, v0

    and-long/2addr v0, p1

    long-to-int v1, v0

    .line 473
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v1, v0, v1

    cmp-long v0, v1, p1

    if-eqz v0, :cond_1

    .line 474
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->hash2(J)I

    move-result v0

    .line 475
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v0, v1, v0

    cmp-long v2, v0, p1

    if-eqz v2, :cond_1

    .line 476
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->hash3(J)I

    move-result v0

    .line 477
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v0, v1, v0

    cmp-long v2, v0, p1

    if-eqz v2, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->containsKeyStash(J)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;Z)Z
    .locals 7

    .line 452
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    const/4 v1, 0x1

    if-nez p1, :cond_2

    .line 454
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    if-nez p1, :cond_0

    return v1

    .line 455
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 456
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_0
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_8

    .line 457
    aget-wide v3, p1, v2

    const-wide/16 v5, 0x0

    cmp-long p2, v3, v5

    if-eqz p2, :cond_1

    aget-object p2, v0, v2

    if-nez p2, :cond_1

    return v1

    :cond_1
    move p2, v2

    goto :goto_0

    :cond_2
    if-eqz p2, :cond_5

    .line 459
    iget-object p2, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    if-ne p1, p2, :cond_3

    return v1

    .line 460
    :cond_3
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_1
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_8

    .line 461
    aget-object p2, v0, v2

    if-ne p2, p1, :cond_4

    return v1

    :cond_4
    move p2, v2

    goto :goto_1

    .line 463
    :cond_5
    iget-boolean p2, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    return v1

    .line 464
    :cond_6
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_2
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_8

    .line 465
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

    .line 517
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/2addr v0, p1

    .line 518
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v0, p1, :cond_0

    int-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->loadFactor:F

    div-float/2addr p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_0
    return-void

    .line 516
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

.method public entries()Lcom/badlogic/gdx/utils/LongMap$Entries;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/LongMap$Entries<",
            "TV;>;"
        }
    .end annotation

    .line 661
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Entries;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    return-object v0

    .line 662
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->entries1:Lcom/badlogic/gdx/utils/LongMap$Entries;

    if-nez v0, :cond_1

    .line 663
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Entries;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->entries1:Lcom/badlogic/gdx/utils/LongMap$Entries;

    .line 664
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Entries;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->entries2:Lcom/badlogic/gdx/utils/LongMap$Entries;

    .line 666
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->entries1:Lcom/badlogic/gdx/utils/LongMap$Entries;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/LongMap$Entries;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 667
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->entries1:Lcom/badlogic/gdx/utils/LongMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap$Entries;->reset()V

    .line 668
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->entries1:Lcom/badlogic/gdx/utils/LongMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/LongMap$Entries;->valid:Z

    .line 669
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->entries2:Lcom/badlogic/gdx/utils/LongMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/LongMap$Entries;->valid:Z

    return-object v0

    .line 672
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->entries2:Lcom/badlogic/gdx/utils/LongMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap$Entries;->reset()V

    .line 673
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->entries2:Lcom/badlogic/gdx/utils/LongMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/LongMap$Entries;->valid:Z

    .line 674
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->entries1:Lcom/badlogic/gdx/utils/LongMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/LongMap$Entries;->valid:Z

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 11

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 581
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/LongMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 582
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/LongMap;

    .line 583
    iget v1, p1, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 584
    :cond_2
    iget-boolean v1, p1, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    if-eqz v3, :cond_5

    .line 586
    iget-object v1, p1, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    if-nez v1, :cond_4

    .line 587
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    if-eqz v1, :cond_5

    return v2

    .line 589
    :cond_4
    iget-object v3, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    return v2

    .line 592
    :cond_5
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 593
    iget-object v3, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    .line 594
    iget v4, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_8

    .line 595
    aget-wide v6, v1, v5

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-eqz v10, :cond_7

    .line 597
    aget-object v8, v3, v5

    if-nez v8, :cond_6

    .line 599
    sget-object v8, Lcom/badlogic/gdx/utils/ObjectMap;->dummy:Ljava/lang/Object;

    invoke-virtual {p1, v6, v7, v8}, Lcom/badlogic/gdx/utils/LongMap;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_7

    return v2

    .line 601
    :cond_6
    invoke-virtual {p1, v6, v7}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v8, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

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
    .locals 11

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 611
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/LongMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 612
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/LongMap;

    .line 613
    iget v1, p1, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 614
    :cond_2
    iget-boolean v1, p1, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-eq v1, v3, :cond_3

    return v2

    :cond_3
    if-eqz v3, :cond_4

    .line 615
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    iget-object v3, p1, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    if-eq v1, v3, :cond_4

    return v2

    .line 616
    :cond_4
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 617
    iget-object v3, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    .line 618
    iget v4, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_6

    .line 619
    aget-wide v6, v1, v5

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-eqz v10, :cond_5

    .line 620
    aget-object v8, v3, v5

    sget-object v9, Lcom/badlogic/gdx/utils/ObjectMap;->dummy:Ljava/lang/Object;

    invoke-virtual {p1, v6, v7, v9}, Lcom/badlogic/gdx/utils/LongMap;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eq v8, v6, :cond_5

    return v2

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_6
    return v0
.end method

.method public findKey(Ljava/lang/Object;ZJ)J
    .locals 6

    .line 495
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    const-wide/16 v1, 0x0

    if-nez p1, :cond_2

    .line 497
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    if-nez p1, :cond_0

    return-wide v1

    .line 498
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 499
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr p2, v3

    :goto_0
    add-int/lit8 v3, p2, -0x1

    if-lez p2, :cond_8

    .line 500
    aget-wide v4, p1, v3

    cmp-long p2, v4, v1

    if-eqz p2, :cond_1

    aget-object p2, v0, v3

    if-nez p2, :cond_1

    aget-wide p2, p1, v3

    return-wide p2

    :cond_1
    move p2, v3

    goto :goto_0

    :cond_2
    if-eqz p2, :cond_5

    .line 502
    iget-object p2, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    if-ne p1, p2, :cond_3

    return-wide v1

    .line 503
    :cond_3
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_1
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_8

    .line 504
    aget-object p2, v0, v1

    if-ne p2, p1, :cond_4

    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide p2, p1, v1

    return-wide p2

    :cond_4
    move p2, v1

    goto :goto_1

    .line 506
    :cond_5
    iget-boolean p2, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-eqz p2, :cond_6

    iget-object p2, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    return-wide v1

    .line 507
    :cond_6
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_2
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_8

    .line 508
    aget-object p2, v0, v1

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_7

    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide p2, p1, v1

    return-wide p2

    :cond_7
    move p2, v1

    goto :goto_2

    :cond_8
    return-wide p3
.end method

.method public get(J)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TV;"
        }
    .end annotation

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-nez v3, :cond_1

    .line 301
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return-object v0

    .line 302
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    return-object p1

    .line 304
    :cond_1
    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v1, v1

    and-long/2addr v1, p1

    long-to-int v2, v1

    .line 305
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v3, v1, v2

    cmp-long v1, v3, p1

    if-eqz v1, :cond_2

    .line 306
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->hash2(J)I

    move-result v2

    .line 307
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v3, v1, v2

    cmp-long v1, v3, p1

    if-eqz v1, :cond_2

    .line 308
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->hash3(J)I

    move-result v2

    .line 309
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v3, v1, v2

    cmp-long v1, v3, p1

    if-eqz v1, :cond_2

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/utils/LongMap;->getStash(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 312
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v2

    return-object p1
.end method

.method public get(JLjava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTV;)TV;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_1

    .line 317
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return-object p3

    .line 318
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    return-object p1

    .line 320
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v0, v0

    and-long/2addr v0, p1

    long-to-int v1, v0

    .line 321
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v2, v0, v1

    cmp-long v0, v2, p1

    if-eqz v0, :cond_2

    .line 322
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->hash2(J)I

    move-result v1

    .line 323
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v2, v0, v1

    cmp-long v0, v2, p1

    if-eqz v0, :cond_2

    .line 324
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->hash3(J)I

    move-result v1

    .line 325
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v2, v0, v1

    cmp-long v0, v2, p1

    if-eqz v0, :cond_2

    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/LongMap;->getStash(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 328
    :cond_2
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1
.end method

.method public hashCode()I
    .locals 10

    .line 560
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 561
    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 563
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 564
    iget-object v3, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    .line 565
    iget v4, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v4, v5

    :goto_1
    if-ge v1, v4, :cond_2

    .line 566
    aget-wide v5, v2, v1

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-eqz v9, :cond_1

    const/16 v7, 0x20

    ushr-long v7, v5, v7

    xor-long/2addr v5, v7

    long-to-int v6, v5

    mul-int/lit8 v6, v6, 0x1f

    add-int/2addr v0, v6

    .line 570
    aget-object v5, v3, v1

    if-eqz v5, :cond_1

    .line 572
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

    .line 410
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

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
            "Lcom/badlogic/gdx/utils/LongMap$Entry<",
            "TV;>;>;"
        }
    .end annotation

    .line 653
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/LongMap;->entries()Lcom/badlogic/gdx/utils/LongMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/badlogic/gdx/utils/LongMap$Keys;
    .locals 3

    .line 705
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Keys;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    return-object v0

    .line 706
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keys1:Lcom/badlogic/gdx/utils/LongMap$Keys;

    if-nez v0, :cond_1

    .line 707
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Keys;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keys1:Lcom/badlogic/gdx/utils/LongMap$Keys;

    .line 708
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Keys;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keys2:Lcom/badlogic/gdx/utils/LongMap$Keys;

    .line 710
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keys1:Lcom/badlogic/gdx/utils/LongMap$Keys;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/LongMap$Keys;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 711
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keys1:Lcom/badlogic/gdx/utils/LongMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap$Keys;->reset()V

    .line 712
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keys1:Lcom/badlogic/gdx/utils/LongMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/LongMap$Keys;->valid:Z

    .line 713
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->keys2:Lcom/badlogic/gdx/utils/LongMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/LongMap$Keys;->valid:Z

    return-object v0

    .line 716
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keys2:Lcom/badlogic/gdx/utils/LongMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap$Keys;->reset()V

    .line 717
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keys2:Lcom/badlogic/gdx/utils/LongMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/LongMap$Keys;->valid:Z

    .line 718
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->keys1:Lcom/badlogic/gdx/utils/LongMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/LongMap$Keys;->valid:Z

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 405
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(JLjava/lang/Object;)Ljava/lang/Object;
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JTV;)TV;"
        }
    .end annotation

    move-object/from16 v13, p0

    move-object/from16 v3, p3

    const-wide/16 v0, 0x0

    const/4 v2, 0x1

    cmp-long v4, p1, v0

    if-nez v4, :cond_1

    .line 100
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    .line 101
    iput-object v3, v13, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    .line 102
    iget-boolean v1, v13, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-nez v1, :cond_0

    .line 103
    iput-boolean v2, v13, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    .line 104
    iget v1, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/2addr v1, v2

    iput v1, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    :cond_0
    return-object v0

    .line 109
    :cond_1
    iget-object v4, v13, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 112
    iget v5, v13, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v5, v5

    and-long v5, p1, v5

    long-to-int v6, v5

    .line 113
    aget-wide v7, v4, v6

    cmp-long v5, v7, p1

    if-nez v5, :cond_2

    .line 115
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object v1, v0, v6

    .line 116
    aput-object v3, v0, v6

    return-object v1

    .line 120
    :cond_2
    invoke-direct/range {p0 .. p2}, Lcom/badlogic/gdx/utils/LongMap;->hash2(J)I

    move-result v9

    .line 121
    aget-wide v10, v4, v9

    cmp-long v5, v10, p1

    if-nez v5, :cond_3

    .line 123
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object v1, v0, v9

    .line 124
    aput-object v3, v0, v9

    return-object v1

    .line 128
    :cond_3
    invoke-direct/range {p0 .. p2}, Lcom/badlogic/gdx/utils/LongMap;->hash3(J)I

    move-result v12

    .line 129
    aget-wide v14, v4, v12

    cmp-long v5, v14, p1

    if-nez v5, :cond_4

    .line 131
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object v1, v0, v12

    .line 132
    aput-object v3, v0, v12

    return-object v1

    .line 137
    :cond_4
    iget v5, v13, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v2, v13, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v2, v5

    :goto_0
    if-ge v5, v2, :cond_6

    .line 138
    aget-wide v16, v4, v5

    cmp-long v18, v16, p1

    if-nez v18, :cond_5

    .line 139
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object v1, v0, v5

    .line 140
    aput-object v3, v0, v5

    return-object v1

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_6
    const/16 v16, 0x0

    cmp-long v2, v7, v0

    if-nez v2, :cond_8

    .line 147
    aput-wide p1, v4, v6

    .line 148
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aput-object v3, v0, v6

    .line 149
    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v1, v13, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v0, v1, :cond_7

    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    const/4 v1, 0x1

    shl-int/2addr v0, v1

    invoke-direct {v13, v0}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_7
    return-object v16

    :cond_8
    cmp-long v2, v10, v0

    if-nez v2, :cond_a

    .line 154
    aput-wide p1, v4, v9

    .line 155
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aput-object v3, v0, v9

    .line 156
    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v1, v13, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v0, v1, :cond_9

    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    const/4 v1, 0x1

    shl-int/2addr v0, v1

    invoke-direct {v13, v0}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_9
    return-object v16

    :cond_a
    cmp-long v2, v14, v0

    if-nez v2, :cond_c

    .line 161
    aput-wide p1, v4, v12

    .line 162
    iget-object v0, v13, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aput-object v3, v0, v12

    .line 163
    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 v1, v0, 0x1

    iput v1, v13, Lcom/badlogic/gdx/utils/LongMap;->size:I

    iget v1, v13, Lcom/badlogic/gdx/utils/LongMap;->threshold:I

    if-lt v0, v1, :cond_b

    iget v0, v13, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    const/4 v1, 0x1

    shl-int/2addr v0, v1

    invoke-direct {v13, v0}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    :cond_b
    return-object v16

    :cond_c
    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    move v4, v6

    move-wide v5, v7

    move v7, v9

    move-wide v8, v10

    move v10, v12

    move-wide v11, v14

    .line 167
    invoke-direct/range {v0 .. v12}, Lcom/badlogic/gdx/utils/LongMap;->push(JLjava/lang/Object;IJIJIJ)V

    return-object v16
.end method

.method public putAll(Lcom/badlogic/gdx/utils/LongMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/LongMap<",
            "+TV;>;)V"
        }
    .end annotation

    .line 172
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/LongMap;->entries()Lcom/badlogic/gdx/utils/LongMap$Entries;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/LongMap$Entries;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/LongMap$Entry;

    .line 173
    iget-wide v1, v0, Lcom/badlogic/gdx/utils/LongMap$Entry;->key:J

    iget-object v0, v0, Lcom/badlogic/gdx/utils/LongMap$Entry;->value:Ljava/lang/Object;

    invoke-virtual {p0, v1, v2, v0}, Lcom/badlogic/gdx/utils/LongMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public remove(J)Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TV;"
        }
    .end annotation

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    cmp-long v3, p1, v0

    if-nez v3, :cond_1

    .line 340
    iget-boolean p1, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    if-nez p1, :cond_0

    return-object v2

    .line 341
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    .line 342
    iput-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->zeroValue:Ljava/lang/Object;

    const/4 p2, 0x0

    .line 343
    iput-boolean p2, p0, Lcom/badlogic/gdx/utils/LongMap;->hasZeroValue:Z

    .line 344
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    return-object p1

    .line 348
    :cond_1
    iget v3, p0, Lcom/badlogic/gdx/utils/LongMap;->mask:I

    int-to-long v3, v3

    and-long/2addr v3, p1

    long-to-int v4, v3

    .line 349
    iget-object v3, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v5, v3, v4

    cmp-long v7, v5, p1

    if-nez v7, :cond_2

    .line 350
    aput-wide v0, v3, v4

    .line 351
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object p2, p1, v4

    .line 352
    aput-object v2, p1, v4

    .line 353
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    return-object p2

    .line 357
    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->hash2(J)I

    move-result v3

    .line 358
    iget-object v4, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v5, v4, v3

    cmp-long v7, v5, p1

    if-nez v7, :cond_3

    .line 359
    aput-wide v0, v4, v3

    .line 360
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object p2, p1, v3

    .line 361
    aput-object v2, p1, v3

    .line 362
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    return-object p2

    .line 366
    :cond_3
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->hash3(J)I

    move-result v3

    .line 367
    iget-object v4, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v5, v4, v3

    cmp-long v7, v5, p1

    if-nez v7, :cond_4

    .line 368
    aput-wide v0, v4, v3

    .line 369
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object p2, p1, v3

    .line 370
    aput-object v2, p1, v3

    .line 371
    iget p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    return-object p2

    .line 375
    :cond_4
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->removeStash(J)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method removeStash(J)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TV;"
        }
    .end annotation

    .line 379
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 380
    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 381
    aget-wide v3, v0, v1

    cmp-long v5, v3, p1

    if-nez v5, :cond_0

    .line 382
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    .line 383
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/LongMap;->removeStashIndex(I)V

    .line 384
    iget p2, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    return-object p1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method removeStashIndex(I)V
    .locals 5

    .line 393
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    .line 394
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap;->stashSize:I

    add-int/2addr v0, v1

    const/4 v1, 0x0

    if-ge p1, v0, :cond_0

    .line 396
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    aget-wide v3, v2, v0

    aput-wide v3, v2, p1

    .line 397
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aget-object v3, v2, v0

    aput-object v3, v2, p1

    .line 398
    aput-object v1, v2, v0

    goto :goto_0

    .line 400
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    aput-object v1, v0, p1

    :goto_0
    return-void
.end method

.method public shrink(I)V
    .locals 3

    if-ltz p1, :cond_2

    .line 417
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    if-le v0, p1, :cond_0

    move p1, v0

    .line 418
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->capacity:I

    if-gt v0, p1, :cond_1

    return-void

    .line 419
    :cond_1
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    .line 420
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/LongMap;->resize(I)V

    return-void

    .line 416
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
    .locals 10

    .line 626
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    if-nez v0, :cond_0

    const-string v0, "[]"

    return-object v0

    .line 627
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v1, 0x5b

    .line 628
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 629
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    .line 630
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->valueTable:[Ljava/lang/Object;

    .line 631
    array-length v3, v1

    :goto_0
    add-int/lit8 v4, v3, -0x1

    const/16 v5, 0x3d

    const-wide/16 v6, 0x0

    if-lez v3, :cond_2

    .line 633
    aget-wide v8, v1, v4

    cmp-long v3, v8, v6

    if-nez v3, :cond_1

    move v3, v4

    goto :goto_0

    .line 635
    :cond_1
    invoke-virtual {v0, v8, v9}, Lcom/badlogic/gdx/utils/StringBuilder;->append(J)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 636
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 637
    aget-object v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    :cond_2
    :goto_1
    add-int/lit8 v3, v4, -0x1

    if-lez v4, :cond_4

    .line 641
    aget-wide v8, v1, v3

    cmp-long v4, v8, v6

    if-nez v4, :cond_3

    goto :goto_2

    :cond_3
    const-string v4, ", "

    .line 643
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 644
    invoke-virtual {v0, v8, v9}, Lcom/badlogic/gdx/utils/StringBuilder;->append(J)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 645
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 646
    aget-object v4, v2, v3

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_2
    move v4, v3

    goto :goto_1

    :cond_4
    const/16 v1, 0x5d

    .line 648
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 649
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Lcom/badlogic/gdx/utils/LongMap$Values;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/LongMap$Values<",
            "TV;>;"
        }
    .end annotation

    .line 683
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Values;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    return-object v0

    .line 684
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->values1:Lcom/badlogic/gdx/utils/LongMap$Values;

    if-nez v0, :cond_1

    .line 685
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Values;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->values1:Lcom/badlogic/gdx/utils/LongMap$Values;

    .line 686
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongMap$Values;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->values2:Lcom/badlogic/gdx/utils/LongMap$Values;

    .line 688
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->values1:Lcom/badlogic/gdx/utils/LongMap$Values;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/LongMap$Values;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 689
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->values1:Lcom/badlogic/gdx/utils/LongMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap$Values;->reset()V

    .line 690
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->values1:Lcom/badlogic/gdx/utils/LongMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/LongMap$Values;->valid:Z

    .line 691
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->values2:Lcom/badlogic/gdx/utils/LongMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/LongMap$Values;->valid:Z

    return-object v0

    .line 694
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->values2:Lcom/badlogic/gdx/utils/LongMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap$Values;->reset()V

    .line 695
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap;->values2:Lcom/badlogic/gdx/utils/LongMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/LongMap$Values;->valid:Z

    .line 696
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongMap;->values1:Lcom/badlogic/gdx/utils/LongMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/LongMap$Values;->valid:Z

    return-object v0
.end method
