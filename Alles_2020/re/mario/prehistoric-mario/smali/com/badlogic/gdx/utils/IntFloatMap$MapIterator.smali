.class Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;
.super Ljava/lang/Object;
.source "IntFloatMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IntFloatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MapIterator"
.end annotation


# static fields
.field static final INDEX_ILLEGAL:I = -0x2

.field static final INDEX_ZERO:I = -0x1


# instance fields
.field currentIndex:I

.field public hasNext:Z

.field final map:Lcom/badlogic/gdx/utils/IntFloatMap;

.field nextIndex:I

.field valid:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IntFloatMap;)V
    .locals 1

    .line 717
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 715
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->valid:Z

    .line 718
    iput-object p1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    .line 719
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->reset()V

    return-void
.end method


# virtual methods
.method findNextIndex()V
    .locals 4

    const/4 v0, 0x0

    .line 732
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->hasNext:Z

    .line 733
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    .line 734
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget v2, v2, Lcom/badlogic/gdx/utils/IntFloatMap;->stashSize:I

    add-int/2addr v1, v2

    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->nextIndex:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->nextIndex:I

    if-ge v2, v1, :cond_1

    .line 735
    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->nextIndex:I

    aget v2, v0, v2

    if-eqz v2, :cond_0

    .line 736
    iput-boolean v3, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->hasNext:Z

    :cond_1
    return-void
.end method

.method public remove()V
    .locals 3

    .line 743
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->currentIndex:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    if-eqz v0, :cond_0

    .line 744
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iput-boolean v1, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    goto :goto_0

    .line 745
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->currentIndex:I

    if-ltz v0, :cond_2

    .line 747
    iget-object v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget v2, v2, Lcom/badlogic/gdx/utils/IntFloatMap;->capacity:I

    if-lt v0, v2, :cond_1

    .line 748
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget v1, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->currentIndex:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IntFloatMap;->removeStashIndex(I)V

    .line 749
    iget v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->currentIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->nextIndex:I

    .line 750
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->findNextIndex()V

    goto :goto_0

    .line 752
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->keyTable:[I

    iget v2, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->currentIndex:I

    aput v1, v0, v2

    :goto_0
    const/4 v0, -0x2

    .line 754
    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->currentIndex:I

    .line 755
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget v1, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->size:I

    return-void

    .line 746
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next must be called before remove."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, -0x2

    .line 723
    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->currentIndex:I

    const/4 v0, -0x1

    .line 724
    iput v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->nextIndex:I

    .line 725
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IntFloatMap;

    iget-boolean v0, v0, Lcom/badlogic/gdx/utils/IntFloatMap;->hasZeroValue:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 726
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->hasNext:Z

    goto :goto_0

    .line 728
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IntFloatMap$MapIterator;->findNextIndex()V

    :goto_0
    return-void
.end method
