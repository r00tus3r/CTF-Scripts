.class public Lcom/uwsoft/editor/renderer/resources/ResourceManager;
.super Ljava/lang/Object;
.source "ResourceManager.java"

# interfaces
.implements Lcom/uwsoft/editor/renderer/resources/IResourceLoader;
.implements Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;


# instance fields
.field protected bitmapFonts:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/uwsoft/editor/renderer/resources/FontSizePair;",
            "Lcom/badlogic/gdx/graphics/g2d/BitmapFont;",
            ">;"
        }
    .end annotation
.end field

.field public fontsPath:Ljava/lang/String;

.field protected fontsToLoad:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/uwsoft/editor/renderer/resources/FontSizePair;",
            ">;"
        }
    .end annotation
.end field

.field protected loadedSceneVOs:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/data/SceneVO;",
            ">;"
        }
    .end annotation
.end field

.field protected mainPack:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

.field public packResolutionName:Ljava/lang/String;

.field protected particleEffectNamesToLoad:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected particleEffects:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;",
            ">;"
        }
    .end annotation
.end field

.field public particleEffectsPath:Ljava/lang/String;

.field protected preparedSceneNames:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected projectVO:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

.field protected resMultiplier:F

.field public scenesPath:Ljava/lang/String;

.field protected skeletonAtlases:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;",
            ">;"
        }
    .end annotation
.end field

.field protected skeletonJSON:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            ">;"
        }
    .end annotation
.end field

.field protected spineAnimNamesToLoad:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public spineAnimationsPath:Ljava/lang/String;

.field protected spriteAnimNamesToLoad:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected spriteAnimations:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;",
            ">;"
        }
    .end annotation
.end field

.field public spriteAnimationsPath:Ljava/lang/String;

.field protected spriterAnimNamesToLoad:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected spriterAnimations:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            ">;"
        }
    .end annotation
.end field

.field public spriterAnimationsPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "orig"

    .line 33
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->packResolutionName:Ljava/lang/String;

    const-string v0, "scenes"

    .line 34
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->scenesPath:Ljava/lang/String;

    const-string v0, "particles"

    .line 35
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffectsPath:Ljava/lang/String;

    const-string v0, "sprite_animations"

    .line 36
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimationsPath:Ljava/lang/String;

    const-string v0, "spriter_animations"

    .line 37
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimationsPath:Ljava/lang/String;

    const-string v0, "spine_animations"

    .line 38
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimationsPath:Ljava/lang/String;

    const-string v0, "freetypefonts"

    .line 39
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->fontsPath:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->preparedSceneNames:Ljava/util/ArrayList;

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadedSceneVOs:Ljava/util/HashMap;

    .line 48
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffectNamesToLoad:Ljava/util/HashSet;

    .line 49
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimNamesToLoad:Ljava/util/HashSet;

    .line 50
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimNamesToLoad:Ljava/util/HashSet;

    .line 51
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimNamesToLoad:Ljava/util/HashSet;

    .line 52
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->fontsToLoad:Ljava/util/HashSet;

    .line 55
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffects:Ljava/util/HashMap;

    .line 57
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->skeletonAtlases:Ljava/util/HashMap;

    .line 58
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->skeletonJSON:Ljava/util/HashMap;

    .line 60
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimations:Ljava/util/HashMap;

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimations:Ljava/util/HashMap;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->bitmapFonts:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 393
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->mainPack:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->dispose()V

    return-void
.end method

.method public getBitmapFont(Ljava/lang/String;I)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    .locals 2

    .line 374
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->bitmapFonts:Ljava/util/HashMap;

    new-instance v1, Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    invoke-direct {v1, p1, p2}, Lcom/uwsoft/editor/renderer/resources/FontSizePair;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    return-object p1
.end method

