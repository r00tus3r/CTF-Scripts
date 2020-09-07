.class Lcom/badlogic/gdx/utils/ComparableTimSort;
.super Ljava/lang/Object;
.source "ComparableTimSort.java"


# static fields
.field private static final DEBUG:Z = false

.field private static final INITIAL_TMP_STORAGE_LENGTH:I = 0x100

.field private static final MIN_GALLOP:I = 0x7

.field private static final MIN_MERGE:I = 0x20


# instance fields
.field private a:[Ljava/lang/Object;

.field private minGallop:I

.field private final runBase:[I

.field private final runLen:[I

.field private stackSize:I

.field private tmp:[Ljava/lang/Object;

.field private tmpCount:I


# direct methods
.method constructor <init>()V
    .locals 2

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x7

    .line 44
    iput v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->minGallop:I

    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    const/16 v0, 0x100

    .line 71
    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmp:[Ljava/lang/Object;

    const/16 v0, 0x28

    .line 72
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runBase:[I

    .line 73
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runLen:[I

    return-void
.end method

.method private constructor <init>([Ljava/lang/Object;)V
    .locals 1

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x7

    .line 44
    iput v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->minGallop:I

    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    .line 130
    iput-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->a:[Ljava/lang/Object;

    .line 133
    array-length p1, p1

    const/16 v0, 0x200

    if-ge p1, v0, :cond_0

    ushr-int/lit8 v0, p1, 0x1

    goto :goto_0

    :cond_0
    const/16 v0, 0x100

    .line 134
    :goto_0
    new-array v0, v0, [Ljava/lang/Object;

    .line 135
    iput-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmp:[Ljava/lang/Object;

    const/16 v0, 0x78

    if-ge p1, v0, :cond_1

    const/4 p1, 0x5

    goto :goto_1

    :cond_1
    const/16 v0, 0x606

    if-ge p1, v0, :cond_2

    const/16 p1, 0xa

    goto :goto_1

    :cond_2
    const v0, 0x1d16f

    if-ge p1, v0, :cond_3

    const/16 p1, 0x13

    goto :goto_1

    :cond_3
    const/16 p1, 0x28

    .line 145
    :goto_1
    new-array v0, p1, [I

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runBase:[I

    .line 146
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runLen:[I

    return-void
.end method

.method private static binarySort([Ljava/lang/Object;III)V
    .locals 5

    if-ne p3, p1, :cond_0

    :goto_0
    add-int/lit8 p3, p3, 0x1

    :cond_0
    if-ge p3, p2, :cond_5

    .line 216
    aget-object v0, p0, p3

    check-cast v0, Ljava/lang/Comparable;

    move v1, p1

    move v2, p3

    :goto_1
    const/4 v3, 0x1

    if-ge v1, v2, :cond_2

    add-int v4, v1, v2

    ushr-int/lit8 v3, v4, 0x1

    .line 227
    aget-object v4, p0, v3

    invoke-interface {v0, v4}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v4

    if-gez v4, :cond_1

    move v2, v3

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    move v1, v3

    goto :goto_1

    :cond_2
    sub-int v2, p3, v1

    if-eq v2, v3, :cond_4

    const/4 v3, 0x2

    if-eq v2, v3, :cond_3

    add-int/lit8 v3, v1, 0x1

    .line 248
    invoke-static {p0, v1, p0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2

    :cond_3
    add-int/lit8 v2, v1, 0x2

    add-int/lit8 v3, v1, 0x1

    .line 243
    aget-object v3, p0, v3

    aput-object v3, p0, v2

    :cond_4
    add-int/lit8 v2, v1, 0x1

    .line 245
    aget-object v3, p0, v1

    aput-object v3, p0, v2

    .line 250
    :goto_2
    aput-object v0, p0, v1

    goto :goto_0

    :cond_5
    return-void
.end method

.method private static countRunAndMakeAscending([Ljava/lang/Object;II)I
    .locals 3

    add-int/lit8 v0, p1, 0x1

    if-ne v0, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v0, 0x1

    .line 279
    aget-object v0, p0, v0

    check-cast v0, Ljava/lang/Comparable;

    aget-object v2, p0, p1

    invoke-interface {v0, v2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_2

    :goto_0
    if-ge v1, p2, :cond_1

    .line 280
    aget-object v0, p0, v1

    check-cast v0, Ljava/lang/Comparable;

    add-int/lit8 v2, v1, -0x1

    aget-object v2, p0, v2

    invoke-interface {v0, v2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 282
    :cond_1
    invoke-static {p0, p1, v1}, Lcom/badlogic/gdx/utils/ComparableTimSort;->reverseRange([Ljava/lang/Object;II)V

    goto :goto_2

    :cond_2
    :goto_1
    if-ge v1, p2, :cond_3

    .line 284
    aget-object v0, p0, v1

    check-cast v0, Ljava/lang/Comparable;

    add-int/lit8 v2, v1, -0x1

    aget-object v2, p0, v2

    invoke-interface {v0, v2}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_3

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    sub-int/2addr v1, p1

    return v1
.end method

.method private ensureCapacity(I)[Ljava/lang/Object;
    .locals 2

    .line 771
    iget v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmpCount:I

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmpCount:I

    .line 772
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmp:[Ljava/lang/Object;

    array-length v0, v0

    if-ge v0, p1, :cond_1

    shr-int/lit8 v0, p1, 0x1

    or-int/2addr v0, p1

    shr-int/lit8 v1, v0, 0x2

    or-int/2addr v0, v1

    shr-int/lit8 v1, v0, 0x4

    or-int/2addr v0, v1

    shr-int/lit8 v1, v0, 0x8

    or-int/2addr v0, v1

    shr-int/lit8 v1, v0, 0x10

    or-int/2addr v0, v1

    add-int/lit8 v0, v0, 0x1

    if-gez v0, :cond_0

    goto :goto_0

    .line 785
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->a:[Ljava/lang/Object;

    array-length p1, p1

    ushr-int/lit8 p1, p1, 0x1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 787
    :goto_0
    new-array p1, p1, [Ljava/lang/Object;

    .line 788
    iput-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmp:[Ljava/lang/Object;

    .line 790
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmp:[Ljava/lang/Object;

    return-object p1
.end method

.method private static gallopLeft(Ljava/lang/Comparable;[Ljava/lang/Object;III)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Comparable<",
            "Ljava/lang/Object;",
            ">;[",
            "Ljava/lang/Object;",
            "III)I"
        }
    .end annotation

    add-int v0, p2, p4

    .line 437
    aget-object v1, p1, v0

    invoke-interface {p0, v1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-lez v1, :cond_3

    sub-int/2addr p3, p4

    const/4 v1, 0x0

    const/4 v3, 0x1

    :goto_0
    if-ge v3, p3, :cond_1

    add-int v4, v0, v3

    .line 440
    aget-object v4, p1, v4

    invoke-interface {p0, v4}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v4

    if-lez v4, :cond_1

    shl-int/lit8 v1, v3, 0x1

    add-int/2addr v1, v2

    if-gtz v1, :cond_0

    move v1, v3

    move v3, p3

    goto :goto_0

    :cond_0
    move v5, v3

    move v3, v1

    move v1, v5

    goto :goto_0

    :cond_1
    if-le v3, p3, :cond_2

    goto :goto_1

    :cond_2
    move p3, v3

    :goto_1
    add-int/2addr v1, p4

    add-int/2addr p3, p4

    move p4, p3

    move p3, v1

    goto :goto_4

    :cond_3
    add-int/lit8 p3, p4, 0x1

    const/4 v1, 0x0

    const/4 v3, 0x1

    :goto_2
    if-ge v3, p3, :cond_5

    sub-int v4, v0, v3

    .line 454
    aget-object v4, p1, v4

    invoke-interface {p0, v4}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v4

    if-gtz v4, :cond_5

    shl-int/lit8 v1, v3, 0x1

    add-int/2addr v1, v2

    if-gtz v1, :cond_4

    move v1, v3

    move v3, p3

    goto :goto_2

    :cond_4
    move v5, v3

    move v3, v1

    move v1, v5

    goto :goto_2

    :cond_5
    if-le v3, p3, :cond_6

    goto :goto_3

    :cond_6
    move p3, v3

    :goto_3
    sub-int p3, p4, p3

    sub-int/2addr p4, v1

    :goto_4
    add-int/2addr p3, v2

    :goto_5
    if-ge p3, p4, :cond_8

    sub-int v0, p4, p3

    ushr-int/2addr v0, v2

    add-int/2addr v0, p3

    add-int v1, p2, v0

    .line 477
    aget-object v1, p1, v1

    invoke-interface {p0, v1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v1

    if-lez v1, :cond_7

    add-int/lit8 v0, v0, 0x1

    move p3, v0

    goto :goto_5

    :cond_7
    move p4, v0

    goto :goto_5

    :cond_8
    return p4
.end method

.method private static gallopRight(Ljava/lang/Comparable;[Ljava/lang/Object;III)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Comparable<",
            "Ljava/lang/Object;",
            ">;[",
            "Ljava/lang/Object;",
            "III)I"
        }
    .end annotation

    add-int v0, p2, p4

    .line 501
    aget-object v1, p1, v0

    invoke-interface {p0, v1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-gez v1, :cond_3

    add-int/lit8 p3, p4, 0x1

    const/4 v1, 0x0

    const/4 v3, 0x1

    :goto_0
    if-ge v3, p3, :cond_1

    sub-int v4, v0, v3

    .line 504
    aget-object v4, p1, v4

    invoke-interface {p0, v4}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v4

    if-gez v4, :cond_1

    shl-int/lit8 v1, v3, 0x1

    add-int/2addr v1, v2

    if-gtz v1, :cond_0

    move v1, v3

    move v3, p3

    goto :goto_0

    :cond_0
    move v5, v3

    move v3, v1

    move v1, v5

    goto :goto_0

    :cond_1
    if-le v3, p3, :cond_2

    goto :goto_1

    :cond_2
    move p3, v3

    :goto_1
    sub-int p3, p4, p3

    sub-int/2addr p4, v1

    goto :goto_4

    :cond_3
    sub-int/2addr p3, p4

    const/4 v1, 0x0

    const/4 v3, 0x1

    :goto_2
    if-ge v3, p3, :cond_5

    add-int v4, v0, v3

    .line 519
    aget-object v4, p1, v4

    invoke-interface {p0, v4}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v4

    if-ltz v4, :cond_5

    shl-int/lit8 v1, v3, 0x1

    add-int/2addr v1, v2

    if-gtz v1, :cond_4

    move v1, v3

    move v3, p3

    goto :goto_2

    :cond_4
    move v5, v3

    move v3, v1

    move v1, v5

    goto :goto_2

    :cond_5
    if-le v3, p3, :cond_6

    goto :goto_3

    :cond_6
    move p3, v3

    :goto_3
    add-int v0, v1, p4

    add-int/2addr p4, p3

    move p3, v0

    :goto_4
    add-int/2addr p3, v2

    :goto_5
    if-ge p3, p4, :cond_8

    sub-int v0, p4, p3

    ushr-int/2addr v0, v2

    add-int/2addr v0, p3

    add-int v1, p2, v0

    .line 541
    aget-object v1, p1, v1

    invoke-interface {p0, v1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v1

    if-gez v1, :cond_7

    move p4, v0

    goto :goto_5

    :cond_7
    add-int/lit8 v0, v0, 0x1

    move p3, v0

    goto :goto_5

    :cond_8
    return p4
.end method

.method private mergeAt(I)V
    .locals 8

    .line 377
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runBase:[I

    aget v1, v0, p1

    .line 378
    iget-object v2, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runLen:[I

    aget v3, v2, p1

    add-int/lit8 v4, p1, 0x1

    .line 379
    aget v5, v0, v4

    .line 380
    aget v6, v2, v4

    add-int v7, v3, v6

    .line 388
    aput v7, v2, p1

    .line 389
    iget v7, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    add-int/lit8 v7, v7, -0x3

    if-ne p1, v7, :cond_0

    add-int/lit8 p1, p1, 0x2

    .line 390
    aget v7, v0, p1

    aput v7, v0, v4

    .line 391
    aget p1, v2, p1

    aput p1, v2, v4

    .line 393
    :cond_0
    iget p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    .line 399
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->a:[Ljava/lang/Object;

    aget-object v0, p1, v5

    check-cast v0, Ljava/lang/Comparable;

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, v3, v2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->gallopRight(Ljava/lang/Comparable;[Ljava/lang/Object;III)I

    move-result p1

    add-int/2addr v1, p1

    sub-int/2addr v3, p1

    if-nez v3, :cond_1

    return-void

    .line 409
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->a:[Ljava/lang/Object;

    add-int v0, v1, v3

    add-int/lit8 v0, v0, -0x1

    aget-object v0, p1, v0

    check-cast v0, Ljava/lang/Comparable;

    add-int/lit8 v2, v6, -0x1

    invoke-static {v0, p1, v5, v6, v2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->gallopLeft(Ljava/lang/Comparable;[Ljava/lang/Object;III)I

    move-result p1

    if-nez p1, :cond_2

    return-void

    :cond_2
    if-gt v3, p1, :cond_3

    .line 415
    invoke-direct {p0, v1, v3, v5, p1}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeLo(IIII)V

    goto :goto_0

    .line 417
    :cond_3
    invoke-direct {p0, v1, v3, v5, p1}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeHi(IIII)V

    :goto_0
    return-void
.end method

.method private mergeCollapse()V
    .locals 7

    .line 345
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    add-int/lit8 v0, v0, -0x2

    if-lez v0, :cond_1

    .line 347
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runLen:[I

    add-int/lit8 v2, v0, -0x1

    aget v3, v1, v2

    aget v4, v1, v0

    add-int/lit8 v5, v0, 0x1

    aget v6, v1, v5

    add-int/2addr v4, v6

    if-gt v3, v4, :cond_1

    .line 348
    aget v2, v1, v2

    aget v1, v1, v5

    if-ge v2, v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 349
    :cond_0
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeAt(I)V

    goto :goto_0

    .line 350
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runLen:[I

    aget v2, v1, v0

    add-int/lit8 v3, v0, 0x1

    aget v1, v1, v3

    if-gt v2, v1, :cond_2

    .line 351
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeAt(I)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method private mergeForceCollapse()V
    .locals 4

    .line 360
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    add-int/lit8 v0, v0, -0x2

    if-lez v0, :cond_0

    .line 362
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runLen:[I

    add-int/lit8 v2, v0, -0x1

    aget v2, v1, v2

    add-int/lit8 v3, v0, 0x1

    aget v1, v1, v3

    if-ge v2, v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 363
    :cond_0
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeAt(I)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private mergeHi(IIII)V
    .locals 11

    .line 670
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->a:[Ljava/lang/Object;

    .line 671
    invoke-direct {p0, p4}, Lcom/badlogic/gdx/utils/ComparableTimSort;->ensureCapacity(I)[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    .line 672
    invoke-static {v0, p3, v1, v2, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int v3, p1, p2

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    add-int/lit8 v5, p4, -0x1

    add-int/2addr p3, p4

    sub-int/2addr p3, v4

    add-int/lit8 v6, p3, -0x1

    add-int/lit8 v7, v3, -0x1

    .line 679
    aget-object v3, v0, v3

    aput-object v3, v0, p3

    add-int/lit8 p2, p2, -0x1

    if-nez p2, :cond_0

    sub-int/2addr v6, v5

    .line 681
    invoke-static {v1, v2, v0, v6, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    :cond_0
    if-ne p4, v4, :cond_1

    sub-int/2addr v6, p2

    sub-int/2addr v7, p2

    add-int/2addr v7, v4

    add-int/lit8 p1, v6, 0x1

    .line 687
    invoke-static {v0, v7, v0, p1, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 688
    aget-object p1, v1, v5

    aput-object p1, v0, v6

    return-void

    .line 692
    :cond_1
    iget p3, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->minGallop:I

    :goto_0
    move v8, p2

    const/4 p2, 0x0

    const/4 v3, 0x0

    .line 703
    :cond_2
    aget-object v9, v1, v5

    check-cast v9, Ljava/lang/Comparable;

    aget-object v10, v0, v7

    invoke-interface {v9, v10}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v9

    if-gez v9, :cond_4

    add-int/lit8 p2, v6, -0x1

    add-int/lit8 v9, v7, -0x1

    .line 704
    aget-object v7, v0, v7

    aput-object v7, v0, v6

    add-int/2addr v3, v4

    add-int/lit8 v8, v8, -0x1

    if-nez v8, :cond_3

    move v3, p2

    move v7, v9

    goto/16 :goto_4

    :cond_3
    move v6, p2

    move v7, v9

    const/4 p2, 0x0

    goto :goto_2

    :cond_4
    add-int/lit8 v3, v6, -0x1

    add-int/lit8 v9, v5, -0x1

    .line 709
    aget-object v5, v1, v5

    aput-object v5, v0, v6

    add-int/2addr p2, v4

    add-int/lit8 p4, p4, -0x1

    if-ne p4, v4, :cond_5

    :goto_1
    move v5, v9

    goto/16 :goto_4

    :cond_5
    move v6, v3

    move v5, v9

    const/4 v3, 0x0

    :goto_2
    or-int v9, v3, p2

    if-lt v9, p3, :cond_2

    .line 722
    :goto_3
    aget-object p2, v1, v5

    check-cast p2, Ljava/lang/Comparable;

    add-int/lit8 v3, v8, -0x1

    invoke-static {p2, v0, p1, v8, v3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->gallopRight(Ljava/lang/Comparable;[Ljava/lang/Object;III)I

    move-result p2

    sub-int p2, v8, p2

    if-eqz p2, :cond_6

    sub-int v3, v6, p2

    sub-int/2addr v7, p2

    sub-int/2addr v8, p2

    add-int/lit8 v6, v7, 0x1

    add-int/lit8 v9, v3, 0x1

    .line 727
    invoke-static {v0, v6, v0, v9, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    if-nez v8, :cond_7

    goto :goto_4

    :cond_6
    move v3, v6

    :cond_7
    add-int/lit8 v6, v3, -0x1

    add-int/lit8 v9, v5, -0x1

    .line 730
    aget-object v5, v1, v5

    aput-object v5, v0, v3

    add-int/lit8 p4, p4, -0x1

    if-ne p4, v4, :cond_8

    move v3, v6

    goto :goto_1

    .line 733
    :cond_8
    aget-object v3, v0, v7

    check-cast v3, Ljava/lang/Comparable;

    add-int/lit8 v5, p4, -0x1

    invoke-static {v3, v1, v2, p4, v5}, Lcom/badlogic/gdx/utils/ComparableTimSort;->gallopLeft(Ljava/lang/Comparable;[Ljava/lang/Object;III)I

    move-result v3

    sub-int v3, p4, v3

    if-eqz v3, :cond_9

    sub-int v5, v6, v3

    sub-int v6, v9, v3

    sub-int/2addr p4, v3

    add-int/lit8 v9, v6, 0x1

    add-int/lit8 v10, v5, 0x1

    .line 738
    invoke-static {v1, v9, v0, v10, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    if-gt p4, v4, :cond_a

    move v3, v5

    move v5, v6

    goto :goto_4

    :cond_9
    move v5, v6

    move v6, v9

    :cond_a
    add-int/lit8 v9, v5, -0x1

    add-int/lit8 v10, v7, -0x1

    .line 741
    aget-object v7, v0, v7

    aput-object v7, v0, v5

    add-int/lit8 v8, v8, -0x1

    if-nez v8, :cond_e

    move v5, v6

    move v3, v9

    move v7, v10

    :goto_4
    if-ge p3, v4, :cond_b

    const/4 p3, 0x1

    .line 748
    :cond_b
    iput p3, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->minGallop:I

    if-ne p4, v4, :cond_c

    sub-int/2addr v3, v8

    sub-int/2addr v7, v8

    add-int/2addr v7, v4

    add-int/lit8 p1, v3, 0x1

    .line 754
    invoke-static {v0, v7, v0, p1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 755
    aget-object p1, v1, v5

    aput-object p1, v0, v3

    goto :goto_5

    :cond_c
    if-eqz p4, :cond_d

    add-int/lit8 p1, p4, -0x1

    sub-int/2addr v3, p1

    .line 761
    invoke-static {v1, v2, v0, v3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_5
    return-void

    .line 757
    :cond_d
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Comparison method violates its general contract!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_e
    add-int/lit8 p3, p3, -0x1

    const/4 v5, 0x7

    if-lt p2, v5, :cond_f

    const/4 p2, 0x1

    goto :goto_6

    :cond_f
    const/4 p2, 0x0

    :goto_6
    if-lt v3, v5, :cond_10

    const/4 v3, 0x1

    goto :goto_7

    :cond_10
    const/4 v3, 0x0

    :goto_7
    or-int/2addr p2, v3

    if-nez p2, :cond_12

    if-gez p3, :cond_11

    const/4 p3, 0x0

    :cond_11
    add-int/lit8 p3, p3, 0x2

    move v5, v6

    move p2, v8

    move v6, v9

    move v7, v10

    goto/16 :goto_0

    :cond_12
    move v5, v6

    move v6, v9

    move v7, v10

    goto/16 :goto_3
.end method

.method private mergeLo(IIII)V
    .locals 11

    .line 566
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->a:[Ljava/lang/Object;

    .line 567
    invoke-direct {p0, p2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->ensureCapacity(I)[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    .line 568
    invoke-static {v0, p1, v1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v3, p1, 0x1

    add-int/lit8 v4, p3, 0x1

    .line 575
    aget-object p3, v0, p3

    aput-object p3, v0, p1

    add-int/lit8 p4, p4, -0x1

    if-nez p4, :cond_0

    .line 577
    invoke-static {v1, v2, v0, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    :cond_0
    const/4 p1, 0x1

    if-ne p2, p1, :cond_1

    .line 581
    invoke-static {v0, v4, v0, v3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v3, p4

    .line 582
    aget-object p1, v1, v2

    aput-object p1, v0, v3

    return-void

    .line 586
    :cond_1
    iget p3, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->minGallop:I

    move v5, p2

    const/4 p2, 0x0

    :goto_0
    move v7, p4

    const/4 p4, 0x0

    const/4 v6, 0x0

    .line 597
    :cond_2
    aget-object v8, v0, v4

    check-cast v8, Ljava/lang/Comparable;

    aget-object v9, v1, p2

    invoke-interface {v8, v9}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result v8

    if-gez v8, :cond_4

    add-int/lit8 p4, v3, 0x1

    add-int/lit8 v8, v4, 0x1

    .line 598
    aget-object v4, v0, v4

    aput-object v4, v0, v3

    add-int/2addr v6, p1

    add-int/lit8 v7, v7, -0x1

    if-nez v7, :cond_3

    move v6, p4

    :goto_1
    move v4, v8

    goto/16 :goto_4

    :cond_3
    move v3, p4

    move v4, v8

    const/4 p4, 0x0

    goto :goto_2

    :cond_4
    add-int/lit8 v6, v3, 0x1

    add-int/lit8 v8, p2, 0x1

    .line 603
    aget-object p2, v1, p2

    aput-object p2, v0, v3

    add-int/2addr p4, p1

    add-int/lit8 v5, v5, -0x1

    if-ne v5, p1, :cond_5

    move p2, v8

    goto :goto_4

    :cond_5
    move v3, v6

    move p2, v8

    const/4 v6, 0x0

    :goto_2
    or-int v8, p4, v6

    if-lt v8, p3, :cond_2

    .line 616
    :goto_3
    aget-object p4, v0, v4

    check-cast p4, Ljava/lang/Comparable;

    invoke-static {p4, v1, p2, v5, v2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->gallopRight(Ljava/lang/Comparable;[Ljava/lang/Object;III)I

    move-result p4

    if-eqz p4, :cond_6

    .line 618
    invoke-static {v1, p2, v0, v3, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v3, p4

    add-int/2addr p2, p4

    sub-int/2addr v5, p4

    if-gt v5, p1, :cond_6

    move v6, v3

    goto :goto_4

    :cond_6
    add-int/lit8 v6, v3, 0x1

    add-int/lit8 v8, v4, 0x1

    .line 625
    aget-object v4, v0, v4

    aput-object v4, v0, v3

    add-int/lit8 v7, v7, -0x1

    if-nez v7, :cond_7

    goto :goto_1

    .line 628
    :cond_7
    aget-object v3, v1, p2

    check-cast v3, Ljava/lang/Comparable;

    invoke-static {v3, v0, v8, v7, v2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->gallopLeft(Ljava/lang/Comparable;[Ljava/lang/Object;III)I

    move-result v3

    if-eqz v3, :cond_8

    .line 630
    invoke-static {v0, v8, v0, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int v4, v6, v3

    add-int v6, v8, v3

    sub-int/2addr v7, v3

    if-nez v7, :cond_9

    move v10, v6

    move v6, v4

    move v4, v10

    goto :goto_4

    :cond_8
    move v4, v6

    move v6, v8

    :cond_9
    add-int/lit8 v8, v4, 0x1

    add-int/lit8 v9, p2, 0x1

    .line 636
    aget-object p2, v1, p2

    aput-object p2, v0, v4

    add-int/lit8 v5, v5, -0x1

    if-ne v5, p1, :cond_d

    move v4, v6

    move v6, v8

    move p2, v9

    :goto_4
    if-ge p3, p1, :cond_a

    const/4 p3, 0x1

    .line 643
    :cond_a
    iput p3, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->minGallop:I

    if-ne v5, p1, :cond_b

    .line 647
    invoke-static {v0, v4, v0, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v6, v7

    .line 648
    aget-object p1, v1, p2

    aput-object p1, v0, v6

    goto :goto_5

    :cond_b
    if-eqz v5, :cond_c

    .line 654
    invoke-static {v1, p2, v0, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_5
    return-void

    .line 650
    :cond_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Comparison method violates its general contract!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_d
    add-int/lit8 p3, p3, -0x1

    const/4 p2, 0x7

    if-lt p4, p2, :cond_e

    const/4 p4, 0x1

    goto :goto_6

    :cond_e
    const/4 p4, 0x0

    :goto_6
    if-lt v3, p2, :cond_f

    const/4 p2, 0x1

    goto :goto_7

    :cond_f
    const/4 p2, 0x0

    :goto_7
    or-int/2addr p2, p4

    if-nez p2, :cond_11

    if-gez p3, :cond_10

    const/4 p3, 0x0

    :cond_10
    add-int/lit8 p3, p3, 0x2

    move v4, v6

    move p4, v7

    move v3, v8

    move p2, v9

    goto/16 :goto_0

    :cond_11
    move v4, v6

    move v3, v8

    move p2, v9

    goto/16 :goto_3
.end method

.method private static minRunLength(I)I
    .locals 2

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x20

    if-lt p0, v1, :cond_0

    and-int/lit8 v1, p0, 0x1

    or-int/2addr v0, v1

    shr-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    add-int/2addr p0, v0

    return p0
.end method

.method private pushRun(II)V
    .locals 2

    .line 333
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runBase:[I

    iget v1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    aput p1, v0, v1

    .line 334
    iget-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->runLen:[I

    aput p2, p1, v1

    add-int/lit8 v1, v1, 0x1

    .line 335
    iput v1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    return-void
.end method

.method private static rangeCheck(III)V
    .locals 2

    if-gt p1, p2, :cond_2

    if-ltz p1, :cond_1

    if-gt p2, p0, :cond_0

    return-void

    .line 803
    :cond_0
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p0, p2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw p0

    .line 802
    :cond_1
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw p0

    .line 801
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "fromIndex("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ") > toIndex("

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static reverseRange([Ljava/lang/Object;II)V
    .locals 3

    add-int/lit8 p2, p2, -0x1

    :goto_0
    if-ge p1, p2, :cond_0

    .line 299
    aget-object v0, p0, p1

    add-int/lit8 v1, p1, 0x1

    .line 300
    aget-object v2, p0, p2

    aput-object v2, p0, p1

    add-int/lit8 p1, p2, -0x1

    .line 301
    aput-object v0, p0, p2

    move p2, p1

    move p1, v1

    goto :goto_0

    :cond_0
    return-void
.end method

.method static sort([Ljava/lang/Object;)V
    .locals 2

    .line 155
    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->sort([Ljava/lang/Object;II)V

    return-void
.end method

.method static sort([Ljava/lang/Object;II)V
    .locals 6

    .line 159
    array-length v0, p0

    invoke-static {v0, p1, p2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->rangeCheck(III)V

    sub-int v0, p2, p1

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    const/16 v1, 0x20

    if-ge v0, v1, :cond_1

    .line 165
    invoke-static {p0, p1, p2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->countRunAndMakeAscending([Ljava/lang/Object;II)I

    move-result v0

    add-int/2addr v0, p1

    .line 166
    invoke-static {p0, p1, p2, v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->binarySort([Ljava/lang/Object;III)V

    return-void

    .line 172
    :cond_1
    new-instance v1, Lcom/badlogic/gdx/utils/ComparableTimSort;

    invoke-direct {v1, p0}, Lcom/badlogic/gdx/utils/ComparableTimSort;-><init>([Ljava/lang/Object;)V

    .line 173
    invoke-static {v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->minRunLength(I)I

    move-result v2

    .line 176
    :cond_2
    invoke-static {p0, p1, p2}, Lcom/badlogic/gdx/utils/ComparableTimSort;->countRunAndMakeAscending([Ljava/lang/Object;II)I

    move-result v3

    if-ge v3, v2, :cond_4

    if-gt v0, v2, :cond_3

    move v4, v0

    goto :goto_0

    :cond_3
    move v4, v2

    :goto_0
    add-int v5, p1, v4

    add-int/2addr v3, p1

    .line 181
    invoke-static {p0, p1, v5, v3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->binarySort([Ljava/lang/Object;III)V

    move v3, v4

    .line 186
    :cond_4
    invoke-direct {v1, p1, v3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->pushRun(II)V

    .line 187
    invoke-direct {v1}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeCollapse()V

    add-int/2addr p1, v3

    sub-int/2addr v0, v3

    if-nez v0, :cond_2

    .line 196
    invoke-direct {v1}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeForceCollapse()V

    return-void
.end method


# virtual methods
.method public doSort([Ljava/lang/Object;II)V
    .locals 6

    const/4 v0, 0x0

    .line 77
    iput v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->stackSize:I

    .line 78
    array-length v1, p1

    invoke-static {v1, p2, p3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->rangeCheck(III)V

    sub-int v1, p3, p2

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    return-void

    :cond_0
    const/16 v2, 0x20

    if-ge v1, v2, :cond_1

    .line 84
    invoke-static {p1, p2, p3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->countRunAndMakeAscending([Ljava/lang/Object;II)I

    move-result v0

    add-int/2addr v0, p2

    .line 85
    invoke-static {p1, p2, p3, v0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->binarySort([Ljava/lang/Object;III)V

    return-void

    .line 89
    :cond_1
    iput-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->a:[Ljava/lang/Object;

    .line 90
    iput v0, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmpCount:I

    .line 94
    invoke-static {v1}, Lcom/badlogic/gdx/utils/ComparableTimSort;->minRunLength(I)I

    move-result v2

    .line 97
    :cond_2
    invoke-static {p1, p2, p3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->countRunAndMakeAscending([Ljava/lang/Object;II)I

    move-result v3

    if-ge v3, v2, :cond_4

    if-gt v1, v2, :cond_3

    move v4, v1

    goto :goto_0

    :cond_3
    move v4, v2

    :goto_0
    add-int v5, p2, v4

    add-int/2addr v3, p2

    .line 102
    invoke-static {p1, p2, v5, v3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->binarySort([Ljava/lang/Object;III)V

    move v3, v4

    .line 107
    :cond_4
    invoke-direct {p0, p2, v3}, Lcom/badlogic/gdx/utils/ComparableTimSort;->pushRun(II)V

    .line 108
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeCollapse()V

    add-int/2addr p2, v3

    sub-int/2addr v1, v3

    if-nez v1, :cond_2

    .line 117
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/ComparableTimSort;->mergeForceCollapse()V

    const/4 p1, 0x0

    .line 120
    iput-object p1, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->a:[Ljava/lang/Object;

    .line 121
    iget-object p2, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmp:[Ljava/lang/Object;

    .line 122
    iget p3, p0, Lcom/badlogic/gdx/utils/ComparableTimSort;->tmpCount:I

    :goto_1
    if-ge v0, p3, :cond_5

    .line 123
    aput-object p1, p2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_5
    return-void
.end method
