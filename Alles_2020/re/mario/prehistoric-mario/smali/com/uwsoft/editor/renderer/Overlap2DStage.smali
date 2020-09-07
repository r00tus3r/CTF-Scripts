.class public Lcom/uwsoft/editor/renderer/Overlap2DStage;
.super Lcom/badlogic/gdx/scenes/scene2d/Stage;
.source "Overlap2DStage.java"


# instance fields
.field public essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

.field public physiscStopped:Z

.field public sceneLoader:Lcom/uwsoft/editor/renderer/SceneLoader;

.field private timeAcc:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 39
    invoke-direct {p0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;-><init>()V

    const/4 v0, 0x0

    .line 34
    iput v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->timeAcc:F

    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->physiscStopped:Z

    .line 40
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/Overlap2DStage;->initStage()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/utils/viewport/Viewport;)V
    .locals 0

    .line 44
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;-><init>(Lcom/badlogic/gdx/utils/viewport/Viewport;)V

    const/4 p1, 0x0

    .line 34
    iput p1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->timeAcc:F

    const/4 p1, 0x0

    .line 36
    iput-boolean p1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->physiscStopped:Z

    .line 45
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/Overlap2DStage;->initStage()V

    return-void
.end method


# virtual methods
.method public act(F)V
    .locals 8

    .line 127
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->physiscStopped:Z

    if-nez v0, :cond_1

    .line 129
    :goto_0
    iget v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->timeAcc:F

    cmpg-float v1, v0, p1

    if-gez v1, :cond_0

    const v1, 0x3c888889

    add-float/2addr v0, v1

    .line 130
    iput v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->timeAcc:F

    .line 131
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2, v2}, Lcom/badlogic/gdx/physics/box2d/World;->step(FII)V

    goto :goto_0

    :cond_0
    sub-float/2addr v0, p1

    .line 133
    iput v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->timeAcc:F

    .line 136
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    if-eqz v0, :cond_2

    .line 137
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/Overlap2DStage;->getCamera()Lcom/badlogic/gdx/graphics/Camera;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    .line 138
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v2, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->combined:Lcom/badlogic/gdx/math/Matrix4;

    const/high16 v3, 0x3f800000    # 1.0f

    sget v4, Lcom/uwsoft/editor/renderer/physics/PhysicsBodyLoader;->SCALE:F

    div-float/2addr v3, v4

    invoke-virtual {v1, v3}, Lcom/badlogic/gdx/math/Matrix4;->scl(F)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v3

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget-object v1, v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v5, v1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v1, v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportWidth:F

    iget v6, v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v6, v6, v1

    iget v1, v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->viewportHeight:F

    iget v0, v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;->zoom:F

    mul-float v7, v1, v0

    invoke-virtual/range {v2 .. v7}, Lbox2dLight/RayHandler;->setCombinedMatrix(Lcom/badlogic/gdx/math/Matrix4;FFFF)V

    .line 146
    :cond_2
    invoke-super {p0, p1}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->act(F)V

    return-void
.end method

.method public draw()V
    .locals 1

    .line 151
    invoke-super {p0}, Lcom/badlogic/gdx/scenes/scene2d/Stage;->draw()V

    .line 153
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    invoke-virtual {v0}, Lbox2dLight/RayHandler;->updateAndRender()V

    :cond_0
    return-void
.end method

.method public getWorld()Lcom/badlogic/gdx/physics/box2d/World;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    return-object v0
.end method

.method protected initLightsConfiguration()V
    .locals 3

    const/4 v0, 0x1

    .line 110
    invoke-static {v0}, Lbox2dLight/RayHandler;->setGammaCorrection(Z)V

    .line 111
    invoke-static {v0}, Lbox2dLight/RayHandler;->useDiffuseLight(Z)V

    .line 113
    new-instance v1, Lbox2dLight/RayHandler;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lbox2dLight/RayHandler;-><init>(Lcom/badlogic/gdx/physics/box2d/World;)V

    const/high16 v2, 0x3f800000    # 1.0f

    .line 114
    invoke-virtual {v1, v2, v2, v2, v2}, Lbox2dLight/RayHandler;->setAmbientLight(FFFF)V

    .line 115
    invoke-virtual {v1, v0}, Lbox2dLight/RayHandler;->setCulling(Z)V

    .line 116
    invoke-virtual {v1, v0}, Lbox2dLight/RayHandler;->setBlur(Z)V

    const/4 v2, 0x3

    .line 117
    invoke-virtual {v1, v2}, Lbox2dLight/RayHandler;->setBlurNum(I)V

    .line 118
    invoke-virtual {v1, v0}, Lbox2dLight/RayHandler;->setShadows(Z)V

    .line 119
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/Overlap2DStage;->getCamera()Lcom/badlogic/gdx/graphics/Camera;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/OrthographicCamera;

    invoke-virtual {v1, v0}, Lbox2dLight/RayHandler;->setCombinedMatrix(Lcom/badlogic/gdx/graphics/OrthographicCamera;)V

    .line 121
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iput-object v1, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    return-void
.end method

