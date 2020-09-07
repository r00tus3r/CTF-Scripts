.class Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;
.super Ljava/lang/Object;
.source "ObjectIntMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/ObjectIntMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MapIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field currentIndex:I

.field public hasNext:Z

.field final map:Lcom/badlogic/gdx/utils/ObjectIntMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectIntMap<",
            "TK;>;"
        }
    .end annotation
.end field

.field nextIndex:I

.field valid:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/ObjectIntMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ObjectIntMap<",
            "TK;>;)V"
        }
    .end annotation

    .line 653
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 651
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->valid:Z

    .line 654
    iput-object p1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    .line 655
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->reset()V

    return-void
.end method


# virtual methods
.method findNextIndex()V
    .locals 4

    const/4 v0, 0x0

    .line 665
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->hasNext:Z

    .line 666
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    .line 667
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    iget-object v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget v2, v2, Lcom/badlogic/gdx/utils/ObjectIntMap;->stashSize:I

    add-int/2addr v1, v2

    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->nextIndex:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->nextIndex:I

    if-ge v2, v1, :cond_1

    .line 668
    iget v2, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->nextIndex:I

    aget-object v2, v0, v2

    if-eqz v2, :cond_0

    .line 669
    iput-boolean v3, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->hasNext:Z

    :cond_1
    return-void
.end method

.method public remove()V
    .locals 3

    .line 676
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->currentIndex:I

    if-ltz v0, :cond_1

    .line 677
    iget-object v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/ObjectIntMap;->capacity:I

    if-lt v0, v1, :cond_0

    .line 678
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->currentIndex:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/ObjectIntMap;->removeStashIndex(I)V

    .line 679
    iget v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->currentIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->nextIndex:I

    .line 680
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->findNextIndex()V

    goto :goto_0

    .line 682
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->keyTable:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->currentIndex:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    :goto_0
    const/4 v0, -0x1

    .line 684
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->currentIndex:I

    .line 685
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->map:Lcom/badlogic/gdx/utils/ObjectIntMap;

    iget v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/ObjectIntMap;->size:I

    return-void

    .line 676
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next must be called before remove."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, -0x1

    .line 659
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->currentIndex:I

    .line 660
    iput v0, p0, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->nextIndex:I

    .line 661
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ObjectIntMap$MapIterator;->findNextIndex()V

    return-void
.end method
