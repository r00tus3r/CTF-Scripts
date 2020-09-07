.class public Lcom/badlogic/gdx/maps/MapObjects;
.super Ljava/lang/Object;
.source "MapObjects.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Lcom/badlogic/gdx/maps/MapObject;",
        ">;"
    }
.end annotation


# instance fields
.field private objects:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/maps/MapObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method


# virtual methods
.method public add(Lcom/badlogic/gdx/maps/MapObject;)V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-void
.end method

.method public get(I)Lcom/badlogic/gdx/maps/MapObject;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/maps/MapObject;

    return-object p1
.end method

.method public get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapObject;
    .locals 4

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 44
    iget-object v2, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/MapObject;

    .line 45
    invoke-virtual {v2}, Lcom/badlogic/gdx/maps/MapObject;->getName()Ljava/lang/String;

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
            "Lcom/badlogic/gdx/maps/MapObject;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 85
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/maps/MapObjects;->getByType(Ljava/lang/Class;Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getByType(Ljava/lang/Class;Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/utils/Array;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/badlogic/gdx/maps/MapObject;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "TT;>;"
        }
    .end annotation

    .line 92
    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 93
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 94
    iget-object v2, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/maps/MapObject;

    .line 95
    invoke-static {p1, v2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->isInstance(Ljava/lang/Class;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 96
    invoke-virtual {p2, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p2
.end method

.method public getCount()I
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    return v0
.end method

.method public getIndex(Lcom/badlogic/gdx/maps/MapObject;)I
    .locals 2

    .line 59
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result p1

    return p1
.end method

.method public getIndex(Ljava/lang/String;)I
    .locals 0

    .line 54
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/maps/MapObjects;->get(Ljava/lang/String;)Lcom/badlogic/gdx/maps/MapObject;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/maps/MapObjects;->getIndex(Lcom/badlogic/gdx/maps/MapObject;)I

    move-result p1

    return p1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/badlogic/gdx/maps/MapObject;",
            ">;"
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(I)V
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    return-void
.end method

.method public remove(Lcom/badlogic/gdx/maps/MapObject;)V
    .locals 2

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/maps/MapObjects;->objects:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    return-void
.end method
