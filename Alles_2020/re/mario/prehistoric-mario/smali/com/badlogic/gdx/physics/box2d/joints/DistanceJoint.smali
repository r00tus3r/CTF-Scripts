.class public Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;
.super Lcom/badlogic/gdx/physics/box2d/Joint;
.source "DistanceJoint.java"


# instance fields
.field private final localAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field private final localAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field private final tmp:[F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;J)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/physics/box2d/Joint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    const/4 p1, 0x2

    .line 31
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->tmp:[F

    .line 32
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 33
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private native jniGetDampingRatio(J)F
.end method

.method private native jniGetFrequency(J)F
.end method

.method private native jniGetLength(J)F
.end method

.method private native jniGetLocalAnchorA(J[F)V
.end method

.method private native jniGetLocalAnchorB(J[F)V
.end method

.method private native jniSetDampingRatio(JF)V
.end method

.method private native jniSetFrequency(JF)V
.end method

.method private native jniSetLength(JF)V
.end method


# virtual methods
.method public getDampingRatio()F
    .locals 2

    .line 115
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->jniGetDampingRatio(J)F

    move-result v0

    return v0
.end method

.method public getFrequency()F
    .locals 2

    .line 95
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->jniGetFrequency(J)F

    move-result v0

    return v0
.end method

.method public getLength()F
    .locals 2

    .line 75
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->jniGetLength(J)F

    move-result v0

    return v0
.end method

.method public getLocalAnchorA()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 40
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->jniGetLocalAnchorA(J[F)V

    .line 41
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 42
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLocalAnchorB()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 52
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->jniGetLocalAnchorB(J[F)V

    .line 53
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 54
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public setDampingRatio(F)V
    .locals 2

    .line 105
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->jniSetDampingRatio(JF)V

    return-void
.end method

.method public setFrequency(F)V
    .locals 2

    .line 85
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->jniSetFrequency(JF)V

    return-void
.end method

.method public setLength(F)V
    .locals 2

    .line 65
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;->jniSetLength(JF)V

    return-void
.end method
