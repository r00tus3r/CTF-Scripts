.class public Lcom/badlogic/gdx/physics/box2d/CircleShape;
.super Lcom/badlogic/gdx/physics/box2d/Shape;
.source "CircleShape.java"


# instance fields
.field private final position:Lcom/badlogic/gdx/math/Vector2;

.field private final tmp:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 29
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/Shape;-><init>()V

    const/4 v0, 0x2

    .line 48
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->tmp:[F

    .line 49
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->position:Lcom/badlogic/gdx/math/Vector2;

    .line 30
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/CircleShape;->newCircleShape()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->addr:J

    return-void
.end method

.method protected constructor <init>(J)V
    .locals 1

    .line 37
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/Shape;-><init>()V

    const/4 v0, 0x2

    .line 48
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->tmp:[F

    .line 49
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->position:Lcom/badlogic/gdx/math/Vector2;

    .line 38
    iput-wide p1, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->addr:J

    return-void
.end method

.method private native jniGetPosition(J[F)V
.end method

.method private native jniSetPosition(JFF)V
.end method

.method private native newCircleShape()J
.end method


# virtual methods
.method public getPosition()Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .line 52
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/CircleShape;->jniGetPosition(J[F)V

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->position:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    iput v2, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v2, 0x1

    .line 54
    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object v0
.end method

.method public getType()Lcom/badlogic/gdx/physics/box2d/Shape$Type;
    .locals 1

    .line 44
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Circle:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 3

    .line 66
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/CircleShape;->addr:J

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/badlogic/gdx/physics/box2d/CircleShape;->jniSetPosition(JFF)V

    return-void
.end method
