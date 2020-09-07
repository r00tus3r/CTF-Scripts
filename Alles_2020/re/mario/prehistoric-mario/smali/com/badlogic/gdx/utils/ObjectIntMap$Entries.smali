.class public Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;
.super Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;
.source "ObjectIntMap.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/ObjectIntMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entries"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator<",
        "TK;>;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/ObjectIntMap$Entry<",
        "TK;>;>;",
        "Ljava/util/Iterator<",
        "Lcom/badlogic/gdx/utils/ObjectIntMap$Entry<",
        "TK;>;>;"
    }
.end annotation


# instance fields
.field private entry:Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectIntMap$Entry<",
            "TK;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectIntMap<",
            "TK;>;)V"
        }
    .end annotation

    .line 693
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;-><init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V

    .line 690
    new-instance p1, Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 709
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->valid:Z

    if-eqz v0, :cond_0

    .line 710
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->hasNext:Z

    return v0

    .line 709
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterator()Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectIntMap$Entries<",
            "TK;>;"
        }
    .end annotation

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 689
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->iterator()Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public next()Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectIntMap$Entry<",
            "TK;>;"
        }
    .end annotation

    .line 698
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->hasNext:Z

    if-eqz v0, :cond_1

    .line 699
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->valid:Z

    if-eqz v0, :cond_0

    .line 700
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 701
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->nextIndex:I

    aget-object v0, v0, v2

    iput-object v0, v1, Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;->key:Ljava/lang/Object;

    .line 702
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/ObjectIntMap;->valueTable:[I

    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->nextIndex:I

    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;->value:I

    .line 703
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->nextIndex:I

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->currentIndex:I

    .line 704
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->findNextIndex()V

    .line 705
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;

    return-object v0

    .line 699
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 698
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 689
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$Entries;->next()Lcom/badlogic/gdx/utils/ObjectIntMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 0

    .line 718
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->remove()V

    return-void
.end method

.method public bridge synthetic reset()V
    .locals 0

    .line 689
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->reset()V

    return-void
.end method
