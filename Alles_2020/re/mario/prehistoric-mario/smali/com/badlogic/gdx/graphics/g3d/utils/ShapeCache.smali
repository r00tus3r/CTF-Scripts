.class public Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;
.super Ljava/lang/Object;
.source "ShapeCache.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;
.implements Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;


# instance fields
.field private final builder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

.field private building:Z

.field private final id:Ljava/lang/String;

.field private final mesh:Lcom/badlogic/gdx/graphics/Mesh;

.field private final renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;


# direct methods
.method public constructor <init>()V
    .locals 6

    .line 71
    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttributes;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/badlogic/gdx/graphics/VertexAttribute;

    new-instance v2, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v3, 0x1

    const/4 v4, 0x3

    const-string v5, "a_position"

    invoke-direct {v2, v3, v4, v5}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    const/4 v4, 0x0

    aput-object v2, v1, v4

    new-instance v2, Lcom/badlogic/gdx/graphics/VertexAttribute;

    const/4 v4, 0x4

    const-string v5, "a_color"

    invoke-direct {v2, v4, v4, v5}, Lcom/badlogic/gdx/graphics/VertexAttribute;-><init>(IILjava/lang/String;)V

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    const/16 v1, 0x1388

    invoke-direct {p0, v1, v1, v0, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;-><init>(IILcom/badlogic/gdx/graphics/VertexAttributes;I)V

    return-void
.end method

.method public constructor <init>(IILcom/badlogic/gdx/graphics/VertexAttributes;I)V
    .locals 2

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "id"

    .line 66
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->id:Ljava/lang/String;

    .line 67
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/Renderable;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 82
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 85
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    invoke-direct {p1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->builder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    .line 88
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 89
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iput p4, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 90
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    new-instance p2, Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-direct {p2}, Lcom/badlogic/gdx/graphics/g3d/Material;-><init>()V

    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    return-void
.end method


# virtual methods
.method public begin()Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;
    .locals 1

    const/4 v0, 0x1

    .line 95
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->begin(I)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object v0

    return-object v0
.end method

.method public begin(I)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;
    .locals 3

    .line 101
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->building:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 102
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->building:Z

    .line 104
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->builder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->begin(Lcom/badlogic/gdx/graphics/VertexAttributes;)V

    .line 105
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->builder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    const-string v2, "id"

    invoke-virtual {v0, v2, p1, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->part(Ljava/lang/String;ILcom/badlogic/gdx/graphics/g3d/model/MeshPart;)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    .line 106
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->builder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    return-object p1

    .line 101
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Call end() after calling begin()"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public dispose()V
    .locals 1

    .line 136
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    return-void
.end method

.method public end()V
    .locals 2

    .line 111
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->building:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 112
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->building:Z

    .line 114
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->builder:Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->end(Lcom/badlogic/gdx/graphics/Mesh;)Lcom/badlogic/gdx/graphics/Mesh;

    return-void

    .line 111
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Call begin() prior to calling end()"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMaterial()Lcom/badlogic/gdx/graphics/g3d/Material;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    return-object v0
.end method

.method public getRenderables(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V
    .locals 0
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

    .line 119
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-void
.end method

.method public getWorldTransform()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ShapeCache;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method
