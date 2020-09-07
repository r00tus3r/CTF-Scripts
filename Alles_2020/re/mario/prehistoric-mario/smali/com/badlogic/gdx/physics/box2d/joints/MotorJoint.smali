.class public Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;
.super Lcom/badlogic/gdx/physics/box2d/Joint;
.source "MotorJoint.java"


# instance fields
.field private final linearOffset:Lcom/badlogic/gdx/math/Vector2;

.field private final tmp:[F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;J)V
    .locals 0

    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/physics/box2d/Joint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    const/4 p1, 0x2

    .line 31
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->tmp:[F

    .line 32
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->linearOffset:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method private native jniGetAngularOffset(J)F
.end method

.method private native jniGetCorrectionFactor(J)F
.end method

.method private native jniGetLinearOffset(J[F)V
.end method

.method private native jniGetMaxForce(J)F
.end method

.method private native jniGetMaxTorque(J)F
.end method

.method private native jniSetAngularOffset(JF)V
.end method

.method private native jniSetCorrectionFactor(JF)V
.end method

.method private native jniSetLinearOffset(JFF)V
.end method

.method private native jniSetMaxForce(JF)V
.end method

.method private native jniSetMaxTorque(JF)V
.end method


# virtual methods
.method public getAngularOffset()F
    .locals 2

    .line 60
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniGetAngularOffset(J)F

    move-result v0

    return v0
.end method

.method public getCorrectionFactor()F
    .locals 2

    .line 114
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniGetCorrectionFactor(J)F

    move-result v0

    return v0
.end method

.method public getLinearOffset()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 39
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniGetLinearOffset(J[F)V

    .line 40
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->linearOffset:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->tmp:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 41
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->linearOffset:Lcom/badlogic/gdx/math/Vector2;

    return-object v0
.end method

.method public getMaxForce()F
    .locals 2

    .line 78
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniGetMaxForce(J)F

    move-result v0

    return v0
.end method

.method public getMaxTorque()F
    .locals 2

    .line 96
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniGetMaxTorque(J)F

    move-result v0

    return v0
.end method

.method public setAngularOffset(F)V
    .locals 2

    .line 69
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniSetAngularOffset(JF)V

    return-void
.end method

.method public setCorrectionFactor(F)V
    .locals 2

    .line 123
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniSetCorrectionFactor(JF)V

    return-void
.end method

.method public setLinearOffset(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 3

    .line 51
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniSetLinearOffset(JFF)V

    return-void
.end method

.method public setMaxForce(F)V
    .locals 2

    .line 87
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniSetMaxForce(JF)V

    return-void
.end method

.method public setMaxTorque(F)V
    .locals 2

    .line 105
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;->jniSetMaxTorque(JF)V

    return-void
.end method
