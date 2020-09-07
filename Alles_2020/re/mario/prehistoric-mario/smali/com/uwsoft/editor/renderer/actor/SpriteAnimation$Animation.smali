.class public Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;
.super Ljava/lang/Object;
.source "SpriteAnimation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/uwsoft/editor/renderer/actor/SpriteAnimation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Animation"
.end annotation


# instance fields
.field public endFrame:I

.field public name:Ljava/lang/String;

.field public startFrame:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 417
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;)V
    .locals 0

    .line 411
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 412
    iput p1, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;->startFrame:I

    .line 413
    iput p2, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;->endFrame:I

    .line 414
    iput-object p3, p0, Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;->name:Ljava/lang/String;

    return-void
.end method

.method public static constructJsonObject(Ljava/lang/String;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;",
            ">;"
        }
    .end annotation

    .line 429
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 430
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-object p0

    .line 432
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/utils/Json;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    .line 433
    const-class v1, Ljava/util/HashMap;

    invoke-virtual {v0, v1, p0}, Lcom/badlogic/gdx/utils/Json;->fromJson(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method public static constructJsonString(Ljava/util/Map;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/uwsoft/editor/renderer/actor/SpriteAnimation$Animation;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 422
    new-instance v0, Lcom/badlogic/gdx/utils/Json;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    .line 423
    sget-object v1, Lcom/badlogic/gdx/utils/JsonWriter$OutputType;->json:Lcom/badlogic/gdx/utils/JsonWriter$OutputType;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Json;->setOutputType(Lcom/badlogic/gdx/utils/JsonWriter$OutputType;)V

    .line 424
    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/utils/Json;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
