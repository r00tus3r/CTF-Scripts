.class public Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;
.super Lcom/badlogic/gdx/physics/box2d/JointDef;
.source "PrismaticJointDef.java"


# instance fields
.field public enableLimit:Z

.field public enableMotor:Z

.field public final localAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field public final localAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field public final localAxisA:Lcom/badlogic/gdx/math/Vector2;

.field public lowerTranslation:F

.field public maxMotorForce:F

.field public motorSpeed:F

.field public referenceAngle:F

.field public upperTranslation:F


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 29
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/JointDef;-><init>()V

    .line 45
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 48
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    .line 54
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->referenceAngle:F

    const/4 v0, 0x0

    .line 57
    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->enableLimit:Z

    .line 60
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->lowerTranslation:F

    .line 63
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->upperTranslation:F

    .line 66
    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->enableMotor:Z

    .line 69
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->maxMotorForce:F

    .line 72
    iput v1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->motorSpeed:F

    .line 30
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PrismaticJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    return-void
.end method


# virtual methods
.method public initialize(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 2

    .line 35
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 36
    iput-object p2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 37
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 38
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p3

    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 39
    iget-object p3, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p4}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalVector(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p4

    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 40
    invoke-virtual {p2}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result p2

    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result p1

    sub-float/2addr p2, p1

    iput p2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->referenceAngle:F

    return-void
.end method
