.class public Lcom/badlogic/gdx/utils/ShortArray;
.super Ljava/lang/Object;
.source "ShortArray.java"


# instance fields
.field public items:[S

.field public ordered:Z

.field public size:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x1

    const/16 v1, 0x10

    .line 33
    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/utils/ShortArray;-><init>(ZI)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x1

    .line 38
    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/utils/ShortArray;-><init>(ZI)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/ShortArray;)V
    .locals 3

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iget-boolean v0, p1, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    .line 54
    iget v0, p1, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    iput v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    .line 55
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    new-array v1, v0, [S

    iput-object v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 56
    iget-object p1, p1, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-boolean p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    .line 46
    new-array p1, p2, [S

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    return-void
.end method

.method public constructor <init>(Z[SII)V
    .locals 1

    .line 70
    invoke-direct {p0, p1, p4}, Lcom/badlogic/gdx/utils/ShortArray;-><init>(ZI)V

    .line 71
    iput p4, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    .line 72
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    const/4 v0, 0x0

    invoke-static {p2, p3, p1, v0, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public constructor <init>([S)V
    .locals 3

    .line 62
    array-length v0, p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, v1, p1, v2, v0}, Lcom/badlogic/gdx/utils/ShortArray;-><init>(Z[SII)V

    return-void
.end method

.method public static varargs with([S)Lcom/badlogic/gdx/utils/ShortArray;
    .locals 1

    .line 416
    new-instance v0, Lcom/badlogic/gdx/utils/ShortArray;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ShortArray;-><init>([S)V

    return-object v0
.end method


# virtual methods
.method public add(I)V
    .locals 3

    .line 77
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 78
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    array-length v2, v0

    if-ne v1, v2, :cond_0

    const/16 v0, 0x8

    int-to-float v1, v1

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    move-result-object v0

    .line 79
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    int-to-short p1, p1

    aput-short p1, v0, v1

    return-void
.end method

.method public add(S)V
    .locals 3

    .line 83
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 84
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    array-length v2, v0

    if-ne v1, v2, :cond_0

    const/16 v0, 0x8

    int-to-float v1, v1

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    move-result-object v0

    .line 85
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    aput-short p1, v0, v1

    return-void
.end method

.method public add(SS)V
    .locals 4

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 90
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

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

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    move-result-object v0

    .line 91
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    aput-short p1, v0, v1

    add-int/lit8 p1, v1, 0x1

    .line 92
    aput-short p2, v0, p1

    add-int/lit8 v1, v1, 0x2

    .line 93
    iput v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    return-void
.end method

.method public add(SSS)V
    .locals 4

    .line 97
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 98
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

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

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    move-result-object v0

    .line 99
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    aput-short p1, v0, v1

    add-int/lit8 p1, v1, 0x1

    .line 100
    aput-short p2, v0, p1

    add-int/lit8 p1, v1, 0x2

    .line 101
    aput-short p3, v0, p1

    add-int/lit8 v1, v1, 0x3

    .line 102
    iput v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    return-void
.end method

.method public add(SSSS)V
    .locals 4

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 107
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

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

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    move-result-object v0

    .line 108
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    aput-short p1, v0, v1

    add-int/lit8 p1, v1, 0x1

    .line 109
    aput-short p2, v0, p1

    add-int/lit8 p1, v1, 0x2

    .line 110
    aput-short p3, v0, p1

    add-int/lit8 p1, v1, 0x3

    .line 111
    aput-short p4, v0, p1

    add-int/lit8 v1, v1, 0x4

    .line 112
    iput v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    return-void
.end method

.method public addAll(Lcom/badlogic/gdx/utils/ShortArray;)V
    .locals 2

    .line 116
    iget-object v0, p1, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    iget p1, p1, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/utils/ShortArray;->addAll([SII)V

    return-void
.end method

.method public addAll(Lcom/badlogic/gdx/utils/ShortArray;II)V
    .locals 3

    add-int v0, p2, p3

    .line 120
    iget v1, p1, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-gt v0, v1, :cond_0

    .line 122
    iget-object p1, p1, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/ShortArray;->addAll([SII)V

    return-void

    .line 121
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

    iget p1, p1, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public varargs addAll([S)V
    .locals 2

    .line 126
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/badlogic/gdx/utils/ShortArray;->addAll([SII)V

    return-void
.end method

.method public addAll([SII)V
    .locals 3

    .line 130
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 131
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/2addr v1, p3

    .line 132
    array-length v2, v0

    if-le v1, v2, :cond_0

    const/16 v0, 0x8

    int-to-float v1, v1

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v1, v1, v2

    float-to-int v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    move-result-object v0

    .line 133
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 134
    iget p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 285
    iput v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    return-void
.end method

.method public contains(S)Z
    .locals 4

    .line 179
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 180
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    :goto_0
    if-ltz v0, :cond_1

    add-int/lit8 v3, v0, -0x1

    .line 182
    aget-short v0, v2, v0

    if-ne v0, p1, :cond_0

    return v1

    :cond_0
    move v0, v3

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public ensureCapacity(I)[S
    .locals 3

    if-ltz p1, :cond_1

    .line 301
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/2addr v0, p1

    .line 302
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    array-length p1, p1

    if-le v0, p1, :cond_0

    const/16 p1, 0x8

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    .line 303
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    return-object p1

    .line 300
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
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 376
    :cond_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 377
    :cond_1
    instance-of v1, p1, Lcom/badlogic/gdx/utils/ShortArray;

    if-nez v1, :cond_2

    return v2

    .line 378
    :cond_2
    check-cast p1, Lcom/badlogic/gdx/utils/ShortArray;

    .line 379
    iget-boolean v1, p1, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    if-nez v1, :cond_3

    return v2

    .line 380
    :cond_3
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    .line 381
    iget v3, p1, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-eq v1, v3, :cond_4

    return v2

    .line 382
    :cond_4
    iget-object v3, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    iget-object p1, p1, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v1, :cond_6

    .line 384
    aget-short v5, v3, v4

    aget-short v6, p1, v4

    if-eq v5, v6, :cond_5

    return v2

    :cond_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_6
    return v0
.end method

.method public first()S
    .locals 2

    .line 270
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-eqz v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    const/4 v1, 0x0

    aget-short v0, v0, v1

    return v0

    .line 270
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Array is empty."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(I)S
    .locals 3

    .line 138
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-ge p1, v0, :cond_0

    .line 139
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    aget-short p1, v0, p1

    return p1

    .line 138
    :cond_0
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index can\'t be >= size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 5

    .line 366
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    if-nez v0, :cond_0

    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0

    .line 367
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    const/4 v1, 0x0

    .line 369
    iget v2, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const/4 v3, 0x1

    :goto_0
    if-ge v1, v2, :cond_1

    mul-int/lit8 v3, v3, 0x1f

    .line 370
    aget-short v4, v0, v1

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v3
.end method

.method public incr(IS)V
    .locals 2

    .line 148
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-ge p1, v0, :cond_0

    .line 149
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    aget-short v1, v0, p1

    add-int/2addr v1, p2

    int-to-short p2, v1

    aput-short p2, v0, p1

    return-void

    .line 148
    :cond_0
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "index can\'t be >= size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public indexOf(S)I
    .locals 4

    .line 187
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 188
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 189
    aget-short v3, v0, v2

    if-ne v3, p1, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public insert(IS)V
    .locals 3

    .line 158
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-gt p1, v0, :cond_2

    .line 159
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 160
    array-length v2, v1

    if-ne v0, v2, :cond_0

    const/16 v1, 0x8

    int-to-float v0, v0

    const/high16 v2, 0x3fe00000    # 1.75f

    mul-float v0, v0, v2

    float-to-int v0, v0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    move-result-object v1

    .line 161
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    if-eqz v0, :cond_1

    add-int/lit8 v0, p1, 0x1

    .line 162
    iget v2, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    sub-int/2addr v2, p1

    invoke-static {v1, p1, v1, v0, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .line 164
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    aget-short v2, v1, p1

    aput-short v2, v1, v0

    .line 165
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    .line 166
    aput-short p2, v1, p1

    return-void

    .line 158
    :cond_2
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "index can\'t be > size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " > "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public isEmpty()Z
    .locals 1

    .line 281
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public lastIndexOf(C)I
    .locals 3

    .line 194
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 195
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_1

    .line 196
    aget-short v2, v0, v1

    if-ne v2, p1, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public mul(IS)V
    .locals 2

    .line 153
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-ge p1, v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    aget-short v1, v0, p1

    mul-int v1, v1, p2

    int-to-short p2, v1

    aput-short p2, v0, p1

    return-void

    .line 153
    :cond_0
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "index can\'t be >= size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public notEmpty()Z
    .locals 1

    .line 276
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public peek()S
    .locals 2

    .line 265
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v1, v1, -0x1

    aget-short v0, v0, v1

    return v0
.end method

.method public pop()S
    .locals 2

    .line 260
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    aget-short v0, v0, v1

    return v0
.end method

.method public random()S
    .locals 3

    .line 355
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 356
    :cond_0
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    add-int/lit8 v0, v0, -0x1

    invoke-static {v1, v0}, Lcom/badlogic/gdx/math/MathUtils;->random(II)I

    move-result v0

    aget-short v0, v2, v0

    return v0
.end method

.method public removeAll(Lcom/badlogic/gdx/utils/ShortArray;)Z
    .locals 9

    .line 242
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    .line 244
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 245
    iget v2, p1, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const/4 v3, 0x0

    move v5, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_2

    .line 246
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/utils/ShortArray;->get(I)S

    move-result v6

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v5, :cond_1

    .line 248
    aget-short v8, v1, v7

    if-ne v6, v8, :cond_0

    .line 249
    invoke-virtual {p0, v7}, Lcom/badlogic/gdx/utils/ShortArray;->removeIndex(I)S

    add-int/lit8 v5, v5, -0x1

    goto :goto_2

    :cond_0
    add-int/lit8 v7, v7, 0x1

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

.method public removeIndex(I)S
    .locals 4

    .line 213
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-ge p1, v0, :cond_1

    .line 214
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 215
    aget-short v2, v1, p1

    add-int/lit8 v0, v0, -0x1

    .line 216
    iput v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    .line 217
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    if-eqz v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    .line 218
    iget v3, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    sub-int/2addr v3, p1

    invoke-static {v1, v0, v1, p1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .line 220
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    aget-short v0, v1, v0

    aput-short v0, v1, p1

    :goto_0
    return v2

    .line 213
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index can\'t be >= size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeRange(II)V
    .locals 4

    .line 226
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-ge p2, v0, :cond_2

    if-gt p1, p2, :cond_1

    sub-int v1, p2, p1

    add-int/lit8 v1, v1, 0x1

    sub-int v2, v0, v1

    .line 230
    iget-boolean v3, p0, Lcom/badlogic/gdx/utils/ShortArray;->ordered:Z

    if-eqz v3, :cond_0

    .line 231
    iget-object p2, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    add-int/2addr v1, p1

    sub-int/2addr v0, v1

    invoke-static {p2, v1, p2, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    :cond_0
    add-int/lit8 p2, p2, 0x1

    .line 233
    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 234
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    sub-int/2addr v0, p2

    invoke-static {v1, p2, v1, p1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 236
    :goto_0
    iput v2, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    return-void

    .line 228
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

    .line 227
    :cond_2
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "end can\'t be >= size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " >= "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeValue(S)Z
    .locals 5

    .line 201
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 202
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    .line 203
    aget-short v4, v0, v3

    if-ne v4, p1, :cond_0

    .line 204
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/ShortArray;->removeIndex(I)S

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method protected resize(I)[S
    .locals 3

    .line 316
    new-array p1, p1, [S

    .line 317
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 318
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    array-length v2, p1

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 319
    iput-object p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    return-object p1
.end method

.method public reverse()V
    .locals 7

    .line 328
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 329
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v2, v1, -0x1

    div-int/lit8 v1, v1, 0x2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    sub-int v4, v2, v3

    .line 331
    aget-short v5, v0, v3

    .line 332
    aget-short v6, v0, v4

    aput-short v6, v0, v3

    .line 333
    aput-short v5, v0, v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public set(IS)V
    .locals 2

    .line 143
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-ge p1, v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    aput-short p2, v0, p1

    return-void

    .line 143
    :cond_0
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "index can\'t be >= size: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public setSize(I)[S
    .locals 3

    if-ltz p1, :cond_1

    .line 310
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    array-length v0, v0

    if-le p1, v0, :cond_0

    const/16 v0, 0x8

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    .line 311
    :cond_0
    iput p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    .line 312
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    return-object p1

    .line 309
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

.method public shrink()[S
    .locals 2

    .line 292
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    array-length v0, v0

    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-eq v0, v1, :cond_0

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/utils/ShortArray;->resize(I)[S

    .line 293
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    return-object v0
.end method

.method public shuffle()V
    .locals 5

    .line 338
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 339
    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_0

    .line 340
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->random(I)I

    move-result v2

    .line 341
    aget-short v3, v0, v1

    .line 342
    aget-short v4, v0, v2

    aput-short v4, v0, v1

    .line 343
    aput-short v3, v0, v2

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public sort()V
    .locals 3

    .line 324
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    iget v1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Ljava/util/Arrays;->sort([SII)V

    return-void
.end method

.method public swap(II)V
    .locals 3

    .line 170
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    const-string v1, " >= "

    if-ge p1, v0, :cond_1

    if-ge p2, v0, :cond_0

    .line 172
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 173
    aget-short v1, v0, p1

    .line 174
    aget-short v2, v0, p2

    aput-short v2, v0, p1

    .line 175
    aput-short v1, v0, p2

    return-void

    .line 171
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "second can\'t be >= size: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 170
    :cond_1
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "first can\'t be >= size: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public toArray()[S
    .locals 4

    .line 360
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    new-array v1, v0, [S

    .line 361
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 389
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-nez v0, :cond_0

    const-string v0, "[]"

    return-object v0

    .line 390
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 391
    new-instance v1, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v2, 0x5b

    .line 392
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x0

    .line 393
    aget-short v2, v0, v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x1

    .line 394
    :goto_0
    iget v3, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-ge v2, v3, :cond_1

    const-string v3, ", "

    .line 395
    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 396
    aget-short v3, v0, v2

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/16 v0, 0x5d

    .line 398
    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 399
    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 403
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-nez v0, :cond_0

    const-string p1, ""

    return-object p1

    .line 404
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->items:[S

    .line 405
    new-instance v1, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/4 v2, 0x0

    .line 406
    aget-short v2, v0, v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x1

    .line 407
    :goto_0
    iget v3, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-ge v2, v3, :cond_1

    .line 408
    invoke-virtual {v1, p1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 409
    aget-short v3, v0, v2

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(I)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 411
    :cond_1
    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public truncate(I)V
    .locals 1

    .line 350
    iget v0, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    if-le v0, p1, :cond_0

    iput p1, p0, Lcom/badlogic/gdx/utils/ShortArray;->size:I

    :cond_0
    return-void
.end method
