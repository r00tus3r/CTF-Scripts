.class public Lcom/uwsoft/editor/renderer/actor/CompositeItem;
.super Lcom/badlogic/gdx/scenes/scene2d/Group;
.source "CompositeItem.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/actor/IBaseItem;


# instance fields
.field private ZIndexComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/uwsoft/editor/renderer/actor/IBaseItem;",
            ">;"
        }
    .end annotation
.end field

.field private body:Lcom/badlogic/gdx/physics/box2d/Body;

.field private customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

.field public dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field private isLockedByLayer:Z

.field private itemIdMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/actor/IBaseItem;",
            ">;"
        }
    .end annotation
.end field

.field private itemLayerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/actor/IBaseItem;",
            ">;>;"
        }
    .end annotation
.end field

.field private items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/actor/IBaseItem;",
            ">;"
        }
    .end annotation
.end field

.field protected layerIndex:I

.field private layerMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/data/LayerItemVO;",
            ">;"
        }
    .end annotation
.end field

.field public mulX:F

.field public mulY:F

.field private parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

.field private scissorBounds:Lcom/badlogic/gdx/math/Rectangle;

.field private scripts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/script/IScript;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 5

    .line 91
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Group;-><init>()V

    const/high16 v0, 0x3f800000    # 1.0f

    .line 57
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    .line 58
    iput v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    const/4 v1, 0x0

    .line 60
    iput v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerIndex:I

    .line 61
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    .line 63
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    .line 64
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerMap:Ljava/util/HashMap;

    .line 65
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemLayerMap:Ljava/util/HashMap;

    .line 67
    iput-boolean v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->isLockedByLayer:Z

    const/4 v2, 0x0

    .line 68
    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 70
    new-instance v2, Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-direct {v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;-><init>()V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    .line 72
    new-instance v2, Lcom/uwsoft/editor/renderer/actor/CompositeItem$1;

    invoke-direct {v2, p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem$1;-><init>(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->ZIndexComparator:Ljava/util/Comparator;

    .line 81
    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scripts:Ljava/util/ArrayList;

    .line 92
    iput-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 93
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 94
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->x:F

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setX(F)V

    .line 95
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->y:F

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setY(F)V

    .line 96
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scaleX:F

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setScaleX(F)V

    .line 97
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scaleY:F

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setScaleY(F)V

    .line 98
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->customVars:Ljava/lang/String;

    invoke-virtual {p2, v2}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 99
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->rotation:F

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setRotation(F)V

    .line 101
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p2, p2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->zIndex:I

    if-gez p2, :cond_0

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iput v1, p2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->zIndex:I

    .line 103
    :cond_0
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object p2, p2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    if-nez p2, :cond_1

    .line 104
    new-instance p2, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p2, v0, v0, v0, v0}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    goto :goto_0

    .line 106
    :cond_1
    new-instance p2, Lcom/badlogic/gdx/graphics/Color;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    const/4 v4, 0x2

    aget v2, v2, v4

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v4, v4, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    aget v3, v4, v3

    invoke-direct {p2, v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    invoke-virtual {p0, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setTint(Lcom/badlogic/gdx/graphics/Color;)V

    .line 109
    :goto_0
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 110
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->reAssemble()V

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 87
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 88
    invoke-virtual {p0, p3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method

.method private assemblePhysics()V
    .locals 7

    .line 576
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-nez v0, :cond_0

    return-void

    .line 577
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    invoke-direct {v0, v1, v2}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    .line 578
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    .line 579
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 580
    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    const/4 v3, 0x0

    .line 581
    invoke-interface {v2, v3}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    .line 583
    :cond_2
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v3

    .line 584
    iget-object v4, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    .line 586
    iget-object v5, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    if-ltz v5, :cond_1

    if-nez v4, :cond_3

    goto :goto_0

    .line 588
    :cond_3
    iget-object v5, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v5, v5, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v5}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    move-result-object v5

    iget-object v5, v5, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->meshes:Ljava/util/HashMap;

    iget-object v6, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_4

    goto :goto_0

    .line 591
    :cond_4
    iget-object v5, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v5, v5, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v6, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v6, v6, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v6}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    move-result-object v6

    iget-object v6, v6, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->meshes:Ljava/util/HashMap;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/uwsoft/editor/renderer/data/MeshVO;

    invoke-static {v5, v4, v3, v0}, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->createBody(Lcom/badlogic/gdx/physics/box2d/World;Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;Lcom/uwsoft/editor/renderer/data/MeshVO;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    .line 592
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->setUserData(Ljava/lang/Object;)V

    goto :goto_0

    .line 594
    :cond_5
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->positionPhysics()V

    return-void
.end method

.method private findItemsByName(Ljava/lang/String;Lcom/uwsoft/editor/renderer/actor/CompositeItem;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/actor/CompositeItem;",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/actor/CompositeItem;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/actor/CompositeItem;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 434
    :goto_0
    iget-object v1, p2, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 435
    iget-object v1, p2, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "CompositeItem"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 436
    iget-object v1, p2, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 437
    iget-object v2, v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->itemName:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 438
    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 440
    :cond_0
    invoke-direct {p0, p1, v1, p3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->findItemsByName(Ljava/lang/String;Lcom/uwsoft/editor/renderer/actor/CompositeItem;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-object p3
.end method

.method private getlayerIndexByName(Ljava/lang/String;)I
    .locals 4

    .line 676
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 677
    :goto_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 678
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/uwsoft/editor/renderer/data/LayerItemVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V
    .locals 3

    .line 404
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v0

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemIdentifier:Ljava/lang/String;

    .line 405
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v1

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->layerName:Ljava/lang/String;

    .line 407
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 408
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 410
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_2

    .line 411
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemLayerMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 412
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemLayerMap:Ljava/util/HashMap;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 414
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemLayerMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 417
    :cond_2
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private reAssemble()V
    .locals 5

    .line 268
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->clear()V

    .line 269
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 270
    :goto_0
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 271
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->dispose()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 274
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 275
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 276
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemLayerMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/4 v0, 0x0

    .line 278
    :goto_1
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 279
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    .line 280
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/ImageItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/ImageItem;-><init>(Lcom/uwsoft/editor/renderer/data/SimpleImageVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 281
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 282
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 283
    iget v2, v2, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/ImageItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    .line 286
    :goto_2
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 287
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImage9patchs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/Image9patchVO;

    .line 288
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;-><init>(Lcom/uwsoft/editor/renderer/data/Image9patchVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 289
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 290
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 291
    iget v2, v2, Lcom/uwsoft/editor/renderer/data/Image9patchVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    .line 294
    :goto_3
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 295
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sTextBox:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    .line 296
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;-><init>(Lcom/uwsoft/editor/renderer/data/TextBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 297
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 298
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 299
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/TextBoxVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/TextBoxVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    .line 301
    :goto_4
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_4

    .line 302
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sButtons:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/ButtonVO;

    .line 303
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;-><init>(Lcom/uwsoft/editor/renderer/data/ButtonVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 304
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 305
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 306
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ButtonVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ButtonVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_4
    const/4 v0, 0x0

    .line 308
    :goto_5
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_5

    .line 309
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLabels:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/LabelVO;

    .line 310
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/LabelItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/LabelItem;-><init>(Lcom/uwsoft/editor/renderer/data/LabelVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 311
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 312
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 313
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/LabelItem;->dataVO:Lcom/uwsoft/editor/renderer/data/LabelVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/LabelVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/LabelItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_5
    const/4 v0, 0x0

    .line 315
    :goto_6
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_6

    .line 316
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sCheckBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    .line 317
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;-><init>(Lcom/uwsoft/editor/renderer/data/CheckBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 318
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 319
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 320
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CheckBoxVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/CheckBoxVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_6
    const/4 v0, 0x0

    .line 322
    :goto_7
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_7

    .line 323
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSelectBoxes:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    .line 324
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;-><init>(Lcom/uwsoft/editor/renderer/data/SelectBoxVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 325
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 326
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 327
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->dataVO:Lcom/uwsoft/editor/renderer/data/SelectBoxVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/SelectBoxVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_7
    const/4 v0, 0x0

    .line 330
    :goto_8
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_8

    .line 331
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 332
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 333
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 334
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 335
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_8
    const/4 v0, 0x0

    .line 339
    :goto_9
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_9

    .line 340
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sParticleEffects:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    .line 341
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/ParticleItem;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;-><init>(Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 342
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 343
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 344
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->dataVO:Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/ParticleEffectVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/ParticleItem;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 347
    :cond_9
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    .line 348
    :goto_a
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_a

    .line 349
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sLights:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/LightVO;

    .line 350
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/LightActor;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/LightActor;-><init>(Lcom/uwsoft/editor/renderer/data/LightVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 351
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 352
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 356
    :cond_a
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->spineReflectionHelper:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    .line 357
    :goto_b
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_b

    .line 358
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpineAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpineVO;

    .line 359
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/SpineActor;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/SpineActor;-><init>(Lcom/uwsoft/editor/renderer/data/SpineVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 360
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 361
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 362
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/SpineActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpineVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/SpineVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/SpineActor;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    :cond_b
    const/4 v0, 0x0

    .line 366
    :goto_c
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_c

    .line 367
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriteAnimations:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    .line 368
    new-instance v3, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v3, v2, v4, p0}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;-><init>(Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 369
    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 370
    invoke-virtual {v3}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->start()V

    .line 371
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 372
    iget-object v2, v3, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/SpriteAnimationVO;->zIndex:I

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;->setZIndex(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 375
    :cond_c
    :goto_d
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v1, v0, :cond_d

    .line 376
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sSpriterAnimations:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;

    .line 377
    new-instance v2, Lcom/uwsoft/editor/renderer/actor/SpriterActor;

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v2, v0, v3, p0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;-><init>(Lcom/uwsoft/editor/renderer/data/SpriterVO;Lcom/uwsoft/editor/renderer/data/Essentials;Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 378
    invoke-direct {p0, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 379
    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 380
    iget-object v0, v2, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->dataVO:Lcom/uwsoft/editor/renderer/data/SpriterVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/SpriterVO;->zIndex:I

    invoke-virtual {v2, v0}, Lcom/uwsoft/editor/renderer/actor/SpriterActor;->setZIndex(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 383
    :cond_d
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_e

    .line 384
    new-instance v0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/LayerItemVO;-><init>()V

    const-string v1, "Default"

    .line 385
    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    .line 386
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 389
    :cond_e
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->recalculateSize()V

    .line 390
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->sortZindexes()V

    .line 391
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->reAssembleLayers()V

    return-void
.end method

.method private setLayerChildrenVisibilty(Ljava/lang/String;Z)V
    .locals 2

    .line 830
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemLayerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 834
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 835
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    check-cast v1, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setVisible(Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 2

    const/4 v0, 0x0

    .line 758
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scripts:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 759
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scripts:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/script/IScript;

    invoke-interface {v1, p1}, Lcom/uwsoft/editor/renderer/script/IScript;->act(F)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 762
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;->bodyType:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-boolean v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->physicsStopped:Z

    if-nez v0, :cond_1

    .line 763
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getPosition()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    sget v1, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    div-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setX(F)V

    .line 764
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getPosition()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    sget v1, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    div-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setY(F)V

    .line 765
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-virtual {v0}, Lcom/badlogic/gdx/physics/box2d/Body;->getAngle()F

    move-result v0

    const v1, 0x42652ee0

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setRotation(F)V

    .line 768
    :cond_1
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Group;->act(F)V

    return-void
.end method

.method public addItem(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V
    .locals 7

    .line 508
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->addItem(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    .line 509
    invoke-interface {p1, p0}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    .line 510
    invoke-direct {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->inventorize(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V

    .line 512
    move-object v0, p1

    check-cast v0, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    .line 514
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->updateDataVO()V

    .line 515
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    invoke-interface {p1, v0, v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->applyResolution(FF)V

    .line 516
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->recalculateSize()V

    .line 517
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->sortZindexes()V

    .line 518
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->reAssembleLayers()V

    .line 521
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v0

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v0

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_1

    .line 522
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    .line 523
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v1

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->x:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    mul-float v1, v1, v2

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->y:F

    iget v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float v2, v2, v3

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 524
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->localToStageCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 525
    sget v1, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector2;->scl(F)Lcom/badlogic/gdx/math/Vector2;

    .line 527
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 528
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    const/4 v1, 0x0

    .line 529
    invoke-interface {p1, v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    .line 532
    :cond_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->physicsBodyData:Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v3}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    move-result-object v3

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->meshes:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v4

    iget-object v4, v4, Lcom/uwsoft/editor/renderer/data/MainItemVO;->meshId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/uwsoft/editor/renderer/data/MeshVO;

    new-instance v4, Lcom/badlogic/gdx/math/Vector2;

    iget v5, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    iget v6, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    invoke-direct {v4, v5, v6}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    invoke-static {v1, v2, v3, v4}, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->createBody(Lcom/badlogic/gdx/physics/box2d/World;Lcom/uwsoft/editor/renderer/data/PhysicsBodyDataVO;Lcom/uwsoft/editor/renderer/data/MeshVO;Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    .line 533
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    iget v2, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object p1

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/MainItemVO;->rotation:F

    float-to-double v3, p1

    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    double-to-float p1, v3

    invoke-virtual {v1, v2, v0, p1}, Lcom/badlogic/gdx/physics/box2d/Body;->setTransform(FFF)V

    :cond_1
    return-void
.end method

.method public addScript(Lcom/uwsoft/editor/renderer/script/IScript;)V
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scripts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    invoke-interface {p1, p0}, Lcom/uwsoft/editor/renderer/script/IScript;->init(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    return-void
.end method

.method public addScript(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/script/IScript;",
            ">;)V"
        }
    .end annotation

    .line 158
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scripts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 159
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/script/IScript;

    .line 160
    invoke-interface {v0, p0}, Lcom/uwsoft/editor/renderer/script/IScript;->init(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public addScriptTo(Ljava/lang/String;Lcom/uwsoft/editor/renderer/script/IScript;)V
    .locals 3

    .line 190
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    .line 191
    instance-of v2, v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    if-eqz v2, :cond_0

    .line 192
    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemName:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 193
    move-object v2, v1

    check-cast v2, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v2, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScript(Lcom/uwsoft/editor/renderer/script/IScript;)V

    .line 195
    :cond_1
    check-cast v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v1, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScriptTo(Ljava/lang/String;Lcom/uwsoft/editor/renderer/script/IScript;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public addScriptTo(Ljava/lang/String;Ljava/lang/Class;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/uwsoft/editor/renderer/script/IScript;",
            ">;)V"
        }
    .end annotation

    .line 210
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    .line 211
    instance-of v2, v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    if-eqz v2, :cond_0

    .line 212
    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemName:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    .line 215
    :try_start_0
    invoke-static {p2}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->newInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/uwsoft/editor/renderer/script/IScript;
    :try_end_0
    .catch Lcom/badlogic/gdx/utils/reflect/ReflectionException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v3

    goto :goto_1

    :catch_0
    move-exception v3

    .line 217
    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/reflect/ReflectionException;->printStackTrace()V

    :goto_1
    if-eqz v2, :cond_1

    .line 220
    move-object v3, v1

    check-cast v3, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v3, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScript(Lcom/uwsoft/editor/renderer/script/IScript;)V

    .line 224
    :cond_1
    check-cast v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v1, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScriptTo(Ljava/lang/String;Ljava/lang/Class;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public addScriptTo(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/script/IScript;",
            ">;)V"
        }
    .end annotation

    .line 172
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    .line 173
    instance-of v2, v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    if-eqz v2, :cond_0

    .line 174
    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemName:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 175
    move-object v2, v1

    check-cast v2, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v2, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScript(Ljava/util/ArrayList;)V

    .line 177
    :cond_1
    check-cast v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v1, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScriptTo(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public applyResolution(FF)V
    .locals 4

    .line 737
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    .line 738
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    const/4 v0, 0x0

    .line 739
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_1

    .line 740
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-interface {v1, p1, p2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->applyResolution(FF)V

    .line 741
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 742
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-interface {v3}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    .line 743
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-interface {v1, v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 746
    :cond_1
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    .line 747
    :cond_2
    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    .line 749
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->x:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setX(F)V

    .line 750
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->y:F

    iget p2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float p1, p1, p2

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setY(F)V

    .line 751
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->updateDataVO()V

    .line 752
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->recalculateSize()V

    .line 753
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->assemblePhysics()V

    return-void
.end method

.method public applyResolution(Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 721
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 722
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v0}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    move-result-object v0

    .line 723
    invoke-virtual {v0, p1}, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->getResolution(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 725
    iget p1, p1, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;->width:I

    int-to-float p1, p1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v0}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    move-result-object v0

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->originalResolution:Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;->width:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    .line 726
    invoke-virtual {p0, p1, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->applyResolution(FF)V

    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 2

    .line 932
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    :cond_0
    const/4 v0, 0x0

    .line 933
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V

    const/4 v0, 0x0

    .line 935
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 936
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->dispose()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 3

    .line 788
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorWidth:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorHeight:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    .line 789
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->isTransform()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->computeTransform()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->applyTransform(Lcom/badlogic/gdx/graphics/g2d/Batch;Lcom/badlogic/gdx/math/Matrix4;)V

    .line 790
    :cond_0
    const-class v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->obtain(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/math/Rectangle;

    .line 791
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getStage()Lcom/badlogic/gdx/scenes/scene2d/Stage;

    move-result-object v1

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scissorBounds:Lcom/badlogic/gdx/math/Rectangle;

    invoke-virtual {v1, v2, v0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->calculateScissors(Lcom/badlogic/gdx/math/Rectangle;Lcom/badlogic/gdx/math/Rectangle;)V

    .line 793
    invoke-static {v0}, Lcom/badlogic/gdx/scenes/scene2d/utils/ScissorStack;->pushScissors(Lcom/badlogic/gdx/math/Rectangle;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 794
    invoke-virtual {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->drawChildren(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    .line 795
    invoke-static {}, Lcom/badlogic/gdx/scenes/scene2d/utils/ScissorStack;->popScissors()Lcom/badlogic/gdx/math/Rectangle;

    .line 796
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->isTransform()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->resetTransform(Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    .line 797
    :cond_1
    invoke-static {v0}, Lcom/badlogic/gdx/utils/Pools;->free(Ljava/lang/Object;)V

    :cond_2
    return-void

    .line 801
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/scenes/scene2d/Group;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V

    return-void
.end method

.method public findItemsByName(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/actor/CompositeItem;",
            ">;"
        }
    .end annotation

    .line 428
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 430
    invoke-direct {p0, p1, p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->findItemsByName(Ljava/lang/String;Lcom/uwsoft/editor/renderer/actor/CompositeItem;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public getBody()Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 1

    .line 923
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-object v0
.end method

.method public getById(Ljava/lang/String;Ljava/lang/Class;)Lcom/uwsoft/editor/renderer/actor/IBaseItem;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lcom/uwsoft/editor/renderer/actor/IBaseItem;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 948
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    return-object p1
.end method

.method public getCheckBoxById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;
    .locals 1

    .line 448
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/CheckBoxItem;

    return-object p1
.end method

.method public getCompositeById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 452
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object p1
.end method

.method public getCustomVariables()Lcom/uwsoft/editor/renderer/utils/CustomVariables;
    .locals 1

    .line 945
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    return-object v0
.end method

.method public getDataVO()Lcom/uwsoft/editor/renderer/data/CompositeItemVO;
    .locals 1

    .line 691
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    return-object v0
.end method

.method public bridge synthetic getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;
    .locals 1

    .line 54
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    move-result-object v0

    return-object v0
.end method

.method public getImageById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/ImageItem;
    .locals 1

    .line 460
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/ImageItem;

    return-object p1
.end method

.method public getItemById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/IBaseItem;
    .locals 1

    .line 456
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    return-object p1
.end method

.method public getItems()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/actor/IBaseItem;",
            ">;"
        }
    .end annotation

    .line 554
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getItemsByLayerName(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/actor/IBaseItem;",
            ">;"
        }
    .end annotation

    .line 953
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemLayerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    return-object p1
.end method

.method public getLabelById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LabelItem;
    .locals 1

    .line 464
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/LabelItem;

    return-object p1
.end method

.method public getLayerIndex()I
    .locals 1

    .line 914
    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerIndex:I

    return v0
.end method

.method public getLightActorById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/LightActor;
    .locals 1

    .line 484
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/LightActor;

    return-object p1
.end method

.method public getNinePatchById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/Image9patchItem;
    .locals 1

    .line 499
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/Image9patchItem;

    return-object p1
.end method

.method public getParentItem()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public getParticleById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/ParticleItem;
    .locals 1

    .line 468
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/ParticleItem;

    return-object p1
.end method

.method public getSelectBoxById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;
    .locals 1

    .line 472
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/SelectBoxItem;

    return-object p1
.end method

.method public getSpineActorById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/SpineActor;
    .locals 1

    .line 495
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/SpineActor;

    return-object p1
.end method

.method public getSpriteAnimationById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;
    .locals 1

    .line 488
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;

    return-object p1
.end method

.method public getSpriterActorById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/SpriterActor;
    .locals 1

    .line 491
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/SpriterActor;

    return-object p1
.end method

.method public getTextBoxById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/TextBoxItem;
    .locals 1

    .line 476
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/TextBoxItem;

    return-object p1
.end method

.method public getTextButtonById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/TextButtonItem;
    .locals 1

    .line 480
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->itemIdMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/actor/TextButtonItem;

    return-object p1
.end method

.method public isComposite()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isLockedByLayer()Z
    .locals 1

    .line 904
    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->isLockedByLayer:Z

    return v0
.end method

.method public layerExists(Ljava/lang/String;)Z
    .locals 1

    .line 811
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public loadFromVO(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;)V
    .locals 0

    .line 542
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 543
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->reAssemble()V

    .line 544
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->recalculateSize()V

    .line 545
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->sortZindexes()V

    .line 546
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->reAssembleLayers()V

    return-void
.end method

.method public positionPhysics()V
    .locals 8

    .line 598
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    .line 599
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    .line 600
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v3

    if-nez v3, :cond_0

    goto :goto_0

    .line 603
    :cond_0
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v3

    .line 604
    iget v4, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->x:F

    iget v5, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    mul-float v4, v4, v5

    iget v3, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->y:F

    iget v5, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float v3, v3, v5

    invoke-virtual {v0, v4, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    .line 605
    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->localToStageCoordinates(Lcom/badlogic/gdx/math/Vector2;)Lcom/badlogic/gdx/math/Vector2;

    .line 606
    sget v3, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/math/Vector2;->scl(F)Lcom/badlogic/gdx/math/Vector2;

    .line 607
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getBody()Lcom/badlogic/gdx/physics/box2d/Body;

    move-result-object v3

    iget v4, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v5, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->rotation:F

    float-to-double v6, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v6

    double-to-float v2, v6

    invoke-virtual {v3, v4, v5, v2}, Lcom/badlogic/gdx/physics/box2d/Body;->setTransform(FFF)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public reAssembleLayers()V
    .locals 5

    .line 564
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerMap:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 566
    :goto_0
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 567
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/LayerItemVO;

    .line 568
    iget-object v3, v2, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    iget-boolean v4, v2, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isVisible:Z

    invoke-direct {p0, v3, v4}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerChildrenVisibilty(Ljava/lang/String;Z)V

    .line 569
    iget-object v3, v2, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    iget-boolean v4, v2, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isLocked:Z

    if-nez v4, :cond_1

    iget-boolean v4, v2, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isVisible:Z

    if-nez v4, :cond_0

    goto :goto_1

    :cond_0
    const/4 v4, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v4, 0x1

    :goto_2
    invoke-virtual {p0, v3, v4}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerChildrenLock(Ljava/lang/String;Z)V

    .line 571
    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerMap:Ljava/util/HashMap;

    iget-object v4, v2, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public recalculateSize()V
    .locals 10

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 613
    :goto_0
    iget-object v6, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v1, v6, :cond_b

    .line 614
    iget-object v6, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-nez v1, :cond_2

    .line 616
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v2

    cmpl-float v2, v2, v0

    if-lez v2, :cond_0

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v2

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v3

    mul-float v2, v2, v3

    cmpl-float v2, v2, v0

    if-lez v2, :cond_0

    .line 617
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v2

    .line 618
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v3

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v4

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v5

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    move v4, v2

    move v2, v3

    goto :goto_1

    .line 620
    :cond_0
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v2

    .line 621
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v3

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v4

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v5

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    move v4, v3

    .line 624
    :goto_1
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v3

    cmpl-float v3, v3, v0

    if-lez v3, :cond_1

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v3

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v5

    mul-float v3, v3, v5

    cmpl-float v3, v3, v0

    if-lez v3, :cond_1

    .line 625
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v5

    .line 626
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v3

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v8

    mul-float v7, v7, v8

    add-float/2addr v3, v7

    goto :goto_2

    .line 628
    :cond_1
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v3

    .line 629
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v5

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v8

    mul-float v7, v7, v8

    add-float/2addr v5, v7

    .line 632
    :cond_2
    :goto_2
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v7

    cmpl-float v7, v7, v0

    if-lez v7, :cond_4

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v7

    cmpl-float v7, v7, v0

    if-lez v7, :cond_4

    .line 633
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v7

    cmpl-float v7, v4, v7

    if-lez v7, :cond_3

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v4

    .line 634
    :cond_3
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v8

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v9

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    cmpg-float v7, v2, v7

    if-gez v7, :cond_6

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v2

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v8

    mul-float v7, v7, v8

    add-float/2addr v2, v7

    goto :goto_3

    .line 636
    :cond_4
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v7

    cmpg-float v7, v2, v7

    if-gez v7, :cond_5

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v2

    .line 637
    :cond_5
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v8

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v9

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    cmpl-float v7, v4, v7

    if-lez v7, :cond_6

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getX()F

    move-result v4

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getWidth()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleX()F

    move-result v8

    mul-float v7, v7, v8

    add-float/2addr v4, v7

    .line 639
    :cond_6
    :goto_3
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v7

    cmpl-float v7, v7, v0

    if-lez v7, :cond_8

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v8

    mul-float v7, v7, v8

    cmpl-float v7, v7, v0

    if-lez v7, :cond_8

    .line 640
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v7

    cmpl-float v7, v5, v7

    if-lez v7, :cond_7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v5

    .line 641
    :cond_7
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v8

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v9

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    cmpg-float v7, v3, v7

    if-gez v7, :cond_a

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v3

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v6

    mul-float v7, v7, v6

    add-float/2addr v3, v7

    goto :goto_4

    .line 643
    :cond_8
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v7

    cmpg-float v7, v3, v7

    if-gez v7, :cond_9

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v3

    .line 644
    :cond_9
    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v8

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v9

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    cmpl-float v7, v5, v7

    if-lez v7, :cond_a

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getY()F

    move-result v5

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getHeight()F

    move-result v7

    invoke-virtual {v6}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->getScaleY()F

    move-result v6

    mul-float v7, v7, v6

    add-float/2addr v5, v7

    :cond_a
    :goto_4
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_b
    sub-float/2addr v2, v0

    .line 649
    invoke-virtual {p0, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setWidth(F)V

    sub-float/2addr v3, v0

    .line 650
    invoke-virtual {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setHeight(F)V

    return-void
.end method

.method public removeItem(Lcom/uwsoft/editor/renderer/actor/IBaseItem;)V
    .locals 2

    .line 700
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 701
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->removeItem(Lcom/uwsoft/editor/renderer/data/MainItemVO;)V

    .line 702
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->dispose()V

    return-void
.end method

.method public removeScript(Lcom/uwsoft/editor/renderer/script/IScript;)V
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scripts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 236
    invoke-interface {p1}, Lcom/uwsoft/editor/renderer/script/IScript;->dispose()V

    return-void
.end method

.method public removeScript(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/script/IScript;",
            ">;)V"
        }
    .end annotation

    .line 257
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    .line 258
    instance-of v2, v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    if-eqz v2, :cond_0

    .line 259
    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->itemName:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 260
    move-object v2, v1

    check-cast v2, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v2, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->removeScript(Ljava/util/ArrayList;)V

    .line 262
    :cond_1
    check-cast v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v1, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->removeScript(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_2
    return-void
.end method

.method public removeScript(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/script/IScript;",
            ">;)V"
        }
    .end annotation

    .line 244
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scripts:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 245
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/script/IScript;

    .line 246
    invoke-interface {v0}, Lcom/uwsoft/editor/renderer/script/IScript;->dispose()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public renew()V
    .locals 6

    .line 868
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->x:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setX(F)V

    .line 869
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->y:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setY(F)V

    .line 870
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scaleX:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setScaleX(F)V

    .line 871
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scaleY:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setScaleY(F)V

    .line 872
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->rotation:F

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setRotation(F)V

    .line 873
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    const/4 v3, 0x2

    aget v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    const/4 v4, 0x3

    aget v3, v3, v4

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setColor(FFFF)V

    .line 874
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->customVars:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->loadFromString(Ljava/lang/String;)V

    .line 875
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorX:F

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v2, v2, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorY:F

    iget v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float v2, v2, v3

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v3, v3, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorWidth:F

    iget v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    mul-float v3, v3, v4

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v4, v4, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorHeight:F

    iget v5, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float v4, v4, v5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/math/Rectangle;-><init>(FFFF)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scissorBounds:Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method

.method public setBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 0

    .line 927
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->body:Lcom/badlogic/gdx/physics/box2d/Body;

    return-void
.end method

.method public setLayerChildrenLock(Ljava/lang/String;Z)V
    .locals 3

    const/4 v0, 0x0

    .line 856
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 857
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    .line 858
    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->layerName:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 859
    invoke-interface {v1, p2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->setLockByLayer(Z)V

    .line 860
    check-cast v1, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    if-eqz p2, :cond_0

    sget-object v2, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->disabled:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    goto :goto_1

    :cond_0
    sget-object v2, Lcom/badlogic/gdx/scenes/scene2d/Touchable;->enabled:Lcom/badlogic/gdx/scenes/scene2d/Touchable;

    :goto_1
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setTouchable(Lcom/badlogic/gdx/scenes/scene2d/Touchable;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setLayerIndex(I)V
    .locals 0

    .line 919
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerIndex:I

    return-void
.end method

.method public setLayerLock(Ljava/lang/String;Z)V
    .locals 2

    const/4 v0, 0x0

    .line 845
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 846
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/LayerItemVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->layerName:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 847
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->layers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/LayerItemVO;

    iput-boolean p2, v1, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isLocked:Z

    .line 848
    invoke-virtual {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerChildrenLock(Ljava/lang/String;Z)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setLayerVisibilty(Ljava/lang/String;Z)V
    .locals 1

    .line 821
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->layerMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;

    if-nez v0, :cond_0

    return-void

    .line 824
    :cond_0
    iput-boolean p2, v0, Lcom/uwsoft/editor/renderer/data/LayerItemVO;->isVisible:Z

    .line 825
    invoke-direct {p0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setLayerChildrenVisibilty(Ljava/lang/String;Z)V

    return-void
.end method

.method public setLockByLayer(Z)V
    .locals 0

    .line 909
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->isLockedByLayer:Z

    return-void
.end method

.method public setParentItem(Lcom/uwsoft/editor/renderer/actor/CompositeItem;)V
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->parentItem:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-void
.end method

.method public setScissors(FFFF)V
    .locals 2

    .line 779
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    div-float/2addr p1, v1

    iput p1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorX:F

    .line 780
    iget p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    div-float/2addr p2, p1

    iput p2, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorY:F

    div-float/2addr p3, v1

    .line 781
    iput p3, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorWidth:F

    div-float/2addr p4, p1

    .line 782
    iput p4, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorHeight:F

    .line 783
    new-instance p1, Lcom/badlogic/gdx/math/Rectangle;

    iget p2, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorX:F

    iget p3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    mul-float p2, p2, p3

    iget-object p3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p3, p3, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorY:F

    iget p4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float p3, p3, p4

    iget-object p4, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget p4, p4, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorWidth:F

    iget v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    mul-float p4, p4, v0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scissorHeight:F

    iget v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    mul-float v0, v0, v1

    invoke-direct {p1, p2, p3, p4, v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>(FFFF)V

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->scissorBounds:Lcom/badlogic/gdx/math/Rectangle;

    return-void
.end method

.method protected setStage(Lcom/badlogic/gdx/scenes/scene2d/Stage;)V
    .locals 0

    .line 398
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Group;->setStage(Lcom/badlogic/gdx/scenes/scene2d/Stage;)V

    if-eqz p1, :cond_0

    .line 400
    invoke-direct {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->assemblePhysics()V

    :cond_0
    return-void
.end method

.method public setTint(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 3

    const/4 v0, 0x4

    .line 122
    new-array v0, v0, [F

    .line 123
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->r:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 124
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->g:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 125
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->b:F

    const/4 v2, 0x2

    aput v1, v0, v2

    .line 126
    iget v1, p1, Lcom/badlogic/gdx/graphics/Color;->a:F

    const/4 v2, 0x3

    aput v1, v0, v2

    .line 127
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    move-result-object v1

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->tint:[F

    .line 128
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setColor(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public sortZindexes()V
    .locals 4

    .line 658
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 661
    :goto_0
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 662
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-interface {v3}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v3

    iget-object v3, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->layerName:Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getlayerIndexByName(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2, v3}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->setLayerIndex(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 664
    :cond_1
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->ZIndexComparator:Ljava/util/Comparator;

    invoke-static {v1, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v1, 0x0

    .line 665
    :goto_1
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 666
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    .line 667
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v3

    iget v3, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    if-gez v3, :cond_2

    .line 668
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v3

    iput v0, v3, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    .line 670
    :cond_2
    move-object v3, v2

    check-cast v3, Lcom/badlogic/gdx/scenes/scene2d/Actor;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/scenes/scene2d/Actor;->setZIndex(I)V

    .line 671
    invoke-interface {v2}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/MainItemVO;

    move-result-object v2

    iput v1, v2, Lcom/uwsoft/editor/renderer/data/MainItemVO;->zIndex:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public updateDataVO()V
    .locals 3

    .line 880
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getX()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulX:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->x:F

    .line 881
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getY()F

    move-result v1

    iget v2, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->mulY:F

    div-float/2addr v1, v2

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->y:F

    .line 882
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getRotation()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->rotation:F

    .line 883
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getZIndex()I

    move-result v0

    if-ltz v0, :cond_0

    .line 884
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getZIndex()I

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->zIndex:I

    .line 887
    :cond_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->layerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->layerName:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 888
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    const-string v1, "Default"

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->layerName:Ljava/lang/String;

    :cond_2
    const/4 v0, 0x0

    .line 891
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 892
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->items:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-interface {v1}, Lcom/uwsoft/editor/renderer/actor/IBaseItem;->updateDataVO()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 895
    :cond_3
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->sortZindexes()V

    .line 897
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getScaleX()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scaleX:F

    .line 898
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getScaleY()F

    move-result v1

    iput v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->scaleY:F

    .line 899
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->customVariables:Lcom/uwsoft/editor/renderer/utils/CustomVariables;

    invoke-virtual {v1}, Lcom/uwsoft/editor/renderer/utils/CustomVariables;->saveAsString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->customVars:Ljava/lang/String;

    return-void
.end method
