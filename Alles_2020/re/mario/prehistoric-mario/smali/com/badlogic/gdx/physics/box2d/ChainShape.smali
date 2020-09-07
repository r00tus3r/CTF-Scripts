.class public Lcom/badlogic/gdx/physics/box2d/ChainShape;
.super Lcom/badlogic/gdx/physics/box2d/Shape;
.source "ChainShape.java"


# static fields
.field private static verts:[F


# instance fields
.field isLooped:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x2

    .line 159
    new-array v0, v0, [F

    sput-object v0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->verts:[F

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/Shape;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    .line 29
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->newChainShape()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    return-void
.end method

.method constructor <init>(J)V
    .locals 1

    .line 36
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/Shape;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    .line 37
    iput-wide p1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    return-void
.end method

.method private native jniCreateChain(J[FII)V
.end method

.method private native jniCreateLoop(J[FII)V
.end method

.method private native jniGetVertex(JI[F)V
.end method

.method private native jniGetVertexCount(J)I
.end method

.method private native jniSetNextVertex(JFF)V
.end method

.method private native jniSetPrevVertex(JFF)V
.end method

.method private native newChainShape()J
.end method


# virtual methods
.method public createChain([F)V
    .locals 6

    .line 85
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    array-length v0, p1

    div-int/lit8 v5, v0, 0x2

    const/4 v4, 0x0

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniCreateChain(J[FII)V

    const/4 p1, 0x0

    .line 86
    iput-boolean p1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    return-void
.end method

.method public createChain([FII)V
    .locals 6

    .line 94
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    div-int/lit8 v5, p3, 0x2

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniCreateChain(J[FII)V

    const/4 p1, 0x0

    .line 95
    iput-boolean p1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    return-void
.end method

.method public createChain([Lcom/badlogic/gdx/math/Vector2;)V
    .locals 7

    .line 101
    array-length v0, p1

    mul-int/lit8 v0, v0, 0x2

    new-array v4, v0, [F

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 102
    :goto_0
    array-length v3, p1

    mul-int/lit8 v3, v3, 0x2

    if-ge v1, v3, :cond_0

    .line 103
    aget-object v3, p1, v2

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v3, v4, v1

    add-int/lit8 v3, v1, 0x1

    .line 104
    aget-object v5, p1, v2

    iget v5, v5, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v5, v4, v3

    add-int/lit8 v1, v1, 0x2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 106
    :cond_0
    iget-wide v2, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    const/4 v5, 0x0

    array-length v6, p1

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniCreateChain(J[FII)V

    .line 107
    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    return-void
.end method

.method public createLoop([F)V
    .locals 6

    .line 48
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    array-length v0, p1

    div-int/lit8 v5, v0, 0x2

    const/4 v4, 0x0

    move-object v0, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniCreateLoop(J[FII)V

    const/4 p1, 0x1

    .line 49
    iput-boolean p1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    return-void
.end method

.method public createLoop([FII)V
    .locals 6

    .line 57
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    div-int/lit8 v5, p3, 0x2

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniCreateLoop(J[FII)V

    const/4 p1, 0x1

    .line 58
    iput-boolean p1, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    return-void
.end method

.method public createLoop([Lcom/badlogic/gdx/math/Vector2;)V
    .locals 8

    .line 64
    array-length v0, p1

    mul-int/lit8 v0, v0, 0x2

    new-array v4, v0, [F

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 65
    :goto_0
    array-length v2, p1

    mul-int/lit8 v2, v2, 0x2

    const/4 v7, 0x1

    if-ge v0, v2, :cond_0

    .line 66
    aget-object v2, p1, v1

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    aput v2, v4, v0

    add-int/lit8 v2, v0, 0x1

    .line 67
    aget-object v3, p1, v1

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->y:F

    aput v3, v4, v2

    add-int/lit8 v0, v0, 0x2

    add-int/2addr v1, v7

    goto :goto_0

    .line 69
    :cond_0
    iget-wide v2, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    const/4 v5, 0x0

    array-length p1, v4

    div-int/lit8 v6, p1, 0x2

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniCreateLoop(J[FII)V

    .line 70
    iput-boolean v7, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    return-void
.end method

.method public getType()Lcom/badlogic/gdx/physics/box2d/Shape$Type;
    .locals 1

    .line 42
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Chain:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0
.end method

.method public getVertex(ILcom/badlogic/gdx/math/Vector2;)V
    .locals 3

    .line 165
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/ChainShape;->verts:[F

    invoke-direct {p0, v0, v1, p1, v2}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniGetVertex(JI[F)V

    .line 166
    sget-object p1, Lcom/badlogic/gdx/physics/box2d/ChainShape;->verts:[F

    const/4 v0, 0x0

    aget v0, p1, v0

    iput v0, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v0, 0x1

    .line 167
    aget p1, p1, v0

    iput p1, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-void
.end method

.method public getVertexCount()I
    .locals 2

    .line 151
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniGetVertexCount(J)I

    move-result v0

    return v0
.end method

.method public isLooped()Z
    .locals 1

    .line 178
    iget-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->isLooped:Z

    return v0
.end method

.method public setNextVertex(FF)V
    .locals 2

    .line 141
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniSetNextVertex(JFF)V

    return-void
.end method

.method public setNextVertex(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 1

    .line 136
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->setNextVertex(FF)V

    return-void
.end method

.method public setPrevVertex(FF)V
    .locals 2

    .line 126
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/ChainShape;->addr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->jniSetPrevVertex(JFF)V

    return-void
.end method

.method public setPrevVertex(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 1

    .line 121
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/physics/box2d/ChainShape;->setPrevVertex(FF)V

    return-void
.end method
