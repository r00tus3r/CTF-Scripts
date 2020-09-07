.class public Lcom/brashmonkey/spriter/Spriter;
.super Ljava/lang/Object;
.source "Spriter.java"


# static fields
.field private static drawer:Lcom/brashmonkey/spriter/Drawer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/brashmonkey/spriter/Drawer<",
            "*>;"
        }
    .end annotation
.end field

.field private static drawerDependencies:[Ljava/lang/Object;

.field private static drawerTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final entityToLoader:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/brashmonkey/spriter/Entity;",
            "Lcom/brashmonkey/spriter/Loader;",
            ">;"
        }
    .end annotation
.end field

.field private static initialized:Z

.field private static final loadedData:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/brashmonkey/spriter/Data;",
            ">;"
        }
    .end annotation
.end field

.field private static loaderClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "+",
            "Lcom/brashmonkey/spriter/Loader;",
            ">;"
        }
    .end annotation
.end field

.field private static loaderDependencies:[Ljava/lang/Object;

.field private static loaderTypes:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final loaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/brashmonkey/spriter/Loader;",
            ">;"
        }
    .end annotation
.end field

.field private static final players:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/brashmonkey/spriter/Player;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    .line 20
    new-array v1, v0, [Ljava/lang/Object;

    sput-object v1, Lcom/brashmonkey/spriter/Spriter;->loaderDependencies:[Ljava/lang/Object;

    new-array v1, v0, [Ljava/lang/Object;

    sput-object v1, Lcom/brashmonkey/spriter/Spriter;->drawerDependencies:[Ljava/lang/Object;

    .line 21
    new-array v1, v0, [Ljava/lang/Class;

    sput-object v1, Lcom/brashmonkey/spriter/Spriter;->loaderTypes:[Ljava/lang/Class;

    new-array v0, v0, [Ljava/lang/Class;

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->drawerTypes:[Ljava/lang/Class;

    .line 23
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderTypes:[Ljava/lang/Class;

    const-class v1, Lcom/brashmonkey/spriter/Data;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 24
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->drawerTypes:[Ljava/lang/Class;

    const-class v1, Lcom/brashmonkey/spriter/Loader;

    aput-object v1, v0, v2

    .line 28
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->loadedData:Ljava/util/HashMap;

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->players:Ljava/util/List;

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->loaders:Ljava/util/List;

    .line 32
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->entityToLoader:Ljava/util/HashMap;

    .line 33
    sput-boolean v2, Lcom/brashmonkey/spriter/Spriter;->initialized:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dispose()V
    .locals 5

    const/4 v0, 0x0

    .line 244
    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->drawer:Lcom/brashmonkey/spriter/Drawer;

    const/4 v1, 0x1

    .line 245
    new-array v2, v1, [Ljava/lang/Object;

    sput-object v2, Lcom/brashmonkey/spriter/Spriter;->drawerDependencies:[Ljava/lang/Object;

    .line 246
    new-array v2, v1, [Ljava/lang/Class;

    sput-object v2, Lcom/brashmonkey/spriter/Spriter;->drawerTypes:[Ljava/lang/Class;

    .line 247
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->drawerTypes:[Ljava/lang/Class;

    const-class v3, Lcom/brashmonkey/spriter/Loader;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 249
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->entityToLoader:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 251
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->loaders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/brashmonkey/spriter/Loader;

    invoke-virtual {v3}, Lcom/brashmonkey/spriter/Loader;->dispose()V

    goto :goto_0

    .line 252
    :cond_0
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->loaders:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 253
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->loadedData:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    .line 254
    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderClass:Ljava/lang/Class;

    .line 255
    new-array v0, v1, [Ljava/lang/Class;

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderTypes:[Ljava/lang/Class;

    .line 256
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderTypes:[Ljava/lang/Class;

    const-class v2, Lcom/brashmonkey/spriter/Data;

    aput-object v2, v0, v4

    .line 257
    new-array v0, v1, [Ljava/lang/Object;

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderDependencies:[Ljava/lang/Object;

    .line 259
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->players:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 261
    sput-boolean v4, Lcom/brashmonkey/spriter/Spriter;->initialized:Z

    return-void
.end method

.method public static draw()V
    .locals 5

    .line 207
    sget-boolean v0, Lcom/brashmonkey/spriter/Spriter;->initialized:Z

    if-eqz v0, :cond_1

    .line 208
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->players:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player;

    .line 209
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->drawer:Lcom/brashmonkey/spriter/Drawer;

    sget-object v3, Lcom/brashmonkey/spriter/Spriter;->entityToLoader:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Player;->getEntity()Lcom/brashmonkey/spriter/Entity;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/brashmonkey/spriter/Loader;

    iput-object v3, v2, Lcom/brashmonkey/spriter/Drawer;->loader:Lcom/brashmonkey/spriter/Loader;

    .line 210
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->drawer:Lcom/brashmonkey/spriter/Drawer;

    invoke-virtual {v2, v1}, Lcom/brashmonkey/spriter/Drawer;->draw(Lcom/brashmonkey/spriter/Player;)V

    goto :goto_0

    :cond_0
    return-void

    .line 207
    :cond_1
    new-instance v0, Lcom/brashmonkey/spriter/SpriterException;

    const-string v1, "Call init() before drawing!"

    invoke-direct {v0, v1}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public static drawer()Lcom/brashmonkey/spriter/Drawer;
    .locals 1

    .line 219
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->drawer:Lcom/brashmonkey/spriter/Drawer;

    return-object v0
.end method

.method public static getData(Ljava/lang/String;)Lcom/brashmonkey/spriter/Data;
    .locals 1

    .line 228
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loadedData:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/brashmonkey/spriter/Data;

    return-object p0
.end method

.method public static getLoader(Ljava/lang/String;)Lcom/brashmonkey/spriter/Loader;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/brashmonkey/spriter/Loader<",
            "*>;"
        }
    .end annotation

    .line 173
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->entityToLoader:Ljava/util/HashMap;

    invoke-static {p0}, Lcom/brashmonkey/spriter/Spriter;->getData(Ljava/lang/String;)Lcom/brashmonkey/spriter/Data;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/brashmonkey/spriter/Data;->getEntity(I)Lcom/brashmonkey/spriter/Entity;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/brashmonkey/spriter/Loader;

    return-object p0
.end method

.method public static init(Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/brashmonkey/spriter/Loader;",
            ">;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/brashmonkey/spriter/Drawer;",
            ">;)V"
        }
    .end annotation

    .line 73
    sput-object p0, Lcom/brashmonkey/spriter/Spriter;->loaderClass:Ljava/lang/Class;

    .line 75
    :try_start_0
    sget-object p0, Lcom/brashmonkey/spriter/Spriter;->drawerTypes:[Ljava/lang/Class;

    invoke-virtual {p1, p0}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p0

    sget-object p1, Lcom/brashmonkey/spriter/Spriter;->drawerDependencies:[Ljava/lang/Object;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/brashmonkey/spriter/Drawer;

    sput-object p0, Lcom/brashmonkey/spriter/Spriter;->drawer:Lcom/brashmonkey/spriter/Drawer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 77
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 79
    :goto_0
    sget-object p0, Lcom/brashmonkey/spriter/Spriter;->drawer:Lcom/brashmonkey/spriter/Drawer;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_1

    :cond_0
    const/4 p0, 0x0

    :goto_1
    sput-boolean p0, Lcom/brashmonkey/spriter/Spriter;->initialized:Z

    return-void
.end method

.method public static load(Ljava/io/File;)V
    .locals 3

    .line 96
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    const-string v1, "\\\\"

    const-string v2, "/"

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/brashmonkey/spriter/Spriter;->load(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 98
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public static load(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 4

    .line 108
    new-instance v0, Lcom/brashmonkey/spriter/SCMLReader;

    invoke-direct {v0, p0}, Lcom/brashmonkey/spriter/SCMLReader;-><init>(Ljava/io/InputStream;)V

    .line 109
    iget-object p0, v0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    .line 110
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loadedData:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderDependencies:[Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    .line 113
    :try_start_0
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderClass:Ljava/lang/Class;

    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->loaderTypes:[Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->loaderDependencies:[Ljava/lang/Object;

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/Loader;

    .line 114
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/brashmonkey/spriter/Loader;->load(Ljava/io/File;)V

    .line 115
    sget-object p1, Lcom/brashmonkey/spriter/Spriter;->loaders:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    iget-object p0, p0, Lcom/brashmonkey/spriter/Data;->entities:[Lcom/brashmonkey/spriter/Entity;

    array-length p1, p0

    :goto_0
    if-ge v1, p1, :cond_0

    aget-object v2, p0, v1

    .line 117
    sget-object v3, Lcom/brashmonkey/spriter/Spriter;->entityToLoader:Ljava/util/HashMap;

    invoke-virtual {v3, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 119
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    return-void
.end method

.method public static load(Ljava/lang/String;)V
    .locals 1

    .line 87
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/brashmonkey/spriter/Spriter;->load(Ljava/io/File;)V

    return-void
.end method

.method public static newPlayer(Ljava/lang/String;I)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 131
    const-class v0, Lcom/brashmonkey/spriter/Player;

    invoke-static {p0, p1, v0}, Lcom/brashmonkey/spriter/Spriter;->newPlayer(Ljava/lang/String;ILjava/lang/Class;)Lcom/brashmonkey/spriter/Player;

    move-result-object p0

    return-object p0
.end method

.method public static newPlayer(Ljava/lang/String;ILjava/lang/Class;)Lcom/brashmonkey/spriter/Player;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/Class<",
            "+",
            "Lcom/brashmonkey/spriter/Player;",
            ">;)",
            "Lcom/brashmonkey/spriter/Player;"
        }
    .end annotation

    .line 143
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loadedData:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 145
    :try_start_0
    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Lcom/brashmonkey/spriter/Entity;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p2, v1}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p2

    new-array v0, v0, [Ljava/lang/Object;

    sget-object v1, Lcom/brashmonkey/spriter/Spriter;->loadedData:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/brashmonkey/spriter/Data;

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Data;->getEntity(I)Lcom/brashmonkey/spriter/Entity;

    move-result-object p0

    aput-object p0, v0, v3

    invoke-virtual {p2, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/brashmonkey/spriter/Player;

    .line 146
    sget-object p1, Lcom/brashmonkey/spriter/Spriter;->players:Ljava/util/List;

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 149
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    const/4 p0, 0x0

    return-object p0

    .line 143
    :cond_0
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "You have to load \""

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\" before using it!"

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newPlayer(Ljava/lang/String;Ljava/lang/String;)Lcom/brashmonkey/spriter/Player;
    .locals 2

    .line 162
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loadedData:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 163
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loadedData:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Data;->getEntityIndex(Ljava/lang/String;)I

    move-result p1

    invoke-static {p0, p1}, Lcom/brashmonkey/spriter/Spriter;->newPlayer(Ljava/lang/String;I)Lcom/brashmonkey/spriter/Player;

    move-result-object p0

    return-object p0

    .line 162
    :cond_0
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "You have to load \""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\" before using it!"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static players()I
    .locals 1

    .line 236
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->players:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public static varargs setDrawerDependencies([Ljava/lang/Object;)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    .line 55
    :cond_0
    array-length v0, p0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->drawerDependencies:[Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->drawerDependencies:[Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v2, v0, v3

    .line 57
    array-length v2, p0

    invoke-static {p0, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 58
    array-length v0, p0

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/Class;

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->drawerTypes:[Ljava/lang/Class;

    .line 59
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->drawerTypes:[Ljava/lang/Class;

    const-class v1, Lcom/brashmonkey/spriter/Loader;

    aput-object v1, v0, v3

    .line 60
    :goto_0
    array-length v0, p0

    if-ge v3, v0, :cond_2

    .line 61
    aget-object v0, p0, v3

    if-eqz v0, :cond_1

    .line 62
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->drawerTypes:[Ljava/lang/Class;

    add-int/lit8 v1, v3, 0x1

    aget-object v2, p0, v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v0, v1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public static varargs setLoaderDependencies([Ljava/lang/Object;)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    .line 41
    :cond_0
    array-length v0, p0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderDependencies:[Ljava/lang/Object;

    .line 42
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderDependencies:[Ljava/lang/Object;

    array-length v2, p0

    const/4 v3, 0x0

    invoke-static {p0, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 43
    array-length v0, p0

    add-int/2addr v0, v1

    new-array v0, v0, [Ljava/lang/Class;

    sput-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderTypes:[Ljava/lang/Class;

    .line 44
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderTypes:[Ljava/lang/Class;

    const-class v1, Lcom/brashmonkey/spriter/Data;

    aput-object v1, v0, v3

    .line 45
    :goto_0
    array-length v0, p0

    if-ge v3, v0, :cond_1

    .line 46
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->loaderTypes:[Ljava/lang/Class;

    add-int/lit8 v1, v3, 0x1

    aget-object v2, p0, v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    aput-object v2, v0, v1

    move v3, v1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static update()V
    .locals 2

    .line 196
    sget-boolean v0, Lcom/brashmonkey/spriter/Spriter;->initialized:Z

    if-eqz v0, :cond_1

    .line 197
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->players:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player;

    .line 198
    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Player;->update()V

    goto :goto_0

    :cond_0
    return-void

    .line 196
    :cond_1
    new-instance v0, Lcom/brashmonkey/spriter/SpriterException;

    const-string v1, "Call init() before updating!"

    invoke-direct {v0, v1}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method

.method public static updateAndDraw()V
    .locals 5

    .line 183
    sget-boolean v0, Lcom/brashmonkey/spriter/Spriter;->initialized:Z

    if-eqz v0, :cond_1

    .line 184
    sget-object v0, Lcom/brashmonkey/spriter/Spriter;->players:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player;

    .line 185
    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Player;->update()V

    .line 186
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->drawer:Lcom/brashmonkey/spriter/Drawer;

    sget-object v3, Lcom/brashmonkey/spriter/Spriter;->entityToLoader:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Player;->getEntity()Lcom/brashmonkey/spriter/Entity;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/brashmonkey/spriter/Loader;

    iput-object v3, v2, Lcom/brashmonkey/spriter/Drawer;->loader:Lcom/brashmonkey/spriter/Loader;

    .line 187
    sget-object v2, Lcom/brashmonkey/spriter/Spriter;->drawer:Lcom/brashmonkey/spriter/Drawer;

    invoke-virtual {v2, v1}, Lcom/brashmonkey/spriter/Drawer;->draw(Lcom/brashmonkey/spriter/Player;)V

    goto :goto_0

    :cond_0
    return-void

    .line 183
    :cond_1
    new-instance v0, Lcom/brashmonkey/spriter/SpriterException;

    const-string v1, "Call init() before updating!"

    invoke-direct {v0, v1}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw v0

    :goto_2
    goto :goto_1
.end method
