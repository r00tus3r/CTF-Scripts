.class abstract Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;
.super Ljava/lang/Object;
.source "IdentityMap.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/IdentityMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "MapIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        "I:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "TI;>;",
        "Ljava/util/Iterator<",
        "TI;>;"
    }
.end annotation


# instance fields
.field currentIndex:I

.field public hasNext:Z

.field final map:Lcom/badlogic/gdx/utils/IdentityMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/IdentityMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field nextIndex:I

.field valid:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/IdentityMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/IdentityMap<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 674
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 672
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->valid:Z

    .line 675
    iput-object p1, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    .line 676
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->reset()V

    return-void
.end method


# virtual methods
.method findNextIndex()V
    .locals 4

    const/4 v0, 0x0

    .line 686
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->hasNext:Z

    .line 687
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    .line 688
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    iget-object v2, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget v2, v2, Lcom/badlogic/gdx/utils/IdentityMap;->stashSize:I

    add-int/2addr v1, v2

    :cond_0
    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->nextIndex:I

    const/4 v3, 0x1

    add-int/2addr v2, v3

    iput v2, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->nextIndex:I

    if-ge v2, v1, :cond_1

    .line 689
    iget v2, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->nextIndex:I

    aget-object v2, v0, v2

    if-eqz v2, :cond_0

    .line 690
    iput-boolean v3, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->hasNext:Z

    :cond_1
    return-void
.end method

.method public remove()V
    .locals 3

    .line 697
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->currentIndex:I

    if-ltz v0, :cond_1

    .line 698
    iget-object v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/IdentityMap;->capacity:I

    if-lt v0, v1, :cond_0

    .line 699
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->currentIndex:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/IdentityMap;->removeStashIndex(I)V

    .line 700
    iget v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->currentIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->nextIndex:I

    .line 701
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->findNextIndex()V

    goto :goto_0

    .line 703
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IdentityMap;->keyTable:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->currentIndex:I

    const/4 v2, 0x0

    aput-object v2, v0, v1

    .line 704
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget-object v0, v0, Lcom/badlogic/gdx/utils/IdentityMap;->valueTable:[Ljava/lang/Object;

    iget v1, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->currentIndex:I

    aput-object v2, v0, v1

    :goto_0
    const/4 v0, -0x1

    .line 706
    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->currentIndex:I

    .line 707
    iget-object v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->map:Lcom/badlogic/gdx/utils/IdentityMap;

    iget v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/badlogic/gdx/utils/IdentityMap;->size:I

    return-void

    .line 697
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next must be called before remove."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 1

    const/4 v0, -0x1

    .line 680
    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->currentIndex:I

    .line 681
    iput v0, p0, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->nextIndex:I

    .line 682
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/IdentityMap$MapIterator;->findNextIndex()V

    return-void
.end method
