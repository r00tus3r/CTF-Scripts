.class public Lcom/badlogic/gdx/graphics/g3d/Model;
.super Ljava/lang/Object;
.source "Model.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# instance fields
.field public final animations:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/Animation;",
            ">;"
        }
    .end annotation
.end field

.field protected final disposables:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/utils/Disposable;",
            ">;"
        }
    .end annotation
.end field

.field public final materials:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Material;",
            ">;"
        }
    .end annotation
.end field

.field public final meshParts:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;",
            ">;"
        }
    .end annotation
.end field

.field public final meshes:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/Mesh;",
            ">;"
        }
    .end annotation
.end field

.field private nodePartBones:Lcom/badlogic/gdx/utils/ObjectMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/ObjectMap<",
            "Lcom/badlogic/gdx/graphics/g3d/model/NodePart;",
            "Lcom/badlogic/gdx/utils/ArrayMap<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/math/Matrix4;",
            ">;>;"
        }
    .end annotation
.end field

.field public final nodes:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/Node;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    .line 75
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    .line 77
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    .line 79
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshes:Lcom/badlogic/gdx/utils/Array;

    .line 82
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshParts:Lcom/badlogic/gdx/utils/Array;

    .line 84
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->disposables:Lcom/badlogic/gdx/utils/Array;

    .line 161
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodePartBones:Lcom/badlogic/gdx/utils/ObjectMap;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;)V
    .locals 1

    .line 95
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/Model;-><init>(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V
    .locals 1

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    .line 75
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    .line 77
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    .line 79
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshes:Lcom/badlogic/gdx/utils/Array;

    .line 82
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshParts:Lcom/badlogic/gdx/utils/Array;

    .line 84
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->disposables:Lcom/badlogic/gdx/utils/Array;

    .line 161
    new-instance v0, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodePartBones:Lcom/badlogic/gdx/utils/ObjectMap;

    .line 102
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/Model;->load(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V

    return-void
.end method


# virtual methods
.method public calculateBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 0

    .line 380
    invoke-virtual {p1}, Lcom/badlogic/gdx/math/collision/BoundingBox;->inf()Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 381
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Model;->extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    move-result-object p1

    return-object p1
.end method

.method public calculateTransforms()V
    .locals 5

    .line 367
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x1

    if-ge v2, v0, :cond_0

    .line 369
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->calculateTransforms(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    :goto_1
    if-ge v1, v0, :cond_1

    .line 372
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->calculateBoneTransforms(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method protected convertMaterial(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)Lcom/badlogic/gdx/graphics/g3d/Material;
    .locals 17

    move-object/from16 v0, p1

    .line 276
    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g3d/Material;-><init>()V

    .line 277
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->id:Ljava/lang/String;

    iput-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/Material;->id:Ljava/lang/String;

    .line 278
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->ambient:Lcom/badlogic/gdx/graphics/Color;

    if-eqz v2, :cond_0

    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v3, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Ambient:J

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->ambient:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v3, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 279
    :cond_0
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->diffuse:Lcom/badlogic/gdx/graphics/Color;

    if-eqz v2, :cond_1

    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v3, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Diffuse:J

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->diffuse:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v3, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 280
    :cond_1
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->specular:Lcom/badlogic/gdx/graphics/Color;

    if-eqz v2, :cond_2

    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v3, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Specular:J

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->specular:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v3, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 281
    :cond_2
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->emissive:Lcom/badlogic/gdx/graphics/Color;

    if-eqz v2, :cond_3

    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v3, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Emissive:J

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->emissive:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v3, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 282
    :cond_3
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->reflection:Lcom/badlogic/gdx/graphics/Color;

    if-eqz v2, :cond_4

    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v3, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Reflection:J

    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->reflection:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v2, v3, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 283
    :cond_4
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->shininess:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5

    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    sget-wide v4, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->Shininess:J

    iget v6, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->shininess:F

    invoke-direct {v2, v4, v5, v6}, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;-><init>(JF)V

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 284
    :cond_5
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->opacity:F

    const/high16 v4, 0x3f800000    # 1.0f

    cmpl-float v2, v2, v4

    if-eqz v2, :cond_6

    new-instance v2, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    const/16 v5, 0x302

    const/16 v6, 0x303

    iget v7, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->opacity:F

    invoke-direct {v2, v5, v6, v7}, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;-><init>(IIF)V

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 286
    :cond_6
    new-instance v2, Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-direct {v2}, Lcom/badlogic/gdx/utils/ObjectMap;-><init>()V

    .line 289
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    if-eqz v5, :cond_13

    .line 290
    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_13

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;

    .line 292
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->fileName:Ljava/lang/String;

    invoke-virtual {v2, v6}, Lcom/badlogic/gdx/utils/ObjectMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_7

    .line 293
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->fileName:Ljava/lang/String;

    invoke-virtual {v2, v6}, Lcom/badlogic/gdx/utils/ObjectMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/graphics/Texture;

    move-object/from16 v8, p0

    move-object/from16 v7, p2

    goto :goto_1

    .line 295
    :cond_7
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->fileName:Ljava/lang/String;

    move-object/from16 v7, p2

    invoke-interface {v7, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;->load(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Texture;

    move-result-object v6

    .line 296
    iget-object v8, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->fileName:Ljava/lang/String;

    invoke-virtual {v2, v8, v6}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v8, p0

    .line 297
    iget-object v9, v8, Lcom/badlogic/gdx/graphics/g3d/Model;->disposables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v9, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 300
    :goto_1
    new-instance v12, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    invoke-direct {v12, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;-><init>(Lcom/badlogic/gdx/graphics/GLTexture;)V

    .line 301
    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Texture;->getMinFilter()Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    move-result-object v9

    iput-object v9, v12, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 302
    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Texture;->getMagFilter()Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    move-result-object v9

    iput-object v9, v12, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 303
    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Texture;->getUWrap()Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    move-result-object v9

    iput-object v9, v12, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->uWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    .line 304
    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Texture;->getVWrap()Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    move-result-object v6

    iput-object v6, v12, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->vWrap:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    .line 306
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvTranslation:Lcom/badlogic/gdx/math/Vector2;

    if-nez v6, :cond_8

    const/4 v13, 0x0

    goto :goto_2

    :cond_8
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvTranslation:Lcom/badlogic/gdx/math/Vector2;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->x:F

    move v13, v6

    .line 307
    :goto_2
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvTranslation:Lcom/badlogic/gdx/math/Vector2;

    if-nez v6, :cond_9

    const/4 v14, 0x0

    goto :goto_3

    :cond_9
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvTranslation:Lcom/badlogic/gdx/math/Vector2;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    move v14, v6

    .line 308
    :goto_3
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvScaling:Lcom/badlogic/gdx/math/Vector2;

    if-nez v6, :cond_a

    const/high16 v15, 0x3f800000    # 1.0f

    goto :goto_4

    :cond_a
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvScaling:Lcom/badlogic/gdx/math/Vector2;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->x:F

    move v15, v6

    .line 309
    :goto_4
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvScaling:Lcom/badlogic/gdx/math/Vector2;

    if-nez v6, :cond_b

    const/high16 v16, 0x3f800000    # 1.0f

    goto :goto_5

    :cond_b
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->uvScaling:Lcom/badlogic/gdx/math/Vector2;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    move/from16 v16, v6

    .line 311
    :goto_5
    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->usage:I

    const/4 v6, 0x2

    if-eq v5, v6, :cond_12

    const/4 v6, 0x3

    if-eq v5, v6, :cond_11

    const/4 v6, 0x4

    if-eq v5, v6, :cond_10

    const/4 v6, 0x5

    if-eq v5, v6, :cond_f

    const/4 v6, 0x7

    if-eq v5, v6, :cond_e

    const/16 v6, 0x8

    if-eq v5, v6, :cond_d

    const/16 v6, 0xa

    if-eq v5, v6, :cond_c

    goto/16 :goto_0

    .line 331
    :cond_c
    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    sget-wide v10, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Reflection:J

    move-object v9, v5

    invoke-direct/range {v9 .. v16}, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;-><init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;FFFF)V

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    goto/16 :goto_0

    .line 319
    :cond_d
    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    sget-wide v10, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Bump:J

    move-object v9, v5

    invoke-direct/range {v9 .. v16}, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;-><init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;FFFF)V

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    goto/16 :goto_0

    .line 322
    :cond_e
    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    sget-wide v10, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Normal:J

    move-object v9, v5

    invoke-direct/range {v9 .. v16}, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;-><init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;FFFF)V

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    goto/16 :goto_0

    .line 316
    :cond_f
    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    sget-wide v10, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Specular:J

    move-object v9, v5

    invoke-direct/range {v9 .. v16}, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;-><init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;FFFF)V

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    goto/16 :goto_0

    .line 325
    :cond_10
    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    sget-wide v10, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Ambient:J

    move-object v9, v5

    invoke-direct/range {v9 .. v16}, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;-><init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;FFFF)V

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    goto/16 :goto_0

    .line 328
    :cond_11
    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    sget-wide v10, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Emissive:J

    move-object v9, v5

    invoke-direct/range {v9 .. v16}, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;-><init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;FFFF)V

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    goto/16 :goto_0

    .line 313
    :cond_12
    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;

    sget-wide v10, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Diffuse:J

    move-object v9, v5

    invoke-direct/range {v9 .. v16}, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;-><init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;FFFF)V

    invoke-virtual {v1, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    goto/16 :goto_0

    :cond_13
    move-object/from16 v8, p0

    return-object v1
.end method

.method protected convertMesh(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;)V
    .locals 10

    .line 237
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v5, v0, v3

    .line 238
    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->indices:[S

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    if-lez v4, :cond_1

    const/4 v1, 0x1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    .line 241
    :goto_1
    new-instance v3, Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget-object v5, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->attributes:[Lcom/badlogic/gdx/graphics/VertexAttribute;

    invoke-direct {v3, v5}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    .line 242
    iget-object v5, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->vertices:[F

    array-length v5, v5

    iget v6, v3, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/lit8 v6, v6, 0x4

    div-int/2addr v5, v6

    .line 244
    new-instance v6, Lcom/badlogic/gdx/graphics/Mesh;

    invoke-direct {v6, v0, v5, v4, v3}, Lcom/badlogic/gdx/graphics/Mesh;-><init>(ZIILcom/badlogic/gdx/graphics/VertexAttributes;)V

    .line 245
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 246
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->disposables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 248
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->vertices:[F

    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Mesh;->getVerticesBuffer()Ljava/nio/FloatBuffer;

    move-result-object v3

    iget-object v4, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->vertices:[F

    array-length v4, v4

    invoke-static {v0, v3, v4, v2}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FLjava/nio/Buffer;II)V

    .line 250
    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 251
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;

    array-length v0, p1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_2
    if-ge v3, v0, :cond_4

    aget-object v7, p1, v3

    .line 252
    new-instance v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    invoke-direct {v8}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;-><init>()V

    .line 253
    iget-object v9, v7, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->id:Ljava/lang/String;

    iput-object v9, v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->id:Ljava/lang/String;

    .line 254
    iget v9, v7, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->primitiveType:I

    iput v9, v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->primitiveType:I

    .line 255
    iput v4, v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->offset:I

    if-eqz v1, :cond_2

    .line 256
    iget-object v9, v7, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->indices:[S

    array-length v9, v9

    goto :goto_3

    :cond_2
    move v9, v5

    :goto_3
    iput v9, v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    .line 257
    iput-object v6, v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    if-eqz v1, :cond_3

    .line 259
    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object v9

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMeshPart;->indices:[S

    invoke-virtual {v9, v7}, Ljava/nio/ShortBuffer;->put([S)Ljava/nio/ShortBuffer;

    .line 261
    :cond_3
    iget v7, v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->size:I

    add-int/2addr v4, v7

    .line 262
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshParts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v7, v8}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 264
    :cond_4
    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/Mesh;->getIndicesBuffer()Ljava/nio/ShortBuffer;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 265
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshParts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    .line 266
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->update()V

    goto :goto_4

    :cond_5
    return-void
.end method

.method public dispose()V
    .locals 2

    .line 354
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->disposables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/Disposable;

    .line 355
    invoke-interface {v1}, Lcom/badlogic/gdx/utils/Disposable;->dispose()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 3

    .line 389
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 391
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-virtual {v2, p1}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method public getAnimation(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/Animation;
    .locals 1

    const/4 v0, 0x1

    .line 398
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/Model;->getAnimation(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    move-result-object p1

    return-object p1
.end method

.method public getAnimation(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Animation;
    .locals 3

    .line 405
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    :goto_0
    if-ge v1, v0, :cond_3

    .line 409
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    iget-object v2, p2, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object p2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-ge v1, v0, :cond_3

    .line 412
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    iget-object v2, p2, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object p2

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method public getManagedDisposables()Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable<",
            "Lcom/badlogic/gdx/utils/Disposable;",
            ">;"
        }
    .end annotation

    .line 349
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->disposables:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getMaterial(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/Material;
    .locals 1

    const/4 v0, 0x1

    .line 420
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/Model;->getMaterial(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/Material;

    move-result-object p1

    return-object p1
.end method

.method public getMaterial(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/Material;
    .locals 3

    .line 427
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    :goto_0
    if-ge v1, v0, :cond_3

    .line 431
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/Material;

    iget-object v2, p2, Lcom/badlogic/gdx/graphics/g3d/Material;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object p2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-ge v1, v0, :cond_3

    .line 434
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/Material;

    iget-object v2, p2, Lcom/badlogic/gdx/graphics/g3d/Material;->id:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    return-object p2

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method public getNode(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 1

    const/4 v0, 0x1

    .line 442
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/Model;->getNode(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p1

    return-object p1
.end method

.method public getNode(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 1

    const/4 v0, 0x0

    .line 449
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/Model;->getNode(Ljava/lang/String;ZZ)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p1

    return-object p1
.end method

.method public getNode(Ljava/lang/String;ZZ)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 1

    .line 457
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-static {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->getNode(Lcom/badlogic/gdx/utils/Array;Ljava/lang/String;ZZ)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p1

    return-object p1
.end method

.method protected load(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V
    .locals 1

    .line 106
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->meshes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/Model;->loadMeshes(Ljava/lang/Iterable;)V

    .line 107
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/Model;->loadMaterials(Ljava/lang/Iterable;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V

    .line 108
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/graphics/g3d/Model;->loadNodes(Ljava/lang/Iterable;)V

    .line 109
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Model;->loadAnimations(Ljava/lang/Iterable;)V

    .line 110
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/Model;->calculateTransforms()V

    return-void
.end method

.method protected loadAnimations(Ljava/lang/Iterable;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;",
            ">;)V"
        }
    .end annotation

    .line 114
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;

    .line 115
    new-instance v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    invoke-direct {v1}, Lcom/badlogic/gdx/graphics/g3d/model/Animation;-><init>()V

    .line 116
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;->id:Ljava/lang/String;

    iput-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->id:Ljava/lang/String;

    .line 117
    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelAnimation;->nodeAnimations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;

    .line 118
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->nodeId:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/graphics/g3d/Model;->getNode(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v3

    if-nez v3, :cond_2

    goto :goto_1

    .line 120
    :cond_2
    new-instance v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;

    invoke-direct {v4}, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;-><init>()V

    .line 121
    iput-object v3, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 123
    iget-object v5, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    if-eqz v5, :cond_5

    .line 124
    new-instance v5, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v5}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    .line 125
    iget-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    iget-object v6, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    iget v6, v6, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 126
    iget-object v5, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    .line 127
    iget v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    iget v8, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->duration:F

    cmpl-float v7, v7, v8

    if-lez v7, :cond_3

    iget v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    iput v7, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->duration:F

    .line 128
    :cond_3
    iget-object v7, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    new-instance v8, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    iget v9, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    new-instance v10, Lcom/badlogic/gdx/math/Vector3;

    iget-object v11, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    if-nez v11, :cond_4

    iget-object v6, v3, Lcom/badlogic/gdx/graphics/g3d/model/Node;->translation:Lcom/badlogic/gdx/math/Vector3;

    goto :goto_3

    :cond_4
    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    check-cast v6, Lcom/badlogic/gdx/math/Vector3;

    :goto_3
    invoke-direct {v10, v6}, Lcom/badlogic/gdx/math/Vector3;-><init>(Lcom/badlogic/gdx/math/Vector3;)V

    invoke-direct {v8, v9, v10}, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;-><init>(FLjava/lang/Object;)V

    invoke-virtual {v7, v8}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_2

    .line 133
    :cond_5
    iget-object v5, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    if-eqz v5, :cond_8

    .line 134
    new-instance v5, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v5}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    .line 135
    iget-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    iget-object v6, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    iget v6, v6, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 136
    iget-object v5, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    .line 137
    iget v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    iget v8, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->duration:F

    cmpl-float v7, v7, v8

    if-lez v7, :cond_6

    iget v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    iput v7, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->duration:F

    .line 138
    :cond_6
    iget-object v7, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    new-instance v8, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    iget v9, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    new-instance v10, Lcom/badlogic/gdx/math/Quaternion;

    iget-object v11, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    if-nez v11, :cond_7

    iget-object v6, v3, Lcom/badlogic/gdx/graphics/g3d/model/Node;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    goto :goto_5

    :cond_7
    iget-object v6, v6, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    check-cast v6, Lcom/badlogic/gdx/math/Quaternion;

    :goto_5
    invoke-direct {v10, v6}, Lcom/badlogic/gdx/math/Quaternion;-><init>(Lcom/badlogic/gdx/math/Quaternion;)V

    invoke-direct {v8, v9, v10}, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;-><init>(FLjava/lang/Object;)V

    invoke-virtual {v7, v8}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_4

    .line 143
    :cond_8
    iget-object v5, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    if-eqz v5, :cond_b

    .line 144
    new-instance v5, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v5}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    .line 145
    iget-object v5, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    iget-object v6, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    iget v6, v6, Lcom/badlogic/gdx/utils/Array;->size:I

    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 146
    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;

    .line 147
    iget v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    iget v7, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->duration:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_9

    iget v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    iput v6, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->duration:F

    .line 148
    :cond_9
    iget-object v6, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    new-instance v7, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    iget v8, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->keytime:F

    new-instance v9, Lcom/badlogic/gdx/math/Vector3;

    iget-object v10, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    if-nez v10, :cond_a

    iget-object v5, v3, Lcom/badlogic/gdx/graphics/g3d/model/Node;->scale:Lcom/badlogic/gdx/math/Vector3;

    goto :goto_7

    :cond_a
    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodeKeyframe;->value:Ljava/lang/Object;

    check-cast v5, Lcom/badlogic/gdx/math/Vector3;

    :goto_7
    invoke-direct {v9, v5}, Lcom/badlogic/gdx/math/Vector3;-><init>(Lcom/badlogic/gdx/math/Vector3;)V

    invoke-direct {v7, v8, v9}, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;-><init>(FLjava/lang/Object;)V

    invoke-virtual {v6, v7}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_6

    .line 153
    :cond_b
    iget-object v2, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    if-eqz v2, :cond_c

    iget-object v2, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-gtz v2, :cond_e

    :cond_c
    iget-object v2, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    if-eqz v2, :cond_d

    iget-object v2, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-gtz v2, :cond_e

    :cond_d
    iget-object v2, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    if-eqz v2, :cond_1

    iget-object v2, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v2, :cond_1

    .line 155
    :cond_e
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->nodeAnimations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v4}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 157
    :cond_f
    iget-object v0, v1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->nodeAnimations:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto/16 :goto_0

    :cond_10
    return-void
.end method

.method protected loadMaterials(Ljava/lang/Iterable;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;",
            ">;",
            "Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;",
            ")V"
        }
    .end annotation

    .line 270
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;

    .line 271
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/Model;->convertMaterial(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)Lcom/badlogic/gdx/graphics/g3d/Material;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected loadMeshes(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;",
            ">;)V"
        }
    .end annotation

    .line 230
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;

    .line 231
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/Model;->convertMesh(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMesh;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected loadNode(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 12

    .line 178
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/model/Node;-><init>()V

    .line 179
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->id:Ljava/lang/String;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->id:Ljava/lang/String;

    .line 181
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->translation:Lcom/badlogic/gdx/math/Vector3;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->translation:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->translation:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 182
    :cond_0
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    .line 183
    :cond_1
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->scale:Lcom/badlogic/gdx/math/Vector3;

    if-eqz v1, :cond_2

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->scale:Lcom/badlogic/gdx/math/Vector3;

    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->scale:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 185
    :cond_2
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    const/4 v2, 0x0

    if-eqz v1, :cond_9

    .line 186
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->parts:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;

    array-length v3, v1

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_9

    aget-object v5, v1, v4

    .line 190
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->meshPartId:Ljava/lang/String;

    const/4 v7, 0x0

    if-eqz v6, :cond_4

    .line 191
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->meshParts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v6}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    .line 192
    iget-object v9, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->meshPartId:Ljava/lang/String;

    iget-object v10, v8, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->id:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    goto :goto_1

    :cond_4
    move-object v8, v7

    .line 199
    :goto_1
    iget-object v6, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->materialId:Ljava/lang/String;

    if-eqz v6, :cond_6

    .line 200
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v6}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_5
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 201
    iget-object v10, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->materialId:Ljava/lang/String;

    iget-object v11, v9, Lcom/badlogic/gdx/graphics/g3d/Material;->id:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_5

    move-object v7, v9

    :cond_6
    if-eqz v8, :cond_8

    if-eqz v7, :cond_8

    if-eqz v8, :cond_7

    if-eqz v7, :cond_7

    .line 211
    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    invoke-direct {v6}, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;-><init>()V

    .line 212
    iput-object v8, v6, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    .line 213
    iput-object v7, v6, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 214
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->parts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v7, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 215
    iget-object v7, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->bones:Lcom/badlogic/gdx/utils/ArrayMap;

    if-eqz v7, :cond_7

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodePartBones:Lcom/badlogic/gdx/utils/ObjectMap;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNodePart;->bones:Lcom/badlogic/gdx/utils/ArrayMap;

    invoke-virtual {v7, v6, v5}, Lcom/badlogic/gdx/utils/ObjectMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 208
    :cond_8
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid node: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;->id:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 220
    :cond_9
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->children:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    if-eqz v1, :cond_a

    .line 221
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;->children:[Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    array-length v1, p1

    :goto_2
    if-ge v2, v1, :cond_a

    aget-object v3, p1, v2

    .line 222
    invoke-virtual {p0, v3}, Lcom/badlogic/gdx/graphics/g3d/Model;->loadNode(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->addChild(Lcom/badlogic/gdx/graphics/g3d/model/Node;)I

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_a
    return-object v0
.end method

.method protected loadNodes(Ljava/lang/Iterable;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;",
            ">;)V"
        }
    .end annotation

    .line 164
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodePartBones:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/ObjectMap;->clear()V

    .line 165
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;

    .line 166
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/Model;->loadNode(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelNode;)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 168
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->nodePartBones:Lcom/badlogic/gdx/utils/ObjectMap;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/ObjectMap;->entries()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/ObjectMap$Entries;->iterator()Lcom/badlogic/gdx/utils/ObjectMap$Entries;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    .line 169
    iget-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->invBoneBindTransforms:Lcom/badlogic/gdx/utils/ArrayMap;

    if-nez v1, :cond_2

    .line 170
    iget-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    new-instance v2, Lcom/badlogic/gdx/utils/ArrayMap;

    const-class v3, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    const-class v4, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v2, v3, v4}, Lcom/badlogic/gdx/utils/ArrayMap;-><init>(Ljava/lang/Class;Ljava/lang/Class;)V

    iput-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->invBoneBindTransforms:Lcom/badlogic/gdx/utils/ArrayMap;

    .line 171
    :cond_2
    iget-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->invBoneBindTransforms:Lcom/badlogic/gdx/utils/ArrayMap;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/ArrayMap;->clear()V

    .line 172
    iget-object v1, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    check-cast v1, Lcom/badlogic/gdx/utils/ArrayMap;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/ArrayMap;->entries()Lcom/badlogic/gdx/utils/ArrayMap$Entries;

    move-result-object v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/ArrayMap$Entries;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    .line 173
    iget-object v3, v0, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->invBoneBindTransforms:Lcom/badlogic/gdx/utils/ArrayMap;

    iget-object v4, v2, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/badlogic/gdx/graphics/g3d/Model;->getNode(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v4

    new-instance v5, Lcom/badlogic/gdx/math/Matrix4;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    check-cast v2, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v5, v2}, Lcom/badlogic/gdx/math/Matrix4;-><init>(Lcom/badlogic/gdx/math/Matrix4;)V

    invoke-virtual {v5}, Lcom/badlogic/gdx/math/Matrix4;->inv()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/badlogic/gdx/utils/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)I

    goto :goto_1

    :cond_3
    return-void
.end method

.method public manageDisposable(Lcom/badlogic/gdx/utils/Disposable;)V
    .locals 2

    .line 344
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->disposables:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/utils/Array;->contains(Ljava/lang/Object;Z)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Model;->disposables:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
