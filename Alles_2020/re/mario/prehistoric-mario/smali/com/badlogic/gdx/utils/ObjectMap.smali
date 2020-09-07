.class public Lcom/badlogic/gdx/utils/ObjectMap;
.super Ljava/lang/Object;
.source "ObjectMap.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/ObjectMap$Keys;,
        Lcom/badlogic/gdx/utils/ObjectMap$Values;,
        Lcom/badlogic/gdx/utils/ObjectMap$Entries;,
        Lcom/badlogic/gdx/utils/ObjectMap$MapIterator;,
        Lcom/badlogic/gdx/utils/ObjectMap$Entry;
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

.field static final dummy:Ljava/lang/Object;


# instance fields
.field capacity:I

.field entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

.field entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

.field private hashShift:I

.field keyTable:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TK;"
        }
    .end annotation
.end field

.field keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

.field keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

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

.field values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

.field values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 38
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/utils/ObjectMap;->dummy:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    const/16 v0, 0x33

    const v1, 0x3f4ccccd    # 0.8f

    .line 57
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>(IF)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const v0, 0x3f4ccccd    # 0.8f

    .line 63
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>(IF)V

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
    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    const/4 p1, 0x0

    cmpg-float p1, p2, p1

    if-lez p1, :cond_0

    .line 76
    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->loadFactor:F

    .line 78
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    int-to-float v0, p1

    mul-float v0, v0, p2

    float-to-int p2, v0

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    add-int/lit8 p2, p1, -0x1

    .line 79
    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    .line 80
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result p1

    rsub-int/lit8 p1, p1, 0x1f

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->hashShift:I

    const/4 p1, 0x3

    .line 81
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    int-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->log(D)D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p2, v0

    mul-int/lit8 p2, p2, 0x2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashCapacity:I

    .line 82
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    const/16 p2, 0x8

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    int-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    div-int/2addr v0, p2

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->pushIterations:I

    .line 84
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashCapacity:I

    add-int/2addr p1, p2

    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 85
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    array-length p1, p1

    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

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

