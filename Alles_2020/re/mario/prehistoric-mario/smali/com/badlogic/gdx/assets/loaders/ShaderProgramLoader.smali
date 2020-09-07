.class public Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "ShaderProgramLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;",
        "Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;",
        ">;"
    }
.end annotation


# instance fields
.field private fragmentFileSuffix:Ljava/lang/String;

.field private vertexFileSuffix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    const-string p1, ".vert"

    .line 39
    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->vertexFileSuffix:Ljava/lang/String;

    const-string p1, ".frag"

    .line 40
    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->fragmentFileSuffix:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 47
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    const-string p1, ".vert"

    .line 39
    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->vertexFileSuffix:Ljava/lang/String;

    const-string p1, ".frag"

    .line 40
    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->fragmentFileSuffix:Ljava/lang/String;

    .line 48
    iput-object p2, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->vertexFileSuffix:Ljava/lang/String;

    .line 49
    iput-object p3, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->fragmentFileSuffix:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 37
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    .locals 0

    .line 37
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;)V
    .locals 0

    return-void
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;)Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;
    .locals 5

    const/4 v0, 0x0

    if-eqz p4, :cond_1

    .line 65
    iget-object v1, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->vertexFile:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->vertexFile:Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v1, v0

    .line 66
    :goto_0
    iget-object v2, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->fragmentFile:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v0, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->fragmentFile:Ljava/lang/String;

    goto :goto_1

    :cond_1
    move-object v1, v0

    :cond_2
    :goto_1
    const/4 v2, 0x0

    if-nez v1, :cond_3

    .line 68
    iget-object v3, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->fragmentFileSuffix:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->fragmentFileSuffix:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->vertexFileSuffix:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_3
    if-nez v0, :cond_4

    .line 71
    iget-object v3, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->vertexFileSuffix:Ljava/lang/String;

    invoke-virtual {p2, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 72
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    iget-object v4, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->vertexFileSuffix:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->fragmentFileSuffix:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_4
    if-nez v1, :cond_5

    move-object v1, p3

    goto :goto_2

    .line 74
    :cond_5
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->resolve(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v1

    :goto_2
    if-nez v0, :cond_6

    goto :goto_3

    .line 75
    :cond_6
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->resolve(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p3

    .line 76
    :goto_3
    invoke-virtual {v1}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object v0

    .line 77
    invoke-virtual {v1, p3}, Lcom/badlogic/gdx/files/FileHandle;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    move-object p3, v0

    goto :goto_4

    :cond_7
    invoke-virtual {p3}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object p3

    :goto_4
    if-eqz p4, :cond_9

    .line 79
    iget-object v1, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->prependVertexCode:Ljava/lang/String;

    if-eqz v1, :cond_8

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->prependVertexCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 80
    :cond_8
    iget-object v1, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->prependFragmentCode:Ljava/lang/String;

    if-eqz v1, :cond_9

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->prependFragmentCode:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 83
    :cond_9
    new-instance v1, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-direct {v1, v0, p3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p4, :cond_a

    .line 84
    iget-boolean p3, p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;->logOnCompileFailure:Z

    if-eqz p3, :cond_b

    :cond_a
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->isCompiled()Z

    move-result p3

    if-nez p3, :cond_b

    .line 85
    invoke-virtual {p1}, Lcom/badlogic/gdx/assets/AssetManager;->getLogger()Lcom/badlogic/gdx/utils/Logger;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "ShaderProgram "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " failed to compile:\n"

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getLog()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Logger;->error(Ljava/lang/String;)V

    :cond_b
    return-object v1
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 37
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ShaderProgramLoader$ShaderProgramParameter;)Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    move-result-object p1

    return-object p1
.end method
