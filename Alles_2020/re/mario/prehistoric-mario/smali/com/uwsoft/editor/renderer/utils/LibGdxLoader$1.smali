.class synthetic Lcom/uwsoft/editor/renderer/utils/LibGdxLoader$1;
.super Ljava/lang/Object;
.source "LibGdxLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/uwsoft/editor/renderer/utils/LibGdxLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$badlogic$gdx$Application$ApplicationType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 58
    invoke-static {}, Lcom/badlogic/gdx/Application$ApplicationType;->values()[Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader$1;->$SwitchMap$com$badlogic$gdx$Application$ApplicationType:[I

    :try_start_0
    sget-object v0, Lcom/uwsoft/editor/renderer/utils/LibGdxLoader$1;->$SwitchMap$com$badlogic$gdx$Application$ApplicationType:[I

    sget-object v1, Lcom/badlogic/gdx/Application$ApplicationType;->iOS:Lcom/badlogic/gdx/Application$ApplicationType;

    invoke-virtual {v1}, Lcom/badlogic/gdx/Application$ApplicationType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
