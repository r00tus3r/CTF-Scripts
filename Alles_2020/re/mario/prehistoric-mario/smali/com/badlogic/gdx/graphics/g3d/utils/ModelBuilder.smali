.class public Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;
.super Ljava/lang/Object;
.source "ModelBuilder.java"


# instance fields
.field private builders:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;",
            ">;"
        }
    .end annotation
.end field

.field private model:Lcom/badlogic/gdx/graphics/g3d/Model;

.field private node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

.field private tmpTransform:Lcom/badlogic/gdx/math/Matrix4;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->builders:Lcom/badlogic/gdx/utils/Array;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->tmpTransform:Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method private endnode()V
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 86
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    :cond_0
    return-void
.end method

.method private getBuilder(Lcom/badlogic/gdx/graphics/VertexAttributes;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;
    .locals 4

    .line 52
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->builders:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    .line 53
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->lastIndex()S

    move-result v2

    const/16 v3, 0x3fff

    if-ge v2, v3, :cond_0

    return-object v1

    .line 54
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;-><init>()V

    .line 55
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->begin(Lcom/badlogic/gdx/graphics/VertexAttributes;)V

    .line 56
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->builders:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static rebuildReferences(Lcom/badlogic/gdx/graphics/g3d/Model;)V
    .locals 2

    .line 362
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 363
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 364
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshParts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 365
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 366
    invoke-static {p0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->rebuildReferences(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/graphics/g3d/model/Node;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static rebuildReferences(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/graphics/g3d/model/Node;)V
    .locals 5

    .line 370
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/Node;->parts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    .line 371
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/utils/Array;->contains(Ljava/lang/Object;Z)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 372
    :cond_1
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshParts:Lcom/badlogic/gdx/utils/Array;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/utils/Array;->contains(Ljava/lang/Object;Z)Z

    move-result v2

    if-nez v2, :cond_0

    .line 373
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshParts:Lcom/badlogic/gdx/utils/Array;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 374
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshes:Lcom/badlogic/gdx/utils/Array;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/utils/Array;->contains(Ljava/lang/Object;Z)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshes:Lcom/badlogic/gdx/utils/Array;

    iget-object v3, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 375
    :cond_2
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/graphics/g3d/Model;->manageDisposable(Lcom/badlogic/gdx/utils/Disposable;)V

    goto :goto_0

    .line 378
    :cond_3
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->getChildren()Ljava/lang/Iterable;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 379
    invoke-static {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->rebuildReferences(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/graphics/g3d/model/Node;)V

    goto :goto_1

    :cond_4
    return-void
.end method


# virtual methods
.method public begin()V
    .locals 2

    .line 62
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 63
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 64
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/Model;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/Model;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    .line 65
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->builders:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->clear()V

    return-void

    .line 62
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Call end() first"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public createArrow(FFFFFFFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 12

    .line 417
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    const-string v1, "arrow"

    move-object v0, p0

    move/from16 v2, p10

    move-wide/from16 v3, p12

    move-object/from16 v5, p11

    .line 418
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object v2

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-interface/range {v2 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->arrow(FFFFFFFFI)V

    .line 419
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createArrow(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 14

    move-object v0, p1

    move-object/from16 v1, p2

    .line 425
    iget v2, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v3, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v4, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v5, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v6, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v7, v1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const v8, 0x3dcccccd    # 0.1f

    const v9, 0x3dcccccd    # 0.1f

    const/4 v10, 0x5

    const/4 v11, 0x4

    move-object v0, p0

    move v1, v2

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move v9, v10

    move v10, v11

    move-object/from16 v11, p3

    move-wide/from16 v12, p4

    invoke-virtual/range {v0 .. v13}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createArrow(FFFFFFFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createBox(FFFILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 6

    .line 197
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    const-string v1, "box"

    move-object v0, p0

    move v2, p4

    move-wide v3, p6

    move-object v5, p5

    .line 198
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object p4

    invoke-interface {p4, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->box(FFF)V

    .line 199
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public createBox(FFFLcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 8

    const/4 v4, 0x4

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    move-wide v6, p5

    .line 188
    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createBox(FFFILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public createCapsule(FFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 6

    .line 354
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    const-string v1, "capsule"

    move-object v0, p0

    move v2, p4

    move-wide v3, p6

    move-object v5, p5

    .line 355
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object p4

    invoke-interface {p4, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->capsule(FFI)V

    .line 356
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public createCapsule(FFILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 8

    const/4 v4, 0x4

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move-object v5, p4

    move-wide v6, p5

    .line 345
    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createCapsule(FFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public createCone(FFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 11

    const/4 v9, 0x0

    const/high16 v10, 0x43b40000    # 360.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move-wide/from16 v7, p7

    .line 277
    invoke-virtual/range {v0 .. v10}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createCone(FFFIILcom/badlogic/gdx/graphics/g3d/Material;JFF)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createCone(FFFIILcom/badlogic/gdx/graphics/g3d/Material;JFF)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 9

    .line 295
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    const-string v1, "cone"

    move-object v0, p0

    move v2, p5

    move-wide/from16 v3, p7

    move-object v5, p6

    .line 296
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object v2

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move/from16 v7, p9

    move/from16 v8, p10

    invoke-interface/range {v2 .. v8}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->cone(FFFIFF)V

    .line 297
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createCone(FFFILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 9

    const/4 v5, 0x4

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p5

    move-wide v7, p6

    .line 268
    invoke-virtual/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createCone(FFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createCone(FFFILcom/badlogic/gdx/graphics/g3d/Material;JFF)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 11

    const/4 v5, 0x4

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object/from16 v6, p5

    move-wide/from16 v7, p6

    move/from16 v9, p8

    move/from16 v10, p9

    .line 286
    invoke-virtual/range {v0 .. v10}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createCone(FFFIILcom/badlogic/gdx/graphics/g3d/Material;JFF)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createCylinder(FFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 11

    const/4 v9, 0x0

    const/high16 v10, 0x43b40000    # 360.0f

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move/from16 v5, p5

    move-object/from16 v6, p6

    move-wide/from16 v7, p7

    .line 240
    invoke-virtual/range {v0 .. v10}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createCylinder(FFFIILcom/badlogic/gdx/graphics/g3d/Material;JFF)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createCylinder(FFFIILcom/badlogic/gdx/graphics/g3d/Material;JFF)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 9

    .line 258
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    const-string v1, "cylinder"

    move-object v0, p0

    move v2, p5

    move-wide/from16 v3, p7

    move-object v5, p6

    .line 259
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object v2

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move/from16 v7, p9

    move/from16 v8, p10

    invoke-interface/range {v2 .. v8}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->cylinder(FFFIFF)V

    .line 260
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createCylinder(FFFILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 9

    const/4 v5, 0x4

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v6, p5

    move-wide v7, p6

    .line 231
    invoke-virtual/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createCylinder(FFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createCylinder(FFFILcom/badlogic/gdx/graphics/g3d/Material;JFF)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 11

    const/4 v5, 0x4

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object/from16 v6, p5

    move-wide/from16 v7, p6

    move/from16 v9, p8

    move/from16 v10, p9

    .line 249
    invoke-virtual/range {v0 .. v10}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createCylinder(FFFIILcom/badlogic/gdx/graphics/g3d/Material;JFF)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createLineGrid(IIFFLcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 18

    move/from16 v0, p1

    move/from16 v1, p2

    .line 435
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    const-string v3, "lines"

    const/4 v4, 0x1

    move-object/from16 v2, p0

    move-wide/from16 v5, p6

    move-object/from16 v7, p5

    .line 436
    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object v2

    int-to-float v3, v0

    mul-float v3, v3, p3

    int-to-float v4, v1

    mul-float v4, v4, p4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    div-float/2addr v4, v5

    neg-float v12, v3

    neg-float v13, v4

    const/4 v14, 0x0

    move/from16 v16, v12

    move/from16 v17, v16

    const/4 v15, 0x0

    :goto_0
    if-gt v15, v0, :cond_0

    const/4 v7, 0x0

    const/4 v10, 0x0

    move-object v5, v2

    move/from16 v6, v16

    move v8, v4

    move/from16 v9, v17

    move v11, v13

    .line 440
    invoke-interface/range {v5 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->line(FFFFFF)V

    add-float v16, v16, p3

    add-float v17, v17, p3

    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const/4 v4, 0x0

    move v15, v13

    :goto_1
    if-gt v14, v1, :cond_1

    move-object v5, v2

    move v6, v12

    move v7, v0

    move v8, v13

    move v9, v3

    move v10, v4

    move v11, v15

    .line 452
    invoke-interface/range {v5 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->line(FFFFFF)V

    add-float v13, v13, p4

    add-float v15, v15, p4

    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 457
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createRect(FFFFFFFFFFFFFFFILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 18

    .line 219
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    const-string v1, "rect"

    move-object/from16 v0, p0

    move/from16 v2, p16

    move-wide/from16 v3, p18

    move-object/from16 v5, p17

    .line 220
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object v2

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    move/from16 v13, p11

    move/from16 v14, p12

    move/from16 v15, p13

    move/from16 v16, p14

    move/from16 v17, p15

    invoke-interface/range {v2 .. v17}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->rect(FFFFFFFFFFFFFFF)V

    .line 222
    invoke-virtual/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createRect(FFFFFFFFFFFFFFFLcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 20

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move/from16 v12, p12

    move/from16 v13, p13

    move/from16 v14, p14

    move/from16 v15, p15

    move-object/from16 v17, p16

    move-wide/from16 v18, p17

    const/16 v16, 0x4

    .line 208
    invoke-virtual/range {v0 .. v19}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createRect(FFFFFFFFFFFFFFFILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createSphere(FFFIIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 14

    const/4 v10, 0x0

    const/high16 v11, 0x43b40000    # 360.0f

    const/4 v12, 0x0

    const/high16 v13, 0x43340000    # 180.0f

    move-object v0, p0

    move v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-wide/from16 v8, p8

    .line 315
    invoke-virtual/range {v0 .. v13}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createSphere(FFFIIILcom/badlogic/gdx/graphics/g3d/Material;JFFFF)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createSphere(FFFIIILcom/badlogic/gdx/graphics/g3d/Material;JFFFF)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 12

    .line 334
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    const-string v1, "cylinder"

    move-object v0, p0

    move/from16 v2, p6

    move-wide/from16 v3, p8

    move-object/from16 v5, p7

    .line 335
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object v2

    move v3, p1

    move v4, p2

    move v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p10

    move/from16 v9, p11

    move/from16 v10, p12

    move/from16 v11, p13

    invoke-interface/range {v2 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->sphere(FFFIIFFFF)V

    .line 337
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createSphere(FFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 10

    const/4 v6, 0x4

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move-object/from16 v7, p6

    move-wide/from16 v8, p7

    .line 306
    invoke-virtual/range {v0 .. v9}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createSphere(FFFIIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createSphere(FFFIILcom/badlogic/gdx/graphics/g3d/Material;JFFFF)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 14

    const/4 v6, 0x4

    move-object v0, p0

    move v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v7, p6

    move-wide/from16 v8, p7

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move/from16 v13, p12

    .line 324
    invoke-virtual/range {v0 .. v13}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createSphere(FFFIIILcom/badlogic/gdx/graphics/g3d/Material;JFFFF)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createXYZCoordinates(FFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 12

    .line 390
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->begin()V

    .line 392
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node()Lcom/badlogic/gdx/graphics/g3d/model/Node;

    const-string v1, "xyz"

    move-object v0, p0

    move/from16 v2, p5

    move-wide/from16 v3, p7

    move-object/from16 v5, p6

    .line 394
    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object v0

    .line 395
    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->RED:Lcom/badlogic/gdx/graphics/Color;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v0

    move v6, p1

    move v9, p2

    move v10, p3

    move/from16 v11, p4

    .line 396
    invoke-interface/range {v2 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->arrow(FFFFFFFFI)V

    .line 397
    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->GREEN:Lcom/badlogic/gdx/graphics/Color;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    const/4 v6, 0x0

    move v7, p1

    .line 398
    invoke-interface/range {v2 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->arrow(FFFFFFFFI)V

    .line 399
    sget-object v1, Lcom/badlogic/gdx/graphics/Color;->BLUE:Lcom/badlogic/gdx/graphics/Color;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    const/4 v7, 0x0

    move v8, p1

    .line 400
    invoke-interface/range {v2 .. v11}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;->arrow(FFFFFFFFI)V

    .line 402
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->end()Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object v0

    return-object v0
.end method

.method public createXYZCoordinates(FLcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 9

    const v2, 0x3dcccccd    # 0.1f

    const v3, 0x3dcccccd    # 0.1f

    const/4 v4, 0x5

    const/4 v5, 0x4

    move-object v0, p0

    move v1, p1

    move-object v6, p2

    move-wide v7, p3

    .line 406
    invoke-virtual/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->createXYZCoordinates(FFFIILcom/badlogic/gdx/graphics/g3d/Material;J)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public end()Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 3

    .line 71
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-eqz v0, :cond_1

    .line 73
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->endnode()V

    const/4 v1, 0x0

    .line 74
    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    .line 76
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->builders:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    .line 77
    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->end()Lcom/badlogic/gdx/graphics/Mesh;

    goto :goto_0

    .line 78
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->builders:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 80
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->rebuildReferences(Lcom/badlogic/gdx/graphics/g3d/Model;)V

    return-object v0

    .line 71
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Call begin() first"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public manage(Lcom/badlogic/gdx/utils/Disposable;)V
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/Model;->manageDisposable(Lcom/badlogic/gdx/utils/Disposable;)V

    return-void

    .line 126
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Call begin() first"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public node()Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 3

    .line 105
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/model/Node;-><init>()V

    .line 106
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node(Lcom/badlogic/gdx/graphics/g3d/model/Node;)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 107
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "node"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->id:Ljava/lang/String;

    return-object v0
.end method

.method protected node(Lcom/badlogic/gdx/graphics/g3d/model/Node;)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-eqz v0, :cond_0

    .line 94
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->endnode()V

    .line 96
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 97
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    return-object p1

    .line 92
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Call begin() first"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public node(Ljava/lang/String;Lcom/badlogic/gdx/graphics/g3d/Model;)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 1

    .line 115
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/model/Node;-><init>()V

    .line 116
    iput-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->id:Ljava/lang/String;

    .line 117
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->addChildren(Ljava/lang/Iterable;)I

    .line 118
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node(Lcom/badlogic/gdx/graphics/g3d/model/Node;)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 119
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/Model;->getManagedDisposables()Ljava/lang/Iterable;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/utils/Disposable;

    .line 120
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->manage(Lcom/badlogic/gdx/utils/Disposable;)V

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public part(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Mesh;IIILcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
    .locals 1

    .line 143
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;-><init>()V

    .line 144
    iput-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->id:Ljava/lang/String;

    .line 145
    iput p3, v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 146
    iput-object p2, v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 147
    iput p4, v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    .line 148
    iput p5, v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    .line 149
    invoke-virtual {p0, v0, p6}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;Lcom/badlogic/gdx/graphics/g3d/Material;)V

    return-object v0
.end method

.method public part(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Mesh;ILcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;
    .locals 7

    .line 158
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/Mesh;->getNumIndices()I

    move-result v5

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Mesh;IIILcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;IJLcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;
    .locals 0

    .line 180
    invoke-static {p3, p4}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->createAttributes(J)Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3, p5}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Ljava/lang/String;ILcom/badlogic/gdx/graphics/VertexAttributes;Lcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;

    move-result-object p1

    return-object p1
.end method

.method public part(Ljava/lang/String;ILcom/badlogic/gdx/graphics/VertexAttributes;Lcom/badlogic/gdx/graphics/g3d/Material;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshPartBuilder;
    .locals 0

    .line 167
    invoke-direct {p0, p3}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->getBuilder(Lcom/badlogic/gdx/graphics/VertexAttributes;)Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;

    move-result-object p3

    .line 168
    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/utils/MeshBuilder;->part(Ljava/lang/String;I)Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    move-result-object p1

    invoke-virtual {p0, p1, p4}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->part(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;Lcom/badlogic/gdx/graphics/g3d/Material;)V

    return-object p3
.end method

.method public part(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;Lcom/badlogic/gdx/graphics/g3d/Material;)V
    .locals 2

    .line 134
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node()Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 135
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/ModelBuilder;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->parts:Lcom/badlogic/gdx/utils/Array;

    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    invoke-direct {v1, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;-><init>(Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;Lcom/badlogic/gdx/graphics/g3d/Material;)V

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-void
.end method
