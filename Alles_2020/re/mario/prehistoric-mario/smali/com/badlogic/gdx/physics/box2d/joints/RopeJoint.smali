.class public Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;
.super Lcom/badlogic/gdx/physics/box2d/Joint;
.source "RopeJoint.java"


# instance fields
.field private final localAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field private final localAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field private final tmp:[F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;J)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/physics/box2d/Joint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    const/4 p1, 0x2

    .line 33
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->tmp:[F

    .line 34
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 35
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private native jniGetLocalAnchorA(J[F)V
.end method

.method private native jniGetLocalAnchorB(J[F)V
.end method

.method private native jniGetMaxLength(J)F
.end method

.method private native jniSetMaxLength(JF)F
.end method


# virtual methods
.method public getLocalAnchorA()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 42
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->jniGetLocalAnchorA(J[F)V

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 44
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLocalAnchorB()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 54
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->jniGetLocalAnchorB(J[F)V

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getMaxLength()F
    .locals 2

    .line 67
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->jniGetMaxLength(J)F

    move-result v0

    return v0
.end method

.method public setMaxLength(F)V
    .locals 2

    .line 77
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;->jniSetMaxLength(JF)F

    return-void
.end method
