.class public Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;
.super Lcom/badlogic/gdx/physics/box2d/Joint;
.source "PrismaticJoint.java"


# instance fields
.field private final localAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field private final localAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field private final localAxisA:Lcom/badlogic/gdx/math/Vector2;

.field private final tmp:[F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;J)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/physics/box2d/Joint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    const/4 p1, 0x2

    .line 32
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->tmp:[F

    .line 33
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 34
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    .line 35
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private native jniEnableLimit(JZ)V
.end method

.method private native jniEnableMotor(JZ)V
.end method

.method private native jniGetJointSpeed(J)F
.end method

.method private native jniGetJointTranslation(J)F
.end method

.method private native jniGetLocalAnchorA(J[F)V
.end method

.method private native jniGetLocalAnchorB(J[F)V
.end method

.method private native jniGetLocalAxisA(J[F)V
.end method

.method private native jniGetLowerLimit(J)F
.end method

.method private native jniGetMaxMotorForce(J)F
.end method

.method private native jniGetMotorForce(JF)F
.end method

.method private native jniGetMotorSpeed(J)F
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

.method private native jniSetMaxMotorForce(JF)V
.end method

.method private native jniSetMotorSpeed(JF)V
.end method


# virtual methods
.method public enableLimit(Z)V
    .locals 2

    .line 109
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniEnableLimit(JZ)V

    return-void
.end method

.method public enableMotor(Z)V
    .locals 2

    .line 159
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniEnableMotor(JZ)V

    return-void
.end method

.method public getJointSpeed()F
    .locals 2

    .line 89
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetJointSpeed(J)F

    move-result v0

    return v0
.end method

.method public getJointTranslation()F
    .locals 2

    .line 79
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetJointTranslation(J)F

    move-result v0

    return v0
.end method

.method public getLocalAnchorA()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 42
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetLocalAnchorA(J[F)V

    .line 43
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 44
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLocalAnchorB()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 54
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetLocalAnchorB(J[F)V

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLocalAxisA()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 66
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetLocalAxisA(J[F)V

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getLowerLimit()F
    .locals 2

    .line 119
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetLowerLimit(J)F

    move-result v0

    return v0
.end method

.method public getMaxMotorForce()F
    .locals 2

    .line 209
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetMaxMotorForce(J)F

    move-result v0

    return v0
.end method

.method public getMotorForce(F)F
    .locals 2

    .line 199
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetMotorForce(JF)F

    move-result p1

    return p1
.end method

.method public getMotorSpeed()F
    .locals 2

    .line 179
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetMotorSpeed(J)F

    move-result v0

    return v0
.end method

.method public getReferenceAngle()F
    .locals 2

    .line 219
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetReferenceAngle(J)F

    move-result v0

    return v0
.end method

.method public getUpperLimit()F
    .locals 2

    .line 129
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniGetUpperLimit(J)F

    move-result v0

    return v0
.end method

.method public isLimitEnabled()Z
    .locals 2

    .line 99
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniIsLimitEnabled(J)Z

    move-result v0

    return v0
.end method

.method public isMotorEnabled()Z
    .locals 2

    .line 149
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniIsMotorEnabled(J)Z

    move-result v0

    return v0
.end method

.method public setLimits(FF)V
    .locals 2

    .line 139
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniSetLimits(JFF)V

    return-void
.end method

.method public setMaxMotorForce(F)V
    .locals 2

    .line 189
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniSetMaxMotorForce(JF)V

    return-void
.end method

.method public setMotorSpeed(F)V
    .locals 2

    .line 169
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;->jniSetMotorSpeed(JF)V

    return-void
.end method
