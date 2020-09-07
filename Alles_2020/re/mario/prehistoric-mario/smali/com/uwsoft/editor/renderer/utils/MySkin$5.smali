.class Lcom/uwsoft/editor/renderer/utils/MySkin$5;
.super Lcom/badlogic/gdx/utils/Json$ReadOnlySerializer;
.source "MySkin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/uwsoft/editor/renderer/utils/MySkin;->getJsonLoader(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/utils/Json;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/uwsoft/editor/renderer/utils/MySkin;


# direct methods
.method constructor <init>(Lcom/uwsoft/editor/renderer/utils/MySkin;)V
    .locals 0

    .line 489
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/utils/MySkin$5;->this$0:Lcom/uwsoft/editor/renderer/utils/MySkin;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Json$ReadOnlySerializer;-><init>()V

    return-void
.end method


# virtual methods
.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 2

    .line 491
    const-class p3, Ljava/lang/String;

    const-string v0, "name"

    invoke-virtual {p1, v0, p3, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    .line 492
    const-class v0, Lcom/badlogic/gdx/graphics/Color;

    const-string v1, "color"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/Color;

    .line 493
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/utils/MySkin$5;->this$0:Lcom/uwsoft/editor/renderer/utils/MySkin;

    invoke-virtual {p2, p3, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->newDrawable(Ljava/lang/String;Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/scenes/scene2d/utils/Drawable;

    move-result-object p1

    return-object p1
.end method