.method public getParticleEffect(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;
    .locals 2

    .line 354
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffects:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;-><init>(Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;)V

    return-object v0
.end method

.method public getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;
    .locals 1

    .line 389
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->projectVO:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    return-object v0
.end method

.method public getSCMLFile(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
    .locals 1

    .line 398
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimations:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/files/FileHandle;

    return-object p1
.end method

.method public getSceneVO(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/SceneVO;
    .locals 1

    .line 384
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadedSceneVOs:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/uwsoft/editor/renderer/data/SceneVO;

    return-object p1
.end method

.method public getSkeletonAtlas(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;
    .locals 1

    .line 359
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->skeletonAtlases:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    return-object p1
.end method

.method public getSkeletonJSON(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->skeletonJSON:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/files/FileHandle;

    return-object p1
.end method

.method public getSkin()Lcom/uwsoft/editor/renderer/utils/MySkin;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getSpriteAnimation(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;
    .locals 1

    .line 369
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimations:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    return-object p1
.end method

.method public getTextureRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 349
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->mainPack:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->findRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    move-result-object p1

    return-object p1
.end method

.method public initAllResources()V
    .locals 2

    .line 86
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    const/4 v0, 0x0

    .line 87
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->projectVO:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->scenes:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 88
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->projectVO:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->scenes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SceneVO;->sceneName:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadSceneVO(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/SceneVO;

    .line 89
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->projectVO:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->scenes:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SceneVO;->sceneName:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->scheduleScene(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->prepareAssetsToLoad()V

    .line 92
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadAssets()V

    return-void
.end method

.method public initScene(Ljava/lang/String;)V
    .locals 0

    .line 100
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadSceneVO(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/SceneVO;

    .line 101
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->scheduleScene(Ljava/lang/String;)V

    .line 102
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->prepareAssetsToLoad()V

    .line 103
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadAssets()V

    return-void
.end method

.method public loadAssets()V
    .locals 0

    .line 189
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadAtlasPack()V

    .line 190
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadParticleEffects()V

    .line 191
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadSpineAnimations()V

    .line 192
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadSpriteAnimations()V

    .line 193
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadSpriterAnimations()V

    .line 194
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadFonts()V

    return-void
.end method

.method public loadAtlasPack()V
    .locals 3

    .line 199
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->packResolutionName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "pack.atlas"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    .line 200
    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 203
    :cond_0
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    iput-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->mainPack:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    return-void
.end method

.method public loadFont(Lcom/uwsoft/editor/renderer/resources/FontSizePair;)V
    .locals 4

    .line 306
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->fontsPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p1, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".ttf"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    .line 307
    new-instance v1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    invoke-direct {v1, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    .line 308
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;-><init>()V

    .line 309
    iget v2, p1, Lcom/uwsoft/editor/renderer/resources/FontSizePair;->fontSize:I

    int-to-float v2, v2

    iget v3, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->resMultiplier:F

    mul-float v2, v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;->size:I

    .line 310
    invoke-virtual {v1, v0}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateFont(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object v0

    .line 311
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->bitmapFonts:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public loadFonts()V
    .locals 3

    .line 282
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    move-result-object v0

    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->packResolutionName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->getResolution(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 283
    iput v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->resMultiplier:F

    .line 284
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->packResolutionName:Ljava/lang/String;

    const-string v2, "orig"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 285
    iget v1, v0, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;->base:I

    if-nez v1, :cond_0

    .line 286
    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;->width:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    move-result-object v1

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->originalResolution:Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;->width:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->resMultiplier:F

    goto :goto_0

    .line 288
    :cond_0
    iget v0, v0, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;->height:I

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->getProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    move-result-object v1

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->originalResolution:Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    iget v1, v1, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;->height:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->resMultiplier:F

    .line 293
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->bitmapFonts:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    .line 294
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->fontsToLoad:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 295
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->bitmapFonts:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 299
    :cond_3
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->fontsToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    .line 300
    invoke-virtual {p0, v1}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadFont(Lcom/uwsoft/editor/renderer/resources/FontSizePair;)V

    goto :goto_2

    :cond_4
    return-void
.end method

.method public loadParticleEffects()V
    .locals 6

    .line 209
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffects:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 210
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffectNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 211
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffects:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 216
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffectNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 217
    new-instance v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;

    invoke-direct {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;-><init>()V

    .line 218
    sget-object v3, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffectsPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v3

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->mainPack:Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    const-string v5, ""

    invoke-virtual {v2, v3, v4, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEffect;->load(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;Ljava/lang/String;)V

    .line 219
    iget-object v3, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffects:Ljava/util/HashMap;

    invoke-virtual {v3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    return-void
.end method

.method public loadProjectVO()Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;
    .locals 3

    .line 332
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    const-string v1, "project.dt"

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    .line 333
    new-instance v1, Lcom/badlogic/gdx/utils/Json;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    .line 334
    const-class v2, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/badlogic/gdx/utils/Json;->fromJson(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->projectVO:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    .line 336
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->projectVO:Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;

    return-object v0
.end method

.method public loadSceneVO(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/SceneVO;
    .locals 3

    .line 316
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->scenesPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".dt"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    .line 317
    new-instance v1, Lcom/badlogic/gdx/utils/Json;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    .line 318
    const-class v2, Lcom/uwsoft/editor/renderer/data/SceneVO;

    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/badlogic/gdx/utils/Json;->fromJson(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/data/SceneVO;

    .line 320
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadedSceneVOs:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method public loadSpineAnimation(Ljava/lang/String;)V
    .locals 4

    .line 253
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    sget-object v1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->packResolutionName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimationsPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".atlas"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    .line 254
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->skeletonAtlases:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->skeletonJSON:Ljava/util/HashMap;

    sget-object v1, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "orig"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimationsPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".json"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public loadSpineAnimations()V
    .locals 4

    .line 262
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->skeletonAtlases:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 263
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 264
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 265
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimNamesToLoad:Ljava/util/HashSet;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 266
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimNamesToLoad:Ljava/util/HashSet;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 268
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 269
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->skeletonJSON:Ljava/util/HashMap;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 274
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 275
    invoke-virtual {p0, v1}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadSpineAnimation(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    return-void
.end method

.method public loadSpriteAnimations()V
    .locals 6

    .line 226
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimations:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 227
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 228
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimations:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 232
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 233
    new-instance v2, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    sget-object v3, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->packResolutionName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimationsPath:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".atlas"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    .line 234
    iget-object v3, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimations:Ljava/util/HashMap;

    invoke-virtual {v3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    return-void
.end method

.method public loadSpriterAnimations()V
    .locals 5

    .line 240
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimations:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 241
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 242
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimations:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 245
    :cond_1
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 246
    sget-object v2, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "orig"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimationsPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".scml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/badlogic/gdx/Files;->internal(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v2

    .line 247
    iget-object v3, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimations:Ljava/util/HashMap;

    invoke-virtual {v3, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    return-void
.end method

.method public prepareAssetsToLoad()V
    .locals 10

    .line 149
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffectNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 150
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 151
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 152
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimNamesToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 153
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->fontsToLoad:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 155
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->preparedSceneNames:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 156
    iget-object v2, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadedSceneVOs:Ljava/util/HashMap;

    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object v2, v2, Lcom/uwsoft/editor/renderer/data/SceneVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    if-nez v2, :cond_0

    goto :goto_0

    .line 161
    :cond_0
    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveParticleEffectsList()[Ljava/lang/String;

    move-result-object v3

    .line 162
    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveSpineAnimationList()[Ljava/lang/String;

    move-result-object v4

    .line 163
    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveSpriteAnimationList()[Ljava/lang/String;

    move-result-object v5

    .line 164
    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveSpriterAnimationList()[Ljava/lang/String;

    move-result-object v6

    .line 165
    invoke-virtual {v2}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveFontList()[Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    move-result-object v2

    .line 166
    iget-object v7, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadedSceneVOs:Ljava/util/HashMap;

    invoke-virtual {v7, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/SceneVO;

    iget-object v1, v1, Lcom/uwsoft/editor/renderer/data/SceneVO;->libraryItems:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;

    .line 167
    iget-object v8, v7, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {v8}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveFontList()[Lcom/uwsoft/editor/renderer/resources/FontSizePair;

    move-result-object v8

    .line 168
    iget-object v9, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->fontsToLoad:Ljava/util/HashSet;

    invoke-static {v9, v8}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 171
    iget-object v7, v7, Lcom/uwsoft/editor/renderer/data/CompositeItemVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-virtual {v7}, Lcom/uwsoft/editor/renderer/data/CompositeVO;->getRecursiveParticleEffectsList()[Ljava/lang/String;

    move-result-object v7

    .line 172
    iget-object v8, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffectNamesToLoad:Ljava/util/HashSet;

    invoke-static {v8, v7}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_1

    .line 176
    :cond_1
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->particleEffectNamesToLoad:Ljava/util/HashSet;

    invoke-static {v1, v3}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 177
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spineAnimNamesToLoad:Ljava/util/HashSet;

    invoke-static {v1, v4}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 178
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriteAnimNamesToLoad:Ljava/util/HashSet;

    invoke-static {v1, v5}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 179
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->spriterAnimNamesToLoad:Ljava/util/HashSet;

    invoke-static {v1, v6}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 180
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->fontsToLoad:Ljava/util/HashSet;

    invoke-static {v1, v2}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-void
.end method

.method public scheduleScene(Ljava/lang/String;)V
    .locals 1

    .line 124
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadedSceneVOs:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->preparedSceneNames:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public setWorkingResolution(Ljava/lang/String;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->packResolutionName:Ljava/lang/String;

    return-void
.end method

.method public unLoadScene(Ljava/lang/String;)V
    .locals 1

    .line 112
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->unScheduleScene(Ljava/lang/String;)V

    .line 113
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadedSceneVOs:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    invoke-virtual {p0}, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadAssets()V

    return-void
.end method

.method public unLoadSceneVO(Ljava/lang/String;)V
    .locals 1

    .line 326
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->loadedSceneVOs:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public unScheduleScene(Ljava/lang/String;)V
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/resources/ResourceManager;->preparedSceneNames:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method
