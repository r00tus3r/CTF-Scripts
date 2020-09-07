.class public Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;
.super Lcom/badlogic/gdx/physics/box2d/JointDef;
.source "PulleyJointDef.java"


# static fields
.field private static final minPulleyLength:F = 2.0f


# instance fields
.field public final groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field public final groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field public lengthA:F

.field public lengthB:F

.field public final localAnchorA:Lcom/badlogic/gdx/math/Vector2;

.field public final localAnchorB:Lcom/badlogic/gdx/math/Vector2;

.field public ratio:F


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 28
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/JointDef;-><init>()V

    .line 49
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 52
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0, v2, v2}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    .line 55
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    .line 58
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0, v2, v3}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    .line 61
    iput v3, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthA:F

    .line 64
    iput v3, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthB:F

    .line 67
    iput v2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->ratio:F

    .line 29
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    const/4 v0, 0x1

    .line 30
    iput-boolean v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->collideConnected:Z

    return-void
.end method


# virtual methods
.method public initialize(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;F)V
    .locals 1

    .line 36
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 37
    iput-object p2, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    .line 38
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p3}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 39
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p4}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 40
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p1, p5}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 41
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {p2, p6}, Lcom/badlogic/gdx/physics/box2d/Body;->getLocalPoint(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 42
    invoke-virtual {p5, p3}, Lcom/badlogic/gdx/math/Vector2;->dst(Lcom/badlogic/gdx/math/Vector2;)F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthA:F

    .line 43
    invoke-virtual {p6, p4}, Lcom/badlogic/gdx/math/Vector2;->dst(Lcom/badlogic/gdx/math/Vector2;)F

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthB:F

    .line 44
    iput p7, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->ratio:F

    .line 45
    iget p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthA:F

    iget p1, p0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthB:F

    return-void
.end method
