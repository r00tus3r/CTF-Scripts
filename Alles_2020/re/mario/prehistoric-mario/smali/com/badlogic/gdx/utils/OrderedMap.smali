.class public Lcom/badlogic/gdx/utils/OrderedMap;
.super Lcom/badlogic/gdx/utils/ObjectMap;
.source "OrderedMap.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;,
        Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapKeys;,
        Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapEntries;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/utils/ObjectMap<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field final keys:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "TK;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    .line 31
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 35
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>(I)V

    .line 36
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    iget v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->capacity:I

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(IF)V
    .locals 0

    .line 40
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>(IF)V

    .line 41
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    iget p2, p0, Lcom/badlogic/gdx/utils/OrderedMap;->capacity:I

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/OrderedMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/OrderedMap<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 45
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    .line 46
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget-object p1, p1, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>(Lcom/badlogic/gdx/utils/Array;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 70
    invoke-super {p0}, Lcom/badlogic/gdx/utils/ObjectMap;->clear()V

    return-void
.end method

.method public clear(I)V
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 65
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->clear(I)V

    return-void
.end method

.method public entries()Lcom/badlogic/gdx/utils/ObjectMap$Entries;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entries<",
            "TK;TV;>;"
        }
    .end annotation

    .line 86
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    return-object v0

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    if-nez v0, :cond_1

    .line 88
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapEntries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapEntries;-><init>(Lcom/badlogic/gdx/utils/OrderedMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    .line 89
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapEntries;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapEntries;-><init>(Lcom/badlogic/gdx/utils/OrderedMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    .line 91
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 92
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->reset()V

    .line 93
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    .line 94
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    return-object v0

    .line 97
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->reset()V

    .line 98
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries1:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->valid:Z

    .line 100
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->entries2:Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    return-object v0
.end method

.method public iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entries<",
            "TK;TV;>;"
        }
    .end annotation

    .line 78
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/OrderedMap;->entries()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .locals 1

    .line 27
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/OrderedMap;->iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object v0

    return-object v0
.end method

.method public keys()Lcom/badlogic/gdx/utils/ObjectMap$Keys;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Keys<",
            "TK;>;"
        }
    .end annotation

    .line 130
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Keys;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    return-object v0

    .line 131
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    if-nez v0, :cond_1

    .line 132
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapKeys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapKeys;-><init>(Lcom/badlogic/gdx/utils/OrderedMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    .line 133
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapKeys;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapKeys;-><init>(Lcom/badlogic/gdx/utils/OrderedMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    .line 135
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 136
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->reset()V

    .line 137
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    .line 138
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    .line 139
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    return-object v0

    .line 141
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->reset()V

    .line 142
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    .line 143
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys1:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Keys;->valid:Z

    .line 144
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys2:Lcom/badlogic/gdx/utils/ObjectMap$Keys;

    return-object v0
.end method

.method public orderedKeys()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "TK;>;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 50
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/OrderedMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 51
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)TV;"
        }
    .end annotation

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 56
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeIndex(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TV;"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .line 148
    iget v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->size:I

    if-nez v0, :cond_0

    const-string v0, "{}"

    return-object v0

    .line 149
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;-><init>(I)V

    const/16 v1, 0x7b

    .line 150
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 151
    iget-object v1, p0, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x0

    .line 152
    iget v3, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    :goto_0
    if-ge v2, v3, :cond_2

    .line 153
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-lez v2, :cond_1

    const-string v5, ", "

    .line 154
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/String;)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 155
    :cond_1
    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    const/16 v5, 0x3d

    .line 156
    invoke-virtual {v0, v5}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 157
    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/utils/OrderedMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/utils/StringBuilder;->append(Ljava/lang/Object;)Lcom/badlogic/gdx/utils/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/16 v1, 0x7d

    .line 159
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/StringBuilder;->append(C)Lcom/badlogic/gdx/utils/StringBuilder;

    .line 160
    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public values()Lcom/badlogic/gdx/utils/ObjectMap$Values;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Values<",
            "TV;>;"
        }
    .end annotation

    .line 108
    sget-boolean v0, Lcom/badlogic/gdx/utils/Collections;->allocateIterators:Z

    if-eqz v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    return-object v0

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    if-nez v0, :cond_1

    .line 110
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;-><init>(Lcom/badlogic/gdx/utils/OrderedMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    .line 111
    new-instance v0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;-><init>(Lcom/badlogic/gdx/utils/OrderedMap;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    .line 113
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    .line 114
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;->reset()V

    .line 115
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    .line 117
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    return-object v0

    .line 119
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Values;->reset()V

    .line 120
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iput-boolean v2, v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values1:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Values;->valid:Z

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap;->values2:Lcom/badlogic/gdx/utils/ObjectMap$Values;

    return-object v0
.end method
