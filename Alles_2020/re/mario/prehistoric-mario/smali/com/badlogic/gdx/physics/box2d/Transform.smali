.class public Lcom/badlogic/gdx/physics/box2d/Transform;
.super Ljava/lang/Object;
.source "Transform.java"


# static fields
.field public static final COS:I = 0x2

.field public static final POS_X:I = 0x0

.field public static final POS_Y:I = 0x1

.field public static final SIN:I = 0x3


# instance fields
.field private orientation:Lcom/badlogic/gdx/math/Vector2;

.field private position:Lcom/badlogic/gdx/math/Vector2;

.field public vals:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 30
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    .line 32
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->position:Lcom/badlogic/gdx/math/Vector2;

    .line 33
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->orientation:Lcom/badlogic/gdx/math/Vector2;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;F)V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 30
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    .line 32
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->position:Lcom/badlogic/gdx/math/Vector2;

    .line 33
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->orientation:Lcom/badlogic/gdx/math/Vector2;

    .line 43
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/physics/box2d/Transform;->setPosition(Lcom/badlogic/gdx/math/Vector2;)V

    .line 44
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/physics/box2d/Transform;->setRotation(F)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    .line 30
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    .line 32
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->position:Lcom/badlogic/gdx/math/Vector2;

    .line 33
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->orientation:Lcom/badlogic/gdx/math/Vector2;

    .line 50
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/physics/box2d/Transform;->setPosition(Lcom/badlogic/gdx/math/Vector2;)V

    .line 51
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/physics/box2d/Transform;->setOrientation(Lcom/badlogic/gdx/math/Vector2;)V

    return-void
.end method


# virtual methods
.method public getOrientation()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 83
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->orientation:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    const/4 v2, 0x2

    aget v2, v1, v2

    const/4 v3, 0x3

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    return-object v0
.end method

.method public getPosition()Lcom/badlogic/gdx/math/Vector2;
    .locals 4

    .line 67
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->position:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x1

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    return-object v0
.end method

.method public getRotation()F
    .locals 5

    .line 79
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    const/4 v1, 0x3

    aget v1, v0, v1

    float-to-double v1, v1

    const/4 v3, 0x2

    aget v0, v0, v3

    float-to-double v3, v0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method public mul(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;
    .locals 5

    .line 57
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x2

    aget v0, v0, v2

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v0, v0, v3

    add-float/2addr v1, v0

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    const/4 v3, 0x3

    aget v0, v0, v3

    neg-float v0, v0

    iget v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v0, v0, v4

    add-float/2addr v1, v0

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    const/4 v4, 0x1

    aget v4, v0, v4

    aget v0, v0, v3

    iget v3, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v0, v0, v3

    add-float/2addr v4, v0

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    aget v0, v0, v2

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v0, v0, v2

    add-float/2addr v4, v0

    .line 60
    iput v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 61
    iput v4, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object p1
.end method

.method public setOrientation(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 3

    .line 87
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 88
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 v1, 0x3

    aput p1, v0, v1

    return-void
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 3

    .line 94
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 v1, 0x1

    aput p1, v0, v1

    return-void
.end method

.method public setRotation(F)V
    .locals 4

    float-to-double v0, p1

    .line 73
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float p1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    .line 74
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Transform;->vals:[F

    const/4 v2, 0x2

    aput p1, v1, v2

    const/4 p1, 0x3

    .line 75
    aput v0, v1, p1

    return-void
.end method
