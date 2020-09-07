.class public Lcom/badlogic/gdx/utils/IntIntMap$Entries;
.super Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;
.source "IntIntMap.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IntIntMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entries"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/IntIntMap$Entry;",
        ">;",
        "Ljava/util/Iterator<",
        "Lcom/badlogic/gdx/utils/IntIntMap$Entry;",
        ">;"
    }
.end annotation


# instance fields
.field private entry:Lcom/badlogic/gdx/utils/IntIntMap$Entry;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IntIntMap;)V
    .locals 0

    .line 749
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/IntIntMap;)V

    .line 746
    new-instance p1, Lcom/badlogic/gdx/utils/IntIntMap$Entry;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/IntIntMap$Entry;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/IntIntMap$Entry;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 770
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->valid:Z

    if-eqz v0, :cond_0

    .line 771
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->hasNext:Z

    return v0

    .line 770
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
            "Lcom/badlogic/gdx/utils/IntIntMap$Entry;",
            ">;"
        }
    .end annotation

    return-object p0
.end method

.method public next()Lcom/badlogic/gdx/utils/IntIntMap$Entry;
    .locals 3

    .line 754
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->hasNext:Z

    if-eqz v0, :cond_2

    .line 755
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->valid:Z

    if-eqz v0, :cond_1

    .line 756
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->map:Lcom/badlogic/gdx/utils/IntIntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntIntMap;->keyTable:[I

    .line 757
    iget v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->nextIndex:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    .line 758
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/IntIntMap$Entry;

    const/4 v1, 0x0

    iput v1, v0, Lcom/badlogic/gdx/utils/IntIntMap$Entry;->key:I

    .line 759
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->map:Lcom/badlogic/gdx/utils/IntIntMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntIntMap;->zeroValue:I

    iput v1, v0, Lcom/badlogic/gdx/utils/IntIntMap$Entry;->value:I

    goto :goto_0

    .line 761
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/IntIntMap$Entry;

    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->nextIndex:I

    aget v0, v0, v2

    iput v0, v1, Lcom/badlogic/gdx/utils/IntIntMap$Entry;->key:I

    .line 762
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/IntIntMap$Entry;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->map:Lcom/badlogic/gdx/utils/IntIntMap;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/IntIntMap;->valueTable:[I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->nextIndex:I

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/utils/IntIntMap$Entry;->value:I

    .line 764
    :goto_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->nextIndex:I

    iput v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->currentIndex:I

    .line 765
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->findNextIndex()V

    .line 766
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/IntIntMap$Entry;

    return-object v0

    .line 755
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 754
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 745
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntIntMap$Entries;->next()Lcom/badlogic/gdx/utils/IntIntMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 0

    .line 779
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 745
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IntIntMap$MapIterator;->reset()V

    return-void
.end method
