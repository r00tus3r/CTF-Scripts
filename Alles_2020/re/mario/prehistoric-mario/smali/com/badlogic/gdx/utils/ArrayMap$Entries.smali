.class public Lcom/badlogic/gdx/utils/ArrayMap$Entries;
.super Ljava/lang/Object;
.source "ArrayMap.java"

# interfaces
.implements Ljava/lang/Iterable;
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/ArrayMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Entries"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
        "TK;TV;>;>;",
        "Ljava/util/Iterator<",
        "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field index:I

.field private final map:Lcom/badlogic/gdx/utils/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ArrayMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field valid:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/ArrayMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/ArrayMap<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 561
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 557
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap$Entry;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    const/4 v0, 0x1

    .line 559
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->valid:Z

    .line 562
    iput-object p1, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->map:Lcom/badlogic/gdx/utils/ArrayMap;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 566
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->valid:Z

    if-eqz v0, :cond_1

    .line 567
    iget v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->map:Lcom/badlogic/gdx/utils/ArrayMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/ArrayMap;->size:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 566
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    return-object p0
.end method

.method public next()Lcom/badlogic/gdx/utils/ObjectMap$Entry;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 576
    iget v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->map:Lcom/badlogic/gdx/utils/ArrayMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/ArrayMap;->size:I

    if-ge v0, v1, :cond_1

    .line 577
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->valid:Z

    if-eqz v0, :cond_0

    .line 578
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->map:Lcom/badlogic/gdx/utils/ArrayMap;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/ArrayMap;->keys:[Ljava/lang/Object;

    iget v2, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    aget-object v1, v1, v2

    iput-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    .line 579
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->map:Lcom/badlogic/gdx/utils/ArrayMap;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/ArrayMap;->values:[Ljava/lang/Object;

    iget v2, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    aget-object v1, v1, v2

    iput-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    .line 580
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->entry:Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    return-object v0

    .line 577
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 576
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    iget v1, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 555
    invoke-virtual {p0}, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->next()Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    move-result-object v0

    return-object v0
.end method

.method public remove()V
    .locals 2

    .line 584
    iget v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    .line 585
    iget-object v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->map:Lcom/badlogic/gdx/utils/ArrayMap;

    iget v1, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/ArrayMap;->removeIndex(I)V

    return-void
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x0

    .line 589
    iput v0, p0, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->index:I

    return-void
.end method
