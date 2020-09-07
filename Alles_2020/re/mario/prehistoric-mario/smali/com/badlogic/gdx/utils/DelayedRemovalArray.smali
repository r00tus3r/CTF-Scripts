.class public Lcom/badlogic/gdx/utils/DelayedRemovalArray;
.super Lcom/badlogic/gdx/utils/Array;
.source "DelayedRemovalArray.java"


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
.field private clear:I

.field private iterating:I

.field private remove:Lcom/badlogic/gdx/utils/IntArray;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 34
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 62
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    .line 34
    new-instance p1, Lcom/badlogic/gdx/utils/IntArray;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/Array;)V
    .locals 1

    .line 42
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>(Lcom/badlogic/gdx/utils/Array;)V

    .line 34
    new-instance p1, Lcom/badlogic/gdx/utils/IntArray;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1

    .line 58
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>(Ljava/lang/Class;)V

    .line 34
    new-instance p1, Lcom/badlogic/gdx/utils/IntArray;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 0

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;-><init>(ZI)V

    .line 34
    new-instance p1, Lcom/badlogic/gdx/utils/IntArray;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method public constructor <init>(ZILjava/lang/Class;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/Array;-><init>(ZILjava/lang/Class;)V

    .line 34
    new-instance p1, Lcom/badlogic/gdx/utils/IntArray;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method public constructor <init>(Z[Ljava/lang/Object;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z[TT;II)V"
        }
    .end annotation

    .line 54
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/utils/Array;-><init>(Z[Ljava/lang/Object;II)V

    .line 34
    new-instance p1, Lcom/badlogic/gdx/utils/IntArray;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method public constructor <init>([Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TT;)V"
        }
    .end annotation

    .line 66
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/Array;-><init>([Ljava/lang/Object;)V

    .line 34
    new-instance p1, Lcom/badlogic/gdx/utils/IntArray;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>(I)V

    iput-object p1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    return-void
.end method

.method private remove(I)V
    .locals 3

    .line 93
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear:I

    if-ge p1, v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 94
    iget-object v1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntArray;->size:I

    :goto_0
    if-ge v0, v1, :cond_3

    .line 95
    iget-object v2, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v2

    if-ne p1, v2, :cond_1

    return-void

    :cond_1
    if-ge p1, v2, :cond_2

    .line 98
    iget-object v1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v1, v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->insert(II)V

    return-void

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    return-void
.end method

.method public static varargs with([Ljava/lang/Object;)Lcom/badlogic/gdx/utils/DelayedRemovalArray;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Lcom/badlogic/gdx/utils/DelayedRemovalArray<",
            "TT;>;"
        }
    .end annotation

    .line 191
    new-instance v0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;-><init>([Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public begin()V
    .locals 1

    .line 70
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    return-void
.end method

.method public clear()V
    .locals 1

    .line 132
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-lez v0, :cond_0

    .line 133
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->size:I

    iput v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear:I

    return-void

    .line 136
    :cond_0
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public end()V
    .locals 5

    .line 74
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-eqz v0, :cond_5

    add-int/lit8 v0, v0, -0x1

    .line 75
    iput v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    .line 76
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-nez v0, :cond_4

    .line 77
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear:I

    const/4 v1, 0x0

    if-lez v0, :cond_0

    iget v2, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->size:I

    if-ne v0, v2, :cond_0

    .line 78
    iget-object v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 79
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear()V

    goto :goto_2

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 82
    iget-object v3, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/IntArray;->pop()I

    move-result v3

    .line 83
    iget v4, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear:I

    if-lt v3, v4, :cond_1

    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->removeIndex(I)Ljava/lang/Object;

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 85
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear:I

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ltz v0, :cond_3

    .line 86
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->removeIndex(I)Ljava/lang/Object;

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 88
    :cond_3
    :goto_2
    iput v1, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->clear:I

    :cond_4
    return-void

    .line 74
    :cond_5
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "begin must be called before end."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v0

    :goto_4
    goto :goto_3
.end method

.method public insert(ILjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 145
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 146
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->insert(ILjava/lang/Object;)V

    return-void

    .line 145
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Invalid between begin/end."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public pop()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 155
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 156
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->pop()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 155
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid between begin/end."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public removeIndex(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 116
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-lez v0, :cond_0

    .line 117
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove(I)V

    .line 118
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 120
    :cond_0
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public removeRange(II)V
    .locals 1

    .line 124
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-lez v0, :cond_0

    :goto_0
    if-lt p2, p1, :cond_1

    .line 126
    invoke-direct {p0, p2}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove(I)V

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    .line 128
    :cond_0
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->removeRange(II)V

    :cond_1
    return-void
.end method

.method public removeValue(Ljava/lang/Object;Z)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)Z"
        }
    .end annotation

    .line 106
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-lez v0, :cond_1

    .line 107
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->indexOf(Ljava/lang/Object;Z)I

    move-result p1

    const/4 p2, -0x1

    if-ne p1, p2, :cond_0

    const/4 p1, 0x0

    return p1

    .line 109
    :cond_0
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->remove(I)V

    const/4 p1, 0x1

    return p1

    .line 112
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    move-result p1

    return p1
.end method

.method public reverse()V
    .locals 2

    .line 170
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 171
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->reverse()V

    return-void

    .line 170
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid between begin/end."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(ILjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;)V"
        }
    .end annotation

    .line 140
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 141
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->set(ILjava/lang/Object;)V

    return-void

    .line 140
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Invalid between begin/end."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setSize(I)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)[TT;"
        }
    .end annotation

    .line 185
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 186
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/Array;->setSize(I)[Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 185
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Invalid between begin/end."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public shuffle()V
    .locals 2

    .line 175
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 176
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->shuffle()V

    return-void

    .line 175
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid between begin/end."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sort()V
    .locals 2

    .line 160
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 161
    invoke-super {p0}, Lcom/badlogic/gdx/utils/Array;->sort()V

    return-void

    .line 160
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Invalid between begin/end."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public sort(Ljava/util/Comparator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    .line 165
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 166
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/Array;->sort(Ljava/util/Comparator;)V

    return-void

    .line 165
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Invalid between begin/end."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public swap(II)V
    .locals 1

    .line 150
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 151
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/utils/Array;->swap(II)V

    return-void

    .line 150
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Invalid between begin/end."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public truncate(I)V
    .locals 1

    .line 180
    iget v0, p0, Lcom/badlogic/gdx/utils/DelayedRemovalArray;->iterating:I

    if-gtz v0, :cond_0

    .line 181
    invoke-super {p0, p1}, Lcom/badlogic/gdx/utils/Array;->truncate(I)V

    return-void

    .line 180
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Invalid between begin/end."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
