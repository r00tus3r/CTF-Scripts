.class public Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;
.super Lcom/badlogic/gdx/physics/box2d/Joint;
.source "RevoluteJoint.java"


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

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->tmp:[F

    .line 34
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 35
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private native jniEnableLimit(JZ)V
.end method

.method private native jniEnableMotor(JZ)V
.end method

.method private native jniGetJointAngle(J)F
.end method

.method private native jniGetJointSpeed(J)F
.end method

.method private native jniGetLocalAnchorA(J[F)V
.end method

.method private native jniGetLocalAnchorB(J[F)V
.end method

.method private native jniGetLowerLimit(J)F
.end method

.method private native jniGetMaxMotorTorque(J)F
.end method

.method private native jniGetMotorSpeed(J)F
.end method

.method private native jniGetMotorTorque(JF)F
.end method

.method private native jniGetReferenceAngle(J)F
.end method

.method private native jniGetUpperLimit(J)F
.end method

.method private native jniIsLimitEnabled(J)Z
.end method

.method private native jniIsMotorEnabled(J)Z
.end method

.method private native jniSetLimits(JFF)V
.end method

.method private native jniSetMaxMotorTorque(JF)V
.end method

.method private native jniSetMotorSpeed(JF)V
.end method


# virtual methods
.method public enableLimit(Z)V
    .locals 2

    .line 73
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniEnableLimit(JZ)V

    return-void
.end method

.method public enableMotor(Z)V
    .locals 2

    .line 124
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniEnableMotor(JZ)V

    return-void
.end method

.method public getJointAngle()F
    .locals 2

    .line 43
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetJointAngle(J)F

    move-result v0

    return v0
.end method

.method public getJointSpeed()F
    .locals 2

    .line 53
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetJointSpeed(J)F

    move-result v0

    return v0
.end method

.method public getLocalAnchorA()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 173
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetLocalAnchorA(J[F)V

    .line 174
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 175
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLocalAnchorB()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 185
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetLocalAnchorB(J[F)V

    .line 186
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 187
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLowerLimit()F
    .locals 2

    .line 83
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetLowerLimit(J)F

    move-result v0

    return v0
.end method

.method public getMaxMotorTorque()F
    .locals 2

    .line 207
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetMaxMotorTorque(J)F

    move-result v0

    return v0
.end method

.method public getMotorSpeed()F
    .locals 2

    .line 144
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetMotorSpeed(J)F

    move-result v0

    return v0
.end method

.method public getMotorTorque(F)F
    .locals 2

    .line 164
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetMotorTorque(JF)F

    move-result p1

    return p1
.end method

.method public getReferenceAngle()F
    .locals 2

    .line 198
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetReferenceAngle(J)F

    move-result v0

    return v0
.end method

.method public getUpperLimit()F
    .locals 2

    .line 93
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniGetUpperLimit(J)F

    move-result v0

    return v0
.end method

.method public isLimitEnabled()Z
    .locals 2

    .line 63
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniIsLimitEnabled(J)Z

    move-result v0

    return v0
.end method

.method public isMotorEnabled()Z
    .locals 2

    .line 114
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniIsMotorEnabled(J)Z

    move-result v0

    return v0
.end method

.method public setLimits(FF)V
    .locals 2

    .line 104
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniSetLimits(JFF)V

    return-void
.end method

.method public setMaxMotorTorque(F)V
    .locals 2

    .line 154
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniSetMaxMotorTorque(JF)V

    return-void
.end method

.method public setMotorSpeed(F)V
    .locals 2

    .line 134
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;->jniSetMotorSpeed(JF)V

    return-void
.end method
