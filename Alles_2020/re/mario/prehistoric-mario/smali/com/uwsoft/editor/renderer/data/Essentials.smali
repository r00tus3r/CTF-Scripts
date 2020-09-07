.class public Lcom/uwsoft/editor/renderer/data/Essentials;
.super Ljava/lang/Object;
.source "Essentials.java"


# instance fields
.field public physicsStopped:Z

.field public rayHandler:Lbox2dLight/RayHandler;

.field public rm:Lcom/uwsoft/editor/renderer/resources/IResourceRetriever;

.field public spineReflectionHelper:Lcom/uwsoft/editor/renderer/spine/SpineReflectionHelper;

.field public world:Lcom/badlogic/gdx/physics/box2d/World;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Lcom/uwsoft/editor/renderer/data/Essentials;->physicsStopped:Z

    return-void
.end method
