.class Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;
.super Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;
.source "ParticleEmitterBox2D.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ParticleBox2D"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;Lcom/badlogic/gdx/graphics/g2d/Sprite;)V
    .locals 0

    .line 94
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    .line 95
    invoke-direct {p0, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;-><init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    return-void
.end method


# virtual methods
.method public translate(FF)V
    .locals 5

    mul-float v0, p1, p1

    mul-float v1, p2, p2

    add-float/2addr v0, v1

    const v1, 0x3a83126f    # 0.001f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    return-void

    .line 109
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->getX()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->getWidth()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    .line 110
    invoke-virtual {p0}, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->getY()F

    move-result v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->getHeight()F

    move-result v3

    div-float/2addr v3, v2

    add-float/2addr v1, v3

    .line 113
    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    const/4 v4, 0x0

    iput-boolean v4, v3, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->particleCollided:Z

    .line 114
    iget-object v3, v3, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->startPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v3, v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 115
    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    iget-object v3, v3, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->endPoint:Lcom/badlogic/gdx/math/Vector2;

    add-float/2addr v0, p1

    add-float/2addr v1, p2

    invoke-virtual {v3, v0, v1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    iget-object v1, v1, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->rayCallBack:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    iget-object v3, v3, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->startPoint:Lcom/badlogic/gdx/math/Vector2;

    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    iget-object v4, v4, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->endPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v1, v3, v4}, Lcom/badlogic/gdx/physics/box2d/World;->rayCast(Lcom/badlogic/gdx/physics/box2d/RayCastCallback;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V

    .line 119
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    iget-boolean v0, v0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->particleCollided:Z

    if-eqz v0, :cond_2

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->normalAngle:F

    mul-float v0, v0, v2

    iget v1, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->angle:F

    sub-float/2addr v0, v1

    const/high16 v1, 0x43340000    # 180.0f

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->angle:F

    .line 122
    iget v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->angle:F

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->angleCos:F

    .line 123
    iget v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->angle:F

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->angleSin:F

    .line 124
    iget v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->angleCos:F

    mul-float p1, p1, v0

    .line 125
    iget v0, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$ParticleBox2D;->angleSin:F

    mul-float p2, p2, v0

    .line 128
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->translate(FF)V

    return-void
.end method
