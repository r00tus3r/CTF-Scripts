.class public Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;
.super Ljava/lang/Object;
.source "PhysicsBodyDataVO.java"


# instance fields
.field public allowSleep:Z

.field public awake:Z

.field public bodyType:I

.field public bullet:Z

.field public centerOfMass:Lcom/badlogic/gdx/math/Vector2;

.field public damping:F

.field public density:F

.field public friction:F

.field public gravityScale:F

.field public mass:F

.field public restitution:F

.field public rotationalInertia:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bodyType:I

    .line 23
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->centerOfMass:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bodyType:I

    .line 27
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bodyType:I

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bodyType:I

    .line 28
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->mass:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->mass:F

    .line 29
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->centerOfMass:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector2;->cpy()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->centerOfMass:Lcom/badlogic/gdx/math/Vector2;

    .line 30
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->rotationalInertia:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->rotationalInertia:F

    .line 31
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->damping:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->damping:F

    .line 32
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->gravityScale:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->gravityScale:F

    .line 33
    iget-boolean v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->allowSleep:Z

    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->allowSleep:Z

    .line 34
    iget-boolean v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->awake:Z

    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->awake:Z

    .line 35
    iget-boolean v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bullet:Z

    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bullet:Z

    .line 36
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->density:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->density:F

    .line 37
    iget v0, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->friction:F

    iput v0, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->friction:F

    .line 38
    iget p1, p1, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->restitution:F

    iput p1, p0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->restitution:F

    return-void
.end method
