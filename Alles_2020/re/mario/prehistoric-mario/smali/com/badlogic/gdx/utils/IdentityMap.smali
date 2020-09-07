.class public Lcom/badlogic/gdx/utils/IdentityMap;
.super Ljava/lang/Object;
.source "IdentityMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/IdentityMap$Keys;,
        Lcom/badlogic/gdx/utils/IdentityMap$Values;,
        Lcom/badlogic/gdx/utils/IdentityMap$Entries;,
        Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# static fields
.field private static final PRIME1:I = -0x41e0eb4f

.field private static final PRIME2:I = -0x4b47d1c7

.field private static final PRIME3:I = -0x312e3dbf


# instance fields
.field capacity:I

.field private entries1:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

.field private entries2:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

.field private hashShift:I

.field keyTable:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TK;"
        }
    .end annotation
.end field

.field private keys1:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

.field private keys2:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

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

.field private values1:Lcom/badlogic/gdx/utils/IdentityMap$Values;

.field private values2:Lcom/badlogic/gdx/utils/IdentityMap$Values;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x33

    const v1, 0x3f4ccccd    # 0.8f

    .line 55
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const v0, 0x3f4ccccd    # 0.8f

    .line 61
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/IdentityMap;-><init>(IF)V

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
    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    const/4 p1, 0x0

    cmpg-float p1, p2, p1

    if-lez p1, :cond_0

    .line 74
    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->loadFactor:F

    .line 76
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    int-to-float v0, p1

    mul-float v0, v0, p2

    float-to-int p2, v0

    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    add-int/lit8 p2, p1, -0x1

    .line 77
    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    .line 78
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x1f

    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->hashShift:I

    const/4 p1, 0x3

    .line 79
    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    int-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p2, v0

    mul-int/lit8 p2, p2, 0x2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashCapacity:I

    .line 80
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    const/16 p2, 0x8

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    div-int/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->pushIterations:I

    .line 82
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashCapacity:I

    add-int/2addr p1, p2

    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 83
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    array-length p1, p1

    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

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

.method public constructor <init>(Lcom/badlogic/gdx/utils/IdentityMap;)V
    .locals 4

    .line 88
    iget v0, p1, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    int-to-float v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/IdentityMap;->loadFactor:F

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/IdentityMap;->loadFactor:F

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;-><init>(IF)V

    .line 89
    iget v0, p1, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    .line 90
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 91
    iget-object v0, p1, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 92
    iget p1, p1, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    return-void
.end method

