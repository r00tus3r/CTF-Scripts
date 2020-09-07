.class public Lcom/badlogic/gdx/utils/Queue;
.super Ljava/lang/Object;
.source "Queue.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/Queue$QueueIterable;,
        Lcom/badlogic/gdx/utils/Queue$QueueIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected head:I

.field private iterable:Lcom/badlogic/gdx/utils/Queue$QueueIterable;

.field public size:I

.field protected tail:I

.field protected values:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x10

    .line 45
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/utils/Queue;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 36
    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    .line 39
    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    .line 51
    new-array p1, p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(ILjava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 32
    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 36
    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    .line 39
    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    .line 58
    invoke-static {p2, p1}, Lcom/badlogic/gdx/utils/reflect/ArrayReflection;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public addFirst(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 84
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    array-length v2, v0

    if-ne v1, v2, :cond_0

    .line 85
    array-length v0, v0

    shl-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/Queue;->resize(I)V

    .line 86
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 89
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    const/4 v2, -0x1

    add-int/2addr v1, v2

    if-ne v1, v2, :cond_1

    .line 92
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    .line 94
    :cond_1
    aput-object p1, v0, v1

    .line 96
    iput v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 97
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    return-void
.end method

.method public addLast(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 66
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    array-length v2, v0

    if-ne v1, v2, :cond_0

    .line 67
    array-length v0, v0

    shl-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/Queue;->resize(I)V

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 71
    :cond_0
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    aput-object p1, v0, v1

    .line 72
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    array-length v0, v0

    if-ne p1, v0, :cond_1

    const/4 p1, 0x0

    .line 73
    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    .line 75
    :cond_1
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    return-void
.end method

.method public clear()V
    .locals 6

    .line 307
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-nez v0, :cond_0

    return-void

    .line 308
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 309
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 310
    iget v2, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-ge v1, v2, :cond_1

    :goto_0
    if-ge v1, v2, :cond_3

    .line 315
    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 319
    :cond_1
    :goto_1
    array-length v5, v0

    if-ge v1, v5, :cond_2

    .line 320
    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_3

    .line 323
    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 326
    :cond_3
    iput v4, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 327
    iput v4, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    .line 328
    iput v4, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    return-void
.end method

.method public ensureCapacity(I)V
    .locals 1

    .line 103
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    add-int/2addr v0, p1

    .line 104
    iget-object p1, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    array-length p1, p1

    if-ge p1, v0, :cond_0

    .line 105
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/Queue;->resize(I)V

    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 11

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_9

    .line 381
    instance-of v2, p1, Lcom/badlogic/gdx/utils/Queue;

    if-nez v2, :cond_1

    goto :goto_2

    .line 383
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/Queue;

    .line 384
    iget v2, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    .line 386
    iget v3, p1, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-eq v3, v2, :cond_2

    return v1

    .line 388
    :cond_2
    iget-object v3, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 389
    array-length v4, v3

    .line 390
    iget-object v5, p1, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 391
    array-length v6, v5

    .line 393
    iget v7, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 394
    iget p1, p1, Lcom/badlogic/gdx/utils/Queue;->head:I

    move v8, p1

    const/4 p1, 0x0

    :goto_0
    if-ge p1, v2, :cond_8

    .line 396
    aget-object v9, v3, v7

    .line 397
    aget-object v10, v5, v8

    if-nez v9, :cond_3

    if-nez v10, :cond_4

    goto :goto_1

    .line 399
    :cond_3
    invoke-virtual {v9, v10}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_5

    :cond_4
    return v1

    :cond_5
    :goto_1
    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v8, v8, 0x1

    if-ne v7, v4, :cond_6

    const/4 v7, 0x0

    :cond_6
    if-ne v8, v6, :cond_7

    const/4 v8, 0x0

    :cond_7
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_8
    return v0

    :cond_9
    :goto_2
    return v1
.end method

.method public equalsIdentity(Ljava/lang/Object;)Z
    .locals 11

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_7

    .line 411
    instance-of v2, p1, Lcom/badlogic/gdx/utils/Queue;

    if-nez v2, :cond_1

    goto :goto_1

    .line 413
    :cond_1
    check-cast p1, Lcom/badlogic/gdx/utils/Queue;

    .line 414
    iget v2, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    .line 416
    iget v3, p1, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-eq v3, v2, :cond_2

    return v1

    .line 418
    :cond_2
    iget-object v3, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 419
    array-length v4, v3

    .line 420
    iget-object v5, p1, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 421
    array-length v6, v5

    .line 423
    iget v7, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 424
    iget p1, p1, Lcom/badlogic/gdx/utils/Queue;->head:I

    move v8, p1

    const/4 p1, 0x0

    :goto_0
    if-ge p1, v2, :cond_6

    .line 426
    aget-object v9, v3, v7

    aget-object v10, v5, v8

    if-eq v9, v10, :cond_3

    return v1

    :cond_3
    add-int/lit8 v7, v7, 0x1

    add-int/lit8 v8, v8, 0x1

    if-ne v7, v4, :cond_4

    const/4 v7, 0x0

    :cond_4
    if-ne v8, v6, :cond_5

    const/4 v8, 0x0

    :cond_5
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_6
    return v0

    :cond_7
    :goto_1
    return v1
.end method

.method public first()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 264
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-eqz v0, :cond_0

    .line 268
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    aget-object v0, v0, v1

    return-object v0

    .line 266
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Queue is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public get(I)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    if-ltz p1, :cond_2

    .line 294
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-ge p1, v0, :cond_1

    .line 295
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 297
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    add-int/2addr v1, p1

    .line 298
    array-length p1, v0

    if-lt v1, p1, :cond_0

    .line 299
    array-length p1, v0

    sub-int/2addr v1, p1

    .line 301
    :cond_0
    aget-object p1, v0, v1

    return-object p1

    .line 294
    :cond_1
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index can\'t be >= size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 293
    :cond_2
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index can\'t be < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 8

    .line 360
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    .line 361
    iget-object v1, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 362
    array-length v2, v1

    .line 363
    iget v3, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    add-int/lit8 v4, v0, 0x1

    const/4 v5, 0x0

    move v6, v3

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v0, :cond_2

    .line 367
    aget-object v7, v1, v6

    mul-int/lit8 v4, v4, 0x1f

    if-eqz v7, :cond_0

    .line 370
    invoke-virtual {v7}, Ljava/lang/Object;->hashCode()I

    move-result v7

    add-int/2addr v4, v7

    :cond_0
    add-int/lit8 v6, v6, 0x1

    if-ne v6, v2, :cond_1

    const/4 v6, 0x0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v4
.end method

.method public indexOf(Ljava/lang/Object;Z)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)I"
        }
    .end annotation

    .line 180
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 182
    iget v2, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    iget v3, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    const/4 v4, 0x0

    if-nez p2, :cond_7

    if-nez p1, :cond_1

    goto :goto_4

    :cond_1
    if-ge v2, v3, :cond_3

    move p2, v2

    :goto_0
    if-ge p2, v3, :cond_d

    .line 196
    aget-object v4, v0, p2

    invoke-virtual {p1, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    sub-int/2addr p2, v2

    return p2

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 198
    :cond_3
    array-length p2, v0

    move v5, v2

    :goto_1
    if-ge v5, p2, :cond_5

    .line 199
    aget-object v6, v0, v5

    invoke-virtual {p1, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    sub-int/2addr v5, v2

    return v5

    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_5
    :goto_2
    if-ge v4, v3, :cond_d

    .line 201
    aget-object p2, v0, v4

    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    array-length p1, v0

    :goto_3
    add-int/2addr v4, p1

    sub-int/2addr v4, v2

    return v4

    :cond_6
    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_7
    :goto_4
    if-ge v2, v3, :cond_9

    move p2, v2

    :goto_5
    if-ge p2, v3, :cond_d

    .line 186
    aget-object v4, v0, p2

    if-ne v4, p1, :cond_8

    sub-int/2addr p2, v2

    return p2

    :cond_8
    add-int/lit8 p2, p2, 0x1

    goto :goto_5

    .line 188
    :cond_9
    array-length p2, v0

    move v5, v2

    :goto_6
    if-ge v5, p2, :cond_b

    .line 189
    aget-object v6, v0, v5

    if-ne v6, p1, :cond_a

    sub-int/2addr v5, v2

    return v5

    :cond_a
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    :cond_b
    :goto_7
    if-ge v4, v3, :cond_d

    .line 191
    aget-object p2, v0, v4

    if-ne p2, p1, :cond_c

    array-length p1, v0

    goto :goto_3

    :cond_c
    add-int/lit8 v4, v4, 0x1

    goto :goto_7

    :cond_d
    return v1
.end method

.method public isEmpty()Z
    .locals 1

    .line 256
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 336
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/Queue$QueueIterator;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/badlogic/gdx/utils/Queue$QueueIterator;-><init>(Lcom/badlogic/gdx/utils/Queue;Z)V

    return-object v0

    .line 337
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->iterable:Lcom/badlogic/gdx/utils/Queue$QueueIterable;

    if-nez v0, :cond_1

    new-instance v0, Lcom/badlogic/gdx/utils/Queue$QueueIterable;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/Queue$QueueIterable;-><init>(Lcom/badlogic/gdx/utils/Queue;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->iterable:Lcom/badlogic/gdx/utils/Queue$QueueIterable;

    .line 338
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->iterable:Lcom/badlogic/gdx/utils/Queue$QueueIterable;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Queue$QueueIterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public last()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 276
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-eqz v0, :cond_1

    .line 280
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 281
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    const/4 v2, -0x1

    add-int/2addr v1, v2

    if-ne v1, v2, :cond_0

    .line 284
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    .line 286
    :cond_0
    aget-object v0, v0, v1

    return-object v0

    .line 278
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Queue is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 251
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public removeFirst()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 135
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-eqz v0, :cond_1

    .line 140
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 142
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    aget-object v2, v0, v1

    const/4 v3, 0x0

    .line 143
    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    .line 144
    iput v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 145
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    array-length v0, v0

    if-ne v1, v0, :cond_0

    const/4 v0, 0x0

    .line 146
    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 148
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    return-object v2

    .line 137
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Queue is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeIndex(I)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    if-ltz p1, :cond_4

    .line 220
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-ge p1, v0, :cond_3

    .line 222
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 223
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    iget v2, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    add-int/2addr p1, v1

    const/4 v3, 0x0

    if-ge v1, v2, :cond_0

    .line 227
    aget-object v1, v0, p1

    add-int/lit8 v4, p1, 0x1

    sub-int v5, v2, p1

    .line 228
    invoke-static {v0, v4, v0, p1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 229
    aput-object v3, v0, v2

    .line 230
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    goto :goto_0

    .line 231
    :cond_0
    array-length v4, v0

    if-lt p1, v4, :cond_1

    .line 232
    array-length v1, v0

    sub-int/2addr p1, v1

    .line 233
    aget-object v1, v0, p1

    add-int/lit8 v3, p1, 0x1

    sub-int/2addr v2, p1

    .line 234
    invoke-static {v0, v3, v0, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 235
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    goto :goto_0

    .line 237
    :cond_1
    aget-object v2, v0, p1

    add-int/lit8 v4, v1, 0x1

    sub-int/2addr p1, v1

    .line 238
    invoke-static {v0, v1, v0, v4, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 239
    aput-object v3, v0, v1

    .line 240
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 241
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    array-length v0, v0

    if-ne p1, v0, :cond_2

    const/4 p1, 0x0

    .line 242
    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    :cond_2
    move-object v1, v2

    .line 245
    :goto_0
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    return-object v1

    .line 220
    :cond_3
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index can\'t be >= size: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " >= "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 219
    :cond_4
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index can\'t be < 0: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeLast()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 158
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-eqz v0, :cond_1

    .line 162
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 163
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    const/4 v2, -0x1

    add-int/2addr v1, v2

    if-ne v1, v2, :cond_0

    .line 166
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    .line 168
    :cond_0
    aget-object v2, v0, v1

    const/4 v3, 0x0

    .line 169
    aput-object v3, v0, v1

    .line 170
    iput v1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    .line 171
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    return-object v2

    .line 159
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "Queue is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeValue(Ljava/lang/Object;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    .line 211
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/Queue;->indexOf(Ljava/lang/Object;Z)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_0

    const/4 p1, 0x0

    return p1

    .line 213
    :cond_0
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/Queue;->removeIndex(I)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1
.end method

.method protected resize(I)V
    .locals 5

    .line 111
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 112
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 113
    iget v2, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    .line 116
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/badlogic/gdx/utils/reflect/ArrayReflection;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    check-cast p1, [Ljava/lang/Object;

    const/4 v3, 0x0

    if-ge v1, v2, :cond_0

    sub-int/2addr v2, v1

    .line 119
    invoke-static {v0, v1, p1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_0

    .line 120
    :cond_0
    iget v4, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-lez v4, :cond_1

    .line 122
    array-length v4, v0

    sub-int/2addr v4, v1

    .line 123
    invoke-static {v0, v1, p1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 124
    invoke-static {v0, v3, p1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 126
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 127
    iput v3, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 128
    iget p1, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    iput p1, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 342
    iget v0, p0, Lcom/badlogic/gdx/utils/Queue;->size:I

    if-nez v0, :cond_0

    const-string v0, "[]"

    return-object v0

    .line 345
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/Queue;->values:[Ljava/lang/Object;

    .line 346
    iget v1, p0, Lcom/badlogic/gdx/utils/Queue;->head:I

    .line 347
    iget v2, p0, Lcom/badlogic/gdx/utils/Queue;->tail:I

    .line 349
    new-instance v3, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v4, 0x40

    invoke-direct {v3, v4}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v4, 0x5b

    .line 350
    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 351
    aget-object v4, v0, v1

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    :goto_0
    add-int/lit8 v1, v1, 0x1

    .line 352
    array-length v4, v0

    rem-int/2addr v1, v4

    if-eq v1, v2, :cond_1

    const-string v4, ", "

    .line 353
    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    move-result-object v4

    aget-object v5, v0, v1

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    goto :goto_0

    :cond_1
    const/16 v0, 0x5d

    .line 355
    invoke-virtual {v3, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 356
    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
