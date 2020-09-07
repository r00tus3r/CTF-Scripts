.class public Lcom/badlogic/gdx/physics/box2d/ContactImpulse;
.super Ljava/lang/Object;
.source "ContactImpulse.java"


# instance fields
.field addr:J

.field final normalImpulses:[F

.field final tangentImpulses:[F

.field tmp:[F

.field final world:Lcom/badlogic/gdx/physics/box2d/World;


# direct methods
.method protected constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;J)V
    .locals 2

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    .line 30
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->tmp:[F

    .line 31
    new-array v1, v0, [F

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->normalImpulses:[F

    .line 32
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->tangentImpulses:[F

    .line 35
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->world:Lcom/badlogic/gdx/physics/box2d/World;

    .line 36
    iput-wide p2, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->addr:J

    return-void
.end method

.method private native jniGetCount(J)I
.end method

.method private native jniGetNormalImpulses(J[F)V
.end method

.method private native jniGetTangentImpulses(J[F)V
.end method


# virtual methods
.method public getCount()I
    .locals 2

    .line 62
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->jniGetCount(J)I

    move-result v0

    return v0
.end method

.method public getNormalImpulses()[F
    .locals 3

    .line 40
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->normalImpulses:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->jniGetNormalImpulses(J[F)V

    .line 41
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->normalImpulses:[F

    return-object v0
.end method

.method public getTangentImpulses()[F
    .locals 3

    .line 51
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->tangentImpulses:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->jniGetTangentImpulses(J[F)V

    .line 52
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->tangentImpulses:[F

    return-object v0
.end method
