.class public Lcom/badlogic/gdx/utils/OrderedSet;
.super Lcom/badlogic/gdx/utils/ObjectSet;
.source "OrderedSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/utils/ObjectSet<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final items:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation
.end field

.field iterator1:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

.field iterator2:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/ObjectSet;-><init>()V

    .line 32
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 41
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectSet;-><init>(I)V

    .line 42
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    iget v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->capacity:I

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectSet;-><init>(IF)V

    .line 37
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    iget p2, p0, Lcom/badlogic/gdx/utils/OrderedSet;->capacity:I

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/OrderedSet;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/OrderedSet<",
            "+TT;>;)V"
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectSet;-><init>(Lcom/badlogic/gdx/utils/ObjectSet;)V

    .line 47
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget v1, p0, Lcom/badlogic/gdx/utils/OrderedSet;->capacity:I

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    .line 48
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    iget-object p1, p1, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 52
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/ObjectSet;->add(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    const/4 p1, 0x1

    return p1
.end method

.method public add(Ljava/lang/Object;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)Z"
        }
    .end annotation

    .line 58
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/ObjectSet;->add(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p2, p1}, Lcom/badlogic/gdx/utils/Array;->insert(ILjava/lang/Object;)V

    const/4 p1, 0x0

    return p1

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p2, p1}, Lcom/badlogic/gdx/utils/Array;->insert(ILjava/lang/Object;)V

    return v1
.end method

.method public clear()V
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 86
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectSet;->clear()V

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 81
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/ObjectSet;->clear(I)V

    return-void
.end method

.method public bridge synthetic iterator()Lcom/badlogic/gdx/utils/ObjectSet$ObjectSetIterator;
    .locals 1

    .line 27
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/OrderedSet;->iterator()Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    move-result-object v0

    return-object v0
.end method

.method public iterator()Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator<",
            "TT;>;"
        }
    .end annotation

    .line 94
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;-><init>(Lcom/badlogic/gdx/utils/OrderedSet;)V

    return-object v0

    .line 95
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator1:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    if-nez v0, :cond_1

    .line 96
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;-><init>(Lcom/badlogic/gdx/utils/OrderedSet;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator1:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    .line 97
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;-><init>(Lcom/badlogic/gdx/utils/OrderedSet;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator2:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    .line 99
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator1:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 100
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator1:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->reset()V

    .line 101
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator1:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->valid:Z

    .line 102
    iget-object v2, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator2:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->valid:Z

    return-object v0

    .line 105
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator2:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->reset()V

    .line 106
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator2:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->valid:Z

    .line 107
    iget-object v2, p0, Lcom/badlogic/gdx/utils/OrderedSet;->iterator1:Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    iput-boolean v1, v2, Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;->valid:Z

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 27
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/OrderedSet;->iterator()Lcom/badlogic/gdx/utils/OrderedSet$OrderedSetIterator;

    move-result-object v0

    return-object v0
.end method

.method public orderedItems()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 68
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/ObjectSet;->remove(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 69
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    const/4 p1, 0x1

    return p1
.end method

.method public removeIndex(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    move-result-object p1

    .line 75
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/ObjectSet;->remove(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 112
    iget v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-nez v0, :cond_0

    const-string v0, "{}"

    return-object v0

    .line 113
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/Array;->items:[Ljava/lang/Object;

    .line 114
    new-instance v1, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v2, 0x20

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v2, 0x7b

    .line 115
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x0

    .line 116
    aget-object v2, v0, v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    const/4 v2, 0x1

    .line 117
    :goto_0
    iget v3, p0, Lcom/badlogic/gdx/utils/OrderedSet;->size:I

    if-ge v2, v3, :cond_1

    const-string v3, ", "

    .line 118
    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 119
    aget-object v3, v0, v2

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/16 v0, 0x7d

    .line 121
    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 122
    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedSet;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
