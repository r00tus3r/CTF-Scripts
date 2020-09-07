.class public Lcom/badlogic/gdx/utils/SortedIntList;
.super Ljava/lang/Object;
.source "SortedIntList.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/utils/SortedIntList$NodePool;,
        Lcom/badlogic/gdx/utils/SortedIntList$Node;,
        Lcom/badlogic/gdx/utils/SortedIntList$Iterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/SortedIntList$Node<",
        "TE;>;>;"
    }
.end annotation


# instance fields
.field first:Lcom/badlogic/gdx/utils/SortedIntList$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/SortedIntList$Node<",
            "TE;>;"
        }
    .end annotation
.end field

.field private iterator:Lcom/badlogic/gdx/utils/SortedIntList$Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/SortedIntList<",
            "TE;>.Iterator;"
        }
    .end annotation
.end field

.field private nodePool:Lcom/badlogic/gdx/utils/SortedIntList$NodePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/SortedIntList$NodePool<",
            "TE;>;"
        }
    .end annotation
.end field

.field size:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/badlogic/gdx/utils/SortedIntList$NodePool;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/SortedIntList$NodePool;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->nodePool:Lcom/badlogic/gdx/utils/SortedIntList$NodePool;

    const/4 v0, 0x0

    .line 25
    iput v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .line 91
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-eqz v0, :cond_0

    .line 92
    iget-object v1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->nodePool:Lcom/badlogic/gdx/utils/SortedIntList$NodePool;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/SortedIntList$NodePool;->free(Ljava/lang/Object;)V

    .line 91
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 94
    iput v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    return-void
.end method

.method public get(I)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-eqz v0, :cond_1

    .line 79
    :goto_0
    iget-object v1, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-eqz v1, :cond_0

    iget v1, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->index:I

    if-ge v1, p1, :cond_0

    .line 80
    iget-object v0, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    goto :goto_0

    .line 82
    :cond_0
    iget v1, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->index:I

    if-ne v1, p1, :cond_1

    .line 83
    iget-object p1, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->value:Ljava/lang/Object;

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method public insert(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITE;)TE;"
        }
    .end annotation

    .line 39
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 42
    :goto_0
    iget-object v2, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-eqz v2, :cond_0

    iget-object v2, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iget v2, v2, Lcom/badlogic/gdx/utils/SortedIntList$Node;->index:I

    if-gt v2, p1, :cond_0

    .line 43
    iget-object v0, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    goto :goto_0

    .line 46
    :cond_0
    iget v2, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->index:I

    if-le p1, v2, :cond_2

    .line 47
    iget-object v2, p0, Lcom/badlogic/gdx/utils/SortedIntList;->nodePool:Lcom/badlogic/gdx/utils/SortedIntList$NodePool;

    iget-object v3, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    invoke-virtual {v2, v0, v3, p2, p1}, Lcom/badlogic/gdx/utils/SortedIntList$NodePool;->obtain(Lcom/badlogic/gdx/utils/SortedIntList$Node;Lcom/badlogic/gdx/utils/SortedIntList$Node;Ljava/lang/Object;I)Lcom/badlogic/gdx/utils/SortedIntList$Node;

    move-result-object p1

    iput-object p1, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    .line 48
    iget-object p1, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iget-object p1, p1, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-eqz p1, :cond_1

    .line 49
    iget-object p1, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iget-object p1, p1, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iget-object p2, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object p2, p1, Lcom/badlogic/gdx/utils/SortedIntList$Node;->p:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    .line 51
    :cond_1
    iget p1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    goto :goto_1

    .line 54
    :cond_2
    iget v2, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->index:I

    if-ge p1, v2, :cond_3

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->nodePool:Lcom/badlogic/gdx/utils/SortedIntList$NodePool;

    iget-object v2, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    invoke-virtual {v0, v1, v2, p2, p1}, Lcom/badlogic/gdx/utils/SortedIntList$NodePool;->obtain(Lcom/badlogic/gdx/utils/SortedIntList$Node;Lcom/badlogic/gdx/utils/SortedIntList$Node;Ljava/lang/Object;I)Lcom/badlogic/gdx/utils/SortedIntList$Node;

    move-result-object p1

    .line 56
    iget-object p2, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object p1, p2, Lcom/badlogic/gdx/utils/SortedIntList$Node;->p:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    .line 57
    iput-object p1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    .line 58
    iget p1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    goto :goto_1

    .line 62
    :cond_3
    iput-object p2, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->value:Ljava/lang/Object;

    goto :goto_1

    .line 65
    :cond_4
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->nodePool:Lcom/badlogic/gdx/utils/SortedIntList$NodePool;

    invoke-virtual {v0, v1, v1, p2, p1}, Lcom/badlogic/gdx/utils/SortedIntList$NodePool;->obtain(Lcom/badlogic/gdx/utils/SortedIntList$Node;Lcom/badlogic/gdx/utils/SortedIntList$Node;Ljava/lang/Object;I)Lcom/badlogic/gdx/utils/SortedIntList$Node;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    .line 66
    iget p1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    :goto_1
    return-object v1
.end method

.method public isEmpty()Z
    .locals 1

    .line 109
    iget v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/badlogic/gdx/utils/SortedIntList$Node<",
            "TE;>;>;"
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->iterator:Lcom/badlogic/gdx/utils/SortedIntList$Iterator;

    if-nez v0, :cond_0

    .line 118
    new-instance v0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;-><init>(Lcom/badlogic/gdx/utils/SortedIntList;)V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->iterator:Lcom/badlogic/gdx/utils/SortedIntList$Iterator;

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->iterator:Lcom/badlogic/gdx/utils/SortedIntList$Iterator;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->reset()Lcom/badlogic/gdx/utils/SortedIntList$Iterator;

    move-result-object v0

    return-object v0
.end method

.method public notEmpty()Z
    .locals 1

    .line 104
    iget v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public size()I
    .locals 1

    .line 99
    iget v0, p0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    return v0
.end method
