.class public Lcom/badlogic/gdx/math/ConvexHull;
.super Ljava/lang/Object;
.source "ConvexHull.java"


# instance fields
.field private final hull:Lcom/badlogic/gdx/utils/FloatArray;

.field private final indices:Lcom/badlogic/gdx/utils/IntArray;

.field private final originalIndices:Lcom/badlogic/gdx/utils/ShortArray;

.field private final quicksortStack:Lcom/badlogic/gdx/utils/IntArray;

.field private sortedPoints:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/ConvexHull;->quicksortStack:Lcom/badlogic/gdx/utils/IntArray;

    .line 28
    new-instance v0, Lcom/badlogic/gdx/utils/FloatArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/FloatArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/ConvexHull;->hull:Lcom/badlogic/gdx/utils/FloatArray;

    .line 29
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/math/ConvexHull;->indices:Lcom/badlogic/gdx/utils/IntArray;

    .line 30
    new-instance v0, Lcom/badlogic/gdx/utils/ShortArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lcom/badlogic/gdx/utils/ShortArray;-><init>(ZI)V

    iput-object v0, p0, Lcom/badlogic/gdx/math/ConvexHull;->originalIndices:Lcom/badlogic/gdx/utils/ShortArray;

    return-void
.end method

.method private ccw(FF)F
    .locals 4

    .line 155
    iget-object v0, p0, Lcom/badlogic/gdx/math/ConvexHull;->hull:Lcom/badlogic/gdx/utils/FloatArray;

    .line 156
    iget v1, v0, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 v2, v1, -0x4

    .line 157
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v2

    add-int/lit8 v3, v1, -0x3

    .line 158
    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v3

    add-int/lit8 v1, v1, -0x2

    .line 159
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/FloatArray;->get(I)F

    move-result v1

    .line 160
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/FloatArray;->peek()F

    move-result v0

    sub-float/2addr v1, v2

    sub-float/2addr p2, v3

    mul-float v1, v1, p2

    sub-float/2addr v0, v3

    sub-float/2addr p1, v2

    mul-float v0, v0, p1

    sub-float/2addr v1, v0

    return v1
.end method