.method private containsKeyStash(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 445
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 446
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 447
    aget-object v3, v0, v1

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

.method private getStash(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 306
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 307
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 308
    aget-object v3, v0, v1

    if-ne v3, p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

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

    .line 508
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private hash3(I)I
    .locals 1

    const v0, -0x312e3dbf

    mul-int p1, p1, v0

    .line 513
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private push(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;ITK;ITK;ITK;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 195
    iget-object v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 196
    iget-object v2, v0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    .line 197
    iget v3, v0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    .line 202
    iget v4, v0, Lcom/badlogic/gdx/utils/IdentityMap;->pushIterations:I

    const/4 v5, 0x0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    move/from16 v10, p3

    move-object/from16 v9, p4

    move/from16 v12, p5

    move-object/from16 v11, p6

    move/from16 v6, p7

    move-object/from16 v5, p8

    const/4 v13, 0x0

    :cond_0
    const/4 v14, 0x2

    .line 205
    invoke-static {v14}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v14

    const/4 v15, 0x1

    if-eqz v14, :cond_2

    if-eq v14, v15, :cond_1

    .line 220
    aget-object v9, v2, v6

    .line 221
    aput-object v7, v1, v6

    .line 222
    aput-object v8, v2, v6

    move-object v7, v5

    move-object v8, v9

    goto :goto_0

    .line 214
    :cond_1
    aget-object v5, v2, v12

    .line 215
    aput-object v7, v1, v12

    .line 216
    aput-object v8, v2, v12

    move-object v8, v5

    move-object v7, v11

    goto :goto_0

    .line 208
    :cond_2
    aget-object v5, v2, v10

    .line 209
    aput-object v7, v1, v10

    .line 210
    aput-object v8, v2, v10

    move-object v8, v5

    move-object v7, v9

    .line 227
    :goto_0
    invoke-static {v7}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v5

    and-int v10, v5, v3

    .line 229
    aget-object v9, v1, v10

    if-nez v9, :cond_4

    .line 231
    aput-object v7, v1, v10

    .line 232
    aput-object v8, v2, v10

    .line 233
    iget v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt v1, v2, :cond_3

    iget v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_3
    return-void

    .line 237
    :cond_4
    invoke-direct {v0, v5}, Lcom/badlogic/gdx/utils/IdentityMap;->hash2(I)I

    move-result v12

    .line 238
    aget-object v11, v1, v12

    if-nez v11, :cond_6

    .line 240
    aput-object v7, v1, v12

    .line 241
    aput-object v8, v2, v12

    .line 242
    iget v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt v1, v2, :cond_5

    iget v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_5
    return-void

    .line 246
    :cond_6
    invoke-direct {v0, v5}, Lcom/badlogic/gdx/utils/IdentityMap;->hash3(I)I

    move-result v6

    .line 247
    aget-object v5, v1, v6

    if-nez v5, :cond_8

    .line 249
    aput-object v7, v1, v6

    .line 250
    aput-object v8, v2, v6

    .line 251
    iget v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt v1, v2, :cond_7

    iget v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    add-int/2addr v13, v15

    if-ne v13, v4, :cond_0

    .line 261
    invoke-direct {v0, v7, v8}, Lcom/badlogic/gdx/utils/IdentityMap;->putStash(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private putResize(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 163
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    .line 164
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    and-int v5, v0, v1

    .line 165
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v6, v1, v5

    if-nez v6, :cond_1

    .line 167
    aput-object p1, v1, v5

    .line 168
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v5

    .line 169
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt p1, p2, :cond_0

    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_0
    return-void

    .line 173
    :cond_1
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash2(I)I

    move-result v7

    .line 174
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v8, v1, v7

    if-nez v8, :cond_3

    .line 176
    aput-object p1, v1, v7

    .line 177
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v7

    .line 178
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt p1, p2, :cond_2

    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_2
    return-void

    .line 182
    :cond_3
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash3(I)I

    move-result v9

    .line 183
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v10, v0, v9

    if-nez v10, :cond_5

    .line 185
    aput-object p1, v0, v9

    .line 186
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v9

    .line 187
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt p1, p2, :cond_4

    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_4
    return-void

    :cond_5
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    .line 191
    invoke-direct/range {v2 .. v10}, Lcom/badlogic/gdx/utils/IdentityMap;->push(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V

    return-void
.end method

.method private putStash(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 265
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashCapacity:I

    if-ne v0, v1, :cond_0

    .line 267
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    .line 268
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IdentityMap;->putResize(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 272
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    add-int/2addr v1, v0

    .line 273
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aput-object p1, v2, v1

    .line 274
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v1

    add-int/lit8 v0, v0, 0x1

    .line 275
    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    .line 276
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    return-void
.end method

.method private resize(I)V
    .locals 5

    .line 480
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v0, v1

    .line 482
    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    int-to-float v1, p1

    .line 483
    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->loadFactor:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    add-int/lit8 v1, p1, -0x1

    .line 484
    iput v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    .line 485
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x1f

    iput v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->hashShift:I

    int-to-double v1, p1

    .line 486
    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    mul-int/lit8 v3, v3, 0x2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashCapacity:I

    const/16 v3, 0x8

    .line 487
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-int v1, v1

    div-int/2addr v1, v3

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->pushIterations:I

    .line 489
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 490
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    .line 492
    iget v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashCapacity:I

    add-int v4, p1, v3

    new-array v4, v4, [Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Object;

    iput-object v4, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    add-int/2addr p1, v3

    .line 493
    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    .line 495
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    const/4 v3, 0x0

    .line 496
    iput v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    .line 497
    iput v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    if-lez p1, :cond_1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 500
    aget-object p1, v1, v3

    if-eqz p1, :cond_0

    .line 501
    aget-object v4, v2, v3

    invoke-direct {p0, p1, v4}, Lcom/badlogic/gdx/utils/IdentityMap;->putResize(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 4

    .line 400
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    if-nez v0, :cond_0

    return-void

    .line 401
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 402
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    .line 403
    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_1

    const/4 v2, 0x0

    .line 404
    aput-object v2, v0, v3

    .line 405
    aput-object v2, v1, v3

    move v2, v3

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 407
    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    .line 408
    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 391
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    if-gt v0, p1, :cond_0

    .line 392
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IdentityMap;->clear()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 395
    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    .line 396
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 432
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    .line 433
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    and-int/2addr v1, v0

    .line 434
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v1, v2, v1

    if-eq p1, v1, :cond_0

    .line 435
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash2(I)I

    move-result v1

    .line 436
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v1, v2, v1

    if-eq p1, v1, :cond_0

    .line 437
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash3(I)I

    move-result v0

    .line 438
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v1, v0

    if-eq p1, v0, :cond_0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->containsKeyStash(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;Z)Z
    .locals 3

    .line 416
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    const/4 v1, 0x1

    if-nez p1, :cond_1

    .line 418
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 419
    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_0
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_5

    .line 420
    aget-object p2, p1, v2

    if-eqz p2, :cond_0

    aget-object p2, v0, v2

    if-nez p2, :cond_0

    return v1

    :cond_0
    move p2, v2

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_3

    .line 422
    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_1
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_5

    .line 423
    aget-object p2, v0, v2

    if-ne p2, p1, :cond_2

    return v1

    :cond_2
    move p2, v2

    goto :goto_1

    .line 425
    :cond_3
    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_2
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_5

    .line 426
    aget-object p2, v0, v2

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    return v1

    :cond_4
    move p2, v2

    goto :goto_2

    :cond_5
    const/4 p1, 0x0

    return p1
.end method

.method public ensureCapacity(I)V
    .locals 3

    if-ltz p1, :cond_1

    .line 475
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/2addr v0, p1

    .line 476
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt v0, p1, :cond_0

    int-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->loadFactor:F

    div-float/2addr p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_0
    return-void

    .line 474
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

.method public entries()Lcom/badlogic/gdx/utils/IdentityMap$Entries;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/IdentityMap$Entries<",
            "TK;TV;>;"
        }
    .end annotation

    .line 606
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    return-object v0

    .line 607
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries1:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    if-nez v0, :cond_1

    .line 608
    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries1:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    .line 609
    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Entries;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries2:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    .line 611
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries1:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IdentityMap$Entries;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 612
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries1:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IdentityMap$Entries;->reset()V

    .line 613
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries1:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IdentityMap$Entries;->valid:Z

    .line 614
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries2:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IdentityMap$Entries;->valid:Z

    return-object v0

    .line 617
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries2:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IdentityMap$Entries;->reset()V

    .line 618
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries2:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IdentityMap$Entries;->valid:Z

    .line 619
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->entries1:Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IdentityMap$Entries;->valid:Z

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 536
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/IdentityMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 537
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/IdentityMap;

    .line 538
    iget v1, p1, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 539
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 540
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    .line 541
    iget v4, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_5

    .line 542
    aget-object v6, v1, v5

    if-eqz v6, :cond_4

    .line 544
    aget-object v7, v3, v5

    if-nez v7, :cond_3

    .line 546
    sget-object v7, Lcom/badlogic/gdx/utils/ObjectMap;->dummy:Ljava/lang/Object;

    invoke-virtual {p1, v6, v7}, Lcom/badlogic/gdx/utils/IdentityMap;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_4

    return v2

    .line 548
    :cond_3
    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/utils/IdentityMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    return v2

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_5
    return v0
.end method

.method public equalsIdentity(Ljava/lang/Object;)Z
    .locals 9

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 558
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/IdentityMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 559
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/IdentityMap;

    .line 560
    iget v1, p1, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 561
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 562
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    .line 563
    iget v4, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_4

    .line 564
    aget-object v6, v1, v5

    if-eqz v6, :cond_3

    .line 565
    aget-object v7, v3, v5

    sget-object v8, Lcom/badlogic/gdx/utils/ObjectMap;->dummy:Ljava/lang/Object;

    invoke-virtual {p1, v6, v8}, Lcom/badlogic/gdx/utils/IdentityMap;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eq v7, v6, :cond_3

    return v2

    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_4
    return v0
.end method

.method public findKey(Ljava/lang/Object;Z)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Z)TK;"
        }
    .end annotation

    .line 456
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    if-nez p1, :cond_1

    .line 458
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 459
    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_0
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_5

    .line 460
    aget-object p2, p1, v1

    if-eqz p2, :cond_0

    aget-object p2, v0, v1

    if-nez p2, :cond_0

    aget-object p1, p1, v1

    return-object p1

    :cond_0
    move p2, v1

    goto :goto_0

    :cond_1
    if-eqz p2, :cond_3

    .line 462
    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_1
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_5

    .line 463
    aget-object p2, v0, v1

    if-ne p2, p1, :cond_2

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1

    :cond_2
    move p2, v1

    goto :goto_1

    .line 465
    :cond_3
    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_2
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_5

    .line 466
    aget-object p2, v0, v1

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1

    :cond_4
    move p2, v1

    goto :goto_2

    :cond_5
    const/4 p1, 0x0

    return-object p1
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 280
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    .line 281
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    and-int/2addr v1, v0

    .line 282
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    if-eq p1, v2, :cond_0

    .line 283
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash2(I)I

    move-result v1

    .line 284
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    if-eq p1, v2, :cond_0

    .line 285
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash3(I)I

    move-result v1

    .line 286
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v0, v1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->getStash(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 289
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 293
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    .line 294
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    and-int/2addr v1, v0

    .line 295
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    if-eq p1, v2, :cond_0

    .line 296
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash2(I)I

    move-result v1

    .line 297
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    if-eq p1, v2, :cond_0

    .line 298
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash3(I)I

    move-result v1

    .line 299
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v0, v1

    if-eq p1, v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/IdentityMap;->getStash(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 302
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1
.end method

.method public hashCode()I
    .locals 6

    .line 518
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 519
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    .line 520
    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    .line 521
    aget-object v5, v0, v3

    if-eqz v5, :cond_0

    .line 523
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    mul-int/lit8 v5, v5, 0x1f

    add-int/2addr v4, v5

    .line 525
    aget-object v5, v1, v3

    if-eqz v5, :cond_0

    .line 527
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    add-int/2addr v4, v5

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v4
.end method

.method public isEmpty()Z
    .locals 1

    .line 376
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

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
            "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 598
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IdentityMap;->entries()Lcom/badlogic/gdx/utils/IdentityMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/badlogic/gdx/utils/IdentityMap$Keys;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/IdentityMap$Keys<",
            "TK;>;"
        }
    .end annotation

    .line 650
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    return-object v0

    .line 651
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys1:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    if-nez v0, :cond_1

    .line 652
    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys1:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    .line 653
    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Keys;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys2:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    .line 655
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys1:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IdentityMap$Keys;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 656
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys1:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IdentityMap$Keys;->reset()V

    .line 657
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys1:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IdentityMap$Keys;->valid:Z

    .line 658
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys2:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IdentityMap$Keys;->valid:Z

    return-object v0

    .line 661
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys2:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IdentityMap$Keys;->reset()V

    .line 662
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys2:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IdentityMap$Keys;->valid:Z

    .line 663
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keys1:Lcom/badlogic/gdx/utils/IdentityMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IdentityMap$Keys;->valid:Z

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 371
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    if-eqz p1, :cond_b

    .line 97
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 100
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v1

    .line 101
    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    and-int v6, v1, v2

    .line 102
    aget-object v7, v0, v6

    if-ne v7, p1, :cond_0

    .line 104
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v6

    .line 105
    aput-object p2, p1, v6

    return-object v0

    .line 109
    :cond_0
    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;->hash2(I)I

    move-result v8

    .line 110
    aget-object v9, v0, v8

    if-ne v9, p1, :cond_1

    .line 112
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v8

    .line 113
    aput-object p2, p1, v8

    return-object v0

    .line 117
    :cond_1
    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;->hash3(I)I

    move-result v10

    .line 118
    aget-object v11, v0, v10

    if-ne v11, p1, :cond_2

    .line 120
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v10

    .line 121
    aput-object p2, p1, v10

    return-object v0

    .line 126
    :cond_2
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_4

    .line 127
    aget-object v3, v0, v1

    if-ne v3, p1, :cond_3

    .line 128
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v1

    .line 129
    aput-object p2, p1, v1

    return-object v0

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    if-nez v7, :cond_6

    .line 136
    aput-object p1, v0, v6

    .line 137
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v6

    .line 138
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_5
    return-object v1

    :cond_6
    if-nez v9, :cond_8

    .line 143
    aput-object p1, v0, v8

    .line 144
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v8

    .line 145
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_7
    return-object v1

    :cond_8
    if-nez v11, :cond_a

    .line 150
    aput-object p1, v0, v10

    .line 151
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v10

    .line 152
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->threshold:I

    if-lt p1, p2, :cond_9

    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    :cond_9
    return-object v1

    :cond_a
    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    .line 156
    invoke-direct/range {v3 .. v11}, Lcom/badlogic/gdx/utils/IdentityMap;->push(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V

    return-object v1

    .line 96
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

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 313
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    .line 314
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->mask:I

    and-int/2addr v1, v0

    .line 315
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v3, v2, v1

    const/4 v4, 0x0

    if-ne v3, p1, :cond_0

    .line 316
    aput-object v4, v2, v1

    .line 317
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v1

    .line 318
    aput-object v4, p1, v1

    .line 319
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    return-object v0

    .line 323
    :cond_0
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash2(I)I

    move-result v1

    .line 324
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v3, v2, v1

    if-ne v3, p1, :cond_1

    .line 325
    aput-object v4, v2, v1

    .line 326
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v1

    .line 327
    aput-object v4, p1, v1

    .line 328
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    return-object v0

    .line 332
    :cond_1
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/IdentityMap;->hash3(I)I

    move-result v0

    .line 333
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v1, v0

    if-ne v2, p1, :cond_2

    .line 334
    aput-object v4, v1, v0

    .line 335
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object v1, p1, v0

    .line 336
    aput-object v4, p1, v0

    .line 337
    iget p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    return-object v1

    .line 341
    :cond_2
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->removeStash(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method removeStash(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 345
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 346
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 347
    aget-object v3, v0, v1

    if-ne v3, p1, :cond_0

    .line 348
    iget-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    .line 349
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;->removeStashIndex(I)V

    .line 350
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

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

    .line 359
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    .line 360
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v0, v1

    const/4 v1, 0x0

    if-ge p1, v0, :cond_0

    .line 362
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    aget-object v3, v2, v0

    aput-object v3, v2, p1

    .line 363
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aget-object v3, v2, v0

    aput-object v3, v2, p1

    .line 364
    aput-object v1, v2, v0

    goto :goto_0

    .line 366
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    aput-object v1, v0, p1

    :goto_0
    return-void
.end method

.method public shrink(I)V
    .locals 3

    if-ltz p1, :cond_2

    .line 383
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    if-le v0, p1, :cond_0

    move p1, v0

    .line 384
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    if-gt v0, p1, :cond_1

    return-void

    .line 385
    :cond_1
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    .line 386
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap;->resize(I)V

    return-void

    .line 382
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

    .line 571
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    if-nez v0, :cond_0

    const-string v0, "[]"

    return-object v0

    .line 572
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v1, 0x5b

    .line 573
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 574
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 575
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    .line 576
    array-length v3, v1

    :goto_0
    add-int/lit8 v4, v3, -0x1

    const/16 v5, 0x3d

    if-lez v3, :cond_2

    .line 578
    aget-object v3, v1, v4

    if-nez v3, :cond_1

    move v3, v4

    goto :goto_0

    .line 580
    :cond_1
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 581
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 582
    aget-object v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    :cond_2
    :goto_1
    add-int/lit8 v3, v4, -0x1

    if-lez v4, :cond_4

    .line 586
    aget-object v4, v1, v3

    if-nez v4, :cond_3

    goto :goto_2

    :cond_3
    const-string v6, ", "

    .line 588
    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 589
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 590
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 591
    aget-object v4, v2, v3

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_2
    move v4, v3

    goto :goto_1

    :cond_4
    const/16 v1, 0x5d

    .line 593
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 594
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Lcom/badlogic/gdx/utils/IdentityMap$Values;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/IdentityMap$Values<",
            "TV;>;"
        }
    .end annotation

    .line 628
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Values;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    return-object v0

    .line 629
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values1:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    if-nez v0, :cond_1

    .line 630
    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Values;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values1:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    .line 631
    new-instance v0, Lcom/badlogic/gdx/utils/IdentityMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/IdentityMap$Values;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values2:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    .line 633
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values1:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 634
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values1:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IdentityMap$Values;->reset()V

    .line 635
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values1:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->valid:Z

    .line 636
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values2:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IdentityMap$Values;->valid:Z

    return-object v0

    .line 639
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values2:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IdentityMap$Values;->reset()V

    .line 640
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values2:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->valid:Z

    .line 641
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap;->values1:Lcom/badlogic/gdx/utils/IdentityMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/IdentityMap$Values;->valid:Z

    return-object v0
.end method
