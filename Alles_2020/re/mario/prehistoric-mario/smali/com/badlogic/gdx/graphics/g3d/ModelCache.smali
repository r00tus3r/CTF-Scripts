.class public Lcom/badlogic/gdx/graphics/g3d/ModelCache;
.super Ljava/lang/Object;
.source "ModelCache.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;
.implements Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/ModelCache$Sorter;,
        Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;,
        Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;,
        Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;
    }
.end annotation


# instance fields
.field private building:Z

.field private camera:Lcom/badlogic/gdx/graphics/Camera;

.field private items:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;"
        }
    .end annotation
.end field

.field private meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

.field private meshPartPool:Lcom/badlogic/gdx/utils/FlushablePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/FlushablePool<",
            "Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;",
            ">;"
        }
    .end annotation
.end field

.field private meshPool:Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;

.field private renderables:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;"
        }
    .end annotation
.end field

.field private renderablesPool:Lcom/badlogic/gdx/utils/FlushablePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/FlushablePool<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;"
        }
    .end annotation
.end field

.field private sorter:Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;

.field private tmp:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 191
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$Sorter;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$Sorter;-><init>()V

    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/ModelCache;-><init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;)V
    .locals 1

    .line 198
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 165
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    .line 166
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$1;-><init>(Lcom/badlogic/gdx/graphics/g3d/ModelCache;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderablesPool:Lcom/badlogic/gdx/utils/FlushablePool;

    .line 172
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$2;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$2;-><init>(Lcom/badlogic/gdx/graphics/g3d/ModelCache;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPartPool:Lcom/badlogic/gdx/utils/FlushablePool;

    .line 179
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    .line 180
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->tmp:Lcom/badlogic/gdx/utils/Array;

    .line 199
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->sorter:Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;

    .line 200
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPool:Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;

    .line 201
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    invoke-direct {p1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    return-void
.end method

.method private obtainRenderable(Lcom/badlogic/gdx/graphics/g3d/Material;I)Lcom/badlogic/gdx/graphics/g3d/Renderable;
    .locals 3

    .line 230
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderablesPool:Lcom/badlogic/gdx/utils/FlushablePool;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/FlushablePool;->obtain()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    const/4 v1, 0x0

    .line 231
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->bones:[Lcom/badlogic/gdx/math/Matrix4;

    .line 232
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    .line 233
    iput-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 234
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iput-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 235
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    const/4 v2, 0x0

    iput v2, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    .line 236
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iput v2, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    .line 237
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iput p2, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 238
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 239
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->halfExtents:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2, p2, p2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 240
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    const/high16 p2, -0x40800000    # -1.0f

    iput p2, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->radius:F

    .line 241
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    .line 242
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->userData:Ljava/lang/Object;

    .line 243
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method


# virtual methods
.method public add(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V
    .locals 1

    .line 320
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->building:Z

    if-eqz v0, :cond_1

    .line 321
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->bones:[Lcom/badlogic/gdx/math/Matrix4;

    if-nez v0, :cond_0

    .line 322
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :goto_0
    return-void

    .line 320
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Can only add items to the ModelCache in between .begin() and .end()"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;)V
    .locals 2

    .line 329
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->tmp:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderablesPool:Lcom/badlogic/gdx/utils/FlushablePool;

    invoke-interface {p1, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;->getRenderables(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V

    .line 330
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->tmp:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 331
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->tmp:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->add(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 332
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->tmp:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public add(Ljava/lang/Iterable;)V
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

    .line 337
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;

    .line 338
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->add(Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public begin()V
    .locals 1

    const/4 v0, 0x0

    .line 209
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->begin(Lcom/badlogic/gdx/graphics/Camera;)V

    return-void
.end method

.method public begin(Lcom/badlogic/gdx/graphics/Camera;)V
    .locals 1

    .line 218
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->building:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 219
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->building:Z

    .line 221
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->camera:Lcom/badlogic/gdx/graphics/Camera;

    .line 222
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderablesPool:Lcom/badlogic/gdx/utils/FlushablePool;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/FlushablePool;->flush()V

    .line 223
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 224
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 225
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPartPool:Lcom/badlogic/gdx/utils/FlushablePool;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/FlushablePool;->flush()V

    .line 226
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPool:Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;->flush()V

    return-void

    .line 218
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Call end() after calling begin()"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public dispose()V
    .locals 2

    .line 353
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->building:Z

    if-nez v0, :cond_0

    .line 354
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPool:Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;->dispose()V

    return-void

    .line 353
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Cannot dispose a ModelCache in between .begin() and .end()"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public end()V
    .locals 16

    move-object/from16 v0, p0

    .line 251
    iget-boolean v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->building:Z

    if-eqz v1, :cond_8

    const/4 v1, 0x0

    .line 252
    iput-boolean v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->building:Z

    .line 254
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v2, :cond_0

    return-void

    .line 255
    :cond_0
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->sorter:Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;

    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-interface {v2, v3, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;->sort(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/utils/Array;)V

    .line 257
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 258
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 260
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 261
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v3

    .line 262
    iget-object v4, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 263
    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 264
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v5, v5, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 266
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    invoke-virtual {v6, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->begin(Lcom/badlogic/gdx/graphics/VertexAttributes;)V

    .line 267
    iget-object v6, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPartPool:Lcom/badlogic/gdx/utils/FlushablePool;

    invoke-virtual {v7}, Lcom/badlogic/gdx/utils/FlushablePool;->obtain()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    const-string v8, ""

    invoke-virtual {v6, v8, v2, v7}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->part(Ljava/lang/String;ILcom/badlogic/gdx/graphics/g3d/model/MeshPart;)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    move-result-object v6

    .line 268
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, v4, v2}, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->obtainRenderable(Lcom/badlogic/gdx/graphics/g3d/Material;I)Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v9

    invoke-virtual {v7, v9}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 270
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    iget v7, v7, Lcom/badlogic/gdx/utils/Array;->size:I

    move-object v9, v4

    move v4, v2

    const/4 v2, 0x0

    :goto_0
    const/4 v10, 0x1

    if-ge v2, v7, :cond_6

    .line 271
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v11, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 272
    iget-object v12, v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v12, v12, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v12

    .line 273
    iget-object v13, v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 274
    iget-object v14, v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v14, v14, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 276
    invoke-virtual {v12, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_1

    iget-object v15, v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v15, v15, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    .line 277
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->getNumVertices()I

    move-result v1

    add-int/2addr v15, v1

    const/16 v1, 0x7fff

    if-ge v15, v1, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    if-eqz v1, :cond_2

    if-ne v14, v4, :cond_2

    .line 278
    invoke-virtual {v13, v9, v10}, Lcom/badlogic/gdx/graphics/g3d/Material;->same(Lcom/badlogic/gdx/graphics/g3d/Attributes;Z)Z

    move-result v15

    if-eqz v15, :cond_2

    const/4 v15, 0x1

    goto :goto_2

    :cond_2
    const/4 v15, 0x0

    :goto_2
    if-nez v15, :cond_5

    if-nez v1, :cond_4

    .line 282
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPool:Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->getNumVertices()I

    move-result v9

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    .line 283
    invoke-virtual {v15}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->getNumIndices()I

    move-result v15

    .line 282
    invoke-interface {v4, v3, v9, v15}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;->obtain(Lcom/badlogic/gdx/graphics/VertexAttributes;II)Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->end(Lcom/badlogic/gdx/graphics/Mesh;)Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object v1

    .line 284
    :goto_3
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v3, v3, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v5, v3, :cond_3

    .line 285
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    add-int/lit8 v4, v5, 0x1

    invoke-virtual {v3, v5}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iput-object v1, v3, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    move v5, v4

    goto :goto_3

    .line 286
    :cond_3
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    invoke-virtual {v1, v12}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->begin(Lcom/badlogic/gdx/graphics/VertexAttributes;)V

    move-object v3, v12

    .line 289
    :cond_4
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPartPool:Lcom/badlogic/gdx/utils/FlushablePool;

    invoke-virtual {v4}, Lcom/badlogic/gdx/utils/FlushablePool;->obtain()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    invoke-virtual {v1, v8, v14, v4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->part(Ljava/lang/String;ILcom/badlogic/gdx/graphics/g3d/model/MeshPart;)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    move-result-object v1

    .line 290
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v9, v4, Lcom/badlogic/gdx/utils/Array;->size:I

    sub-int/2addr v9, v10

    invoke-virtual {v4, v9}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 291
    iget-object v9, v4, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v10, v6, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    iput v10, v9, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    .line 292
    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v6, v6, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    iput v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    .line 295
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, v13, v14}, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->obtainRenderable(Lcom/badlogic/gdx/graphics/g3d/Material;I)Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v6

    invoke-virtual {v4, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    move-object v6, v1

    move-object v9, v13

    move v4, v14

    .line 298
    :cond_5
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v10, v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v1, v10}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->setVertexTransform(Lcom/badlogic/gdx/math/Matrix4;)V

    .line 299
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v10, v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v10, v10, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v12, v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v12, v12, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    iget-object v11, v11, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v11, v11, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    invoke-virtual {v1, v10, v12, v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->addMesh(Lcom/badlogic/gdx/graphics/Mesh;II)V

    add-int/lit8 v2, v2, 0x1

    const/4 v1, 0x0

    goto/16 :goto_0

    .line 302
    :cond_6
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshPool:Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->getNumVertices()I

    move-result v4

    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->meshBuilder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    .line 303
    invoke-virtual {v7}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->getNumIndices()I

    move-result v7

    .line 302
    invoke-interface {v2, v3, v4, v7}, Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;->obtain(Lcom/badlogic/gdx/graphics/VertexAttributes;II)Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->end(Lcom/badlogic/gdx/graphics/Mesh;)Lcom/badlogic/gdx/graphics/Mesh;

    move-result-object v1

    .line 304
    :goto_4
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v5, v2, :cond_7

    .line 305
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    add-int/lit8 v3, v5, 0x1

    invoke-virtual {v2, v5}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iput-object v1, v2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    move v5, v3

    goto :goto_4

    .line 307
    :cond_7
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    iget v2, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    sub-int/2addr v2, v10

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 308
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v3, v6, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    iput v3, v2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    .line 309
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget v2, v6, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    iput v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    return-void

    .line 251
    :cond_8
    new-instance v1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v2, "Call begin() prior to calling end()"

    invoke-direct {v1, v2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_6

    :goto_5
    throw v1

    :goto_6
    goto :goto_5
.end method

.method public getRenderables(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;",
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;)V"
        }
    .end annotation

    .line 343
    iget-boolean p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->building:Z

    if-nez p2, :cond_1

    .line 344
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    const/4 v1, 0x0

    .line 345
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->shader:Lcom/badlogic/gdx/graphics/g3d/Shader;

    .line 346
    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    goto :goto_0

    .line 348
    :cond_0
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache;->renderables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    return-void

    .line 343
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Cannot render a ModelCache in between .begin() and .end()"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method
