.class public Lcom/badlogic/gdx/utils/IntFloatMap$Keys;
.super Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;
.source "IntFloatMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IntFloatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Keys"
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V
    .locals 0

    .line 831
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 835
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->valid:Z

    if-eqz v0, :cond_0

    .line 836
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->hasNext:Z

    return v0

    .line 835
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public next()I
    .locals 2

    .line 840
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->hasNext:Z

    if-eqz v0, :cond_2

    .line 841
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->valid:Z

    if-eqz v0, :cond_1

    .line 842
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->nextIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->nextIndex:I

    aget v0, v0, v1

    .line 843
    :goto_0
    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->currentIndex:I

    .line 844
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->findNextIndex()V

    return v0

    .line 841
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 840
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .line 829
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 829
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->reset()V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/IntArray;
    .locals 3

    .line 850
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>(ZI)V

    .line 851
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->hasNext:Z

    if-eqz v1, :cond_0

    .line 852
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$Keys;->next()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
