.class public Lcom/uwsoft/editor/renderer/SceneLoader;
.super Ljava/lang/Object;
.source "SceneLoader.java"


# instance fields
.field private curResolution:Ljava/lang/String;

.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field public sceneActor:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

.field private sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "orig"

    .line 32
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    .line 46
    new-instance v0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;-><init>()V

    .line 47
    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->initAllResources()V

    .line 48
    new-instance v1, Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v1}, Lcom/uwsoft/editor/renderer/data/Essentials;-><init>()V

    .line 49
    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    .line 50
    iput-object v1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/Essentials;)V
    .locals 1

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "orig"

    .line 32
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    .line 86
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    return-void
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;)V
    .locals 1

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "orig"

    .line 32
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    .line 75
    new-instance v0, Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/Essentials;-><init>()V

    .line 76
    iput-object p1, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    .line 77
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "orig"

    .line 32
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    .line 60
    new-instance v0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;-><init>()V

    .line 61
    invoke-virtual {v0, p1}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->setWorkingResolution(Ljava/lang/String;)V

    .line 62
    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->initAllResources()V

    .line 63
    new-instance v1, Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v1}, Lcom/uwsoft/editor/renderer/data/Essentials;-><init>()V

    .line 64
    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    .line 65
    iput-object v1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 66
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public addScriptTo(Ljava/lang/String;Lcom/uwsoft/editor/renderer/script/IScript;)V
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneActor:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScriptTo(Ljava/lang/String;Lcom/uwsoft/editor/renderer/script/IScript;)V

    return-void
.end method

.method public addScriptTo(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/script/IScript;",
            ">;)V"
        }
    .end annotation

    .line 256
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneActor:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v0, p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->addScriptTo(Ljava/lang/String;Ljava/util/ArrayList;)V

    return-void
.end method

.method public getCompositeElement(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;)Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 2

    .line 247
    new-instance v0, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v0, p1, v1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    return-object v0
.end method