.method public constructor <init>(Lcom/badlogic/gdx/utils/ObjectMap;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 90
    iget v0, p1, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    int-to-float v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/ObjectMap;->loadFactor:F

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    iget v1, p1, Lcom/badlogic/gdx/utils/ObjectMap;->loadFactor:F

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>(IF)V

    .line 91
    iget v0, p1, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    .line 92
    iget-object v0, p1, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 93
    iget-object v0, p1, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    array-length v2, v0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 94
    iget p1, p1, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    return-void
.end method

.method private containsKeyStash(Ljava/lang/Object;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 463
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 464
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 465
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

.method private getStash(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 317
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 318
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 319
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

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

    .line 526
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    and-int/2addr p1, v0

    return p1
.end method

.method private hash3(I)I
    .locals 1

    const v0, -0x312e3dbf

    mul-int p1, p1, v0

    .line 531
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->hashShift:I

    ushr-int v0, p1, v0

    xor-int/2addr p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

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

    .line 204
    iget-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 205
    iget-object v2, v0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    .line 206
    iget v3, v0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    .line 211
    iget v4, v0, Lcom/badlogic/gdx/utils/ObjectMap;->pushIterations:I

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

    .line 214
    invoke-static {v14}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v14

    const/4 v15, 0x1

    if-eqz v14, :cond_2

    if-eq v14, v15, :cond_1

    .line 229
    aget-object v9, v2, v6

    .line 230
    aput-object v7, v1, v6

    .line 231
    aput-object v8, v2, v6

    move-object v7, v5

    move-object v8, v9

    goto :goto_0

    .line 223
    :cond_1
    aget-object v5, v2, v12

    .line 224
    aput-object v7, v1, v12

    .line 225
    aput-object v8, v2, v12

    move-object v8, v5

    move-object v7, v11

    goto :goto_0

    .line 217
    :cond_2
    aget-object v5, v2, v10

    .line 218
    aput-object v7, v1, v10

    .line 219
    aput-object v8, v2, v10

    move-object v8, v5

    move-object v7, v9

    .line 236
    :goto_0
    invoke-virtual {v7}, Ljava/lang/Object;->hashCode()I

    move-result v5

    and-int v10, v5, v3

    .line 238
    aget-object v9, v1, v10

    if-nez v9, :cond_4

    .line 240
    aput-object v7, v1, v10

    .line 241
    aput-object v8, v2, v10

    .line 242
    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt v1, v2, :cond_3

    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_3
    return-void

    .line 246
    :cond_4
    invoke-direct {v0, v5}, Lcom/badlogic/gdx/utils/ObjectMap;->hash2(I)I

    move-result v12

    .line 247
    aget-object v11, v1, v12

    if-nez v11, :cond_6

    .line 249
    aput-object v7, v1, v12

    .line 250
    aput-object v8, v2, v12

    .line 251
    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt v1, v2, :cond_5

    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_5
    return-void

    .line 255
    :cond_6
    invoke-direct {v0, v5}, Lcom/badlogic/gdx/utils/ObjectMap;->hash3(I)I

    move-result v6

    .line 256
    aget-object v5, v1, v6

    if-nez v5, :cond_8

    .line 258
    aput-object v7, v1, v6

    .line 259
    aput-object v8, v2, v6

    .line 260
    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, v0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget v2, v0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt v1, v2, :cond_7

    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/2addr v1, v15

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_7
    return-void

    :cond_8
    add-int/2addr v13, v15

    if-ne v13, v4, :cond_0

    .line 270
    invoke-direct {v0, v7, v8}, Lcom/badlogic/gdx/utils/ObjectMap;->putStash(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private putResize(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 172
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 173
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    and-int v5, v0, v1

    .line 174
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v6, v1, v5

    if-nez v6, :cond_1

    .line 176
    aput-object p1, v1, v5

    .line 177
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v5

    .line 178
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt p1, p2, :cond_0

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_0
    return-void

    .line 182
    :cond_1
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash2(I)I

    move-result v7

    .line 183
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v8, v1, v7

    if-nez v8, :cond_3

    .line 185
    aput-object p1, v1, v7

    .line 186
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v7

    .line 187
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt p1, p2, :cond_2

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_2
    return-void

    .line 191
    :cond_3
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash3(I)I

    move-result v9

    .line 192
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v10, v0, v9

    if-nez v10, :cond_5

    .line 194
    aput-object p1, v0, v9

    .line 195
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v9

    .line 196
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt p1, p2, :cond_4

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_4
    return-void

    :cond_5
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    .line 200
    invoke-direct/range {v2 .. v10}, Lcom/badlogic/gdx/utils/ObjectMap;->push(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V

    return-void
.end method

.method private putStash(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .line 274
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashCapacity:I

    if-ne v0, v1, :cond_0

    .line 276
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/lit8 v0, v0, 0x1

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    .line 277
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->putResize(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    .line 281
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    add-int/2addr v1, v0

    .line 282
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aput-object p1, v2, v1

    .line 283
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v1

    add-int/lit8 v0, v0, 0x1

    .line 284
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    .line 285
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    return-void
.end method

.method private resize(I)V
    .locals 5

    .line 498
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v0, v1

    .line 500
    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    int-to-float v1, p1

    .line 501
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->loadFactor:F

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    add-int/lit8 v1, p1, -0x1

    .line 502
    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    .line 503
    invoke-static {p1}, Ljava/lang/Integer;->numberOfTrailingZeros(I)I

    move-result v1

    rsub-int/lit8 v1, v1, 0x1f

    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->hashShift:I

    int-to-double v1, p1

    .line 504
    invoke-static {v1, v2}, Ljava/lang/Math;->log(D)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    mul-int/lit8 v3, v3, 0x2

    const/4 v4, 0x3

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashCapacity:I

    const/16 v3, 0x8

    .line 505
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v1, v2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    double-to-int v1, v1

    div-int/2addr v1, v3

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->pushIterations:I

    .line 507
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 508
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    .line 510
    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashCapacity:I

    add-int v4, p1, v3

    new-array v4, v4, [Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Object;

    iput-object v4, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    add-int/2addr p1, v3

    .line 511
    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    .line 513
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    const/4 v3, 0x0

    .line 514
    iput v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    .line 515
    iput v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    if-lez p1, :cond_1

    :goto_0
    if-ge v3, v0, :cond_1

    .line 518
    aget-object p1, v1, v3

    if-eqz p1, :cond_0

    .line 519
    aget-object v4, v2, v3

    invoke-direct {p0, p1, v4}, Lcom/badlogic/gdx/utils/ObjectMap;->putResize(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private toString(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6

    .line 597
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    const-string p1, "{}"

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    return-object p1

    .line 598
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    if-eqz p2, :cond_2

    const/16 v1, 0x7b

    .line 599
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 600
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 601
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    .line 602
    array-length v3, v1

    :goto_1
    add-int/lit8 v4, v3, -0x1

    const/16 v5, 0x3d

    if-lez v3, :cond_4

    .line 604
    aget-object v3, v1, v4

    if-nez v3, :cond_3

    move v3, v4

    goto :goto_1

    .line 606
    :cond_3
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 607
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 608
    aget-object v3, v2, v4

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    :cond_4
    :goto_2
    add-int/lit8 v3, v4, -0x1

    if-lez v4, :cond_6

    .line 612
    aget-object v4, v1, v3

    if-nez v4, :cond_5

    goto :goto_3

    .line 614
    :cond_5
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 615
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 616
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 617
    aget-object v4, v2, v3

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_3
    move v4, v3

    goto :goto_2

    :cond_6
    if-eqz p2, :cond_7

    const/16 p1, 0x7d

    .line 619
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 620
    :cond_7
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public clear()V
    .locals 4

    .line 418
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    if-nez v0, :cond_0

    return-void

    .line 419
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 420
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    .line 421
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v2, v3

    :goto_0
    add-int/lit8 v3, v2, -0x1

    if-lez v2, :cond_1

    const/4 v2, 0x0

    .line 422
    aput-object v2, v0, v3

    .line 423
    aput-object v2, v1, v3

    move v2, v3

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 425
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    .line 426
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 407
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    if-gt v0, p1, :cond_0

    .line 408
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectMap;->clear()V

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 411
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    .line 412
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)Z"
        }
    .end annotation

    .line 450
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 451
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    and-int/2addr v1, v0

    .line 452
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v1, v2, v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 453
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash2(I)I

    move-result v1

    .line 454
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v1, v2, v1

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 455
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash3(I)I

    move-result v0

    .line 456
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v1, v0

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->containsKeyStash(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public containsValue(Ljava/lang/Object;Z)Z
    .locals 3

    .line 434
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    const/4 v1, 0x1

    if-nez p1, :cond_1

    .line 436
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 437
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_0
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_5

    .line 438
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

    .line 440
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_1
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_5

    .line 441
    aget-object p2, v0, v2

    if-ne p2, p1, :cond_2

    return v1

    :cond_2
    move p2, v2

    goto :goto_1

    .line 443
    :cond_3
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr p2, v2

    :goto_2
    add-int/lit8 v2, p2, -0x1

    if-lez p2, :cond_5

    .line 444
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

    .line 493
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/2addr v0, p1

    .line 494
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt v0, p1, :cond_0

    int-to-float p1, v0

    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->loadFactor:F

    div-float/2addr p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_0
    return-void

    .line 492
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

.method public entries()Lcom/badlogic/gdx/utils/ObjectMap$Entries;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entries<",
            "TK;TV;>;"
        }
    .end annotation

    .line 632
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    return-object v0

    .line 633
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    if-nez v0, :cond_1

    .line 634
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    .line 635
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    .line 637
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 638
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->reset()V

    .line 639
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    .line 640
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    return-object v0

    .line 643
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->reset()V

    .line 644
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    .line 645
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 554
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/ObjectMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 555
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/ObjectMap;

    .line 556
    iget v1, p1, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 557
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 558
    iget-object v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    .line 559
    iget v4, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_5

    .line 560
    aget-object v6, v1, v5

    if-eqz v6, :cond_4

    .line 562
    aget-object v7, v3, v5

    if-nez v7, :cond_3

    .line 564
    sget-object v7, Lcom/badlogic/gdx/utils/ObjectMap;->dummy:Ljava/lang/Object;

    invoke-virtual {p1, v6, v7}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_4

    return v2

    .line 566
    :cond_3
    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

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

    .line 576
    :cond_0
    instance-of v1, p1, Lcom/badlogic/gdx/utils/IdentityMap;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 577
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/IdentityMap;

    .line 578
    iget v1, p1, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    if-eq v1, v3, :cond_2

    return v2

    .line 579
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 580
    iget-object v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    .line 581
    iget v4, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v5, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v4, v5

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_4

    .line 582
    aget-object v6, v1, v5

    if-eqz v6, :cond_3

    .line 583
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

    .line 474
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    if-nez p1, :cond_1

    .line 476
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 477
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_0
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_5

    .line 478
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

    .line 480
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_1
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_5

    .line 481
    aget-object p2, v0, v1

    if-ne p2, p1, :cond_2

    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1

    :cond_2
    move p2, v1

    goto :goto_1

    .line 483
    :cond_3
    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr p2, v1

    :goto_2
    add-int/lit8 v1, p2, -0x1

    if-lez p2, :cond_5

    .line 484
    aget-object p2, v0, v1

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_4

    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

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

    .line 290
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 291
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    and-int/2addr v1, v0

    .line 292
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 293
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash2(I)I

    move-result v1

    .line 294
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 295
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash3(I)I

    move-result v1

    .line 296
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->getStash(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 299
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

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

    .line 304
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 305
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    and-int/2addr v1, v0

    .line 306
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 307
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash2(I)I

    move-result v1

    .line 308
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 309
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash3(I)I

    move-result v1

    .line 310
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v0, v0, v1

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->getStash(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 313
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    return-object p1
.end method

.method public hashCode()I
    .locals 6

    .line 536
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 537
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    .line 538
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    .line 539
    aget-object v5, v0, v3

    if-eqz v5, :cond_0

    .line 541
    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    mul-int/lit8 v5, v5, 0x1f

    add-int/2addr v4, v5

    .line 543
    aget-object v5, v1, v3

    if-eqz v5, :cond_0

    .line 545
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

    .line 391
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entries<",
            "TK;TV;>;"
        }
    .end annotation

    .line 624
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectMap;->entries()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 34
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectMap;->iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Keys<",
            "TK;>;"
        }
    .end annotation

    .line 676
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Keys;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    return-object v0

    .line 677
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    if-nez v0, :cond_1

    .line 678
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Keys;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    .line 679
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Keys;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    .line 681
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 682
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->reset()V

    .line 683
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    .line 684
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    return-object v0

    .line 687
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->reset()V

    .line 688
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    .line 689
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 386
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

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

    .line 100
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 103
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    .line 104
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    and-int v6, v1, v2

    .line 105
    aget-object v7, v0, v6

    .line 106
    invoke-virtual {p1, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 107
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v6

    .line 108
    aput-object p2, p1, v6

    return-object v0

    .line 112
    :cond_0
    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->hash2(I)I

    move-result v8

    .line 113
    aget-object v9, v0, v8

    .line 114
    invoke-virtual {p1, v9}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 115
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v8

    .line 116
    aput-object p2, p1, v8

    return-object v0

    .line 120
    :cond_1
    invoke-direct {p0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->hash3(I)I

    move-result v10

    .line 121
    aget-object v11, v0, v10

    .line 122
    invoke-virtual {p1, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 123
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v10

    .line 124
    aput-object p2, p1, v10

    return-object v0

    .line 129
    :cond_2
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_4

    .line 130
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 131
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v1

    .line 132
    aput-object p2, p1, v1

    return-object v0

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    if-nez v7, :cond_6

    .line 139
    aput-object p1, v0, v6

    .line 140
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v6

    .line 141
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt p1, p2, :cond_5

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_5
    return-object v1

    :cond_6
    if-nez v9, :cond_8

    .line 146
    aput-object p1, v0, v8

    .line 147
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v8

    .line 148
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt p1, p2, :cond_7

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_7
    return-object v1

    :cond_8
    if-nez v11, :cond_a

    .line 153
    aput-object p1, v0, v10

    .line 154
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aput-object p2, p1, v10

    .line 155
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p2, p1, 0x1

    iput p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    iget p2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->threshold:I

    if-lt p1, p2, :cond_9

    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    shl-int/lit8 p1, p1, 0x1

    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    :cond_9
    return-object v1

    :cond_a
    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    .line 159
    invoke-direct/range {v3 .. v11}, Lcom/badlogic/gdx/utils/ObjectMap;->push(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;ILjava/lang/Object;)V

    return-object v1

    .line 99
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

.method public putAll(Lcom/badlogic/gdx/utils/ObjectMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 164
    iget v0, p1, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->ensureCapacity(I)V

    .line 165
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/ObjectMap;->iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    .line 166
    iget-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    invoke-virtual {p0, v1, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 325
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 326
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->mask:I

    and-int/2addr v1, v0

    .line 327
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 328
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aput-object v3, p1, v1

    .line 329
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v1

    .line 330
    aput-object v3, p1, v1

    .line 331
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    return-object v0

    .line 335
    :cond_0
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash2(I)I

    move-result v1

    .line 336
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 337
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aput-object v3, p1, v1

    .line 338
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object v0, p1, v1

    .line 339
    aput-object v3, p1, v1

    .line 340
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    return-object v0

    .line 344
    :cond_1
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->hash3(I)I

    move-result v0

    .line 345
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 346
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aput-object v3, p1, v0

    .line 347
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object v1, p1, v0

    .line 348
    aput-object v3, p1, v0

    .line 349
    iget p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    return-object v1

    .line 353
    :cond_2
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->removeStash(Ljava/lang/Object;)Ljava/lang/Object;

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

    .line 357
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 358
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v2, v1

    :goto_0
    if-ge v1, v2, :cond_1

    .line 359
    aget-object v3, v0, v1

    invoke-virtual {p1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 360
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object p1, p1, v1

    .line 361
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->removeStashIndex(I)V

    .line 362
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

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

    .line 371
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    .line 372
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectMap;->stashSize:I

    add-int/2addr v0, v1

    const/4 v1, 0x0

    if-ge p1, v0, :cond_0

    .line 374
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aget-object v3, v2, v0

    aput-object v3, v2, p1

    .line 375
    iget-object v3, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aget-object v4, v3, v0

    aput-object v4, v3, p1

    .line 376
    aput-object v1, v2, v0

    .line 377
    aput-object v1, v3, v0

    goto :goto_0

    .line 379
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    aput-object v1, v0, p1

    .line 380
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    aput-object v1, v0, p1

    :goto_0
    return-void
.end method

.method public shrink(I)V
    .locals 3

    if-ltz p1, :cond_2

    .line 398
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    if-le v0, p1, :cond_0

    move p1, v0

    .line 399
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->capacity:I

    if-gt v0, p1, :cond_1

    return-void

    .line 400
    :cond_1
    invoke-static {p1}, Lcom/badlogic/gdx/math/MathUtils;->nextPowerOfTwo(I)I

    move-result p1

    .line 401
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->resize(I)V

    return-void

    .line 397
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
    .locals 2

    const-string v0, ", "

    const/4 v1, 0x1

    .line 593
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->toString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 589
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/utils/ObjectMap;->toString(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public values()Lcom/badlogic/gdx/utils/ObjectMap$Values;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Values<",
            "TV;>;"
        }
    .end annotation

    .line 654
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    return-object v0

    .line 655
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    if-nez v0, :cond_1

    .line 656
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    .line 657
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    .line 659
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 660
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;->reset()V

    .line 661
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    .line 662
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    return-object v0

    .line 665
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;->reset()V

    .line 666
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    .line 667
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    return-object v0
.end method
