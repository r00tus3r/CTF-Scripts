.class public Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;
.super Lcom/badlogic/gdx/physics/box2d/Joint;
.source "PulleyJoint.java"


# instance fields
.field private final groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field private final groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field private final tmp:[F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;J)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/physics/box2d/Joint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    const/4 p1, 0x2

    .line 37
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->tmp:[F

    .line 38
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 53
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private native jniGetGroundAnchorA(J[F)V
.end method

.method private native jniGetGroundAnchorB(J[F)V
.end method

.method private native jniGetLength1(J)F
.end method

.method private native jniGetLength2(J)F
.end method

.method private native jniGetRatio(J)F
.end method


# virtual methods
.method public getGroundAnchorA()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 41
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->jniGetGroundAnchorA(J[F)V

    .line 42
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getGroundAnchorB()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 56
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->jniGetGroundAnchorB(J[F)V

    .line 57
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLength1()F
    .locals 2

    .line 69
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->jniGetLength1(J)F

    move-result v0

    return v0
.end method

.method public getLength2()F
    .locals 2

    .line 79
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->jniGetLength2(J)F

    move-result v0

    return v0
.end method

.method public getRatio()F
    .locals 2

    .line 89
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;->jniGetRatio(J)F

    move-result v0

    return v0
.end method
