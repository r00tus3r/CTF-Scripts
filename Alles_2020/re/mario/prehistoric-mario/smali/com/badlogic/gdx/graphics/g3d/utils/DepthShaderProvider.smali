.class public Lcom/badlogic/gdx/graphics/g3d/utils/DepthShaderProvider;
.super Lcom/badlogic/gdx/graphics/g3d/utils/BaseShaderProvider;
.source "DepthShaderProvider.java"


# instance fields
.field public final config:Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/DepthShaderProvider;-><init>(Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 0

    .line 37
    invoke-virtual {p1}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/utils/DepthShaderProvider;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/BaseShaderProvider;-><init>()V

    if-nez p1, :cond_0

    .line 29
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;

    invoke-direct {p1}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;-><init>()V

    :cond_0
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DepthShaderProvider;->config:Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 33
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;

    invoke-direct {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/DepthShaderProvider;-><init>(Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;)V

    return-void
.end method


# virtual methods
.method protected createShader(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Shader;
    .locals 2

    .line 46
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DepthShaderProvider;->config:Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;

    invoke-direct {v0, p1, v1}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;)V

    return-object v0
.end method
