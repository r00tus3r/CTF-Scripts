.class public Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;
.super Ljava/lang/Object;
.source "IntSet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IntSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "IntSetIterator"
.end annotation


# static fields
.field static final INDEX_ILLEGAL:I = -0x2

.field static final INDEX_ZERO:I = -0x1


# instance fields
.field currentIndex:I

.field public hasNext:Z

.field nextIndex:I

.field final set:Lcom/badlogic/gdx/utils/IntSet;

.field valid:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IntSet;)V
    .locals 1

    .line 521
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 519
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->valid:Z

    .line 522
    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    .line 523
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->reset()V

    return-void
.end method


# virtual methods
.method findNextIndex()V
    .locals 4

    const/4 v0, 0x0

    .line 536
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->hasNext:Z

    .line 537
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntSet;->keyTable:[I

    .line 538
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntSet;->capacity:I

    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget v2, v2, Lcom/badlogic/gdx/utils/IntSet;->stashSize:I

    add-int/2addr v1, v2

    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->nextIndex:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->nextIndex:I

    if-ge v2, v1, :cond_1

    .line 539
    iget v2, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->nextIndex:I

    aget v2, v0, v2

    if-eqz v2, :cond_0

    .line 540
    iput-boolean v3, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->hasNext:Z

    :cond_1
    return-void
.end method

.method public next()I
    .locals 2

    .line 563
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->hasNext:Z

    if-eqz v0, :cond_2

    .line 564
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->valid:Z

    if-eqz v0, :cond_1

    .line 565
    iget v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->nextIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntSet;->keyTable:[I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->nextIndex:I

    aget v0, v0, v1

    .line 566
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->currentIndex:I

    .line 567
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->findNextIndex()V

    return v0

    .line 564
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 563
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 3

    .line 547
    iget v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->currentIndex:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntSet;->hasZeroValue:Z

    if-eqz v0, :cond_0

    .line 548
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/IntSet;->hasZeroValue:Z

    goto :goto_0

    .line 549
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->currentIndex:I

    if-ltz v0, :cond_2

    .line 551
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget v2, v2, Lcom/badlogic/gdx/utils/IntSet;->capacity:I

    if-lt v0, v2, :cond_1

    .line 552
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget v1, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->currentIndex:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntSet;->removeStashIndex(I)V

    .line 553
    iget v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->currentIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->nextIndex:I

    .line 554
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->findNextIndex()V

    goto :goto_0

    .line 556
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntSet;->keyTable:[I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->currentIndex:I

    aput v1, v0, v2

    :goto_0
    const/4 v0, -0x2

    .line 558
    iput v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->currentIndex:I

    .line 559
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget v1, v0, Lcom/badlogic/gdx/utils/IntSet;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/IntSet;->size:I

    return-void

    .line 550
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next must be called before remove."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, -0x2

    .line 527
    iput v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->currentIndex:I

    const/4 v0, -0x1

    .line 528
    iput v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->nextIndex:I

    .line 529
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntSet;->hasZeroValue:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 530
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->hasNext:Z

    goto :goto_0

    .line 532
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->findNextIndex()V

    :goto_0
    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/IntArray;
    .locals 3

    .line 573
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->set:Lcom/badlogic/gdx/utils/IntSet;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntSet;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>(ZI)V

    .line 574
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->hasNext:Z

    if-eqz v1, :cond_0

    .line 575
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntSet$IntSetIterator;->next()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
