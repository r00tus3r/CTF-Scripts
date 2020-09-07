.class public Lcom/badlogic/gdx/utils/SnapshotArray;
.super Lcom/badlogic/gdx/utils/Array;
.source "SnapshotArray.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/utils/Array<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private recycled:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private snapshot:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TT;"
        }
    .end annotation
.end field

.field private snapshots:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 72
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/Array;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>(Lcom/badlogic/gdx/utils/Array;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .locals 0

    .line 68
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>(Ljava/lang/Class;)V

    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 0

    .line 60
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    return-void
.end method

.method public constructor <init>(ZILjava/lang/Class;)V
    .locals 0

    .line 56
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/Array;-><init>(ZILjava/lang/Class;)V

    return-void
.end method

.method public constructor <init>(Z[Ljava/lang/Object;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z[TT;II)V"
        }
    .end annotation

    .line 64
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/utils/Array;-><init>(Z[Ljava/lang/Object;II)V

    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .line 76
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>([Ljava/lang/Object;)V

    return-void
.end method

.method private modified()V
    .locals 4

    .line 101
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshot:[Ljava/lang/Object;

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->items:[Ljava/lang/Object;

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->recycled:[Ljava/lang/Object;

    if-eqz v0, :cond_1

    array-length v0, v0

    iget v1, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    if-lt v0, v1, :cond_1

    .line 104
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->items:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->recycled:[Ljava/lang/Object;

    iget v2, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->size:I

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->recycled:[Ljava/lang/Object;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->items:[Ljava/lang/Object;

    const/4 v0, 0x0

    .line 106
    iput-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->recycled:[Ljava/lang/Object;

    goto :goto_0

    .line 108
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->items:[Ljava/lang/Object;

    array-length v0, v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/SnapshotArray;->resize(I)[Ljava/lang/Object;

    :cond_2
    :goto_0
    return-void
.end method

.method public static varargs with([Ljava/lang/Object;)Lcom/badlogic/gdx/utils/SnapshotArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Lcom/badlogic/gdx/utils/SnapshotArray<",
            "TT;>;"
        }
    .end annotation

    .line 188
    new-instance v0, Lcom/badlogic/gdx/utils/SnapshotArray;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/SnapshotArray;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public begin()[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[TT;"
        }
    .end annotation

    .line 81
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 82
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->items:[Ljava/lang/Object;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshot:[Ljava/lang/Object;

    .line 83
    iget v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshots:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshots:I

    .line 84
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->items:[Ljava/lang/Object;

    return-object v0
.end method

.method public clear()V
    .locals 0

    .line 152
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 153
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public end()V
    .locals 4

    .line 89
    iget v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshots:I

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshots:I

    .line 90
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshot:[Ljava/lang/Object;

    if-nez v0, :cond_0

    return-void

    .line 91
    :cond_0
    iget-object v2, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->items:[Ljava/lang/Object;

    const/4 v3, 0x0

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshots:I

    if-nez v0, :cond_1

    .line 93
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshot:[Ljava/lang/Object;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->recycled:[Ljava/lang/Object;

    .line 94
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->recycled:[Ljava/lang/Object;

    array-length v0, v0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 95
    iget-object v2, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->recycled:[Ljava/lang/Object;

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 97
    :cond_1
    iput-object v3, p0, Lcom/badlogic/gdx/utils/SnapshotArray;->snapshot:[Ljava/lang/Object;

    return-void
.end method

.method public insert(ILjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 117
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 118
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->insert(ILjava/lang/Object;)V

    return-void
.end method

.method public pop()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 147
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 148
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->pop()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public removeAll(Lcom/badlogic/gdx/utils/Array;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "+TT;>;Z)Z"
        }
    .end annotation

    .line 142
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 143
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->removeAll(Lcom/badlogic/gdx/utils/Array;Z)Z

    move-result p1

    return p1
.end method

.method public removeIndex(I)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 132
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 133
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeRange(II)V
    .locals 0

    .line 137
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 138
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->removeRange(II)V

    return-void
.end method

.method public removeValue(Ljava/lang/Object;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    .line 127
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 128
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    move-result p1

    return p1
.end method

.method public reverse()V
    .locals 0

    .line 167
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 168
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->reverse()V

    return-void
.end method

.method public set(ILjava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 112
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 113
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->set(ILjava/lang/Object;)V

    return-void
.end method

.method public setSize(I)[Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)[TT;"
        }
    .end annotation

    .line 182
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 183
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/Array;->setSize(I)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public shuffle()V
    .locals 0

    .line 172
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 173
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->shuffle()V

    return-void
.end method

.method public sort()V
    .locals 0

    .line 157
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 158
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->sort()V

    return-void
.end method

.method public sort(Ljava/util/Comparator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    .line 162
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 163
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/Array;->sort(Ljava/util/Comparator;)V

    return-void
.end method

.method public swap(II)V
    .locals 0

    .line 122
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 123
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->swap(II)V

    return-void
.end method

.method public truncate(I)V
    .locals 0

    .line 177
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/SnapshotArray;->modified()V

    .line 178
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/Array;->truncate(I)V

    return-void
.end method
