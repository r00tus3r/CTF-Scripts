.class public Lcom/badlogic/gdx/graphics/g3d/ModelInstance;
.super Ljava/lang/Object;
.source "ModelInstance.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/RenderableProvider;


# static fields
.field public static defaultShareKeyframes:Z = true


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

.field public final materials:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Material;",
            ">;"
        }
    .end annotation
.end field

.field public final model:Lcom/badlogic/gdx/graphics/g3d/Model;

.field public final nodes:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/Node;",
            ">;"
        }
    .end annotation
.end field

.field public transform:Lcom/badlogic/gdx/math/Matrix4;

.field public userData:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;)V
    .locals 1

    const/4 v0, 0x0

    .line 62
    check-cast v0, [Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;[Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;FFF)V
    .locals 0

    .line 188
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;)V

    .line 189
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Matrix4;->setToTranslation(FFF)Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    const/4 v0, 0x0

    .line 194
    check-cast v0, [Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;[Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Lcom/badlogic/gdx/utils/Array;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g3d/Model;",
            "Lcom/badlogic/gdx/math/Matrix4;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 168
    sget-boolean v0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->defaultShareKeyframes:Z

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Lcom/badlogic/gdx/utils/Array;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Lcom/badlogic/gdx/utils/Array;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g3d/Model;",
            "Lcom/badlogic/gdx/math/Matrix4;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

    .line 173
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-nez p2, :cond_0

    .line 174
    new-instance p2, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {p2}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    :cond_0
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    .line 175
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p0, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyNodes(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Array;)V

    .line 176
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, p1, p4}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyAnimations(Ljava/lang/Iterable;Z)V

    .line 177
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->calculateTransforms()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;Z)V
    .locals 7

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v6, p4

    .line 77
    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZ)V
    .locals 7

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    move v6, p5

    .line 97
    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZZ)V
    .locals 8

    .line 118
    sget-boolean v7, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->defaultShareKeyframes:Z

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZZZ)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZZZ)V
    .locals 1

    .line 128
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

    .line 129
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-nez p2, :cond_0

    .line 130
    new-instance p2, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {p2}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    :cond_0
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    .line 131
    invoke-virtual {p1, p3, p4}, Lcom/badlogic/gdx/graphics/g3d/Model;->getNode(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p2

    .line 132
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->copy()Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p4

    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    if-eqz p6, :cond_2

    .line 134
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    if-eqz p5, :cond_1

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/model/Node;->globalTransform:Lcom/badlogic/gdx/math/Matrix4;

    goto :goto_0

    :cond_1
    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/model/Node;->localTransform:Lcom/badlogic/gdx/math/Matrix4;

    :goto_0
    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 135
    iget-object p2, p4, Lcom/badlogic/gdx/graphics/g3d/model/Node;->translation:Lcom/badlogic/gdx/math/Vector3;

    const/4 p3, 0x0

    invoke-virtual {p2, p3, p3, p3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    .line 136
    iget-object p2, p4, Lcom/badlogic/gdx/graphics/g3d/model/Node;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p2}, Lcom/badlogic/gdx/math/Quaternion;->idt()Lcom/badlogic/gdx/math/Quaternion;

    .line 137
    iget-object p2, p4, Lcom/badlogic/gdx/graphics/g3d/model/Node;->scale:Lcom/badlogic/gdx/math/Vector3;

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-virtual {p2, p3, p3, p3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    goto :goto_1

    :cond_2
    if-eqz p5, :cond_3

    .line 138
    invoke-virtual {p4}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->hasParent()Z

    move-result p3

    if-eqz p3, :cond_3

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->getParent()Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p2

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/model/Node;->globalTransform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 139
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->invalidate()V

    .line 140
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, p1, p7}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyAnimations(Ljava/lang/Iterable;Z)V

    .line 141
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->calculateTransforms()V

    return-void
.end method

.method public varargs constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;[Ljava/lang/String;)V
    .locals 1

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

    .line 151
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-nez p2, :cond_0

    .line 152
    new-instance p2, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {p2}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    :cond_0
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    if-nez p3, :cond_1

    .line 154
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p0, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyNodes(Lcom/badlogic/gdx/utils/Array;)V

    goto :goto_0

    .line 156
    :cond_1
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Model;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p0, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyNodes(Lcom/badlogic/gdx/utils/Array;[Ljava/lang/String;)V

    .line 157
    :goto_0
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Model;->animations:Lcom/badlogic/gdx/utils/Array;

    sget-boolean p2, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->defaultShareKeyframes:Z

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyAnimations(Ljava/lang/Iterable;Z)V

    .line 158
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->calculateTransforms()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 0

    .line 182
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;)V

    .line 183
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Matrix4;->setToTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/utils/Array;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g3d/Model;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 163
    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Lcom/badlogic/gdx/utils/Array;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Ljava/lang/String;Z)V
    .locals 7

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v6, p3

    .line 69
    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Ljava/lang/String;ZZ)V
    .locals 7

    const/4 v2, 0x0

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v5, p3

    move v6, p4

    .line 86
    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;Ljava/lang/String;ZZZ)V
    .locals 7

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    .line 107
    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;Ljava/lang/String;ZZZ)V

    return-void
