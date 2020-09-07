.class public Lcom/brashmonkey/spriter/Data;
.super Ljava/lang/Object;
.source "Data.java"


# instance fields
.field final entities:[Lcom/brashmonkey/spriter/Entity;

.field private entityPointer:I

.field private folderPointer:I

.field final folders:[Lcom/brashmonkey/spriter/Folder;

.field public final generator:Ljava/lang/String;

.field public final generatorVersion:Ljava/lang/String;

.field public final scmlVersion:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V
    .locals 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/brashmonkey/spriter/Data;->folderPointer:I

    iput v0, p0, Lcom/brashmonkey/spriter/Data;->entityPointer:I

    .line 21
    iput-object p1, p0, Lcom/brashmonkey/spriter/Data;->scmlVersion:Ljava/lang/String;

    .line 22
    iput-object p2, p0, Lcom/brashmonkey/spriter/Data;->generator:Ljava/lang/String;

    .line 23
    iput-object p3, p0, Lcom/brashmonkey/spriter/Data;->generatorVersion:Ljava/lang/String;

    .line 24
    new-array p1, p4, [Lcom/brashmonkey/spriter/Folder;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Data;->folders:[Lcom/brashmonkey/spriter/Folder;

    .line 25
    new-array p1, p5, [Lcom/brashmonkey/spriter/Entity;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Data;->entities:[Lcom/brashmonkey/spriter/Entity;

    return-void
.end method


# virtual methods
.method addEntity(Lcom/brashmonkey/spriter/Entity;)V
    .locals 3

    .line 41
    iget-object v0, p0, Lcom/brashmonkey/spriter/Data;->entities:[Lcom/brashmonkey/spriter/Entity;

    iget v1, p0, Lcom/brashmonkey/spriter/Data;->entityPointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Data;->entityPointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method addFolder(Lcom/brashmonkey/spriter/Folder;)V
    .locals 3

    .line 33
    iget-object v0, p0, Lcom/brashmonkey/spriter/Data;->folders:[Lcom/brashmonkey/spriter/Folder;

    iget v1, p0, Lcom/brashmonkey/spriter/Data;->folderPointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Data;->folderPointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method public getEntities()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 148
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Data;->entities:[Lcom/brashmonkey/spriter/Entity;

    array-length v1, v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    .line 149
    :goto_0
    iget-object v2, p0, Lcom/brashmonkey/spriter/Data;->entities:[Lcom/brashmonkey/spriter/Entity;

    array-length v3, v2

    if-ge v1, v3, :cond_0

    .line 150
    aget-object v2, v2, v1

    iget-object v2, v2, Lcom/brashmonkey/spriter/Entity;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getEntity(I)Lcom/brashmonkey/spriter/Entity;
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/brashmonkey/spriter/Data;->entities:[Lcom/brashmonkey/spriter/Entity;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getEntity(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity;
    .locals 0

    .line 91
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Data;->getEntityIndex(Ljava/lang/String;)I

    move-result p1

    if-ltz p1, :cond_0

    .line 92
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Data;->getEntity(I)Lcom/brashmonkey/spriter/Entity;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method getEntityIndex(Ljava/lang/String;)I
    .locals 5

    .line 102
    iget-object v0, p0, Lcom/brashmonkey/spriter/Data;->entities:[Lcom/brashmonkey/spriter/Entity;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 103
    iget-object v4, v3, Lcom/brashmonkey/spriter/Entity;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget p1, v3, Lcom/brashmonkey/spriter/Entity;->id:I

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public getFile(II)Lcom/brashmonkey/spriter/File;
    .locals 0

    .line 125
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Data;->getFolder(I)Lcom/brashmonkey/spriter/Folder;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/brashmonkey/spriter/Data;->getFile(Lcom/brashmonkey/spriter/Folder;I)Lcom/brashmonkey/spriter/File;

    move-result-object p1

    return-object p1
.end method

.method public getFile(Lcom/brashmonkey/spriter/FileReference;)Lcom/brashmonkey/spriter/File;
    .locals 1

    .line 134
    iget v0, p1, Lcom/brashmonkey/spriter/FileReference;->folder:I

    iget p1, p1, Lcom/brashmonkey/spriter/FileReference;->file:I

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Data;->getFile(II)Lcom/brashmonkey/spriter/File;

    move-result-object p1

    return-object p1
.end method

.method public getFile(Lcom/brashmonkey/spriter/Folder;I)Lcom/brashmonkey/spriter/File;
    .locals 0

    .line 114
    invoke-virtual {p1, p2}, Lcom/brashmonkey/spriter/Folder;->getFile(I)Lcom/brashmonkey/spriter/File;

    move-result-object p1

    return-object p1
.end method

.method getFolder(I)Lcom/brashmonkey/spriter/Folder;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/brashmonkey/spriter/Data;->folders:[Lcom/brashmonkey/spriter/Folder;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getFolder(Ljava/lang/String;)Lcom/brashmonkey/spriter/Folder;
    .locals 0

    .line 50
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Data;->getFolderIndex(Ljava/lang/String;)I

    move-result p1

    if-ltz p1, :cond_0

    .line 51
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Data;->getFolder(I)Lcom/brashmonkey/spriter/Folder;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method getFolderIndex(Ljava/lang/String;)I
    .locals 5

    .line 61
    iget-object v0, p0, Lcom/brashmonkey/spriter/Data;->folders:[Lcom/brashmonkey/spriter/Folder;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 62
    iget-object v4, v3, Lcom/brashmonkey/spriter/Folder;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget p1, v3, Lcom/brashmonkey/spriter/Folder;->id:I

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .line 138
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|[Version: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Data;->scmlVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", Generator: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Data;->generator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Data;->generatorVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 139
    iget-object v1, p0, Lcom/brashmonkey/spriter/Data;->folders:[Lcom/brashmonkey/spriter/Folder;

    array-length v2, v1

    const/4 v3, 0x0

    move-object v4, v0

    const/4 v0, 0x0

    :goto_0
    const-string v5, "\n"

    if-ge v0, v2, :cond_0

    aget-object v6, v1, v0

    .line 140
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 141
    :cond_0
    iget-object v0, p0, Lcom/brashmonkey/spriter/Data;->entities:[Lcom/brashmonkey/spriter/Entity;

    array-length v1, v0

    :goto_1
    if-ge v3, v1, :cond_1

    aget-object v2, v0, v3

    .line 142
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 143
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
