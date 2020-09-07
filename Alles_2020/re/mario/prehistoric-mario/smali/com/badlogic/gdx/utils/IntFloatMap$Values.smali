.class public Lcom/badlogic/gdx/utils/IntFloatMap$Values;
.super Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;
.source "IntFloatMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IntFloatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Values"
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V
    .locals 0

    .line 799
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 803
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 804
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->hasNext:Z

    return v0

    .line 803
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public next()F
    .locals 2

    .line 808
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->hasNext:Z

    if-eqz v0, :cond_2

    .line 809
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->valid:Z

    if-eqz v0, :cond_1

    .line 811
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->nextIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 812
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->zeroValue:F

    goto :goto_0

    .line 814
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->valueTable:[F

    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->nextIndex:I

    aget v0, v0, v1

    .line 815
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->currentIndex:I

    .line 816
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->findNextIndex()V

    return v0

    .line 809
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 808
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .line 797
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 797
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->reset()V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/FloatArray;
    .locals 3

    .line 822
    new-instance v0, Lcom/badlogic/gdx/utils/FloatArray;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/FloatArray;-><init>(ZI)V

    .line 823
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->hasNext:Z

    if-eqz v1, :cond_0

    .line 824
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Values;->next()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/FloatArray;->add(F)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
