.class Lcom/badlogic/gdx/utils/SortedIntList$Iterator;
.super Ljava/lang/Object;
.source "SortedIntList.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/SortedIntList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Iterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Lcom/badlogic/gdx/utils/SortedIntList$Node<",
        "TE;>;>;"
    }
.end annotation


# instance fields
.field private position:Lcom/badlogic/gdx/utils/SortedIntList$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/SortedIntList$Node<",
            "TE;>;"
        }
    .end annotation
.end field

.field private previousPosition:Lcom/badlogic/gdx/utils/SortedIntList$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/SortedIntList$Node<",
            "TE;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/badlogic/gdx/utils/SortedIntList;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/utils/SortedIntList;)V
    .locals 0

    .line 123
    iput-object p1, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->this$0:Lcom/badlogic/gdx/utils/SortedIntList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->position:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public next()Lcom/badlogic/gdx/utils/SortedIntList$Node;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/SortedIntList$Node<",
            "TE;>;"
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->position:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->previousPosition:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    .line 135
    iget-object v0, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->position:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    .line 136
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->previousPosition:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    return-object v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 123
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->next()Lcom/badlogic/gdx/utils/SortedIntList$Node;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 142
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->previousPosition:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-eqz v0, :cond_2

    .line 144
    iget-object v1, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->this$0:Lcom/badlogic/gdx/utils/SortedIntList;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-ne v0, v1, :cond_0

    .line 145
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->this$0:Lcom/badlogic/gdx/utils/SortedIntList;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->position:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object v1, v0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    goto :goto_0

    .line 149
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->previousPosition:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->p:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->position:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object v1, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->n:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    if-eqz v1, :cond_1

    .line 151
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->previousPosition:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/SortedIntList$Node;->p:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object v0, v1, Lcom/badlogic/gdx/utils/SortedIntList$Node;->p:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    .line 154
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->this$0:Lcom/badlogic/gdx/utils/SortedIntList;

    iget v1, v0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/SortedIntList;->size:I

    :cond_2
    return-void
.end method

.method public reset()Lcom/badlogic/gdx/utils/SortedIntList$Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/SortedIntList<",
            "TE;>.Iterator;"
        }
    .end annotation

    .line 159
    iget-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->this$0:Lcom/badlogic/gdx/utils/SortedIntList;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/SortedIntList;->first:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    iput-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->position:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    const/4 v0, 0x0

    .line 160
    iput-object v0, p0, Lcom/badlogic/gdx/utils/SortedIntList$Iterator;->previousPosition:Lcom/badlogic/gdx/utils/SortedIntList$Node;

    return-object p0
.end method
