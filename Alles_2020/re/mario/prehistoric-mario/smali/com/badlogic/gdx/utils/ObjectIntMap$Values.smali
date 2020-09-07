.class public Lcom/badlogic/gdx/utils/ObjectIntMap$Values;
.super Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;
.source "ObjectIntMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/ObjectIntMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectIntMap<",
            "*>;)V"
        }
    .end annotation

    .line 724
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 728
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 729
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->hasNext:Z

    return v0

    .line 728
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public next()I
    .locals 2

    .line 733
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->hasNext:Z

    if-eqz v0, :cond_1

    .line 734
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 735
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->nextIndex:I

    aget v0, v0, v1

    .line 736
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->currentIndex:I

    .line 737
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->findNextIndex()V

    return v0

    .line 734
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 733
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .line 722
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 722
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->reset()V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/IntArray;
    .locals 3

    .line 743
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>(ZI)V

    .line 744
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->hasNext:Z

    if-eqz v1, :cond_0

    .line 745
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Values;->next()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
