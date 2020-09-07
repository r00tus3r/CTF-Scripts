.class Lcom/badlogic/gdx/utils/IntMap$MapIterator;
.super Ljava/lang/Object;
.source "IntMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IntMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MapIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final INDEX_ILLEGAL:I = -0x2

.field static final INDEX_ZERO:I = -0x1


# instance fields
.field currentIndex:I

.field public hasNext:Z

.field final map:Lcom/badlogic/gdx/utils/IntMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/IntMap<",
            "TV;>;"
        }
    .end annotation
.end field

.field nextIndex:I

.field valid:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IntMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/IntMap<",
            "TV;>;)V"
        }
    .end annotation

    .line 749
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 747
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->valid:Z

    .line 750
    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    .line 751
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->reset()V

    return-void
.end method


# virtual methods
.method findNextIndex()V
    .locals 4

    const/4 v0, 0x0

    .line 764
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->hasNext:Z

    .line 765
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    .line 766
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget v2, v2, Lcom/badlogic/gdx/utils/IntMap;->stashSize:I

    add-int/2addr v1, v2

    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->nextIndex:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->nextIndex:I

    if-ge v2, v1, :cond_1

    .line 767
    iget v2, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->nextIndex:I

    aget v2, v0, v2

    if-eqz v2, :cond_0

    .line 768
    iput-boolean v3, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->hasNext:Z

    :cond_1
    return-void
.end method

.method public remove()V
    .locals 4

    .line 775
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->currentIndex:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-eqz v0, :cond_0

    .line 776
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iput-object v2, v0, Lcom/badlogic/gdx/utils/IntMap;->zeroValue:Ljava/lang/Object;

    .line 777
    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    goto :goto_0

    .line 778
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->currentIndex:I

    if-ltz v0, :cond_2

    .line 780
    iget-object v3, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget v3, v3, Lcom/badlogic/gdx/utils/IntMap;->capacity:I

    if-lt v0, v3, :cond_1

    .line 781
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->currentIndex:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntMap;->removeStashIndex(I)V

    .line 782
    iget v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->currentIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->nextIndex:I

    .line 783
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->findNextIndex()V

    goto :goto_0

    .line 785
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntMap;->keyTable:[I

    iget v3, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->currentIndex:I

    aput v1, v0, v3

    .line 786
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntMap;->valueTable:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->currentIndex:I

    aput-object v2, v0, v1

    :goto_0
    const/4 v0, -0x2

    .line 788
    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->currentIndex:I

    .line 789
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget v1, v0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/IntMap;->size:I

    return-void

    .line 779
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next must be called before remove."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, -0x2

    .line 755
    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->currentIndex:I

    const/4 v0, -0x1

    .line 756
    iput v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->nextIndex:I

    .line 757
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntMap;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntMap;->hasZeroValue:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 758
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->hasNext:Z

    goto :goto_0

    .line 760
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntMap$MapIterator;->findNextIndex()V

    :goto_0
    return-void
.end method
