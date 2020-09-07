.class Lcom/uwsoft/editor/renderer/utils/MySkin$1;
.super Lcom/badlogic/gdx/utils/Json;
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

    .line 401
    iput-object p1, p0, Lcom/uwsoft/editor/renderer/utils/MySkin$1;->this$0:Lcom/uwsoft/editor/renderer/utils/MySkin;

    invoke-direct {p0}, Lcom/badlogic/gdx/utils/Json;-><init>()V

    return-void
.end method


# virtual methods
.method public readValue(Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/Class;",
            "Lcom/badlogic/gdx/utils/JsonValue;",
            ")TT;"
        }
    .end annotation

    .line 404
    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/JsonValue;->isString()Z

    move-result v0

    if-eqz v0, :cond_0

    const-class v0, Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Lcom/badlogic/gdx/utils/reflect/ClassReflection;->isAssignableFrom(Ljava/lang/Class;Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 405
    iget-object p2, p0, Lcom/uwsoft/editor/renderer/utils/MySkin$1;->this$0:Lcom/uwsoft/editor/renderer/utils/MySkin;

    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/JsonValue;->asString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3, p1}, Lcom/uwsoft/editor/renderer/utils/MySkin;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    .line 406
    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/Class;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
