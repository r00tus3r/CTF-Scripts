.class public Lcom/badlogic/gdx/utils/IdentityMap$Values;
.super Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;
.source "IdentityMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IdentityMap;
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
        "Lcom/badlogic/gdx/utils/IdentityMap$MapIterator<",
        "Ljava/lang/Object;",
        "TV;TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IdentityMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/IdentityMap<",
            "*TV;>;)V"
        }
    .end annotation

    .line 742
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/IdentityMap;)V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 746
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 747
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->hasNext:Z

    return v0

    .line 746
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

    .line 751
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->hasNext:Z

    if-eqz v0, :cond_1

    .line 752
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->valid:Z

    if-eqz v0, :cond_0

    .line 753
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->nextIndex:I

    aget-object v0, v0, v1

    .line 754
    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->currentIndex:I

    .line 755
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IdentityMap$Values;->findNextIndex()V

    return-object v0

    .line 752
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 751
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .line 740
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 740
    invoke-super {p0}, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->reset()V

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

    .line 765
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    const/4 v2, 0x1

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    .line 766
    :goto_0
    iget-boolean v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->hasNext:Z

    if-eqz v1, :cond_0

    .line 767
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IdentityMap$Values;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public toArray(Lcom/badlogic/gdx/utils/Array;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "TV;>;)V"
        }
    .end annotation

    .line 773
    :goto_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$Values;->hasNext:Z

    if-eqz v0, :cond_0

    .line 774
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IdentityMap$Values;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method
