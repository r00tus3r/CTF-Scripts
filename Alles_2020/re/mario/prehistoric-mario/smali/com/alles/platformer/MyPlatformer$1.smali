.class Lcom/alles/platformer/MyPlatformer$1;
.super Lcom/badlogic/gdx/utils/Pool;
.source "MyPlatformer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/alles/platformer/MyPlatformer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/utils/Pool<",
        "Lcom/badlogic/gdx/math/Rectangle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/alles/platformer/MyPlatformer;


# direct methods
.method constructor <init>(Lcom/alles/platformer/MyPlatformer;)V
    .locals 0

    .line 98
    iput-object p1, p0, Lcom/alles/platformer/MyPlatformer$1;->this$0:Lcom/alles/platformer/MyPlatformer;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Pool;-><init>()V

    return-void
.end method


# virtual methods
.method protected newObject()Lcom/badlogic/gdx/math/Rectangle;
    .locals 1

    .line 101
    new-instance v0, Lcom/badlogic/gdx/math/Rectangle;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Rectangle;-><init>()V

    return-object v0
.end method

.method protected bridge synthetic newObject()Ljava/lang/Object;
    .locals 1

    .line 98
    invoke-virtual {p0}, Lcom/alles/platformer/MyPlatformer$1;->newObject()Lcom/badlogic/gdx/math/Rectangle;

    move-result-object v0

    return-object v0
.end method
