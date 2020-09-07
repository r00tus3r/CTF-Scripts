.class public Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;
.super Lcom/badlogic/gdx/physics/box2d/Joint;
.source "GearJoint.java"


# instance fields
.field private joint1:Lcom/badlogic/gdx/physics/box2d/Joint;

.field private joint2:Lcom/badlogic/gdx/physics/box2d/Joint;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;JLcom/badlogic/gdx/physics/box2d/Joint;Lcom/badlogic/gdx/physics/box2d/Joint;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/physics/box2d/Joint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 38
    iput-object p4, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;->joint1:Lcom/badlogic/gdx/physics/box2d/Joint;

    .line 39
    iput-object p5, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;->joint2:Lcom/badlogic/gdx/physics/box2d/Joint;

    return-void
.end method

.method private native jniGetJoint1(J)J
.end method

.method private native jniGetJoint2(J)J
.end method

.method private native jniGetRatio(J)F
.end method

.method private native jniSetRatio(JF)V
.end method


# virtual methods
.method public getJoint1()Lcom/badlogic/gdx/physics/box2d/Joint;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;->joint1:Lcom/badlogic/gdx/physics/box2d/Joint;

    return-object v0
.end method

.method public getJoint2()Lcom/badlogic/gdx/physics/box2d/Joint;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;->joint2:Lcom/badlogic/gdx/physics/box2d/Joint;

    return-object v0
.end method

.method public getRatio()F
    .locals 2

    .line 76
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;->jniGetRatio(J)F

    move-result v0

    return v0
.end method

.method public setRatio(F)V
    .locals 2

    .line 66
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;->jniSetRatio(JF)V

    return-void
.end method
