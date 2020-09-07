.class public Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;
.super Lcom/badlogic/gdx/assets/AssetLoaderParameters;
.source "ShaderProgramLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ShaderProgramParameter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/AssetLoaderParameters<",
        "Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;",
        ">;"
    }
.end annotation


# instance fields
.field public fragmentFile:Ljava/lang/String;

.field public logOnCompileFailure:Z

.field public prependFragmentCode:Ljava/lang/String;

.field public prependVertexCode:Ljava/lang/String;

.field public vertexFile:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 91
    invoke-direct {p0}, Lcom/badlogic/gdx/assets/AssetLoaderParameters;-><init>()V

    const/4 v0, 0x1

    .line 99
    iput-boolean v0, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->logOnCompileFailure:Z

    return-void
.end method
