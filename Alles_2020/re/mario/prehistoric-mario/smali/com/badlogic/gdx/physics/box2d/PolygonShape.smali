.class public Lcom/badlogic/gdx/physics/box2d/PolygonShape;
.super Lcom/badlogic/gdx/physics/box2d/Shape;
.source "PolygonShape.java"


# static fields
.field private static verts:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x2

    .line 117
    new-array v0, v0, [F

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->verts:[F

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/Shape;-><init>()V

    .line 29
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->newPolygonShape()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    return-void
.end method

.method protected constructor <init>(J)V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/Shape;-><init>()V

    .line 33
    iput-wide p1, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    return-void
.end method

.method private native jniGetVertex(JI[F)V
.end method

.method private native jniGetVertexCount(J)I
.end method

.method private native jniSet(J[FII)V
.end method

.method private native jniSetAsBox(JFF)V
.end method

.method private native jniSetAsBox(JFFFFF)V
.end method

.method private native newPolygonShape()J
.end method


# virtual methods
.method public getType()Lcom/badlogic/gdx/physics/box2d/Shape$Type;
    .locals 1

    .line 44
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Polygon:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0
.end method

.method public getVertex(ILcom/badlogic/gdx/math/Vector2;)V
    .locals 3

    .line 123
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->verts:[F

    invoke-direct {p0, v0, v1, p1, v2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->jniGetVertex(JI[F)V

    .line 124
    sget-object p1, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->verts:[F

    const/4 v0, 0x0

    aget v0, p1, v0

    iput v0, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v0, 0x1

    .line 125
    aget p1, p1, v0

    iput p1, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-void
.end method

.method public getVertexCount()I
    .locals 2

    .line 109
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->jniGetVertexCount(J)I

    move-result v0

    return v0
.end method

.method public set([F)V
    .locals 6

    .line 61
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    array-length v5, p1

    const/4 v4, 0x0

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->jniSet(J[FII)V

    return-void
.end method

.method public set([FII)V
    .locals 6

    .line 67
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->jniSet(J[FII)V

    return-void
.end method

.method public set([Lcom/badlogic/gdx/math/Vector2;)V
    .locals 7

    .line 50
    array-length v0, p1

    mul-int/lit8 v0, v0, 0x2

    new-array v4, v0, [F

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 51
    :goto_0
    array-length v2, p1

    mul-int/lit8 v2, v2, 0x2

    if-ge v0, v2, :cond_0

    .line 52
    aget-object v2, p1, v1

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v4, v0

    add-int/lit8 v2, v0, 0x1

    .line 53
    aget-object v3, p1, v1

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v3, v4, v2

    add-int/lit8 v0, v0, 0x2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 55
    :cond_0
    iget-wide v2, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    const/4 v5, 0x0

    array-length v6, v4

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->jniSet(J[FII)V

    return-void
.end method

.method public setAsBox(FF)V
    .locals 2

    .line 85
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->jniSetAsBox(JFF)V

    return-void
.end method

.method public setAsBox(FFLcom/badlogic/gdx/math/Vector2;F)V
    .locals 8

    .line 99
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->addr:J

    iget v5, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v6, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v7, p4

    invoke-direct/range {v0 .. v7}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;->jniSetAsBox(JFFFFF)V

    return-void
.end method
