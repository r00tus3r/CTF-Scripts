.class final Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$4;
.super Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$GlobalSetter;
.source "DefaultShader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 142
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$GlobalSetter;-><init>()V

    return-void
.end method


# virtual methods
.method public set(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;ILcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V
    .locals 6

    .line 145
    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p3, p3, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v2, p3, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p3, p3, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v3, p3, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p3, p3, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, p3, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget p3, p3, Lcom/badlogic/gdx/graphics/Camera;->far:F

    iget-object p4, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget p4, p4, Lcom/badlogic/gdx/graphics/Camera;->far:F

    mul-float p3, p3, p4

    const p4, 0x3f9813a9    # 1.1881f

    div-float v5, p4, p3

    move-object v0, p1

    move v1, p2

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->set(IFFFF)Z

    return-void
.end method
