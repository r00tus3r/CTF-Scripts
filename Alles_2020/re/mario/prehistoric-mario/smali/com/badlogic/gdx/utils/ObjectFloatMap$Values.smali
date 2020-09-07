.class public Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;
.super Lcom/badlogic/gdx/utils/ObjectFloatMap$MapIterator;
.source "ObjectFloatMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/ObjectFloatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/utils/ObjectFloatMap$MapIterator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/ObjectFloatMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectFloatMap<",
            "*>;)V"
        }
    .end annotation

    .line 723
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectFloatMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/ObjectFloatMap;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 727
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 728
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->hasNext:Z

    return v0

    .line 727
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public next()F
    .locals 2

    .line 732
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->hasNext:Z

    if-eqz v0, :cond_1

    .line 733
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 734
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->map:Lcom/badlogic/gdx/utils/ObjectFloatMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectFloatMap;->valueTable:[F

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->nextIndex:I

    aget v0, v0, v1

    .line 735
    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->currentIndex:I

    .line 736
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->findNextIndex()V

    return v0

    .line 733
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 732
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .line 721
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectFloatMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 721
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectFloatMap$MapIterator;->reset()V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/FloatArray;
    .locals 3

    .line 742
    new-instance v0, Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->map:Lcom/badlogic/gdx/utils/ObjectFloatMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/ObjectFloatMap;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/FloatArray;-><init>(ZI)V

    .line 743
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->hasNext:Z

    if-eqz v1, :cond_0

    .line 744
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectFloatMap$Values;->next()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
