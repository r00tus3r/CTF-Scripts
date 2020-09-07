.class Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$1;
.super Ljava/lang/Object;
.source "ParticleEmitterBox2D.java"

# interfaces
.implements Lcom/badlogic/gdx/physics/box2d/RayCastCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;)V
    .locals 0

    .line 49
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$1;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public reportRayFixture(Lcom/badlogic/gdx/physics/box2d/Fixture;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;F)F
    .locals 0

    .line 51
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D$1;->this$0:Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->particleCollided:Z

    .line 52
    iget p2, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget p3, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    invoke-static {p2, p3}, Lcom/badlogic/gdx/math/MathUtils;->atan2(FF)F

    move-result p2

    const p3, 0x42652ee0

    mul-float p2, p2, p3

    iput p2, p1, Lcom/badlogic/gdx/physics/box2d/graphics/ParticleEmitterBox2D;->normalAngle:F

    return p4
.end method
