.class public Lcom/badlogic/gdx/physics/box2d/WorldManifold;
.super Ljava/lang/Object;
.source "WorldManifold.java"


# instance fields
.field protected final normal:Lcom/badlogic/gdx/math/Vector2;

.field protected numContactPoints:I

.field protected final points:[Lcom/badlogic/gdx/math/Vector2;

.field protected final separations:[F


# direct methods
.method protected constructor <init>()V
    .locals 4

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->normal:Lcom/badlogic/gdx/math/Vector2;

    const/4 v0, 0x2

    .line 24
    new-array v1, v0, [Lcom/badlogic/gdx/math/Vector2;

    new-instance v2, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->points:[Lcom/badlogic/gdx/math/Vector2;

    .line 25
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->separations:[F

    return-void
.end method


# virtual methods
.method public getNormal()Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->normal:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getNumberOfContactPoints()I
    .locals 1

    .line 50
    iget v0, p0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->numContactPoints:I

    return v0
.end method

.method public getPoints()[Lcom/badlogic/gdx/math/Vector2;
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->points:[Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getSeparations()[F
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->separations:[F

    return-object v0
.end method
