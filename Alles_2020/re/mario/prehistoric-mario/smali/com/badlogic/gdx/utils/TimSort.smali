.class Lcom/badlogic/gdx/utils/TimSort;
.super Ljava/lang/Object;
.source "TimSort.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final INITIAL_TMP_STORAGE_LENGTH:I = 0x100

.field private static final MIN_GALLOP:I = 0x7

.field private static final MIN_MERGE:I = 0x20


# instance fields
.field private a:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private c:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "-TT;>;"
        }
    .end annotation
.end field

.field private minGallop:I

.field private final runBase:[I

.field private final runLen:[I

.field private stackSize:I

.field private tmp:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private tmpCount:I


# direct methods
.method constructor <init>()V
    .locals 2

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x7

    .line 64
    iput v0, p0, Lcom/badlogic/gdx/utils/TimSort;->minGallop:I

    const/4 v0, 0x0

    .line 82
    iput v0, p0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    const/16 v0, 0x100

    .line 91
    new-array v0, v0, [Ljava/lang/Object;

    check-cast v0, [Ljava/lang/Object;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/TimSort;->tmp:[Ljava/lang/Object;

    const/16 v0, 0x28

    .line 92
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/utils/TimSort;->runBase:[I

    .line 93
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    return-void
.end method

.method private constructor <init>([Ljava/lang/Object;Ljava/util/Comparator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x7

    .line 64
    iput v0, p0, Lcom/badlogic/gdx/utils/TimSort;->minGallop:I

    const/4 v0, 0x0

    .line 82
    iput v0, p0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    .line 153
    iput-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->a:[Ljava/lang/Object;

    .line 154
    iput-object p2, p0, Lcom/badlogic/gdx/utils/TimSort;->c:Ljava/util/Comparator;

    .line 157
    array-length p1, p1

    const/16 p2, 0x200

    if-ge p1, p2, :cond_0

    ushr-int/lit8 p2, p1, 0x1

    goto :goto_0

    :cond_0
    const/16 p2, 0x100

    .line 158
    :goto_0
    new-array p2, p2, [Ljava/lang/Object;

    check-cast p2, [Ljava/lang/Object;

    .line 159
    iput-object p2, p0, Lcom/badlogic/gdx/utils/TimSort;->tmp:[Ljava/lang/Object;

    const/16 p2, 0x78

    if-ge p1, p2, :cond_1

    const/4 p1, 0x5

    goto :goto_1

    :cond_1
    const/16 p2, 0x606

    if-ge p1, p2, :cond_2

    const/16 p1, 0xa

    goto :goto_1

    :cond_2
    const p2, 0x1d16f

    if-ge p1, p2, :cond_3

    const/16 p1, 0x13

    goto :goto_1

    :cond_3
    const/16 p1, 0x28

    .line 169
    :goto_1
    new-array p2, p1, [I

    iput-object p2, p0, Lcom/badlogic/gdx/utils/TimSort;->runBase:[I

    .line 170
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    return-void
.end method

.method private static binarySort([Ljava/lang/Object;IIILjava/util/Comparator;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;III",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    if-ne p3, p1, :cond_0

    :goto_0
    add-int/lit8 p3, p3, 0x1

    :cond_0
    if-ge p3, p2, :cond_5

    .line 245
    aget-object v0, p0, p3

    move v1, p1

    move v2, p3

    :goto_1
    const/4 v3, 0x1

    if-ge v1, v2, :cond_2

    add-int v4, v1, v2

    ushr-int/lit8 v3, v4, 0x1

    .line 256
    aget-object v4, p0, v3

    invoke-interface {p4, v0, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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

    .line 277
    invoke-static {p0, v1, p0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_2

    :cond_3
    add-int/lit8 v2, v1, 0x2

    add-int/lit8 v3, v1, 0x1

    .line 272
    aget-object v3, p0, v3

    aput-object v3, p0, v2

    :cond_4
    add-int/lit8 v2, v1, 0x1

    .line 274
    aget-object v3, p0, v1

    aput-object v3, p0, v2

    .line 279
    :goto_2
    aput-object v0, p0, v1

    goto :goto_0

    :cond_5
    return-void
.end method

.method private static countRunAndMakeAscending([Ljava/lang/Object;IILjava/util/Comparator;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II",
            "Ljava/util/Comparator<",
            "-TT;>;)I"
        }
    .end annotation

    add-int/lit8 v0, p1, 0x1

    if-ne v0, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v0, 0x1

    .line 308
    aget-object v0, p0, v0

    aget-object v2, p0, p1

    invoke-interface {p3, v0, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_2

    :goto_0
    if-ge v1, p2, :cond_1

    .line 309
    aget-object v0, p0, v1

    add-int/lit8 v2, v1, -0x1

    aget-object v2, p0, v2

    invoke-interface {p3, v0, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    if-gez v0, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 311
    :cond_1
    invoke-static {p0, p1, v1}, Lcom/badlogic/gdx/utils/TimSort;->reverseRange([Ljava/lang/Object;II)V

    goto :goto_2

    :cond_2
    :goto_1
    if-ge v1, p2, :cond_3

    .line 313
    aget-object v0, p0, v1

    add-int/lit8 v2, v1, -0x1

    aget-object v2, p0, v2

    invoke-interface {p3, v0, v2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)[TT;"
        }
    .end annotation

    .line 805
    iget v0, p0, Lcom/badlogic/gdx/utils/TimSort;->tmpCount:I

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/utils/TimSort;->tmpCount:I

    .line 806
    iget-object v0, p0, Lcom/badlogic/gdx/utils/TimSort;->tmp:[Ljava/lang/Object;

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

    .line 819
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->a:[Ljava/lang/Object;

    array-length p1, p1

    ushr-int/lit8 p1, p1, 0x1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 821
    :goto_0
    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    .line 822
    iput-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->tmp:[Ljava/lang/Object;

    .line 824
    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->tmp:[Ljava/lang/Object;

    return-object p1
.end method

.method private static gallopLeft(Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;[TT;III",
            "Ljava/util/Comparator<",
            "-TT;>;)I"
        }
    .end annotation

    add-int v0, p2, p4

    .line 469
    aget-object v1, p1, v0

    invoke-interface {p5, p0, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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

    .line 472
    aget-object v4, p1, v4

    invoke-interface {p5, p0, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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

    .line 486
    aget-object v4, p1, v4

    invoke-interface {p5, p0, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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

    .line 509
    aget-object v1, p1, v1

    invoke-interface {p5, p0, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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

.method private static gallopRight(Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;[TT;III",
            "Ljava/util/Comparator<",
            "-TT;>;)I"
        }
    .end annotation

    add-int v0, p2, p4

    .line 534
    aget-object v1, p1, v0

    invoke-interface {p5, p0, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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

    .line 537
    aget-object v4, p1, v4

    invoke-interface {p5, p0, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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

    .line 552
    aget-object v4, p1, v4

    invoke-interface {p5, p0, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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

    .line 574
    aget-object v1, p1, v1

    invoke-interface {p5, p0, v1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

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
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 409
    iget-object v2, v0, Lcom/badlogic/gdx/utils/TimSort;->runBase:[I

    aget v9, v2, v1

    .line 410
    iget-object v3, v0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    aget v10, v3, v1

    add-int/lit8 v4, v1, 0x1

    .line 411
    aget v15, v2, v4

    .line 412
    aget v14, v3, v4

    add-int v5, v10, v14

    .line 420
    aput v5, v3, v1

    .line 421
    iget v5, v0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    add-int/lit8 v5, v5, -0x3

    if-ne v1, v5, :cond_0

    add-int/lit8 v1, v1, 0x2

    .line 422
    aget v5, v2, v1

    aput v5, v2, v4

    .line 423
    aget v1, v3, v1

    aput v1, v3, v4

    .line 425
    :cond_0
    iget v1, v0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    .line 431
    iget-object v4, v0, Lcom/badlogic/gdx/utils/TimSort;->a:[Ljava/lang/Object;

    aget-object v3, v4, v15

    const/4 v7, 0x0

    iget-object v8, v0, Lcom/badlogic/gdx/utils/TimSort;->c:Ljava/util/Comparator;

    move v5, v9

    move v6, v10

    invoke-static/range {v3 .. v8}, Lcom/badlogic/gdx/utils/TimSort;->gallopRight(Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I

    move-result v1

    add-int/2addr v9, v1

    sub-int/2addr v10, v1

    if-nez v10, :cond_1

    return-void

    .line 441
    :cond_1
    iget-object v12, v0, Lcom/badlogic/gdx/utils/TimSort;->a:[Ljava/lang/Object;

    add-int v1, v9, v10

    add-int/lit8 v1, v1, -0x1

    aget-object v11, v12, v1

    add-int/lit8 v1, v14, -0x1

    iget-object v2, v0, Lcom/badlogic/gdx/utils/TimSort;->c:Ljava/util/Comparator;

    move v13, v15

    move v3, v15

    move v15, v1

    move-object/from16 v16, v2

    invoke-static/range {v11 .. v16}, Lcom/badlogic/gdx/utils/TimSort;->gallopLeft(Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I

    move-result v1

    if-nez v1, :cond_2

    return-void

    :cond_2
    if-gt v10, v1, :cond_3

    .line 447
    invoke-direct {v0, v9, v10, v3, v1}, Lcom/badlogic/gdx/utils/TimSort;->mergeLo(IIII)V

    goto :goto_0

    .line 449
    :cond_3
    invoke-direct {v0, v9, v10, v3, v1}, Lcom/badlogic/gdx/utils/TimSort;->mergeHi(IIII)V

    :goto_0
    return-void
.end method

.method private mergeCollapse()V
    .locals 5

    .line 380
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_4

    add-int/lit8 v0, v0, -0x2

    if-lt v0, v1, :cond_0

    .line 382
    iget-object v1, p0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    add-int/lit8 v2, v0, -0x1

    aget v2, v1, v2

    aget v3, v1, v0

    add-int/lit8 v4, v0, 0x1

    aget v1, v1, v4

    add-int/2addr v3, v1

    if-le v2, v3, :cond_1

    :cond_0
    const/4 v1, 0x2

    if-lt v0, v1, :cond_2

    iget-object v1, p0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    add-int/lit8 v2, v0, -0x2

    aget v2, v1, v2

    aget v3, v1, v0

    add-int/lit8 v4, v0, -0x1

    aget v1, v1, v4

    add-int/2addr v3, v1

    if-gt v2, v3, :cond_2

    .line 383
    :cond_1
    iget-object v1, p0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    add-int/lit8 v2, v0, -0x1

    aget v2, v1, v2

    add-int/lit8 v3, v0, 0x1

    aget v1, v1, v3

    if-ge v2, v1, :cond_3

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 384
    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    aget v2, v1, v0

    add-int/lit8 v3, v0, 0x1

    aget v1, v1, v3

    if-le v2, v1, :cond_3

    goto :goto_2

    .line 387
    :cond_3
    :goto_1
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/TimSort;->mergeAt(I)V

    goto :goto_0

    :cond_4
    :goto_2
    return-void
.end method

.method private mergeForceCollapse()V
    .locals 4

    .line 393
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    add-int/lit8 v0, v0, -0x2

    if-lez v0, :cond_0

    .line 395
    iget-object v1, p0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    add-int/lit8 v2, v0, -0x1

    aget v2, v1, v2

    add-int/lit8 v3, v0, 0x1

    aget v1, v1, v3

    if-ge v2, v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 396
    :cond_0
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/TimSort;->mergeAt(I)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private mergeHi(IIII)V
    .locals 20

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    .line 702
    iget-object v7, v0, Lcom/badlogic/gdx/utils/TimSort;->a:[Ljava/lang/Object;

    .line 703
    invoke-direct {v0, v2}, Lcom/badlogic/gdx/utils/TimSort;->ensureCapacity(I)[Ljava/lang/Object;

    move-result-object v8

    const/4 v9, 0x0

    .line 704
    invoke-static {v7, v1, v8, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int v3, p1, p2

    const/4 v10, 0x1

    sub-int/2addr v3, v10

    add-int/lit8 v4, v2, -0x1

    add-int/2addr v1, v2

    sub-int/2addr v1, v10

    add-int/lit8 v5, v1, -0x1

    add-int/lit8 v6, v3, -0x1

    .line 711
    aget-object v3, v7, v3

    aput-object v3, v7, v1

    add-int/lit8 v1, p2, -0x1

    if-nez v1, :cond_0

    sub-int/2addr v5, v4

    .line 713
    invoke-static {v8, v9, v7, v5, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    :cond_0
    if-ne v2, v10, :cond_1

    sub-int/2addr v5, v1

    sub-int/2addr v6, v1

    add-int/2addr v6, v10

    add-int/lit8 v2, v5, 0x1

    .line 719
    invoke-static {v7, v6, v7, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 720
    aget-object v1, v8, v4

    aput-object v1, v7, v5

    return-void

    .line 724
    :cond_1
    iget-object v11, v0, Lcom/badlogic/gdx/utils/TimSort;->c:Ljava/util/Comparator;

    .line 725
    iget v3, v0, Lcom/badlogic/gdx/utils/TimSort;->minGallop:I

    :goto_0
    move v13, v1

    const/4 v1, 0x0

    const/4 v12, 0x0

    .line 736
    :cond_2
    aget-object v14, v8, v4

    aget-object v15, v7, v6

    invoke-interface {v11, v14, v15}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v14

    if-gez v14, :cond_4

    add-int/lit8 v1, v5, -0x1

    add-int/lit8 v14, v6, -0x1

    .line 737
    aget-object v6, v7, v6

    aput-object v6, v7, v5

    add-int/2addr v12, v10

    add-int/lit8 v13, v13, -0x1

    if-nez v13, :cond_3

    move v12, v4

    move v15, v14

    goto/16 :goto_6

    :cond_3
    move v5, v1

    move v6, v14

    const/4 v1, 0x0

    goto :goto_1

    :cond_4
    add-int/lit8 v12, v5, -0x1

    add-int/lit8 v14, v4, -0x1

    .line 742
    aget-object v4, v8, v4

    aput-object v4, v7, v5

    add-int/2addr v1, v10

    add-int/lit8 v2, v2, -0x1

    if-ne v2, v10, :cond_5

    move v15, v6

    move v1, v12

    move v12, v14

    goto/16 :goto_6

    :cond_5
    move v5, v12

    move v4, v14

    const/4 v12, 0x0

    :goto_1
    or-int v14, v12, v1

    if-lt v14, v3, :cond_2

    move/from16 v16, v2

    move/from16 v17, v3

    move v12, v4

    move v14, v5

    move v15, v6

    .line 755
    :goto_2
    aget-object v1, v8, v12

    add-int/lit8 v5, v13, -0x1

    move-object v2, v7

    move/from16 v3, p1

    move v4, v13

    move-object v6, v11

    invoke-static/range {v1 .. v6}, Lcom/badlogic/gdx/utils/TimSort;->gallopRight(Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I

    move-result v1

    sub-int v6, v13, v1

    if-eqz v6, :cond_7

    sub-int v1, v14, v6

    sub-int v2, v15, v6

    sub-int/2addr v13, v6

    add-int/lit8 v3, v2, 0x1

    add-int/lit8 v4, v1, 0x1

    .line 760
    invoke-static {v7, v3, v7, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    if-nez v13, :cond_6

    move v15, v2

    :goto_3
    move/from16 v2, v16

    :goto_4
    move/from16 v3, v17

    goto/16 :goto_6

    :cond_6
    move v14, v1

    move v15, v2

    :cond_7
    add-int/lit8 v18, v14, -0x1

    add-int/lit8 v19, v12, -0x1

    .line 763
    aget-object v1, v8, v12

    aput-object v1, v7, v14

    add-int/lit8 v12, v16, -0x1

    if-ne v12, v10, :cond_8

    move v2, v12

    move/from16 v3, v17

    move/from16 v1, v18

    move/from16 v12, v19

    goto :goto_6

    .line 766
    :cond_8
    aget-object v1, v7, v15

    const/4 v3, 0x0

    add-int/lit8 v5, v12, -0x1

    move-object v2, v8

    move v4, v12

    move v14, v6

    move-object v6, v11

    invoke-static/range {v1 .. v6}, Lcom/badlogic/gdx/utils/TimSort;->gallopLeft(Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I

    move-result v1

    sub-int v1, v12, v1

    if-eqz v1, :cond_a

    sub-int v2, v18, v1

    sub-int v4, v19, v1

    sub-int v3, v12, v1

    add-int/lit8 v5, v4, 0x1

    add-int/lit8 v6, v2, 0x1

    .line 771
    invoke-static {v8, v5, v7, v6, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    if-gt v3, v10, :cond_9

    move v1, v2

    move v2, v3

    move v12, v4

    goto :goto_4

    :cond_9
    move/from16 v18, v2

    move/from16 v16, v3

    move v12, v4

    goto :goto_5

    :cond_a
    move/from16 v16, v12

    move/from16 v12, v19

    :goto_5
    add-int/lit8 v2, v18, -0x1

    add-int/lit8 v3, v15, -0x1

    .line 775
    aget-object v4, v7, v15

    aput-object v4, v7, v18

    add-int/lit8 v13, v13, -0x1

    if-nez v13, :cond_e

    move v1, v2

    move v15, v3

    goto :goto_3

    :goto_6
    if-ge v3, v10, :cond_b

    const/4 v3, 0x1

    .line 782
    :cond_b
    iput v3, v0, Lcom/badlogic/gdx/utils/TimSort;->minGallop:I

    if-ne v2, v10, :cond_c

    sub-int/2addr v1, v13

    sub-int/2addr v15, v13

    add-int/2addr v15, v10

    add-int/lit8 v2, v1, 0x1

    .line 788
    invoke-static {v7, v15, v7, v2, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 789
    aget-object v2, v8, v12

    aput-object v2, v7, v1

    goto :goto_7

    :cond_c
    if-eqz v2, :cond_d

    add-int/lit8 v3, v2, -0x1

    sub-int/2addr v1, v3

    .line 795
    invoke-static {v8, v9, v7, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_7
    return-void

    .line 791
    :cond_d
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Comparison method violates its general contract!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_e
    add-int/lit8 v17, v17, -0x1

    const/4 v4, 0x7

    if-lt v14, v4, :cond_f

    const/4 v5, 0x1

    goto :goto_8

    :cond_f
    const/4 v5, 0x0

    :goto_8
    if-lt v1, v4, :cond_10

    const/4 v1, 0x1

    goto :goto_9

    :cond_10
    const/4 v1, 0x0

    :goto_9
    or-int/2addr v1, v5

    if-nez v1, :cond_12

    if-gez v17, :cond_11

    const/16 v17, 0x0

    :cond_11
    add-int/lit8 v1, v17, 0x2

    move v5, v2

    move v6, v3

    move v4, v12

    move/from16 v2, v16

    move v3, v1

    move v1, v13

    goto/16 :goto_0

    :cond_12
    move v14, v2

    move v15, v3

    goto/16 :goto_2
.end method

.method private mergeLo(IIII)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    .line 598
    iget-object v7, v0, Lcom/badlogic/gdx/utils/TimSort;->a:[Ljava/lang/Object;

    .line 599
    invoke-direct {v0, v2}, Lcom/badlogic/gdx/utils/TimSort;->ensureCapacity(I)[Ljava/lang/Object;

    move-result-object v8

    const/4 v9, 0x0

    .line 600
    invoke-static {v7, v1, v8, v9, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v3, v1, 0x1

    add-int/lit8 v4, p3, 0x1

    .line 607
    aget-object v5, v7, p3

    aput-object v5, v7, v1

    add-int/lit8 v1, p4, -0x1

    if-nez v1, :cond_0

    .line 609
    invoke-static {v8, v9, v7, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void

    :cond_0
    const/4 v10, 0x1

    if-ne v2, v10, :cond_1

    .line 613
    invoke-static {v7, v4, v7, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v3, v1

    .line 614
    aget-object v1, v8, v9

    aput-object v1, v7, v3

    return-void

    .line 618
    :cond_1
    iget-object v11, v0, Lcom/badlogic/gdx/utils/TimSort;->c:Ljava/util/Comparator;

    .line 619
    iget v5, v0, Lcom/badlogic/gdx/utils/TimSort;->minGallop:I

    move v6, v5

    move v5, v3

    const/4 v3, 0x0

    :goto_0
    move v13, v1

    const/4 v1, 0x0

    const/4 v12, 0x0

    .line 630
    :goto_1
    aget-object v14, v7, v4

    aget-object v15, v8, v3

    invoke-interface {v11, v14, v15}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v14

    if-gez v14, :cond_3

    add-int/lit8 v1, v5, 0x1

    add-int/lit8 v14, v4, 0x1

    .line 631
    aget-object v4, v7, v4

    aput-object v4, v7, v5

    add-int/2addr v12, v10

    add-int/lit8 v13, v13, -0x1

    if-nez v13, :cond_2

    move v10, v6

    move v12, v13

    move v4, v14

    const/4 v9, 0x1

    move v14, v2

    move v13, v3

    goto/16 :goto_6

    :cond_2
    move v5, v1

    move v4, v14

    const/4 v1, 0x0

    goto :goto_2

    :cond_3
    add-int/lit8 v12, v5, 0x1

    add-int/lit8 v14, v3, 0x1

    .line 636
    aget-object v3, v8, v3

    aput-object v3, v7, v5

    add-int/2addr v1, v10

    add-int/lit8 v2, v2, -0x1

    if-ne v2, v10, :cond_4

    move v10, v6

    move v1, v12

    move v12, v13

    move v13, v14

    const/4 v9, 0x1

    move v14, v2

    goto/16 :goto_6

    :cond_4
    move v5, v12

    move v3, v14

    const/4 v12, 0x0

    :goto_2
    or-int v14, v1, v12

    if-lt v14, v6, :cond_12

    move v14, v2

    move v12, v4

    move v15, v5

    move/from16 v17, v6

    move/from16 v16, v13

    move v13, v3

    .line 649
    :goto_3
    aget-object v1, v7, v12

    const/4 v5, 0x0

    move-object v2, v8

    move v3, v13

    move v4, v14

    move-object v6, v11

    invoke-static/range {v1 .. v6}, Lcom/badlogic/gdx/utils/TimSort;->gallopRight(Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I

    move-result v6

    if-eqz v6, :cond_6

    .line 651
    invoke-static {v8, v13, v7, v15, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int v1, v15, v6

    add-int v3, v13, v6

    sub-int v2, v14, v6

    if-gt v2, v10, :cond_5

    move v14, v2

    move v13, v3

    move v4, v12

    move/from16 v12, v16

    goto :goto_4

    :cond_5
    move v15, v1

    move v14, v2

    move v13, v3

    :cond_6
    add-int/lit8 v5, v15, 0x1

    add-int/lit8 v4, v12, 0x1

    .line 658
    aget-object v1, v7, v12

    aput-object v1, v7, v15

    add-int/lit8 v12, v16, -0x1

    if-nez v12, :cond_7

    move v1, v5

    :goto_4
    move/from16 v10, v17

    const/4 v9, 0x1

    goto :goto_6

    .line 661
    :cond_7
    aget-object v1, v8, v13

    const/4 v15, 0x0

    move-object v2, v7

    move v3, v4

    move v9, v4

    move v4, v12

    move v10, v5

    move v5, v15

    move v15, v6

    move-object v6, v11

    invoke-static/range {v1 .. v6}, Lcom/badlogic/gdx/utils/TimSort;->gallopLeft(Ljava/lang/Object;[Ljava/lang/Object;IIILjava/util/Comparator;)I

    move-result v1

    if-eqz v1, :cond_9

    .line 663
    invoke-static {v7, v9, v7, v10, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int v2, v10, v1

    add-int v4, v9, v1

    sub-int v3, v12, v1

    if-nez v3, :cond_8

    move v1, v2

    move v12, v3

    goto :goto_4

    :cond_8
    move v12, v3

    goto :goto_5

    :cond_9
    move v4, v9

    move v2, v10

    :goto_5
    add-int/lit8 v3, v2, 0x1

    add-int/lit8 v5, v13, 0x1

    .line 669
    aget-object v6, v8, v13

    aput-object v6, v7, v2

    add-int/lit8 v14, v14, -0x1

    const/4 v9, 0x1

    if-ne v14, v9, :cond_d

    move v1, v3

    move v13, v5

    move/from16 v10, v17

    :goto_6
    if-ge v10, v9, :cond_a

    const/4 v10, 0x1

    .line 676
    :cond_a
    iput v10, v0, Lcom/badlogic/gdx/utils/TimSort;->minGallop:I

    if-ne v14, v9, :cond_b

    .line 680
    invoke-static {v7, v4, v7, v1, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v1, v12

    .line 681
    aget-object v2, v8, v13

    aput-object v2, v7, v1

    goto :goto_7

    :cond_b
    if-eqz v14, :cond_c

    .line 687
    invoke-static {v8, v13, v7, v1, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :goto_7
    return-void

    .line 683
    :cond_c
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Comparison method violates its general contract!"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_d
    add-int/lit8 v17, v17, -0x1

    const/4 v2, 0x7

    if-lt v15, v2, :cond_e

    const/4 v6, 0x1

    goto :goto_8

    :cond_e
    const/4 v6, 0x0

    :goto_8
    if-lt v1, v2, :cond_f

    const/4 v1, 0x1

    goto :goto_9

    :cond_f
    const/4 v1, 0x0

    :goto_9
    or-int/2addr v1, v6

    if-nez v1, :cond_11

    if-gez v17, :cond_10

    const/16 v17, 0x0

    :cond_10
    add-int/lit8 v6, v17, 0x2

    move v1, v12

    move v2, v14

    const/4 v9, 0x0

    const/4 v10, 0x1

    move/from16 v18, v5

    move v5, v3

    move/from16 v3, v18

    goto/16 :goto_0

    :cond_11
    move v15, v3

    move v13, v5

    move/from16 v16, v12

    const/4 v9, 0x0

    const/4 v10, 0x1

    move v12, v4

    goto/16 :goto_3

    :cond_12
    const/4 v9, 0x0

    goto/16 :goto_1
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

    .line 362
    iget-object v0, p0, Lcom/badlogic/gdx/utils/TimSort;->runBase:[I

    iget v1, p0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    aput p1, v0, v1

    .line 363
    iget-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->runLen:[I

    aput p2, p1, v1

    add-int/lit8 v1, v1, 0x1

    .line 364
    iput v1, p0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    return-void
.end method

.method private static rangeCheck(III)V
    .locals 2

    if-gt p1, p2, :cond_2

    if-ltz p1, :cond_1

    if-gt p2, p0, :cond_0

    return-void

    .line 837
    :cond_0
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p0, p2}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw p0

    .line 836
    :cond_1
    new-instance p0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw p0

    .line 835
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

    .line 328
    aget-object v0, p0, p1

    add-int/lit8 v1, p1, 0x1

    .line 329
    aget-object v2, p0, p2

    aput-object v2, p0, p1

    add-int/lit8 p1, p2, -0x1

    .line 330
    aput-object v0, p0, p2

    move p2, p1

    move p1, v1

    goto :goto_0

    :cond_0
    return-void
.end method

.method static sort([Ljava/lang/Object;IILjava/util/Comparator;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;II",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    if-nez p3, :cond_0

    .line 184
    invoke-static {p0, p1, p2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;II)V

    return-void

    .line 188
    :cond_0
    array-length v0, p0

    invoke-static {v0, p1, p2}, Lcom/badlogic/gdx/utils/TimSort;->rangeCheck(III)V

    sub-int v0, p2, p1

    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    return-void

    :cond_1
    const/16 v1, 0x20

    if-ge v0, v1, :cond_2

    .line 194
    invoke-static {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/TimSort;->countRunAndMakeAscending([Ljava/lang/Object;IILjava/util/Comparator;)I

    move-result v0

    add-int/2addr v0, p1

    .line 195
    invoke-static {p0, p1, p2, v0, p3}, Lcom/badlogic/gdx/utils/TimSort;->binarySort([Ljava/lang/Object;IIILjava/util/Comparator;)V

    return-void

    .line 201
    :cond_2
    new-instance v1, Lcom/badlogic/gdx/utils/TimSort;

    invoke-direct {v1, p0, p3}, Lcom/badlogic/gdx/utils/TimSort;-><init>([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 202
    invoke-static {v0}, Lcom/badlogic/gdx/utils/TimSort;->minRunLength(I)I

    move-result v2

    .line 205
    :cond_3
    invoke-static {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/TimSort;->countRunAndMakeAscending([Ljava/lang/Object;IILjava/util/Comparator;)I

    move-result v3

    if-ge v3, v2, :cond_5

    if-gt v0, v2, :cond_4

    move v4, v0

    goto :goto_0

    :cond_4
    move v4, v2

    :goto_0
    add-int v5, p1, v4

    add-int/2addr v3, p1

    .line 210
    invoke-static {p0, p1, v5, v3, p3}, Lcom/badlogic/gdx/utils/TimSort;->binarySort([Ljava/lang/Object;IIILjava/util/Comparator;)V

    move v3, v4

    .line 215
    :cond_5
    invoke-direct {v1, p1, v3}, Lcom/badlogic/gdx/utils/TimSort;->pushRun(II)V

    .line 216
    invoke-direct {v1}, Lcom/badlogic/gdx/utils/TimSort;->mergeCollapse()V

    add-int/2addr p1, v3

    sub-int/2addr v0, v3

    if-nez v0, :cond_3

    .line 225
    invoke-direct {v1}, Lcom/badlogic/gdx/utils/TimSort;->mergeForceCollapse()V

    return-void
.end method

.method static sort([Ljava/lang/Object;Ljava/util/Comparator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    .line 179
    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0, p1}, Lcom/badlogic/gdx/utils/TimSort;->sort([Ljava/lang/Object;IILjava/util/Comparator;)V

    return-void
.end method


# virtual methods
.method public doSort([Ljava/lang/Object;Ljava/util/Comparator;II)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;",
            "Ljava/util/Comparator<",
            "TT;>;II)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 97
    iput v0, p0, Lcom/badlogic/gdx/utils/TimSort;->stackSize:I

    .line 98
    array-length v1, p1

    invoke-static {v1, p3, p4}, Lcom/badlogic/gdx/utils/TimSort;->rangeCheck(III)V

    sub-int v1, p4, p3

    const/4 v2, 0x2

    if-ge v1, v2, :cond_0

    return-void

    :cond_0
    const/16 v2, 0x20

    if-ge v1, v2, :cond_1

    .line 104
    invoke-static {p1, p3, p4, p2}, Lcom/badlogic/gdx/utils/TimSort;->countRunAndMakeAscending([Ljava/lang/Object;IILjava/util/Comparator;)I

    move-result v0

    add-int/2addr v0, p3

    .line 105
    invoke-static {p1, p3, p4, v0, p2}, Lcom/badlogic/gdx/utils/TimSort;->binarySort([Ljava/lang/Object;IIILjava/util/Comparator;)V

    return-void

    .line 109
    :cond_1
    iput-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->a:[Ljava/lang/Object;

    .line 110
    iput-object p2, p0, Lcom/badlogic/gdx/utils/TimSort;->c:Ljava/util/Comparator;

    .line 111
    iput v0, p0, Lcom/badlogic/gdx/utils/TimSort;->tmpCount:I

    .line 115
    invoke-static {v1}, Lcom/badlogic/gdx/utils/TimSort;->minRunLength(I)I

    move-result v2

    .line 118
    :cond_2
    invoke-static {p1, p3, p4, p2}, Lcom/badlogic/gdx/utils/TimSort;->countRunAndMakeAscending([Ljava/lang/Object;IILjava/util/Comparator;)I

    move-result v3

    if-ge v3, v2, :cond_4

    if-gt v1, v2, :cond_3

    move v4, v1

    goto :goto_0

    :cond_3
    move v4, v2

    :goto_0
    add-int v5, p3, v4

    add-int/2addr v3, p3

    .line 123
    invoke-static {p1, p3, v5, v3, p2}, Lcom/badlogic/gdx/utils/TimSort;->binarySort([Ljava/lang/Object;IIILjava/util/Comparator;)V

    move v3, v4

    .line 128
    :cond_4
    invoke-direct {p0, p3, v3}, Lcom/badlogic/gdx/utils/TimSort;->pushRun(II)V

    .line 129
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/TimSort;->mergeCollapse()V

    add-int/2addr p3, v3

    sub-int/2addr v1, v3

    if-nez v1, :cond_2

    .line 138
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/TimSort;->mergeForceCollapse()V

    const/4 p1, 0x0

    .line 141
    iput-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->a:[Ljava/lang/Object;

    .line 142
    iput-object p1, p0, Lcom/badlogic/gdx/utils/TimSort;->c:Ljava/util/Comparator;

    .line 143
    iget-object p2, p0, Lcom/badlogic/gdx/utils/TimSort;->tmp:[Ljava/lang/Object;

    .line 144
    iget p3, p0, Lcom/badlogic/gdx/utils/TimSort;->tmpCount:I

    :goto_1
    if-ge v0, p3, :cond_5

    .line 145
    aput-object p1, p2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_5
    return-void
.end method
