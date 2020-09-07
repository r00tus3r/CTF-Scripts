.class public Lcom/badlogic/gdx/physics/box2d/Manifold$ManifoldPoint;
.super Ljava/lang/Object;
.source "Manifold.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/physics/box2d/Manifold;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ManifoldPoint"
.end annotation


# instance fields
.field public contactID:I

.field public final localPoint:Lcom/badlogic/gdx/math/Vector2;

.field public normalImpulse:F

.field public tangentImpulse:F

.field final synthetic this$0:Lcom/badlogic/gdx/physics/box2d/Manifold;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/physics/box2d/Manifold;)V
    .locals 0

    .line 111
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Manifold$ManifoldPoint;->this$0:Lcom/badlogic/gdx/physics/box2d/Manifold;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    new-instance p1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {p1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Manifold$ManifoldPoint;->localPoint:Lcom/badlogic/gdx/math/Vector2;

    const/4 p1, 0x0

    .line 115
    iput p1, p0, Lcom/badlogic/gdx/physics/box2d/Manifold$ManifoldPoint;->contactID:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/physics/box2d/Manifold$ManifoldPoint;->contactID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Manifold$ManifoldPoint;->localPoint:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/physics/box2d/Manifold$ManifoldPoint;->normalImpulse:F

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/badlogic/gdx/physics/box2d/Manifold$ManifoldPoint;->tangentImpulse:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