.end method

.method public varargs constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Model;[Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 146
    invoke-direct {p0, p1, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/Model;Lcom/badlogic/gdx/math/Matrix4;[Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/ModelInstance;)V
    .locals 1

    .line 199
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Matrix4;->cpy()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/ModelInstance;Lcom/badlogic/gdx/math/Matrix4;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/ModelInstance;Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 204
    sget-boolean v0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->defaultShareKeyframes:Z

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/ModelInstance;Lcom/badlogic/gdx/math/Matrix4;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/ModelInstance;Lcom/badlogic/gdx/math/Matrix4;Z)V
    .locals 1

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

    .line 209
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->model:Lcom/badlogic/gdx/graphics/g3d/Model;

    if-nez p2, :cond_0

    .line 210
    new-instance p2, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {p2}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    :cond_0
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    .line 211
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p0, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyNodes(Lcom/badlogic/gdx/utils/Array;)V

    .line 212
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyAnimations(Ljava/lang/Iterable;Z)V

    .line 213
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->calculateTransforms()V

    return-void
.end method

.method private copyNodes(Lcom/badlogic/gdx/utils/Array;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/Node;",
            ">;)V"
        }
    .end annotation

    .line 222
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 223
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 224
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->copy()Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 226
    :cond_0
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->invalidate()V

    return-void
.end method

.method private copyNodes(Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Array;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/Node;",
            ">;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 243
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 244
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 245
    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 246
    iget-object v5, v2, Lcom/badlogic/gdx/graphics/g3d/model/Node;->id:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 247
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->copy()Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 252
    :cond_2
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->invalidate()V

    return-void
.end method

.method private varargs copyNodes(Lcom/badlogic/gdx/utils/Array;[Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/model/Node;",
            ">;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 230
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 231
    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 232
    array-length v4, p2

    const/4 v5, 0x0

    :goto_1
    if-ge v5, v4, :cond_1

    aget-object v6, p2, v5

    .line 233
    iget-object v7, v3, Lcom/badlogic/gdx/graphics/g3d/model/Node;->id:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 234
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->copy()Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_2

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 239
    :cond_2
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->invalidate()V

    return-void
.end method

.method private invalidate()V
    .locals 3

    .line 282
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 283
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-direct {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->invalidate(Lcom/badlogic/gdx/graphics/g3d/model/Node;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private invalidate(Lcom/badlogic/gdx/graphics/g3d/model/Node;)V
    .locals 8

    .line 258
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/Node;->parts:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    .line 259
    iget-object v3, p1, Lcom/badlogic/gdx/graphics/g3d/model/Node;->parts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    .line 260
    iget-object v4, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->invBoneBindTransforms:Lcom/badlogic/gdx/utils/ArrayMap;

    if-eqz v4, :cond_0

    const/4 v5, 0x0

    .line 262
    :goto_1
    iget v6, v4, Lcom/badlogic/gdx/utils/ArrayMap;->size:I

    if-ge v5, v6, :cond_0

    .line 263
    iget-object v6, v4, Lcom/badlogic/gdx/utils/ArrayMap;->keys:[Ljava/lang/Object;

    check-cast v6, [Lcom/badlogic/gdx/graphics/g3d/model/Node;

    iget-object v7, v4, Lcom/badlogic/gdx/utils/ArrayMap;->keys:[Ljava/lang/Object;

    check-cast v7, [Lcom/badlogic/gdx/graphics/g3d/model/Node;

    aget-object v7, v7, v5

    iget-object v7, v7, Lcom/badlogic/gdx/graphics/g3d/model/Node;->id:Ljava/lang/String;

    invoke-virtual {p0, v7}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getNode(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v7

    aput-object v7, v6, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 266
    :cond_0
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    iget-object v5, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lcom/badlogic/gdx/utils/Array;->contains(Ljava/lang/Object;Z)Z

    move-result v4

    if-nez v4, :cond_2

    .line 267
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    iget-object v5, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {v4, v5, v1}, Lcom/badlogic/gdx/utils/Array;->indexOf(Ljava/lang/Object;Z)I

    move-result v4

    if-gez v4, :cond_1

    .line 269
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    iget-object v5, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g3d/Material;->copy()Lcom/badlogic/gdx/graphics/g3d/Material;

    move-result-object v5

    iput-object v5, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_2

    .line 271
    :cond_1
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5, v4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/Material;

    iput-object v4, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 274
    :cond_3
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->getChildCount()I

    move-result v0

    :goto_3
    if-ge v1, v0, :cond_4

    .line 275
    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->getChild(I)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->invalidate(Lcom/badlogic/gdx/graphics/g3d/model/Node;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_4
    return-void
.end method


# virtual methods
.method public calculateBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 0

    .line 415
    invoke-virtual {p1}, Lcom/badlogic/gdx/math/collision/BoundingBox;->inf()Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 416
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)Lcom/badlogic/gdx/math/collision/BoundingBox;

    move-result-object p1

    return-object p1
.end method

.method public calculateTransforms()V
    .locals 5

    .line 402
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x1

    if-ge v2, v0, :cond_0

    .line 404
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->calculateTransforms(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    :goto_1
    if-ge v1, v0, :cond_1

    .line 407
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->calculateBoneTransforms(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/ModelInstance;
    .locals 1

    .line 218
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;-><init>(Lcom/badlogic/gdx/graphics/g3d/ModelInstance;)V

    return-object v0
.end method

.method public copyAnimation(Lcom/badlogic/gdx/graphics/g3d/model/Animation;)V
    .locals 1

    .line 307
    sget-boolean v0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->defaultShareKeyframes:Z

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyAnimation(Lcom/badlogic/gdx/graphics/g3d/model/Animation;Z)V

    return-void
.end method

.method public copyAnimation(Lcom/badlogic/gdx/graphics/g3d/model/Animation;Z)V
    .locals 8

    .line 314
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/model/Animation;-><init>()V

    .line 315
    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->id:Ljava/lang/String;

    iput-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->id:Ljava/lang/String;

    .line 316
    iget v1, p1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->duration:F

    iput v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->duration:F

    .line 317
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->nodeAnimations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;

    .line 318
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/model/Node;->id:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getNode(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_0

    .line 320
    :cond_1
    new-instance v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;

    invoke-direct {v3}, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;-><init>()V

    .line 321
    iput-object v2, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->node:Lcom/badlogic/gdx/graphics/g3d/model/Node;

    if-eqz p2, :cond_2

    .line 323
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    iput-object v2, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    .line 324
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    iput-object v2, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    .line 325
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    iput-object v1, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    goto/16 :goto_4

    .line 327
    :cond_2
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    if-eqz v2, :cond_3

    .line 328
    new-instance v2, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v2}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v2, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    .line 329
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    .line 330
    iget-object v5, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    iget v7, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;->keytime:F

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;->value:Ljava/lang/Object;

    invoke-direct {v6, v7, v4}, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;-><init>(FLjava/lang/Object;)V

    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 332
    :cond_3
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    if-eqz v2, :cond_4

    .line 333
    new-instance v2, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v2}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v2, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    .line 334
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    .line 335
    iget-object v5, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    new-instance v6, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    iget v7, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;->keytime:F

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;->value:Ljava/lang/Object;

    invoke-direct {v6, v7, v4}, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;-><init>(FLjava/lang/Object;)V

    invoke-virtual {v5, v6}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_2

    .line 337
    :cond_4
    iget-object v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    if-eqz v2, :cond_5

    .line 338
    new-instance v2, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v2}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v2, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    .line 339
    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    .line 340
    iget-object v4, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    new-instance v5, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;

    iget v6, v2, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;->keytime:F

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;->value:Ljava/lang/Object;

    invoke-direct {v5, v6, v2}, Lcom/badlogic/gdx/graphics/g3d/model/NodeKeyframe;-><init>(FLjava/lang/Object;)V

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_3

    .line 343
    :cond_5
    :goto_4
    iget-object v1, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->translation:Lcom/badlogic/gdx/utils/Array;

    if-nez v1, :cond_6

    iget-object v1, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->rotation:Lcom/badlogic/gdx/utils/Array;

    if-nez v1, :cond_6

    iget-object v1, v3, Lcom/badlogic/gdx/graphics/g3d/model/NodeAnimation;->scaling:Lcom/badlogic/gdx/utils/Array;

    if-eqz v1, :cond_0

    .line 344
    :cond_6
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->nodeAnimations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 346
    :cond_7
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/model/Animation;->nodeAnimations:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez p1, :cond_8

    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    :cond_8
    return-void
.end method

.method public copyAnimations(Ljava/lang/Iterable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/badlogic/gdx/graphics/g3d/model/Animation;",
            ">;)V"
        }
    .end annotation

    .line 290
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    .line 291
    sget-boolean v1, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->defaultShareKeyframes:Z

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyAnimation(Lcom/badlogic/gdx/graphics/g3d/model/Animation;Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public copyAnimations(Ljava/lang/Iterable;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/badlogic/gdx/graphics/g3d/model/Animation;",
            ">;Z)V"
        }
    .end annotation

    .line 299
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    .line 300
    invoke-virtual {p0, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->copyAnimation(Lcom/badlogic/gdx/graphics/g3d/model/Animation;Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public extendBoundingBox(Lcom/badlogic/gdx/math/collision/BoundingBox;)Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 3

    .line 424
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 426
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

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

    const/4 v0, 0x0

    .line 433
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getAnimation(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Animation;

    move-result-object p1

    return-object p1
.end method

.method public getAnimation(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Animation;
    .locals 3

    .line 440
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    :goto_0
    if-ge v1, v0, :cond_3

    .line 444
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

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

    .line 447
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->animations:Lcom/badlogic/gdx/utils/Array;

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

.method public getMaterial(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g3d/Material;
    .locals 1

    const/4 v0, 0x1

    .line 455
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getMaterial(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/Material;

    move-result-object p1

    return-object p1
.end method

.method public getMaterial(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/Material;
    .locals 3

    .line 462
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    :goto_0
    if-ge v1, v0, :cond_3

    .line 466
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

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

    .line 469
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->materials:Lcom/badlogic/gdx/utils/Array;

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

    .line 477
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getNode(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p1

    return-object p1
.end method

.method public getNode(Ljava/lang/String;Z)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 1

    const/4 v0, 0x0

    .line 484
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getNode(Ljava/lang/String;ZZ)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p1

    return-object p1
.end method

.method public getNode(Ljava/lang/String;ZZ)Lcom/badlogic/gdx/graphics/g3d/model/Node;
    .locals 1

    .line 492
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-static {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->getNode(Lcom/badlogic/gdx/utils/Array;Ljava/lang/String;ZZ)Lcom/badlogic/gdx/graphics/g3d/model/Node;

    move-result-object p1

    return-object p1
.end method

.method public getRenderable(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Renderable;
    .locals 2

    .line 362
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getRenderable(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/model/Node;)Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object p1

    return-object p1
.end method

.method public getRenderable(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/model/Node;)Lcom/badlogic/gdx/graphics/g3d/Renderable;
    .locals 2

    .line 367
    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/model/Node;->parts:Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getRenderable(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/model/Node;Lcom/badlogic/gdx/graphics/g3d/model/NodePart;)Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object p1

    return-object p1
.end method

.method public getRenderable(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/model/Node;Lcom/badlogic/gdx/graphics/g3d/model/NodePart;)Lcom/badlogic/gdx/graphics/g3d/Renderable;
    .locals 1

    .line 371
    invoke-virtual {p3, p1}, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->setRenderable(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 372
    iget-object p3, p3, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->bones:[Lcom/badlogic/gdx/math/Matrix4;

    if-nez p3, :cond_0

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    if-eqz p3, :cond_0

    .line 373
    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p3

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/model/Node;->globalTransform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    goto :goto_0

    .line 374
    :cond_0
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    if-eqz p2, :cond_1

    .line 375
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->transform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    goto :goto_0

    .line 377
    :cond_1
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p2}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    .line 378
    :goto_0
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->userData:Ljava/lang/Object;

    iput-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->userData:Ljava/lang/Object;

    return-object p1
.end method

.method protected getRenderables(Lcom/badlogic/gdx/graphics/g3d/model/Node;Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/g3d/model/Node;",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;",
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/graphics/g3d/Renderable;",
            ">;)V"
        }
    .end annotation

    .line 383
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/Node;->parts:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v0, :cond_1

    .line 384
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/model/Node;->parts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;

    .line 385
    iget-boolean v2, v1, Lcom/badlogic/gdx/graphics/g3d/model/NodePart;->enabled:Z

    if-eqz v2, :cond_0

    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-virtual {p0, v2, p1, v1}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getRenderable(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/model/Node;Lcom/badlogic/gdx/graphics/g3d/model/NodePart;)Lcom/badlogic/gdx/graphics/g3d/Renderable;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 389
    :cond_1
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/model/Node;->getChildren()Ljava/lang/Iterable;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 390
    invoke-virtual {p0, v0, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getRenderables(Lcom/badlogic/gdx/graphics/g3d/model/Node;Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V

    goto :goto_1

    :cond_2
    return-void
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

    .line 355
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->nodes:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/Node;

    .line 356
    invoke-virtual {p0, v1, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/ModelInstance;->getRenderables(Lcom/badlogic/gdx/graphics/g3d/model/Node;Lcom/badlogic/gdx/utils/Array;Lcom/badlogic/gdx/utils/Pool;)V

    goto :goto_0

    :cond_0
    return-void
.end method
