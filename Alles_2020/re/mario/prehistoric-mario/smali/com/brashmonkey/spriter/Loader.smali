.class public abstract Lcom/brashmonkey/spriter/Loader;
.super Ljava/lang/Object;
.source "Loader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected data:Lcom/brashmonkey/spriter/Data;

.field private disposed:Z

.field protected final resources:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/brashmonkey/spriter/FileReference;",
            "TR;>;"
        }
    .end annotation
.end field

.field protected root:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Data;)V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 30
    iput-object v0, p0, Lcom/brashmonkey/spriter/Loader;->root:Ljava/lang/String;

    .line 39
    iput-object p1, p0, Lcom/brashmonkey/spriter/Loader;->data:Lcom/brashmonkey/spriter/Data;

    .line 40
    new-instance p1, Ljava/util/HashMap;

    const/16 v0, 0x64

    invoke-direct {p1, v0}, Ljava/util/HashMap;-><init>(I)V

    iput-object p1, p0, Lcom/brashmonkey/spriter/Loader;->resources:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method protected beginLoading()V
    .locals 0

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/brashmonkey/spriter/Loader;->resources:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    const/4 v0, 0x0

    .line 104
    iput-object v0, p0, Lcom/brashmonkey/spriter/Loader;->data:Lcom/brashmonkey/spriter/Data;

    const-string v0, ""

    .line 105
    iput-object v0, p0, Lcom/brashmonkey/spriter/Loader;->root:Ljava/lang/String;

    const/4 v0, 0x1

    .line 106
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Loader;->disposed:Z

    return-void
.end method

.method protected finishLoading()V
    .locals 0

    return-void
.end method

.method public get(Lcom/brashmonkey/spriter/FileReference;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/FileReference;",
            ")TR;"
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/brashmonkey/spriter/Loader;->resources:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public isDisposed()Z
    .locals 1

    .line 114
    iget-boolean v0, p0, Lcom/brashmonkey/spriter/Loader;->disposed:Z

    return v0
.end method

.method public load(Ljava/io/File;)V
    .locals 0

    .line 86
    invoke-virtual {p1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Loader;->load(Ljava/lang/String;)V

    return-void
.end method

.method public load(Ljava/lang/String;)V
    .locals 10

    .line 67
    iput-object p1, p0, Lcom/brashmonkey/spriter/Loader;->root:Ljava/lang/String;

    .line 68
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Loader;->beginLoading()V

    .line 69
    iget-object p1, p0, Lcom/brashmonkey/spriter/Loader;->data:Lcom/brashmonkey/spriter/Data;

    iget-object p1, p1, Lcom/brashmonkey/spriter/Data;->folders:[Lcom/brashmonkey/spriter/Folder;

    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 70
    iget-object v4, v3, Lcom/brashmonkey/spriter/Folder;->files:[Lcom/brashmonkey/spriter/File;

    array-length v5, v4

    const/4 v6, 0x0

    :goto_1
    if-ge v6, v5, :cond_0

    aget-object v7, v4, v6

    .line 72
    new-instance v8, Lcom/brashmonkey/spriter/FileReference;

    iget v9, v3, Lcom/brashmonkey/spriter/Folder;->id:I

    iget v7, v7, Lcom/brashmonkey/spriter/File;->id:I

    invoke-direct {v8, v9, v7}, Lcom/brashmonkey/spriter/FileReference;-><init>(II)V

    .line 73
    iget-object v7, p0, Lcom/brashmonkey/spriter/Loader;->resources:Ljava/util/HashMap;

    invoke-virtual {p0, v8}, Lcom/brashmonkey/spriter/Loader;->loadResource(Lcom/brashmonkey/spriter/FileReference;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 77
    :cond_1
    iput-boolean v1, p0, Lcom/brashmonkey/spriter/Loader;->disposed:Z

    .line 78
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Loader;->finishLoading()V

    return-void
.end method

.method protected abstract loadResource(Lcom/brashmonkey/spriter/FileReference;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/FileReference;",
            ")TR;"
        }
    .end annotation
.end method
