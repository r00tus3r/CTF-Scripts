.class public Lcom/uwsoft/editor/renderer/data/SceneVO;
.super Ljava/lang/Object;
.source "SceneVO.java"


# instance fields
.field public ambientColor:[F

.field public composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

.field public libraryItems:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/data/CompositeItemVO;",
            ">;"
        }
    .end annotation
.end field

.field public physicsPropertiesVO:Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

.field public sceneName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 12
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->sceneName:Ljava/lang/String;

    const/4 v0, 0x4

    .line 16
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->libraryItems:Ljava/util/HashMap;

    .line 20
    new-instance v0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->physicsPropertiesVO:Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Lcom/uwsoft/editor/renderer/data/SceneVO;)V
    .locals 2

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 12
    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->sceneName:Ljava/lang/String;

    const/4 v0, 0x4

    .line 16
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->libraryItems:Ljava/util/HashMap;

    .line 20
    new-instance v0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->physicsPropertiesVO:Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    .line 27
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->sceneName:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->sceneName:Ljava/lang/String;

    .line 28
    new-instance v0, Lcom/uwsoft/editor/renderer/data/CompositeVO;

    iget-object v1, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    invoke-direct {v0, v1}, Lcom/uwsoft/editor/renderer/data/CompositeVO;-><init>(Lcom/uwsoft/editor/renderer/data/CompositeVO;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->composite:Lcom/uwsoft/editor/renderer/data/CompositeVO;

    .line 29
    iget-object v0, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v0

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->ambientColor:[F

    .line 30
    new-instance v0, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    iget-object p1, p1, Lcom/uwsoft/editor/renderer/data/SceneVO;->physicsPropertiesVO:Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    invoke-direct {v0, p1}, Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;-><init>(Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;)V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/SceneVO;->physicsPropertiesVO:Lcom/uwsoft/editor/renderer/data/PhysicsPropertiesVO;

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public constructJsonString()Ljava/lang/String;
    .locals 2

    .line 35
    new-instance v0, Lcom/badlogic/gdx/utils/Json;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    .line 36
    sget-object v1, Lcom/badlogic/gdx/utils/JsonWriter$OutputType;->json:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Json;->setOutputType(Lcom/badlogic/gdx/utils/JsonWriter$OutputType;)V

    .line 37
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/utils/Json;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
