.class public Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;
.super Ljava/lang/Object;
.source "DefaultShader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Config"
.end annotation


# instance fields
.field public defaultCullFace:I

.field public defaultDepthFunc:I

.field public fragmentShader:Ljava/lang/String;

.field public ignoreUnimplemented:Z

.field public numBones:I

.field public numDirectionalLights:I

.field public numPointLights:I

.field public numSpotLights:I

.field public vertexShader:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->vertexShader:Ljava/lang/String;

    .line 56
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->fragmentShader:Ljava/lang/String;

    const/4 v0, 0x2

    .line 58
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->numDirectionalLights:I

    const/4 v0, 0x5

    .line 60
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->numPointLights:I

    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->numSpotLights:I

    const/16 v0, 0xc

    .line 64
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->numBones:I

    const/4 v0, 0x1

    .line 66
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->ignoreUnimplemented:Z

    const/4 v0, -0x1

    .line 68
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->defaultCullFace:I

    .line 70
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->defaultDepthFunc:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->vertexShader:Ljava/lang/String;

    .line 56
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->fragmentShader:Ljava/lang/String;

    const/4 v0, 0x2

    .line 58
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->numDirectionalLights:I

    const/4 v0, 0x5

    .line 60
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->numPointLights:I

    const/4 v0, 0x0

    .line 62
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->numSpotLights:I

    const/16 v0, 0xc

    .line 64
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->numBones:I

    const/4 v0, 0x1

    .line 66
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->ignoreUnimplemented:Z

    const/4 v0, -0x1

    .line 68
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->defaultCullFace:I

    .line 70
    iput v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->defaultDepthFunc:I

    .line 76
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->vertexShader:Ljava/lang/String;

    .line 77
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;->fragmentShader:Ljava/lang/String;

    return-void
.end method
