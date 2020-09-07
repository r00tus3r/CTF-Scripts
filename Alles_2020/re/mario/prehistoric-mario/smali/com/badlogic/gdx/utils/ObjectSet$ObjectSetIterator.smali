.class public Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;
.super Ljava/lang/Object;
.source "ObjectSet.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/ObjectSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectSetIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "TK;>;",
        "Ljava/util/Iterator<",
        "TK;>;"
    }
.end annotation


# instance fields
.field currentIndex:I

.field public hasNext:Z

.field nextIndex:I

.field final set:Lcom/badlogic/gdx/utils/ObjectSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectSet<",
            "TK;>;"
        }
    .end annotation
.end field

.field valid:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/ObjectSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectSet<",
            "TK;>;)V"
        }
    .end annotation

    .line 521
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 519
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->valid:Z

    .line 522
    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    .line 523
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->reset()V

    return-void
.end method

.method private findNextIndex()V
    .locals 4

    const/4 v0, 0x0

    .line 533
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->hasNext:Z

    .line 534
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectSet;->keyTable:[Ljava/lang/Object;

    .line 535
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget v1, v1, Lcom/badlogic/gdx/utils/ObjectSet;->capacity:I

    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget v2, v2, Lcom/badlogic/gdx/utils/ObjectSet;->stashSize:I

    add-int/2addr v1, v2

    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->nextIndex:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->nextIndex:I

    if-ge v2, v1, :cond_1

    .line 536
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->nextIndex:I

    aget-object v2, v0, v2

    if-eqz v2, :cond_0

    .line 537
    iput-boolean v3, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->hasNext:Z

    :cond_1
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 557
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->valid:Z

    if-eqz v0, :cond_0

    .line 558
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->hasNext:Z

    return v0

    .line 557
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterator()Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator<",
            "TK;>;"
        }
    .end annotation

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 514
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->iterator()Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 562
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->hasNext:Z

    if-eqz v0, :cond_1

    .line 563
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->valid:Z

    if-eqz v0, :cond_0

    .line 564
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectSet;->keyTable:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->nextIndex:I

    aget-object v0, v0, v1

    .line 565
    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->currentIndex:I

    .line 566
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->findNextIndex()V

    return-object v0

    .line 563
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 562
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 3

    .line 544
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->currentIndex:I

    if-ltz v0, :cond_1

    .line 545
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget v1, v1, Lcom/badlogic/gdx/utils/ObjectSet;->capacity:I

    if-lt v0, v1, :cond_0

    .line 546
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->currentIndex:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/ObjectSet;->removeStashIndex(I)V

    .line 547
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->currentIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->nextIndex:I

    .line 548
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->findNextIndex()V

    goto :goto_0

    .line 550
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectSet;->keyTable:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->currentIndex:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    :goto_0
    const/4 v0, -0x1

    .line 552
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->currentIndex:I

    .line 553
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectSet;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/ObjectSet;->size:I

    return-void

    .line 544
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next must be called before remove."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, -0x1

    .line 527
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->currentIndex:I

    .line 528
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->nextIndex:I

    .line 529
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->findNextIndex()V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/Array;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "TK;>;"
        }
    .end annotation

    .line 583
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->set:Lcom/badlogic/gdx/utils/ObjectSet;

    iget v1, v1, Lcom/badlogic/gdx/utils/ObjectSet;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->toArray(Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;

    move-result-object v0

    return-object v0
.end method

.method public toArray(Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TK;>;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "TK;>;"
        }
    .end annotation

    .line 576
    :goto_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->hasNext:Z

    if-eqz v0, :cond_0

    .line 577
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object p1
.end method
