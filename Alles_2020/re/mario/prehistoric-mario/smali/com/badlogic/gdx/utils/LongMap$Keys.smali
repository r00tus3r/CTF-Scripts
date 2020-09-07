.class public Lcom/badlogic/gdx/utils/LongMap$Keys;
.super Lcom/badlogic/gdx/utils/LongMap$MapIterator;
.source "LongMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/LongMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Keys"
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/LongMap;)V
    .locals 0

    .line 865
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/LongMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/LongMap;)V

    return-void
.end method


# virtual methods
.method public next()J
    .locals 3

    .line 869
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->hasNext:Z

    if-eqz v0, :cond_2

    .line 870
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->valid:Z

    if-eqz v0, :cond_1

    .line 871
    iget v0, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->nextIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->map:Lcom/badlogic/gdx/utils/LongMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/LongMap;->keyTable:[J

    iget v1, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->nextIndex:I

    aget-wide v1, v0, v1

    move-wide v0, v1

    .line 872
    :goto_0
    iget v2, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->nextIndex:I

    iput v2, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->currentIndex:I

    .line 873
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/LongMap$Keys;->findNextIndex()V

    return-wide v0

    .line 870
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 869
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .line 863
    invoke-super {p0}, Lcom/badlogic/gdx/utils/LongMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 863
    invoke-super {p0}, Lcom/badlogic/gdx/utils/LongMap$MapIterator;->reset()V

    return-void
.end method

.method public toArray()Lcom/badlogic/gdx/utils/LongArray;
    .locals 3

    .line 879
    new-instance v0, Lcom/badlogic/gdx/utils/LongArray;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->map:Lcom/badlogic/gdx/utils/LongMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/LongMap;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/LongArray;-><init>(ZI)V

    .line 880
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/LongMap$Keys;->hasNext:Z

    if-eqz v1, :cond_0

    .line 881
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/LongMap$Keys;->next()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/LongArray;->add(J)V

    goto :goto_0

    :cond_0
    return-object v0
.end method
