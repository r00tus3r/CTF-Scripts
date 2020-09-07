.class public Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;
.super Ljava/lang/Object;
.source "ProjectInfoVO.java"


# instance fields
.field public assetMeshMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public meshes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/data/MeshVO;",
            ">;"
        }
    .end annotation
.end field

.field public originalResolution:Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

.field public resolutions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;",
            ">;"
        }
    .end annotation
.end field

.field public scenes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/uwsoft/editor/renderer/data/SceneVO;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    invoke-direct {v0}, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->originalResolution:Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->resolutions:Ljava/util/ArrayList;

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->scenes:Ljava/util/ArrayList;

    .line 17
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->assetMeshMap:Ljava/util/HashMap;

    .line 18
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->meshes:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public addNewMesh(Lcom/uwsoft/editor/renderer/data/MeshVO;)Ljava/lang/String;
    .locals 4

    .line 40
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->meshes:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/HashMap;->size()I

    move-result v0

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->meshes:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO$1;

    invoke-direct {v1, p0}, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO$1;-><init>(Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->max(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    .line 48
    :goto_0
    iget-object v1, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->meshes:Ljava/util/HashMap;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public cloneMesh(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->meshes:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/uwsoft/editor/renderer/data/MeshVO;

    if-nez v0, :cond_0

    return-object p1

    .line 57
    :cond_0
    invoke-virtual {v0}, Lcom/uwsoft/editor/renderer/data/MeshVO;->clone()Lcom/uwsoft/editor/renderer/data/MeshVO;

    move-result-object p1

    .line 58
    invoke-virtual {p0, p1}, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->addNewMesh(Lcom/uwsoft/editor/renderer/data/MeshVO;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public constructJsonString()Ljava/lang/String;
    .locals 2

    .line 22
    new-instance v0, Lcom/badlogic/gdx/utils/Json;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    .line 23
    sget-object v1, Lcom/badlogic/gdx/utils/JsonWriter$OutputType;->json:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Json;->setOutputType(Lcom/badlogic/gdx/utils/JsonWriter$OutputType;)V

    .line 24
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/utils/Json;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 25
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Json;->prettyPrint(Ljava/lang/String;)Ljava/lang/String;

    return-object v1
.end method

.method public getResolution(Ljava/lang/String;)Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;
    .locals 3

    .line 30
    iget-object v0, p0, Lcom/uwsoft/editor/renderer/data/ProjectInfoVO;->resolutions:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;

    .line 31
    iget-object v2, v1, Lcom/uwsoft/editor/renderer/data/ResolutionEntryVO;->name:Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
