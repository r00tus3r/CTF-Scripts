.class public Lcom/badlogic/gdx/utils/ObjectMap$Entries;
.super Lcom/badlogic/gdx/utils/ObjectMap$MapIterator;
.source "ObjectMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/ObjectMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entries"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/utils/ObjectMap$MapIterator<",
        "TK;TV;",
        "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/ObjectMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 750
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    .line 747
    new-instance p1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/ObjectMap$Entry;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 766
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    if-eqz v0, :cond_0

    .line 767
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->hasNext:Z

    return v0

    .line 766
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entries<",
            "TK;TV;>;"
        }
    .end annotation

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 746
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public next()Lcom/badlogic/gdx/utils/ObjectMap$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 755
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->hasNext:Z

    if-eqz v0, :cond_1

    .line 756
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    if-eqz v0, :cond_0

    .line 757
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->map:Lcom/badlogic/gdx/utils/ObjectMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectMap;->keyTable:[Ljava/lang/Object;

    .line 758
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->nextIndex:I

    aget-object v0, v0, v2

    iput-object v0, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    .line 759
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->map:Lcom/badlogic/gdx/utils/ObjectMap;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/ObjectMap;->valueTable:[Ljava/lang/Object;

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->nextIndex:I

    aget-object v1, v1, v2

    iput-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    .line 760
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->nextIndex:I

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->currentIndex:I

    .line 761
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->findNextIndex()V

    .line 762
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    return-object v0

    .line 756
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 755
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 746
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->next()Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic remove()V
    .locals 0

    .line 746
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 746
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectMap$MapIterator;->reset()V

    return-void
.end method