.method private quicksortPartition([FII)I
    .locals 8

    .line 191
    aget v0, p1, p2

    add-int/lit8 v1, p2, 0x1

    .line 192
    aget v2, p1, v1

    move v3, p3

    move p3, p2

    :cond_0
    :goto_0
    if-ge p3, v3, :cond_4

    :goto_1
    if-ge p3, v3, :cond_1

    .line 197
    aget v4, p1, p3

    cmpg-float v4, v4, v0

    if-gtz v4, :cond_1

    add-int/lit8 p3, p3, 0x2

    goto :goto_1

    .line 199
    :cond_1
    :goto_2
    aget v4, p1, v3

    cmpl-float v4, v4, v0

    if-gtz v4, :cond_3

    aget v4, p1, v3

    cmpl-float v4, v4, v0

    if-nez v4, :cond_2

    add-int/lit8 v4, v3, 0x1

    aget v4, p1, v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_2

    goto :goto_3

    :cond_2
    if-ge p3, v3, :cond_0

    .line 202
    aget v4, p1, p3

    .line 203
    aget v5, p1, v3

    aput v5, p1, p3

    .line 204
    aput v4, p1, v3

    add-int/lit8 v4, p3, 0x1

    .line 206
    aget v5, p1, v4

    add-int/lit8 v6, v3, 0x1

    .line 207
    aget v7, p1, v6

    aput v7, p1, v4

    .line 208
    aput v5, p1, v6

    goto :goto_0

    :cond_3
    :goto_3
    add-int/lit8 v3, v3, -0x2

    goto :goto_2

    .line 211
    :cond_4
    aget p3, p1, v3

    aput p3, p1, p2

    .line 212
    aput v0, p1, v3

    add-int/lit8 p2, v3, 0x1

    .line 214
    aget p3, p1, p2

    aput p3, p1, v1

    .line 215
    aput v2, p1, p2

    return v3
.end method

.method private quicksortPartitionWithIndices([FIIZ[S)I
    .locals 8

    .line 254
    aget v0, p1, p2

    add-int/lit8 v1, p2, 0x1

    .line 255
    aget v2, p1, v1

    move v3, p3

    move p3, p2

    :cond_0
    :goto_0
    if-ge p3, v3, :cond_6

    :goto_1
    if-ge p3, v3, :cond_1

    .line 261
    aget v4, p1, p3

    cmpg-float v4, v4, v0

    if-gtz v4, :cond_1

    add-int/lit8 p3, p3, 0x2

    goto :goto_1

    :cond_1
    if-eqz p4, :cond_3

    .line 264
    :goto_2
    aget v4, p1, v3

    cmpl-float v4, v4, v0

    if-gtz v4, :cond_2

    aget v4, p1, v3

    cmpl-float v4, v4, v0

    if-nez v4, :cond_4

    add-int/lit8 v4, v3, 0x1

    aget v4, p1, v4

    cmpg-float v4, v4, v2

    if-gez v4, :cond_4

    :cond_2
    add-int/lit8 v3, v3, -0x2

    goto :goto_2

    .line 267
    :cond_3
    :goto_3
    aget v4, p1, v3

    cmpl-float v4, v4, v0

    if-gtz v4, :cond_5

    aget v4, p1, v3

    cmpl-float v4, v4, v0

    if-nez v4, :cond_4

    add-int/lit8 v4, v3, 0x1

    aget v4, p1, v4

    cmpl-float v4, v4, v2

    if-lez v4, :cond_4

    goto :goto_4

    :cond_4
    if-ge p3, v3, :cond_0

    .line 271
    aget v4, p1, p3

    .line 272
    aget v5, p1, v3

    aput v5, p1, p3

    .line 273
    aput v4, p1, v3

    add-int/lit8 v4, p3, 0x1

    .line 275
    aget v5, p1, v4

    add-int/lit8 v6, v3, 0x1

    .line 276
    aget v7, p1, v6

    aput v7, p1, v4

    .line 277
    aput v5, p1, v6

    .line 279
    div-int/lit8 v4, p3, 0x2

    aget-short v5, p5, v4

    .line 280
    div-int/lit8 v6, v3, 0x2

    aget-short v7, p5, v6

    aput-short v7, p5, v4

    .line 281
    aput-short v5, p5, v6

    goto :goto_0

    :cond_5
    :goto_4
    add-int/lit8 v3, v3, -0x2

    goto :goto_3

    .line 284
    :cond_6
    aget p3, p1, v3

    aput p3, p1, p2

    .line 285
    aput v0, p1, v3

    add-int/lit8 p3, v3, 0x1

    .line 287
    aget p4, p1, p3

    aput p4, p1, v1

    .line 288
    aput v2, p1, p3

    .line 290
    div-int/lit8 p2, p2, 0x2

    aget-short p1, p5, p2

    .line 291
    div-int/lit8 p3, v3, 0x2

    aget-short p4, p5, p3

    aput-short p4, p5, p2

    .line 292
    aput-short p1, p5, p3

    return v3
.end method

.method private sort([FI)V
    .locals 6

    add-int/lit8 p2, p2, -0x1

    .line 169
    iget-object v0, p0, Lcom/badlogic/gdx/math/ConvexHull;->quicksortStack:Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x0

    .line 170
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 p2, p2, -0x1

    .line 171
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 172
    :cond_0
    :goto_0
    iget p2, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-lez p2, :cond_3

    .line 173
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    move-result p2

    .line 174
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    move-result v1

    if-gt p2, v1, :cond_1

    goto :goto_0

    .line 176
    :cond_1
    invoke-direct {p0, p1, v1, p2}, Lcom/badlogic/gdx/math/ConvexHull;->quicksortPartition([FII)I

    move-result v2

    sub-int v3, v2, v1

    sub-int v4, p2, v2

    if-le v3, v4, :cond_2

    .line 178
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 v5, v2, -0x2

    .line 179
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    :cond_2
    add-int/lit8 v5, v2, 0x2

    .line 181
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 182
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    if-lt v4, v3, :cond_0

    .line 184
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 v2, v2, -0x2

    .line 185
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method private sortWithIndices([FIZ)V
    .locals 9

    .line 223
    div-int/lit8 v0, p2, 0x2

    .line 224
    iget-object v1, p0, Lcom/badlogic/gdx/math/ConvexHull;->originalIndices:Lcom/badlogic/gdx/utils/ShortArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/ShortArray;->clear()V

    .line 225
    iget-object v1, p0, Lcom/badlogic/gdx/math/ConvexHull;->originalIndices:Lcom/badlogic/gdx/utils/ShortArray;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/ShortArray;->ensureCapacity(I)[S

    .line 226
    iget-object v1, p0, Lcom/badlogic/gdx/math/ConvexHull;->originalIndices:Lcom/badlogic/gdx/utils/ShortArray;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_0

    .line 228
    aput-short v3, v1, v3

    add-int/lit8 v3, v3, 0x1

    int-to-short v3, v3

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, -0x1

    .line 232
    iget-object v0, p0, Lcom/badlogic/gdx/math/ConvexHull;->quicksortStack:Lcom/badlogic/gdx/utils/IntArray;

    .line 233
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 p2, p2, -0x1

    .line 234
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 235
    :cond_1
    :goto_1
    iget p2, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-lez p2, :cond_4

    .line 236
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    move-result p2

    .line 237
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    move-result v8

    if-gt p2, v8, :cond_2

    goto :goto_1

    :cond_2
    move-object v2, p0

    move-object v3, p1

    move v4, v8

    move v5, p2

    move v6, p3

    move-object v7, v1

    .line 239
    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/math/ConvexHull;->quicksortPartitionWithIndices([FIIZ[S)I

    move-result v2

    sub-int v3, v2, v8

    sub-int v4, p2, v2

    if-le v3, v4, :cond_3

    .line 241
    invoke-virtual {v0, v8}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 v5, v2, -0x2

    .line 242
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    :cond_3
    add-int/lit8 v5, v2, 0x2

    .line 244
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 245
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    if-lt v4, v3, :cond_1

    .line 247
    invoke-virtual {v0, v8}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 v2, v2, -0x2

    .line 248
    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_1

    :cond_4
    return-void
.end method


# virtual methods
.method public computeIndices(Lcom/badlogic/gdx/utils/FloatArray;ZZ)Lcom/badlogic/gdx/utils/IntArray;
    .locals 6

    .line 89
    iget-object v1, p1, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    iget v3, p1, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    const/4 v2, 0x0

    move-object v0, p0

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/math/ConvexHull;->computeIndices([FIIZZ)Lcom/badlogic/gdx/utils/IntArray;

    move-result-object p1

    return-object p1
.end method

.method public computeIndices([FIIZZ)Lcom/badlogic/gdx/utils/IntArray;
    .locals 9

    const/16 v0, 0x7fff

    if-gt p3, v0, :cond_8

    add-int v0, p2, p3

    const/4 v1, 0x0

    if-nez p4, :cond_2

    .line 103
    iget-object v2, p0, Lcom/badlogic/gdx/math/ConvexHull;->sortedPoints:[F

    if-eqz v2, :cond_0

    array-length v2, v2

    if-ge v2, p3, :cond_1

    :cond_0
    new-array v2, p3, [F

    iput-object v2, p0, Lcom/badlogic/gdx/math/ConvexHull;->sortedPoints:[F

    .line 104
    :cond_1
    iget-object v2, p0, Lcom/badlogic/gdx/math/ConvexHull;->sortedPoints:[F

    invoke-static {p1, p2, v2, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    iget-object p1, p0, Lcom/badlogic/gdx/math/ConvexHull;->sortedPoints:[F

    .line 107
    invoke-direct {p0, p1, p3, p5}, Lcom/badlogic/gdx/math/ConvexHull;->sortWithIndices([FIZ)V

    const/4 p2, 0x0

    .line 110
    :cond_2
    iget-object p3, p0, Lcom/badlogic/gdx/math/ConvexHull;->indices:Lcom/badlogic/gdx/utils/IntArray;

    .line 111
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 113
    iget-object p5, p0, Lcom/badlogic/gdx/math/ConvexHull;->hull:Lcom/badlogic/gdx/utils/FloatArray;

    .line 114
    invoke-virtual {p5}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    .line 117
    div-int/lit8 v2, p2, 0x2

    move v3, v2

    move v2, p2

    :goto_0
    const/4 v4, 0x0

    const/4 v5, 0x4

    if-ge v2, v0, :cond_4

    .line 118
    aget v6, p1, v2

    add-int/lit8 v7, v2, 0x1

    .line 119
    aget v7, p1, v7

    .line 120
    :goto_1
    iget v8, p5, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lt v8, v5, :cond_3

    invoke-direct {p0, v6, v7}, Lcom/badlogic/gdx/math/ConvexHull;->ccw(FF)F

    move-result v8

    cmpg-float v8, v8, v4

    if-gtz v8, :cond_3

    .line 121
    iget v8, p5, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 v8, v8, -0x2

    iput v8, p5, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    .line 122
    iget v8, p3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    add-int/lit8 v8, v8, -0x1

    iput v8, p3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    goto :goto_1

    .line 124
    :cond_3
    invoke-virtual {p5, v6}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 125
    invoke-virtual {p5, v7}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 126
    invoke-virtual {p3, v3}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    sub-int/2addr v0, v5

    .line 130
    div-int/lit8 v2, v0, 0x2

    iget v3, p5, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 v3, v3, 0x2

    :goto_2
    if-lt v0, p2, :cond_6

    .line 131
    aget v5, p1, v0

    add-int/lit8 v6, v0, 0x1

    .line 132
    aget v6, p1, v6

    .line 133
    :goto_3
    iget v7, p5, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lt v7, v3, :cond_5

    invoke-direct {p0, v5, v6}, Lcom/badlogic/gdx/math/ConvexHull;->ccw(FF)F

    move-result v7

    cmpg-float v7, v7, v4

    if-gtz v7, :cond_5

    .line 134
    iget v7, p5, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 v7, v7, -0x2

    iput v7, p5, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    .line 135
    iget v7, p3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    add-int/lit8 v7, v7, -0x1

    iput v7, p3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    goto :goto_3

    .line 137
    :cond_5
    invoke-virtual {p5, v5}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 138
    invoke-virtual {p5, v6}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 139
    invoke-virtual {p3, v2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 v0, v0, -0x2

    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    :cond_6
    if-nez p4, :cond_7

    .line 144
    iget-object p1, p0, Lcom/badlogic/gdx/math/ConvexHull;->originalIndices:Lcom/badlogic/gdx/utils/ShortArray;

    iget-object p1, p1, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 145
    iget-object p2, p3, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    .line 146
    iget p4, p3, Lcom/badlogic/gdx/utils/IntArray;->size:I

    :goto_4
    if-ge v1, p4, :cond_7

    .line 147
    aget p5, p2, v1

    aget-short p5, p1, p5

    aput p5, p2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_7
    return-object p3

    .line 99
    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "count must be <= 32767"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :goto_5
    throw p1

    :goto_6
    goto :goto_5
.end method

.method public computeIndices([FZZ)Lcom/badlogic/gdx/utils/IntArray;
    .locals 6

    .line 94
    array-length v3, p1

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/math/ConvexHull;->computeIndices([FIIZZ)Lcom/badlogic/gdx/utils/IntArray;

    move-result-object p1

    return-object p1
.end method

.method public computePolygon(Lcom/badlogic/gdx/utils/FloatArray;Z)Lcom/badlogic/gdx/utils/FloatArray;
    .locals 2

    .line 34
    iget-object v0, p1, Lcom/badlogic/gdx/utils/FloatArray;->items:[F

    iget p1, p1, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/badlogic/gdx/math/ConvexHull;->computePolygon([FIIZ)Lcom/badlogic/gdx/utils/FloatArray;

    move-result-object p1

    return-object p1
.end method

.method public computePolygon([FIIZ)Lcom/badlogic/gdx/utils/FloatArray;
    .locals 6

    add-int v0, p2, p3

    const/4 v1, 0x0

    if-nez p4, :cond_2

    .line 54
    iget-object p4, p0, Lcom/badlogic/gdx/math/ConvexHull;->sortedPoints:[F

    if-eqz p4, :cond_0

    array-length p4, p4

    if-ge p4, p3, :cond_1

    :cond_0
    new-array p4, p3, [F

    iput-object p4, p0, Lcom/badlogic/gdx/math/ConvexHull;->sortedPoints:[F

    .line 55
    :cond_1
    iget-object p4, p0, Lcom/badlogic/gdx/math/ConvexHull;->sortedPoints:[F

    invoke-static {p1, p2, p4, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    iget-object p1, p0, Lcom/badlogic/gdx/math/ConvexHull;->sortedPoints:[F

    .line 58
    invoke-direct {p0, p1, p3}, Lcom/badlogic/gdx/math/ConvexHull;->sort([FI)V

    const/4 p2, 0x0

    .line 61
    :cond_2
    iget-object p3, p0, Lcom/badlogic/gdx/math/ConvexHull;->hull:Lcom/badlogic/gdx/utils/FloatArray;

    .line 62
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/FloatArray;->clear()V

    move p4, p2

    :goto_0
    const/4 v1, 0x0

    const/4 v2, 0x4

    if-ge p4, v0, :cond_4

    .line 66
    aget v3, p1, p4

    add-int/lit8 v4, p4, 0x1

    .line 67
    aget v4, p1, v4

    .line 68
    :goto_1
    iget v5, p3, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lt v5, v2, :cond_3

    invoke-direct {p0, v3, v4}, Lcom/badlogic/gdx/math/ConvexHull;->ccw(FF)F

    move-result v5

    cmpg-float v5, v5, v1

    if-gtz v5, :cond_3

    .line 69
    iget v5, p3, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 v5, v5, -0x2

    iput v5, p3, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    goto :goto_1

    .line 70
    :cond_3
    invoke-virtual {p3, v3}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 71
    invoke-virtual {p3, v4}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    add-int/lit8 p4, p4, 0x2

    goto :goto_0

    :cond_4
    sub-int/2addr v0, v2

    .line 75
    iget p4, p3, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 p4, p4, 0x2

    :goto_2
    if-lt v0, p2, :cond_6

    .line 76
    aget v2, p1, v0

    add-int/lit8 v3, v0, 0x1

    .line 77
    aget v3, p1, v3

    .line 78
    :goto_3
    iget v4, p3, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    if-lt v4, p4, :cond_5

    invoke-direct {p0, v2, v3}, Lcom/badlogic/gdx/math/ConvexHull;->ccw(FF)F

    move-result v4

    cmpg-float v4, v4, v1

    if-gtz v4, :cond_5

    .line 79
    iget v4, p3, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    add-int/lit8 v4, v4, -0x2

    iput v4, p3, Lcom/badlogic/gdx/utils/FloatArray;->size:I

    goto :goto_3

    .line 80
    :cond_5
    invoke-virtual {p3, v2}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    .line 81
    invoke-virtual {p3, v3}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    add-int/lit8 v0, v0, -0x2

    goto :goto_2

    :cond_6
    return-object p3
.end method

.method public computePolygon([FZ)Lcom/badlogic/gdx/utils/FloatArray;
    .locals 2

    .line 39
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0, p2}, Lcom/badlogic/gdx/math/ConvexHull;->computePolygon([FIIZ)Lcom/badlogic/gdx/utils/FloatArray;

    move-result-object p1

    return-object p1
.end method
