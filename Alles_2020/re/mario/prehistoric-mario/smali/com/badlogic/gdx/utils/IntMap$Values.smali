.class public Lcom/badlogic/gdx/utils/IntMap$Values;
.super Lcom/badlogic/gdx/utils/IntMap$MapIterator;
.source "IntMap.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IntMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/utils/IntMap$MapIterator<",
        "TV;>;",
        "Ljava/lang/Iterable<",
        "TV;>;",
        "Ljava/util/Iterator<",
        "TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IntMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/IntMap<",
            "TV;>;)V"
        }
    .end annotation

    .line 833
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/IntMap;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 837
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 838
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->hasNext:Z

    return v0

    .line 837
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TV;>;"
        }
    .end annotation

    return-object p0
.end method

.method public next()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 842
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->hasNext:Z

    if-eqz v0, :cond_2

    .line 843
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->valid:Z

    if-eqz v0, :cond_1

    .line 845
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->nextIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 846
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    goto :goto_0

    .line 848
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->nextIndex:I

    aget-object v0, v0, v1

    .line 849
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->currentIndex:I

    .line 850
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntMap$Values;->findNextIndex()V

    return-object v0

    .line 843
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 842
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 0

    .line 867
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 831
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->reset()V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/Array;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "TV;>;"
        }
    .end annotation

    .line 860
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntMap;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    .line 861
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/IntMap$Values;->hasNext:Z

    if-eqz v1, :cond_0

    .line 862
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntMap$Values;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
