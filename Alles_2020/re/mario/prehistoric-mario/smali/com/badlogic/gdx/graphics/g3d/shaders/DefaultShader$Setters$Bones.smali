.class public Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$Bones;
.super Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$LocalSetter;
.source "DefaultShader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Bones"
.end annotation


# static fields
.field private static final idtMatrix:Lcom/badlogic/gdx/math/Matrix4;


# instance fields
.field public final bones:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 199
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$Bones;->idtMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 202
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$LocalSetter;-><init>()V

    mul-int/lit8 p1, p1, 0x10

    .line 203
    new-array p1, p1, [F

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$Bones;->bones:[F

    return-void
.end method


# virtual methods
.method public set(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;ILcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V
    .locals 4

    const/4 p4, 0x0

    const/4 v0, 0x0

    .line 208
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$Bones;->bones:[F

    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 209
    div-int/lit8 v2, v0, 0x10

    .line 210
    iget-object v3, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->bones:[Lcom/badlogic/gdx/math/Matrix4;

    if-eqz v3, :cond_1

    iget-object v3, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->bones:[Lcom/badlogic/gdx/math/Matrix4;

    array-length v3, v3

    if-ge v2, v3, :cond_1

    iget-object v3, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->bones:[Lcom/badlogic/gdx/math/Matrix4;

    aget-object v3, v3, v2

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    iget-object v3, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->bones:[Lcom/badlogic/gdx/math/Matrix4;

    aget-object v2, v3, v2

    iget-object v2, v2, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    rem-int/lit8 v3, v0, 0x10

    aget v2, v2, v3

    goto :goto_2

    :cond_1
    :goto_1
    sget-object v2, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$Bones;->idtMatrix:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v2, v2, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    rem-int/lit8 v3, v0, 0x10

    aget v2, v2, v3

    :goto_2
    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 213
    :cond_2
    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->loc(I)I

    move-result p1

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$Bones;->bones:[F

    array-length v0, p2

    invoke-virtual {p3, p1, p2, p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix4fv(I[FII)V

    return-void
.end method
