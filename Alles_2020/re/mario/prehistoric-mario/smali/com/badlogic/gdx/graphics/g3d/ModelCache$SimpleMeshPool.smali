.class public Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;
.super Ljava/lang/Object;
.source "ModelCache.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/ModelCache$MeshPool;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/ModelCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleMeshPool"
.end annotation


# instance fields
.field private freeMeshes:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/Mesh;",
            ">;"
        }
    .end annotation
.end field

.field private usedMeshes:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/Mesh;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    .line 64
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 92
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/Mesh;

    .line 93
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    goto :goto_0

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 95
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/Mesh;

    .line 96
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    goto :goto_1

    .line 97
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public flush()V
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 69
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public obtain(Lcom/badlogic/gdx/graphics/VertexAttributes;II)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 5

    .line 74
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 75
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/Mesh;

    .line 76
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Mesh;->getMaxVertices()I

    move-result v4

    if-lt v4, p2, :cond_0

    .line 77
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/Mesh;->getMaxIndices()I

    move-result v4

    if-lt v4, p3, :cond_0

    .line 78
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    .line 79
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x1

    sub-int/2addr p3, p2

    .line 84
    invoke-static {p3}, Ljava/lang/Integer;->numberOfLeadingZeros(I)I

    move-result p3

    rsub-int/lit8 p3, p3, 0x20

    shl-int/2addr p2, p3

    const p3, 0x8000

    invoke-static {p3, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    .line 85
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    invoke-direct {v0, v1, p3, p2, p1}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V

    .line 86
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$SimpleMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v0
.end method