.method public initSceneLoader()V
    .locals 3

    .line 89
    new-instance v0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;-><init>()V

    .line 92
    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->initAllResources()V

    .line 94
    new-instance v1, Lcom/uwsoft/editor/renderer/SceneLoader;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v1, v2}, Lcom/uwsoft/editor/renderer/SceneLoader;-><init>(Lcom/uwsoft/editor/renderer/data/Essentials;)V

    iput-object v1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->sceneLoader:Lcom/uwsoft/editor/renderer/SceneLoader;

    .line 95
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v1, v2}, Lbox2dLight/RayHandler;->setWorld(Lcom/badlogic/gdx/physics/box2d/World;)V

    .line 96
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    return-void
.end method

.method public initSceneLoader(Lcom/uwsoft/editor/renderer/resources/ResourceManager;)V
    .locals 2

    .line 100
    new-instance v0, Lcom/uwsoft/editor/renderer/SceneLoader;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v0, v1}, Lcom/uwsoft/editor/renderer/SceneLoader;-><init>(Lcom/uwsoft/editor/renderer/data/Essentials;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->sceneLoader:Lcom/uwsoft/editor/renderer/SceneLoader;

    .line 101
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v0, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->world:Lcom/badlogic/gdx/physics/box2d/World;

    invoke-virtual {v0, v1}, Lbox2dLight/RayHandler;->setWorld(Lcom/badlogic/gdx/physics/box2d/World;)V

    .line 102
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iput-object p1, v0, Lcom/uwsoft/editor/renderer/data/Essentials;->rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

    return-void
.end method

.method protected initStage()V
    .locals 2

    .line 53
    new-instance v0, Lcom/uwsoft/editor/renderer/data/Essentials;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/Essentials;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    .line 54
    new-instance v0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;-><init>()V

    .line 55
    iget-boolean v1, v0, Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;->isSpineAviable:Z

    if-eqz v1, :cond_0

    .line 56
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iput-object v0, v1, Lcom/uwsoft/editor/renderer/data/Essentials;->spineReflectionHelper:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

    .line 58
    :cond_0
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/Overlap2DStage;->initLightsConfiguration()V

    return-void
.end method

.method public loadScene(Ljava/lang/String;)V
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->sceneLoader:Lcom/uwsoft/editor/renderer/SceneLoader;

    invoke-virtual {v0, p1}, Lcom/uwsoft/editor/renderer/SceneLoader;->loadScene(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/SceneVO;

    .line 71
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->sceneLoader:Lcom/uwsoft/editor/renderer/SceneLoader;

    invoke-virtual {p1}, Lcom/uwsoft/editor/renderer/SceneLoader;->getSceneVO()Lcom/uwsoft/editor/renderer/data/SceneVO;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/Overlap2DStage;->setAmbienceInfo(Lcom/uwsoft/editor/renderer/data/SceneVO;)V

    .line 73
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->sceneLoader:Lcom/uwsoft/editor/renderer/SceneLoader;

    invoke-virtual {p1}, Lcom/uwsoft/editor/renderer/SceneLoader;->getRoot()Lcom/uwsoft/editor/renderer/actor/CompositeItem;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/Overlap2DStage;->addActor(Lcom/badlogic/gdx/scenes/scene2d/Actor;)V

    return-void
.end method

.method public setAmbienceInfo(Lcom/uwsoft/editor/renderer/data/SceneVO;)V
    .locals 5

    .line 159
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

    .line 160
    iget-object p1, p0, Lcom/uwsoft/editor/renderer/Overlap2DStage;->essentials:Lcom/uwsoft/editor/renderer/data/Essentials;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/Essentials;->rayHandler:Lbox2dLight/RayHandler;

    invoke-virtual {p1, v0}, Lbox2dLight/RayHandler;->setAmbientLight(Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method
