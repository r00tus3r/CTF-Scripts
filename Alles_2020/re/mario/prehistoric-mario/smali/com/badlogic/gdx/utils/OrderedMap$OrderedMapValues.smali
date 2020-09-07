.class public Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;
.super Lcom/badlogic/gdx/utils/ObjectMap$Values;
.source "OrderedMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/utils/OrderedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OrderedMapValues"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/badlogic/gdx/utils/ObjectMap$Values<",
        "TV;>;"
    }
.end annotation


# instance fields
.field private keys:Lcom/badlogic/gdx/utils/Array;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/utils/OrderedMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/OrderedMap<",
            "*TV;>;)V"
        }
    .end annotation

    .line 228
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/utils/ObjectMap$Values;-><init>(Lcom/badlogic/gdx/utils/ObjectMap;)V

    .line 229
    iget-object p1, p1, Lcom/badlogic/gdx/utils/OrderedMap;->keys:Lcom/badlogic/gdx/utils/Array;

    iput-object p1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->keys:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method


# virtual methods
.method public next()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 238
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->hasNext:Z

    if-eqz v0, :cond_2

    .line 239
    iget-boolean v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->valid:Z

    if-eqz v0, :cond_1

    .line 240
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->map:Lcom/badlogic/gdx/utils/ObjectMap;

    iget-object v1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->keys:Lcom/badlogic/gdx/utils/Array;

    iget v2, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->nextIndex:I

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 241
    iget v1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->nextIndex:I

    iput v1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->currentIndex:I

    .line 242
    iget v1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->nextIndex:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->nextIndex:I

    .line 243
    iget v1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->nextIndex:I

    iget-object v3, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->map:Lcom/badlogic/gdx/utils/ObjectMap;

    iget v3, v3, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    if-ge v1, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->hasNext:Z

    return-object v0

    .line 239
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "#iterator() cannot be used nested."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 238
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public remove()V
    .locals 2

    .line 248
    iget v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->currentIndex:I

    if-ltz v0, :cond_0

    .line 249
    iget-object v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->map:Lcom/badlogic/gdx/utils/ObjectMap;

    check-cast v0, Lcom/badlogic/gdx/utils/OrderedMap;

    iget v1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->currentIndex:I

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/OrderedMap;->removeIndex(I)Ljava/lang/Object;

    .line 250
    iget v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->currentIndex:I

    iput v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->nextIndex:I

    const/4 v0, -0x1

    .line 251
    iput v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->currentIndex:I

    return-void

    .line 248
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "next must be called before remove."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public reset()V
    .locals 2

    const/4 v0, 0x0

    .line 233
    iput v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->nextIndex:I

    .line 234
    iget-object v1, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->map:Lcom/badlogic/gdx/utils/ObjectMap;

    iget v1, v1, Lcom/badlogic/gdx/utils/ObjectMap;->size:I

    if-lez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/badlogic/gdx/utils/OrderedMap$OrderedMapValues;->hasNext:Z

    return-void
.end method
