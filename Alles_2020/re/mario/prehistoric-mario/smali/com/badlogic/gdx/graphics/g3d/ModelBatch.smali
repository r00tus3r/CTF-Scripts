.class public Lcom/badlogic/gdx/graphics/g3d/ModelBatch;
.super Ljava/lang/Object;
.source "ModelBatch.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;
    }
.end annotation


# instance fields
.field protected camera:Lcom/badlogic/gdx/graphics/Camera;

.field protected final context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

.field private final ownContext:Z

.field protected final renderables:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;"
        }
    .end annotation
.end field

.field protected final renderablesPool:Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;

.field protected final shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

.field protected final sorter:Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 143
    invoke-direct {p0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 1

    .line 130
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultShaderProvider;

    invoke-direct {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultShaderProvider;-><init>(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/files/FileHandle;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;)V
    .locals 1

    const/4 v0, 0x0

    .line 103
    invoke-direct {p0, p1, v0, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V
    .locals 1

    const/4 v0, 0x0

    .line 97
    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;)V
    .locals 1

    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V
    .locals 1

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderablesPool:Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;

    .line 66
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    if-nez p3, :cond_0

    .line 80
    new-instance p3, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;

    invoke-direct {p3}, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;-><init>()V

    :cond_0
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;

    const/4 p3, 0x1

    if-nez p1, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 81
    :goto_0
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->ownContext:Z

    if-nez p1, :cond_2

    .line 82
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultTextureBinder;

    invoke-direct {v0, p3, p3}, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultTextureBinder;-><init>(II)V

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;)V

    :cond_2
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    if-nez p2, :cond_3

    .line 83
    new-instance p2, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultShaderProvider;

    invoke-direct {p2}, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultShaderProvider;-><init>()V

    :cond_3
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V
    .locals 1

    const/4 v0, 0x0

    .line 116
    invoke-direct {p0, v0, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;)V
    .locals 1

    const/4 v0, 0x0

    .line 122
    invoke-direct {p0, v0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V
    .locals 1

    const/4 v0, 0x0

    .line 110
    invoke-direct {p0, v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 138
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultShaderProvider;

    invoke-direct {v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultShaderProvider;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1, v0, p1}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;)V

    return-void
.end method


# virtual methods
.method public begin(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    if-nez v0, :cond_1

    .line 152
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    .line 153
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->ownContext:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->begin()V

    :cond_0
    return-void

    .line 151
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Call end() first."

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public dispose()V
    .locals 1

    .line 334
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;->dispose()V

    return-void
.end method

.method public end()V
    .locals 1

    .line 218
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->flush()V

    .line 219
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->ownContext:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->end()V

    :cond_0
    const/4 v0, 0x0

    .line 220
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    return-void
.end method

.method public flush()V
    .locals 5

    .line 198
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-interface {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;->sort(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/utils/Array;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 200
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v1, v2, :cond_2

    .line 201
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 202
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    if-eq v0, v3, :cond_1

    if-eqz v0, :cond_0

    .line 203
    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g3d/Shader;->end()V

    .line 204
    :cond_0
    iget-object v0, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    .line 205
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    invoke-interface {v0, v3, v4}, Lcom/badlogic/gdx/graphics/g3d/Shader;->begin(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;)V

    .line 207
    :cond_1
    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/g3d/Shader;->render(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    if-eqz v0, :cond_3

    .line 209
    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g3d/Shader;->end()V

    .line 210
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderablesPool:Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;->flush()V

    .line 211
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public getCamera()Lcom/badlogic/gdx/graphics/Camera;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    return-object v0
.end method

.method public getRenderContext()Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;
    .locals 1

    .line 182
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    return-object v0
.end method

.method public getRenderableSorter()Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->sorter:Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;

    return-object v0
.end method

.method public getShaderProvider()Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

    return-object v0
.end method

.method public ownsRenderContext()Z
    .locals 1

    .line 177
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->ownContext:Z

    return v0
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

    invoke-interface {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;->getShader(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Shader;

    move-result-object v0

    iput-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    .line 228
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;)V
    .locals 3

    .line 235
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 236
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderablesPool:Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;

    invoke-interface {p1, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;->getRenderables(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V

    .line 237
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, p1, :cond_0

    .line 238
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 239
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

    invoke-interface {v1, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;->getShader(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Shader;

    move-result-object v1

    iput-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;Lcom/badlogic/gdx/graphics/g3d/Environment;)V
    .locals 3

    .line 257
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 258
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderablesPool:Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;

    invoke-interface {p1, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;->getRenderables(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V

    .line 259
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, p1, :cond_0

    .line 260
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 261
    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    .line 262
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

    invoke-interface {v1, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;->getShader(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Shader;

    move-result-object v1

    iput-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;Lcom/badlogic/gdx/graphics/g3d/Environment;Lcom/badlogic/gdx/graphics/g3d/Shader;)V
    .locals 3

    .line 309
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 310
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderablesPool:Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;

    invoke-interface {p1, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;->getRenderables(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V

    .line 311
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, p1, :cond_0

    .line 312
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 313
    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    .line 314
    iput-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    .line 315
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

    invoke-interface {v1, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;->getShader(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Shader;

    move-result-object v1

    iput-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;Lcom/badlogic/gdx/graphics/g3d/Shader;)V
    .locals 3

    .line 282
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 283
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderablesPool:Lcom/badlogic/gdx/graphics/g3d/ModelBatch$RenderablePool;

    invoke-interface {p1, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;->getRenderables(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V

    .line 284
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, p1, :cond_0

    .line 285
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 286
    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    .line 287
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->shaderProvider:Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;

    invoke-interface {v1, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/ShaderProvider;->getShader(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Shader;

    move-result-object v1

    iput-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public render(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;",
            ">(",
            "Ljava/lang/Iterable<",
            "TT;>;)V"
        }
    .end annotation

    .line 247
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;

    .line 248
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->render(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public render(Ljava/lang/Iterable;Lcom/badlogic/gdx/graphics/g3d/Environment;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;",
            ">(",
            "Ljava/lang/Iterable<",
            "TT;>;",
            "Lcom/badlogic/gdx/graphics/g3d/Environment;",
            ")V"
        }
    .end annotation

    .line 272
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;

    .line 273
    invoke-virtual {p0, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->render(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;Lcom/badlogic/gdx/graphics/g3d/Environment;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public render(Ljava/lang/Iterable;Lcom/badlogic/gdx/graphics/g3d/Environment;Lcom/badlogic/gdx/graphics/g3d/Shader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;",
            ">(",
            "Ljava/lang/Iterable<",
            "TT;>;",
            "Lcom/badlogic/gdx/graphics/g3d/Environment;",
            "Lcom/badlogic/gdx/graphics/g3d/Shader;",
            ")V"
        }
    .end annotation

    .line 328
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;

    .line 329
    invoke-virtual {p0, v0, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->render(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;Lcom/badlogic/gdx/graphics/g3d/Environment;Lcom/badlogic/gdx/graphics/g3d/Shader;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public render(Ljava/lang/Iterable;Lcom/badlogic/gdx/graphics/g3d/Shader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;",
            ">(",
            "Ljava/lang/Iterable<",
            "TT;>;",
            "Lcom/badlogic/gdx/graphics/g3d/Shader;",
            ")V"
        }
    .end annotation

    .line 297
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;

    .line 298
    invoke-virtual {p0, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->render(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;Lcom/badlogic/gdx/graphics/g3d/Shader;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setCamera(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    if-eqz v0, :cond_1

    .line 161
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->flush()V

    .line 162
    :cond_0
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelBatch;->camera:Lcom/badlogic/gdx/graphics/Camera;

    return-void

    .line 160
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Call begin() first."

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
