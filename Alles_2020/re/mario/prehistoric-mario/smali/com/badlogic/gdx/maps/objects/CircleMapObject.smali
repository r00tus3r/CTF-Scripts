.class public Lcom/badlogic/gdx/maps/objects/CircleMapObject;
.super Lcom/badlogic/gdx/maps/MapObject;
.source "CircleMapObject.java"


# instance fields
.field private circle:Lcom/badlogic/gdx/math/Circle;


# direct methods
.method public constructor <init>()V
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 34
    invoke-direct {p0, v0, v0, v1}, Lcom/badlogic/gdx/maps/objects/CircleMapObject;-><init>(FFF)V

    return-void
.end method

.method public constructor <init>(FFF)V
    .locals 1

    .line 43
    invoke-direct {p0}, Lcom/badlogic/gdx/maps/MapObject;-><init>()V

    .line 44
    new-instance v0, Lcom/badlogic/gdx/math/Circle;

    invoke-direct {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Circle;-><init>(FFF)V

    iput-object v0, p0, Lcom/badlogic/gdx/maps/objects/CircleMapObject;->circle:Lcom/badlogic/gdx/math/Circle;

    return-void
.end method


# virtual methods
.method public getCircle()Lcom/badlogic/gdx/math/Circle;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/badlogic/gdx/maps/objects/CircleMapObject;->circle:Lcom/badlogic/gdx/math/Circle;

    return-object v0
.end method
