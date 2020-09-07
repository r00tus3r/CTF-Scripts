.class public Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;
.super Ljava/lang/Object;
.source "PhysicsBodyLoader.java"


# static fields
.field public static SCALE:F


# instance fields
.field private final world:Lcom/badlogic/gdx/physics/box2d/World;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 21
    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v1, v0

    sput v1, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->world:Lcom/badlogic/gdx/physics/box2d/World;

    return-void
.end method

.method public static createBody(Lcom/badlogic/gdx/physics/box2d/World;Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;Lcom/uwsoft/editor/renderer/data/MeshVO;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 8

    .line 35
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/FixtureDef;-><init>()V

    if-eqz p1, :cond_0

    .line 38
    iget v1, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->density:F

    iput v1, v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->density:F

    .line 39
    iget v1, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->friction:F

    iput v1, v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->friction:F

    .line 40
    iget v1, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->restitution:F

    iput v1, v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->restitution:F

    .line 43
    :cond_0
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;

    invoke-direct {v1}, Lcom/badlogic/gdx/physics/box2d/BodyDef;-><init>()V

    .line 44
    iget-object v2, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 46
    iget v2, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bodyType:I

    if-nez v2, :cond_1

    .line 47
    sget-object p1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->StaticBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    iput-object p1, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    goto :goto_0

    .line 48
    :cond_1
    iget p1, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bodyType:I

    const/4 v2, 0x1

    if-ne p1, v2, :cond_2

    .line 49
    sget-object p1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->KinematicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    iput-object p1, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    goto :goto_0

    .line 51
    :cond_2
    sget-object p1, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->DynamicBody:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    iput-object p1, v1, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    .line 54
    :goto_0
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object p0

    .line 56
    new-instance p1, Lcom/badlogic/gdx/physics/box2d/PolygonShape;

    invoke-direct {p1}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 58
    :goto_1
    iget-object v3, p2, Lcom/uwsoft/editor/renderer/data/MeshVO;->minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;

    array-length v3, v3

    if-ge v2, v3, :cond_4

    .line 59
    iget-object v3, p2, Lcom/uwsoft/editor/renderer/data/MeshVO;->minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;

    aget-object v3, v3, v2

    array-length v3, v3

    mul-int/lit8 v3, v3, 0x2

    new-array v3, v3, [F

    const/4 v4, 0x0

    .line 60
    :goto_2
    array-length v5, v3

    if-ge v4, v5, :cond_3

    .line 61
    iget-object v5, p2, Lcom/uwsoft/editor/renderer/data/MeshVO;->minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;

    aget-object v5, v5, v2

    div-int/lit8 v6, v4, 0x2

    aget-object v5, v5, v6

    iget v5, v5, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v7, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v5, v5, v7

    sget v7, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v5, v5, v7

    aput v5, v3, v4

    add-int/lit8 v5, v4, 0x1

    .line 62
    iget-object v7, p2, Lcom/uwsoft/editor/renderer/data/MeshVO;->minPolygonData:[[Lcom/badlogic/gdx/math/Vector2;

    aget-object v7, v7, v2

    aget-object v6, v7, v6

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v7, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v6, v6, v7

    sget v7, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    mul-float v6, v6, v7

    aput v6, v3, v5

    add-int/lit8 v4, v4, 0x2

    goto :goto_2

    .line 64
    :cond_3
    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->set([F)V

    .line 65
    iput-object p1, v0, Lcom/badlogic/gdx/physics/box2d/FixtureDef;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    .line 66
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/physics/box2d/Body;->createFixture(Lcom/badlogic/gdx/physics/box2d/FixtureDef;)Lcom/badlogic/gdx/physics/box2d/Fixture;

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    return-object p0
.end method


# virtual methods
.method public createBody(Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;Lcom/uwsoft/editor/renderer/data/MeshVO;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-static {v0, p1, p2, p3}, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->createBody(Lcom/badlogic/gdx/physics/box2d/World;Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;Lcom/uwsoft/editor/renderer/data/MeshVO;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object p1

    return-object p1
.end method
