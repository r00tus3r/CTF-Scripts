.class public Lcom/badlogic/gdx/maps/MapLayers;
.super Ljava/lang/Object;
.source "MapLayers.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/maps/MapLayer;",
        ">;"
    }
.end annotation


# instance fields
.field private layers:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/maps/MapLayer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method


# virtual methods
.method public add(Lcom/badlogic/gdx/maps/MapLayer;)V
    .locals 1

    .line 63
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-void
.end method

.method public get(I)Lcom/badlogic/gdx/maps/MapLayer;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/maps/MapLayer;

    return-object p1
.end method

.method public get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;
    .locals 4

    .line 37
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 38
    iget-object v2, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/MapLayer;

    .line 39
    invoke-virtual {v2}, Lcom/badlogic/gdx/maps/MapLayer;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getByType(Ljava/lang/Class;)Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/badlogic/gdx/maps/MapLayer;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 84
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/maps/MapLayers;->getByType(Ljava/lang/Class;Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getByType(Ljava/lang/Class;Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/badlogic/gdx/maps/MapLayer;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 91
    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 92
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 93
    iget-object v2, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/MapLayer;

    .line 94
    invoke-static {p1, v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->isInstance(Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 95
    invoke-virtual {p2, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p2
.end method

.method public getCount()I
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    return v0
.end method

.method public getIndex(Lcom/badlogic/gdx/maps/MapLayer;)I
    .locals 2

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result p1

    return p1
.end method

.method public getIndex(Ljava/lang/String;)I
    .locals 0

    .line 48
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/maps/MapLayers;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapLayer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/maps/MapLayers;->getIndex(Lcom/badlogic/gdx/maps/MapLayer;)I

    move-result p1

    return p1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/badlogic/gdx/maps/MapLayer;",
            ">;"
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(I)V
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    return-void
.end method

.method public remove(Lcom/badlogic/gdx/maps/MapLayer;)V
    .locals 2

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    return-void
.end method

.method public size()I
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapLayers;->layers:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    return v0
.end method