.method public getCompositeElementById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneActor:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    invoke-virtual {v0, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getCompositeById(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getDataVO()Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/SceneLoader;->getCompositeElement(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;)Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    move-result-object p1

    return-object p1
.end method

.method public getLibraryAsActor(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 3

    .line 217
    new-instance v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SceneVO;->libraryItems:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    invoke-direct {v0, v1}, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;)V

    .line 218
    iget-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    if-nez v1, :cond_0

    new-instance v1, Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {v1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;-><init>()V

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    .line 219
    :cond_0
    new-instance v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v1, v0, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    .line 220
    iget-object v0, v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->dataVO:Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iput-object p1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->itemName:Ljava/lang/String;

    .line 221
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    invoke-virtual {v1, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->applyResolution(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 222
    invoke-virtual {v1, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setX(F)V

    .line 223
    invoke-virtual {v1, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->setY(F)V

    return-object v1
.end method

.method public getRm()Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;
    .locals 1

    .line 264
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    return-object v0
.end method

.method public getRoot()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneActor:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    return-object v0
.end method

.method public getSceneAsActor()Lcom/uwsoft/editor/renderer/actor/CompositeItem;
    .locals 3

    .line 199
    new-instance v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SceneVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {v0, v1}, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V

    .line 201
    iget-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    if-nez v1, :cond_0

    new-instance v1, Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {v1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;-><init>()V

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    .line 202
    :cond_0
    new-instance v1, Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v1, v0, v2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeItemVO;Lcom/uwsoft/editor/renderer/data/Essentials;)V

    return-object v1
.end method

.method public getSceneVO()Lcom/uwsoft/editor/renderer/data/SceneVO;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    return-object v0
.end method

.method public inject(Ljava/lang/Object;)V
    .locals 8

    .line 282
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 284
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    .line 285
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    array-length v2, v0

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(I)V

    .line 288
    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 289
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 290
    const-class v4, Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 291
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    .line 293
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v5

    .line 294
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getDeclaredAnnotations()[Ljava/lang/annotation/Annotation;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 296
    const-class v6, Lcom/uwsoft/editor/renderer/Overlap2D;

    invoke-virtual {v3, v6}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 297
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "annotation found"

    invoke-virtual {v6, v7}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 298
    invoke-virtual {v3}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    .line 299
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/SceneLoader;->getRoot()Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    move-result-object v7

    invoke-virtual {v7, v6, v4}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->getById(Ljava/lang/String;Ljava/lang/Class;)Lcom/uwsoft/editor/renderer/actor/IBaseItem;

    move-result-object v4

    .line 300
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v6, v4}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 302
    :try_start_0
    invoke-virtual {v5, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, p1, v4}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v3

    goto :goto_1

    :catch_1
    move-exception v3

    .line 304
    :goto_1
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    const/4 v3, -0x1

    .line 305
    invoke-static {v3}, Ljava/lang/System;->exit(I)V

    :cond_0
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public invalidateSceneVO(Lcom/uwsoft/editor/renderer/data/SceneVO;)V
    .locals 0

    .line 160
    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/SceneLoader;->removeMissingImages(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V

    return-void
.end method

.method public loadScene(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/SceneVO;
    .locals 1

    const/4 v0, 0x1

    .line 151
    invoke-virtual {p0, p1, v0}, Lcom/uwsoft/editor/renderer/SceneLoader;->loadScene(Ljava/lang/String;Z)Lcom/uwsoft/editor/renderer/data/SceneVO;

    move-result-object p1

    return-object p1
.end method

.method public loadScene(Ljava/lang/String;Z)Lcom/uwsoft/editor/renderer/data/SceneVO;
    .locals 5

    .line 118
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    invoke-interface {v0, p1}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getSceneVO(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/SceneVO;

    move-result-object p1

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    .line 121
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->physicsPropertiesVO:Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    .line 124
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SceneVO;->physicsPropertiesVO:Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/SceneVO;->physicsPropertiesVO:Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    iget-boolean v0, v0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->enabled:Z

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 125
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    new-instance v2, Lcom/badlogic/gdx/physics/box2d/World;

    new-instance v3, Lcom/badlogic/gdx/math/Vector2;

    iget v4, p1, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->gravityX:F

    iget p1, p1, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;->gravityY:F

    invoke-direct {v3, v4, p1}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    invoke-direct {v2, v3, v1}, Lcom/badlogic/gdx/physics/box2d/World;-><init>(Lcom/badlogic/gdx/math/Vector2;Z)V

    iput-object v2, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    .line 126
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {p1, v0}, Lbox2dLight/RayHandler;->setWorld(Lcom/badlogic/gdx/physics/box2d/World;)V

    .line 129
    :cond_0
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/SceneLoader;->invalidateSceneVO(Lcom/uwsoft/editor/renderer/data/SceneVO;)V

    if-eqz p2, :cond_1

    .line 132
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/SceneLoader;->getSceneAsActor()Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    move-result-object p1

    iput-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneActor:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    .line 133
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    const-string p2, "orig"

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneActor:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    iget-object p2, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->applyResolution(Ljava/lang/String;)V

    .line 136
    :cond_1
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/SceneLoader;->setAmbienceInfo(Lcom/uwsoft/editor/renderer/data/SceneVO;)V

    .line 137
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneVO:Lcom/uwsoft/editor/renderer/data/SceneVO;

    return-object p1
.end method

.method public removeMissingImages(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    .line 171
    :cond_0
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;

    .line 172
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    iget-object v3, v1, Lcom/uwsoft/editor/renderer/data/SimpleImageVO;->imageName:Ljava/lang/String;

    invoke-interface {v2, v3}, Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;->getTextureRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    move-result-object v2

    if-nez v2, :cond_1

    .line 173
    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sImages:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 176
    :cond_2
    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/CompositeVO;->sComposites:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 177
    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {p0, v0}, Lcom/uwsoft/editor/renderer/SceneLoader;->removeMissingImages(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V

    goto :goto_1

    :cond_3
    return-void
.end method

.method public setAmbienceInfo(Lcom/uwsoft/editor/renderer/data/SceneVO;)V
    .locals 5

    .line 187
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    if-eqz v0, :cond_0

    .line 188
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    iget-object v2, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    iget-object v3, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    const/4 v4, 0x3

    aget p1, p1, v4

    invoke-direct {v0, v1, v2, v3, p1}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    .line 189
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    invoke-virtual {p1, v0}, Lbox2dLight/RayHandler;->setAmbientLight(Lcom/badlogic/gdx/graphics/Color;)V

    :cond_0
    return-void
.end method

.method public setResolution(Ljava/lang/String;)V
    .locals 1

    .line 94
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->curResolution:Ljava/lang/String;

    .line 95
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/SceneLoader;->sceneActor:Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {v0, p1}, Lcom/uwsoft/editor/renderer/actor/CompositeItem;->applyResolution(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
