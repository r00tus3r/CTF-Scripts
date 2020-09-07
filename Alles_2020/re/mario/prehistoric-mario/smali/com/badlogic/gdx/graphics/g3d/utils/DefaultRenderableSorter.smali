.class public Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;
.super Ljava/lang/Object;
.source "DefaultRenderableSorter.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/badlogic/gdx/graphics/g3d/utils/RenderableSorter;",
        "Ljava/util/Comparator<",
        "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
        ">;"
    }
.end annotation


# instance fields
.field private camera:Lcom/badlogic/gdx/graphics/Camera;

.field private final tmpV1:Lcom/badlogic/gdx/math/Vector3;

.field private final tmpV2:Lcom/badlogic/gdx/math/Vector3;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    .line 31
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method private getTranslation(Lcom/badlogic/gdx/math/Matrix4;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 40
    invoke-virtual {p2}, Lcom/badlogic/gdx/math/Vector3;->isZero()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    goto :goto_0

    .line 42
    :cond_0
    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Matrix4;->hasRotationOrScaling()Z

    move-result v0

    if-nez v0, :cond_1

    .line 43
    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    goto :goto_0

    .line 45
    :cond_1
    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/math/Vector3;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Vector3;

    :goto_0
    return-object p3
.end method


# virtual methods
.method public compare(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Renderable;)I
    .locals 6

    .line 51
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->has(J)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    sget-wide v3, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {v0, v3, v4}, Lcom/badlogic/gdx/graphics/g3d/Material;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->blended:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 52
    :goto_0
    iget-object v3, p2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    sget-wide v4, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {v3, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->has(J)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    sget-wide v4, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {v3, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    iget-boolean v3, v3, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->blended:Z

    if-eqz v3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    const/4 v4, -0x1

    if-eq v0, v3, :cond_3

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v2, -0x1

    :goto_2
    return v2

    .line 57
    :cond_3
    iget-object v3, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {p0, v3, p1, v5}, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->getTranslation(Lcom/badlogic/gdx/math/Matrix4;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 58
    iget-object p1, p2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->center:Lcom/badlogic/gdx/math/Vector3;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {p0, p1, p2, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->getTranslation(Lcom/badlogic/gdx/math/Matrix4;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 59
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->dst2(Lcom/badlogic/gdx/math/Vector3;)F

    move-result p1

    const/high16 p2, 0x447a0000    # 1000.0f

    mul-float p1, p1, p2

    float-to-int p1, p1

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->camera:Lcom/badlogic/gdx/graphics/Camera;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/Camera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->tmpV2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v3, v5}, Lcom/badlogic/gdx/math/Vector3;->dst2(Lcom/badlogic/gdx/math/Vector3;)F

    move-result v3

    mul-float v3, v3, p2

    float-to-int p2, v3

    sub-int/2addr p1, p2

    int-to-float p1, p1

    const/4 p2, 0x0

    cmpg-float v3, p1, p2

    if-gez v3, :cond_4

    const/4 v1, -0x1

    goto :goto_3

    :cond_4
    cmpl-float p1, p1, p2

    if-lez p1, :cond_5

    const/4 v1, 0x1

    :cond_5
    :goto_3
    if-eqz v0, :cond_6

    neg-int v1, v1

    :cond_6
    return v1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 28
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    check-cast p2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->compare(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Renderable;)I

    move-result p1

    return p1
.end method

.method public sort(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/utils/Array;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/Camera;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;)V"
        }
    .end annotation

    .line 35
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/DefaultRenderableSorter;->camera:Lcom/badlogic/gdx/graphics/Camera;

    .line 36
    invoke-virtual {p2, p0}, Lcom/badlogic/gdx/utils/Array;->sort(Ljava/util/Comparator;)V

    return-void
.end method
