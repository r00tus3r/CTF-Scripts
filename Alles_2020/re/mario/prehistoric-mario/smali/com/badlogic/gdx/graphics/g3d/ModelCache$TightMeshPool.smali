.class public Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;
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
    name = "TightMeshPool"
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

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    .line 105
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 131
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/Mesh;

    .line 132
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    goto :goto_0

    .line 133
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 134
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/Mesh;

    .line 135
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Mesh;->dispose()V

    goto :goto_1

    .line 136
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public flush()V
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    .line 110
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void
.end method

.method public obtain(Lcom/badlogic/gdx/graphics/VertexAttributes;II)Lcom/badlogic/gdx/graphics/Mesh;
    .locals 4

    .line 115
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 116
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/Mesh;

    .line 117
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->getMaxVertices()I

    move-result v3

    if-ne v3, p2, :cond_0

    .line 118
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->getMaxIndices()I

    move-result v3

    if-ne v3, p3, :cond_0

    .line 119
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->freeMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    .line 120
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 124
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/graphics/Mesh;

    const/4 v1, 0x1

    invoke-direct {v0, v1, p2, p3, p1}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V

    .line 125
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelCache$TightMeshPool;->usedMeshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v0
.end method
