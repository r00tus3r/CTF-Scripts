.class final Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Setters$2;
.super Ljava/lang/Object;
.source "ParticleShader.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Setters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isGlobal(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;I)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public set(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;ILcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V
    .locals 0

    .line 136
    sget-object p3, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->TMP_VECTOR3:Lcom/badlogic/gdx/math/Vector3;

    iget-object p4, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p4, p4, Lcom/badlogic/gdx/graphics/Camera;->up:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p3

    invoke-virtual {p3}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->set(ILcom/badlogic/gdx/math/Vector3;)Z

    return-void
.end method
