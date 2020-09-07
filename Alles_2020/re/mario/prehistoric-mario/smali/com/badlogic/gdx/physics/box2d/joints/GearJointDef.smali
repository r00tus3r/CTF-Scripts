.class public Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;
.super Lcom/badlogic/gdx/physics/box2d/JointDef;
.source "GearJointDef.java"


# instance fields
.field public joint1:Lcom/badlogic/gdx/physics/box2d/Joint;

.field public joint2:Lcom/badlogic/gdx/physics/box2d/Joint;

.field public ratio:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/badlogic/gdx/physics/box2d/JointDef;-><init>()V

    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->joint1:Lcom/badlogic/gdx/physics/box2d/Joint;

    .line 33
    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->joint2:Lcom/badlogic/gdx/physics/box2d/Joint;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 37
    iput v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->ratio:F

    .line 26
    sget-object v0, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->GearJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    return-void
.end method
