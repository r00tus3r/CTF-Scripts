.class public Lcom/badlogic/gdx/utils/LongArray;
.super Ljava/lang/Object;
.source "LongArray.java"


# instance fields
.field public items:[J

.field public ordered:Z

.field public size:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x1

    const/16 v1, 0x10

    .line 33
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/LongArray;-><init>(ZI)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x1

    .line 38
    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/utils/LongArray;-><init>(ZI)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/LongArray;)V
    .locals 3

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iget-boolean v0, p1, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    .line 54
    iget v0, p1, Lcom/badlogic/gdx/utils/LongArray;->size:I

    iput v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    .line 55
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    new-array v1, v0, [J

    iput-object v1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 56
    iget-object p1, p1, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    .line 46
    new-array p1, p2, [J

    iput-object p1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    return-void
.end method

.method public constructor <init>(Z[JII)V
    .locals 1

    .line 70
    invoke-direct {p0, p1, p4}, Lcom/badlogic/gdx/utils/LongArray;-><init>(ZI)V

    .line 71
    iput p4, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    .line 72
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    const/4 v0, 0x0

    invoke-static {p2, p3, p1, v0, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public constructor <init>([J)V
    .locals 3

    .line 62
    array-length v0, p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, v1, p1, v2, v0}, Lcom/badlogic/gdx/utils/LongArray;-><init>(Z[JII)V

    return-void
.end method

.method public static varargs with([J)Lcom/badlogic/gdx/utils/LongArray;
    .locals 1

    .line 409
    new-instance v0, Lcom/badlogic/gdx/utils/LongArray;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/LongArray;-><init>([J)V

    return-object v0
.end method


# virtual methods
.method public add(J)V
    .locals 3

    .line 76
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 77
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    array-length v2, v0

    if-ne v1, v2, :cond_0

    const/16 v0, 0x8

    int-to-float v1, v1

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    move-result-object v0

    .line 78
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    aput-wide p1, v0, v1

    return-void
.end method

.method public add(JJ)V
    .locals 4

    .line 82
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 83
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v2, v1, 0x1

    array-length v3, v0

    if-lt v2, v3, :cond_0

    const/16 v0, 0x8

    int-to-float v1, v1

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    move-result-object v0

    .line 84
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    aput-wide p1, v0, v1

    add-int/lit8 p1, v1, 0x1

    .line 85
    aput-wide p3, v0, p1

    add-int/lit8 v1, v1, 0x2

    .line 86
    iput v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    return-void
.end method

.method public add(JJJ)V
    .locals 4

    .line 90
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 91
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v2, v1, 0x2

    array-length v3, v0

    if-lt v2, v3, :cond_0

    const/16 v0, 0x8

    int-to-float v1, v1

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    move-result-object v0

    .line 92
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    aput-wide p1, v0, v1

    add-int/lit8 p1, v1, 0x1

    .line 93
    aput-wide p3, v0, p1

    add-int/lit8 p1, v1, 0x2

    .line 94
    aput-wide p5, v0, p1

    add-int/lit8 v1, v1, 0x3

    .line 95
    iput v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    return-void
.end method

.method public add(JJJJ)V
    .locals 4

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 100
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v2, v1, 0x3

    array-length v3, v0

    if-lt v2, v3, :cond_0

    const/16 v0, 0x8

    int-to-float v1, v1

    const v2, 0x3fe66666    # 1.8f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    move-result-object v0

    .line 101
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    aput-wide p1, v0, v1

    add-int/lit8 p1, v1, 0x1

    .line 102
    aput-wide p3, v0, p1

    add-int/lit8 p1, v1, 0x2

    .line 103
    aput-wide p5, v0, p1

    add-int/lit8 p1, v1, 0x3

    .line 104
    aput-wide p7, v0, p1

    add-int/lit8 v1, v1, 0x4

    .line 105
    iput v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    return-void
.end method

.method public addAll(Lcom/badlogic/gdx/utils/LongArray;)V
    .locals 2

    .line 109
    iget-object v0, p1, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    iget p1, p1, Lcom/badlogic/gdx/utils/LongArray;->size:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/utils/LongArray;->addAll([JII)V

    return-void
.end method

.method public addAll(Lcom/badlogic/gdx/utils/LongArray;II)V
    .locals 3

    add-int v0, p2, p3

    .line 113
    iget v1, p1, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-gt v0, v1, :cond_0

    .line 115
    iget-object p1, p1, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/LongArray;->addAll([JII)V

    return-void

    .line 114
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "offset + length must be <= size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " + "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " <= "

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public varargs addAll([J)V
    .locals 2

    .line 119
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/badlogic/gdx/utils/LongArray;->addAll([JII)V

    return-void
.end method

.method public addAll([JII)V
    .locals 3

    .line 123
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 124
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/2addr v1, p3

    .line 125
    array-length v2, v0

    if-le v1, v2, :cond_0

    const/16 v0, 0x8

    int-to-float v1, v1

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    move-result-object v0

    .line 126
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 127
    iget p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 278
    iput v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    return-void
.end method

.method public contains(J)Z
    .locals 6

    .line 172
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 173
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    :goto_0
    if-ltz v0, :cond_1

    add-int/lit8 v3, v0, -0x1

    .line 175
    aget-wide v4, v2, v0

    cmp-long v0, v4, p1

    if-nez v0, :cond_0

    return v1

    :cond_0
    move v0, v3

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public ensureCapacity(I)[J
    .locals 3

    if-ltz p1, :cond_1

    .line 294
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/2addr v0, p1

    .line 295
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    array-length p1, p1

    if-le v0, p1, :cond_0

    const/16 p1, 0x8

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    .line 296
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    return-object p1

    .line 293
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

.method public equals(Ljava/lang/Object;)Z
    .locals 10

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 369
    :cond_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 370
    :cond_1
    instance-of v1, p1, Lcom/badlogic/gdx/utils/LongArray;

    if-nez v1, :cond_2

    return v2

    .line 371
    :cond_2
    check-cast p1, Lcom/badlogic/gdx/utils/LongArray;

    .line 372
    iget-boolean v1, p1, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    if-nez v1, :cond_3

    return v2

    .line 373
    :cond_3
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    .line 374
    iget v3, p1, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-eq v1, v3, :cond_4

    return v2

    .line 375
    :cond_4
    iget-object v3, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    iget-object p1, p1, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v1, :cond_6

    .line 377
    aget-wide v5, v3, v4

    aget-wide v7, p1, v4

    cmp-long v9, v5, v7

    if-eqz v9, :cond_5

    return v2

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_6
    return v0
.end method

.method public first()J
    .locals 3

    .line 263
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-eqz v0, :cond_0

    .line 264
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    const/4 v1, 0x0

    aget-wide v1, v0, v1

    return-wide v1

    .line 263
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Array is empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(I)J
    .locals 3

    .line 131
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-ge p1, v0, :cond_0

    .line 132
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    aget-wide v1, v0, p1

    return-wide v1

    .line 131
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index can\'t be >= size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 9

    .line 359
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    if-nez v0, :cond_0

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0

    .line 360
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    const/4 v1, 0x0

    .line 362
    iget v2, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    const/4 v3, 0x1

    :goto_0
    if-ge v1, v2, :cond_1

    mul-int/lit8 v3, v3, 0x1f

    .line 363
    aget-wide v4, v0, v1

    aget-wide v6, v0, v1

    const/16 v8, 0x20

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v5, v4

    add-int/2addr v3, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v3
.end method

.method public incr(IJ)V
    .locals 3

    .line 141
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-ge p1, v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    aget-wide v1, v0, p1

    add-long/2addr v1, p2

    aput-wide v1, v0, p1

    return-void

    .line 141
    :cond_0
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "index can\'t be >= size: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public indexOf(J)I
    .locals 6

    .line 180
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 181
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 182
    aget-wide v3, v0, v2

    cmp-long v5, v3, p1

    if-nez v5, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public insert(IJ)V
    .locals 4

    .line 151
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-gt p1, v0, :cond_2

    .line 152
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 153
    array-length v2, v1

    if-ne v0, v2, :cond_0

    const/16 v1, 0x8

    int-to-float v0, v0

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v0, v0, v2

    float-to-int v0, v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    move-result-object v1

    .line 154
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    if-eqz v0, :cond_1

    add-int/lit8 v0, p1, 0x1

    .line 155
    iget v2, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    sub-int/2addr v2, p1

    invoke-static {v1, p1, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .line 157
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    aget-wide v2, v1, p1

    aput-wide v2, v1, v0

    .line 158
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    .line 159
    aput-wide p2, v1, p1

    return-void

    .line 151
    :cond_2
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "index can\'t be > size: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " > "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public isEmpty()Z
    .locals 1

    .line 274
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public lastIndexOf(C)I
    .locals 7

    .line 187
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 188
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    .line 189
    aget-wide v2, v0, v1

    int-to-long v4, p1

    cmp-long v6, v2, v4

    if-nez v6, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public mul(IJ)V
    .locals 3

    .line 146
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-ge p1, v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    aget-wide v1, v0, p1

    mul-long v1, v1, p2

    aput-wide v1, v0, p1

    return-void

    .line 146
    :cond_0
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "index can\'t be >= size: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public notEmpty()Z
    .locals 1

    .line 269
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public peek()J
    .locals 3

    .line 258
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v1, v1, -0x1

    aget-wide v1, v0, v1

    return-wide v1
.end method

.method public pop()J
    .locals 3

    .line 253
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    aget-wide v1, v0, v1

    return-wide v1
.end method

.method public random()J
    .locals 3

    .line 348
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    .line 349
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    const/4 v2, 0x0

    add-int/lit8 v0, v0, -0x1

    invoke-static {v2, v0}, Lcom/badlogic/gdx/math/MathUtils;->random(II)I

    move-result v0

    aget-wide v0, v1, v0

    return-wide v0
.end method

.method public removeAll(Lcom/badlogic/gdx/utils/LongArray;)Z
    .locals 12

    .line 235
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    .line 237
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 238
    iget v2, p1, Lcom/badlogic/gdx/utils/LongArray;->size:I

    const/4 v3, 0x0

    move v5, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_2

    .line 239
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/utils/LongArray;->get(I)J

    move-result-wide v6

    const/4 v8, 0x0

    :goto_1
    if-ge v8, v5, :cond_1

    .line 241
    aget-wide v9, v1, v8

    cmp-long v11, v6, v9

    if-nez v11, :cond_0

    .line 242
    invoke-virtual {p0, v8}, Lcom/badlogic/gdx/utils/LongArray;->removeIndex(I)J

    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    :cond_0
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    if-eq v5, v0, :cond_3

    const/4 v3, 0x1

    :cond_3
    return v3
.end method

.method public removeIndex(I)J
    .locals 6

    .line 206
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-ge p1, v0, :cond_1

    .line 207
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 208
    aget-wide v2, v1, p1

    add-int/lit8 v0, v0, -0x1

    .line 209
    iput v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    .line 210
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    if-eqz v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    .line 211
    iget v4, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    sub-int/2addr v4, p1

    invoke-static {v1, v0, v1, p1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .line 213
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    aget-wide v4, v1, v0

    aput-wide v4, v1, p1

    :goto_0
    return-wide v2

    .line 206
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index can\'t be >= size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeRange(II)V
    .locals 4

    .line 219
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-ge p2, v0, :cond_2

    if-gt p1, p2, :cond_1

    sub-int v1, p2, p1

    add-int/lit8 v1, v1, 0x1

    sub-int v2, v0, v1

    .line 223
    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/LongArray;->ordered:Z

    if-eqz v3, :cond_0

    .line 224
    iget-object p2, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    add-int/2addr v1, p1

    sub-int/2addr v0, v1

    invoke-static {p2, v1, p2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 226
    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 227
    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    sub-int/2addr v0, p2

    invoke-static {v1, p2, v1, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 229
    :goto_0
    iput v2, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    return-void

    .line 221
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "start can\'t be > end: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " > "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 220
    :cond_2
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "end can\'t be >= size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " >= "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeValue(J)Z
    .locals 7

    .line 194
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 195
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 196
    aget-wide v4, v0, v3

    cmp-long v6, v4, p1

    if-nez v6, :cond_0

    .line 197
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/LongArray;->removeIndex(I)J

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method protected resize(I)[J
    .locals 3

    .line 309
    new-array p1, p1, [J

    .line 310
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 311
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    array-length v2, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 312
    iput-object p1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    return-object p1
.end method

.method public reverse()V
    .locals 9

    .line 321
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 322
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v2, v1, -0x1

    div-int/lit8 v1, v1, 0x2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    sub-int v4, v2, v3

    .line 324
    aget-wide v5, v0, v3

    .line 325
    aget-wide v7, v0, v4

    aput-wide v7, v0, v3

    .line 326
    aput-wide v5, v0, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public set(IJ)V
    .locals 1

    .line 136
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-ge p1, v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    aput-wide p2, v0, p1

    return-void

    .line 136
    :cond_0
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "index can\'t be >= size: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public setSize(I)[J
    .locals 3

    if-ltz p1, :cond_1

    .line 303
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    array-length v0, v0

    if-le p1, v0, :cond_0

    const/16 v0, 0x8

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    .line 304
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    .line 305
    iget-object p1, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    return-object p1

    .line 302
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "newSize must be >= 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public shrink()[J
    .locals 2

    .line 285
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    array-length v0, v0

    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-eq v0, v1, :cond_0

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/LongArray;->resize(I)[J

    .line 286
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    return-object v0
.end method

.method public shuffle()V
    .locals 7

    .line 331
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 332
    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_0

    .line 333
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v2

    .line 334
    aget-wide v3, v0, v1

    .line 335
    aget-wide v5, v0, v2

    aput-wide v5, v0, v1

    .line 336
    aput-wide v3, v0, v2

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public sort()V
    .locals 3

    .line 317
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    iget v1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Ljava/util/Arrays;->sort([JII)V

    return-void
.end method

.method public swap(II)V
    .locals 5

    .line 163
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    const-string v1, " >= "

    if-ge p1, v0, :cond_1

    if-ge p2, v0, :cond_0

    .line 165
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 166
    aget-wide v1, v0, p1

    .line 167
    aget-wide v3, v0, p2

    aput-wide v3, v0, p1

    .line 168
    aput-wide v1, v0, p2

    return-void

    .line 164
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "second can\'t be >= size: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 163
    :cond_1
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "first can\'t be >= size: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public toArray()[J
    .locals 4

    .line 353
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    new-array v1, v0, [J

    .line 354
    iget-object v2, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 382
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-nez v0, :cond_0

    const-string v0, "[]"

    return-object v0

    .line 383
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 384
    new-instance v1, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v2, 0x5b

    .line 385
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x0

    .line 386
    aget-wide v2, v0, v2

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(J)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x1

    .line 387
    :goto_0
    iget v3, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-ge v2, v3, :cond_1

    const-string v3, ", "

    .line 388
    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 389
    aget-wide v3, v0, v2

    invoke-virtual {v1, v3, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(J)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/16 v0, 0x5d

    .line 391
    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 392
    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 396
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-nez v0, :cond_0

    const-string p1, ""

    return-object p1

    .line 397
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongArray;->items:[J

    .line 398
    new-instance v1, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    .line 399
    aget-wide v2, v0, v2

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(J)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x1

    .line 400
    :goto_0
    iget v3, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-ge v2, v3, :cond_1

    .line 401
    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 402
    aget-wide v3, v0, v2

    invoke-virtual {v1, v3, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(J)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 404
    :cond_1
    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public truncate(I)V
    .locals 1

    .line 343
    iget v0, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    if-le v0, p1, :cond_0

    iput p1, p0, Lcom/badlogic/gdx/utils/LongArray;->size:I

    :cond_0
    return-void
.end method