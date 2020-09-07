.class public Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;
.super Lcom/badlogic/gdx/physics/box2d/JointDef;
.source "DistanceJointDef.java"


# instance fields
.field public dampingRatio:F

.field public frequencyHz:F

.field public length:F

.field public final localAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field public final localAnchorB:Lcom/badlogic/gdx/math/Vector2;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/JointDef;-><init>()V

    .line 42
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 45
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 48
    iput v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->length:F

    const/4 v0, 0x0

    .line 51
    iput v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->frequencyHz:F

    .line 54
    iput v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->dampingRatio:F

    .line 29
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->DistanceJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    return-void
.end method


# virtual methods
.method public initialize(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 1

    .line 34
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 35
    iput-object p2, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 36
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 37
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p2, p4}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 38
    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/math/Vector2;->dst(Lcom/badlogic/gdx/math/Vector2;)F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->length:F

    return-void
.end method
