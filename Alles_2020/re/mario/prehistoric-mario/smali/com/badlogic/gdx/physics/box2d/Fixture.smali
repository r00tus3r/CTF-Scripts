.class public Lcom/badlogic/gdx/physics/box2d/Fixture;
.super Ljava/lang/Object;
.source "Fixture.java"


# instance fields
.field protected addr:J

.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private final filter:Lcom/badlogic/gdx/physics/box2d/Filter;

.field protected shape:Lcom/badlogic/gdx/physics/box2d/Shape;

.field private final tmp:[S

.field protected userData:Ljava/lang/Object;


# direct methods
.method protected constructor <init>(Lcom/badlogic/gdx/physics/box2d/Body;J)V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x3

    .line 156
    new-array v0, v0, [S

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->tmp:[S

    .line 157
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Filter;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/Filter;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->filter:Lcom/badlogic/gdx/physics/box2d/Filter;

    .line 43
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 44
    iput-wide p2, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    return-void
.end method

.method private native jniGetDensity(J)F
.end method

.method private native jniGetFilterData(J[S)V
.end method

.method private native jniGetFriction(J)F
.end method

.method private native jniGetRestitution(J)F
.end method

.method private native jniGetShape(J)J
.end method

.method private native jniGetType(J)I
.end method

.method private native jniIsSensor(J)Z
.end method

.method private native jniRefilter(J)V
.end method

.method private native jniSetDensity(JF)V
.end method

.method private native jniSetFilterData(JSSS)V
.end method

.method private native jniSetFriction(JF)V
.end method

.method private native jniSetRestitution(JF)V
.end method

.method private native jniSetSensor(JZ)V
.end method

.method private native jniTestPoint(JFF)Z
.end method


# virtual methods
.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getDensity()F
    .locals 2

    .line 246
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniGetDensity(J)F

    move-result v0

    return v0
.end method

.method public getFilterData()Lcom/badlogic/gdx/physics/box2d/Filter;
    .locals 3

    .line 160
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->tmp:[S

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniGetFilterData(J[S)V

    .line 161
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->filter:Lcom/badlogic/gdx/physics/box2d/Filter;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->tmp:[S

    const/4 v2, 0x0

    aget-short v2, v1, v2

    iput-short v2, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    const/4 v2, 0x1

    .line 162
    aget-short v2, v1, v2

    iput-short v2, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    const/4 v2, 0x2

    .line 163
    aget-short v1, v1, v2

    iput-short v1, v0, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    return-object v0
.end method

.method public getFriction()F
    .locals 2

    .line 256
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniGetFriction(J)F

    move-result v0

    return v0
.end method

.method public getRestitution()F
    .locals 2

    .line 276
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniGetRestitution(J)F

    move-result v0

    return v0
.end method

.method public getShape()Lcom/badlogic/gdx/physics/box2d/Shape;
    .locals 5

    .line 88
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    if-nez v0, :cond_5

    .line 89
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniGetShape(J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_4

    .line 91
    invoke-static {v0, v1}, Lcom/badlogic/gdx/physics/box2d/Shape;->jniGetType(J)I

    move-result v2

    if-eqz v2, :cond_3

    const/4 v3, 0x1

    if-eq v2, v3, :cond_2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_1

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    .line 104
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/ChainShape;

    invoke-direct {v2, v0, v1}, Lcom/badlogic/gdx/physics/box2d/ChainShape;-><init>(J)V

    iput-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    goto :goto_0

    .line 107
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Unknown shape type!"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_1
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/PolygonShape;

    invoke-direct {v2, v0, v1}, Lcom/badlogic/gdx/physics/box2d/PolygonShape;-><init>(J)V

    iput-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    goto :goto_0

    .line 98
    :cond_2
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/EdgeShape;

    invoke-direct {v2, v0, v1}, Lcom/badlogic/gdx/physics/box2d/EdgeShape;-><init>(J)V

    iput-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    goto :goto_0

    .line 95
    :cond_3
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/CircleShape;

    invoke-direct {v2, v0, v1}, Lcom/badlogic/gdx/physics/box2d/CircleShape;-><init>(J)V

    iput-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    goto :goto_0

    .line 90
    :cond_4
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Null shape address!"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 111
    :cond_5
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    return-object v0
.end method

.method public getType()Lcom/badlogic/gdx/physics/box2d/Shape$Type;
    .locals 2

    .line 57
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniGetType(J)I

    move-result v0

    if-eqz v0, :cond_3

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 66
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Chain:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0

    .line 68
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Unknown shape type!"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_1
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Polygon:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0

    .line 62
    :cond_2
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Edge:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0

    .line 60
    :cond_3
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/Shape$Type;->Circle:Lcom/badlogic/gdx/physics/box2d/Shape$Type;

    return-object v0
.end method

.method public getUserData()Ljava/lang/Object;
    .locals 1

    .line 306
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->userData:Ljava/lang/Object;

    return-object v0
.end method

.method public isSensor()Z
    .locals 2

    .line 132
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniIsSensor(J)Z

    move-result v0

    return v0
.end method

.method public refilter()V
    .locals 2

    .line 178
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniRefilter(J)V

    return-void
.end method

.method protected reset(Lcom/badlogic/gdx/physics/box2d/Body;J)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 49
    iput-wide p2, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    const/4 p1, 0x0

    .line 50
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->shape:Lcom/badlogic/gdx/physics/box2d/Shape;

    .line 51
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->userData:Ljava/lang/Object;

    return-void
.end method

.method public setDensity(F)V
    .locals 2

    .line 236
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniSetDensity(JF)V

    return-void
.end method

.method public setFilterData(Lcom/badlogic/gdx/physics/box2d/Filter;)V
    .locals 6

    .line 143
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    iget-short v3, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    iget-short v4, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    iget-short v5, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniSetFilterData(JSSS)V

    return-void
.end method

.method public setFriction(F)V
    .locals 2

    .line 266
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniSetFriction(JF)V

    return-void
.end method

.method public setRestitution(F)V
    .locals 2

    .line 286
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniSetRestitution(JF)V

    return-void
.end method

.method public setSensor(Z)V
    .locals 2

    .line 121
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniSetSensor(JZ)V

    return-void
.end method

.method public setUserData(Ljava/lang/Object;)V
    .locals 0

    .line 301
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->userData:Ljava/lang/Object;

    return-void
.end method

.method public testPoint(FF)Z
    .locals 2

    .line 201
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniTestPoint(JFF)Z

    move-result p1

    return p1
.end method

.method public testPoint(Lcom/badlogic/gdx/math/Vector2;)Z
    .locals 3

    .line 194
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->jniTestPoint(JFF)Z

    move-result p1

    return p1
.end method
