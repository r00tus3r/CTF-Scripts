.class public Lcom/badlogic/gdx/utils/IntIntMap$Values;
.super Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;
.source "IntIntMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IntIntMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Values"
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IntIntMap;)V
    .locals 0

    .line 785
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 789
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 790
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->hasNext:Z

    return v0

    .line 789
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public next()I
    .locals 2

    .line 794
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->hasNext:Z

    if-eqz v0, :cond_2

    .line 795
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->valid:Z

    if-eqz v0, :cond_1

    .line 797
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->nextIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 798
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->map:Lcom/badlogic/gdx/utils/IntIntMap;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    goto :goto_0

    .line 800
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->map:Lcom/badlogic/gdx/utils/IntIntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->nextIndex:I

    aget v0, v0, v1

    .line 801
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->currentIndex:I

    .line 802
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntIntMap$Values;->findNextIndex()V

    return v0

    .line 795
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 794
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .line 783
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 783
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;->reset()V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/IntArray;
    .locals 3

    .line 808
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->map:Lcom/badlogic/gdx/utils/IntIntMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntIntMap;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>(ZI)V

    .line 809
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Values;->hasNext:Z

    if-eqz v1, :cond_0

    .line 810
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntIntMap$Values;->next()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
