.class public Lcom/brashmonkey/spriter/SCMLReader;
.super Ljava/lang/Object;
.source "SCMLReader.java"


# instance fields
.field protected data:Lcom/brashmonkey/spriter/Data;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/SCMLReader;->load(Ljava/io/InputStream;)Lcom/brashmonkey/spriter/Data;

    move-result-object p1

    iput-object p1, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/SCMLReader;->load(Ljava/lang/String;)Lcom/brashmonkey/spriter/Data;

    move-result-object p1

    iput-object p1, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    return-void
.end method


# virtual methods
.method public getData()Lcom/brashmonkey/spriter/Data;
    .locals 1

    .line 294
    iget-object v0, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    return-object v0
.end method

.method protected load(Ljava/io/InputStream;)Lcom/brashmonkey/spriter/Data;
    .locals 9

    .line 62
    new-instance v0, Lcom/brashmonkey/spriter/XmlReader;

    invoke-direct {v0}, Lcom/brashmonkey/spriter/XmlReader;-><init>()V

    .line 64
    :try_start_0
    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/XmlReader;->parse(Ljava/io/InputStream;)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object p1

    const-string v0, "folder"

    .line 65
    invoke-virtual {p1, v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, "entity"

    .line 66
    invoke-virtual {p1, v1}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 67
    new-instance v8, Lcom/brashmonkey/spriter/Data;

    const-string v2, "scml_version"

    invoke-virtual {p1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "generator"

    invoke-virtual {p1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "generator_version"

    invoke-virtual {p1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/brashmonkey/spriter/Data;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    iput-object v8, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    .line 69
    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/SCMLReader;->loadFolders(Ljava/util/ArrayList;)V

    .line 70
    invoke-virtual {p0, v1}, Lcom/brashmonkey/spriter/SCMLReader;->loadEntities(Ljava/util/ArrayList;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 72
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 74
    :goto_0
    iget-object p1, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    return-object p1
.end method

.method protected load(Ljava/lang/String;)Lcom/brashmonkey/spriter/Data;
    .locals 9

    .line 45
    new-instance v0, Lcom/brashmonkey/spriter/XmlReader;

    invoke-direct {v0}, Lcom/brashmonkey/spriter/XmlReader;-><init>()V

    .line 46
    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/XmlReader;->parse(Ljava/lang/String;)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object p1

    const-string v0, "folder"

    .line 47
    invoke-virtual {p1, v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    const-string v1, "entity"

    .line 48
    invoke-virtual {p1, v1}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 49
    new-instance v8, Lcom/brashmonkey/spriter/Data;

    const-string v2, "scml_version"

    invoke-virtual {p1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v2, "generator"

    invoke-virtual {p1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "generator_version"

    invoke-virtual {p1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v7

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/brashmonkey/spriter/Data;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II)V

    iput-object v8, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    .line 51
    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/SCMLReader;->loadFolders(Ljava/util/ArrayList;)V

    .line 52
    invoke-virtual {p0, v1}, Lcom/brashmonkey/spriter/SCMLReader;->loadEntities(Ljava/util/ArrayList;)V

    .line 53
    iget-object p1, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    return-object p1
.end method

.method protected loadAnimations(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Entity;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Lcom/brashmonkey/spriter/Entity;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 175
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 176
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/XmlReader$Element;

    const-string v2, "timeline"

    .line 177
    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    const-string v3, "mainline"

    .line 178
    invoke-virtual {v1, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object v3

    const-string v4, "key"

    .line 179
    invoke-virtual {v3, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 180
    new-instance v11, Lcom/brashmonkey/spriter/Animation;

    new-instance v5, Lcom/brashmonkey/spriter/Mainline;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v5, v4}, Lcom/brashmonkey/spriter/Mainline;-><init>(I)V

    const-string v4, "id"

    invoke-virtual {v1, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string v4, "name"

    invoke-virtual {v1, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v4, "length"

    invoke-virtual {v1, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v8

    const/4 v4, 0x1

    const-string v9, "looping"

    invoke-virtual {v1, v9, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v10

    move-object v4, v11

    invoke-direct/range {v4 .. v10}, Lcom/brashmonkey/spriter/Animation;-><init>(Lcom/brashmonkey/spriter/Mainline;ILjava/lang/String;IZI)V

    .line 183
    invoke-virtual {p2, v11}, Lcom/brashmonkey/spriter/Entity;->addAnimation(Lcom/brashmonkey/spriter/Animation;)V

    .line 184
    iget-object v1, v11, Lcom/brashmonkey/spriter/Animation;->mainline:Lcom/brashmonkey/spriter/Mainline;

    invoke-virtual {p0, v3, v1}, Lcom/brashmonkey/spriter/SCMLReader;->loadMainlineKeys(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Mainline;)V

    .line 185
    invoke-virtual {p0, v2, v11, p2}, Lcom/brashmonkey/spriter/SCMLReader;->loadTimelines(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Animation;Lcom/brashmonkey/spriter/Entity;)V

    .line 186
    invoke-virtual {v11}, Lcom/brashmonkey/spriter/Animation;->prepare()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected loadCharacterMaps(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Entity;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Lcom/brashmonkey/spriter/Entity;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 155
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 156
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 157
    new-instance v2, Lcom/brashmonkey/spriter/Entity$CharacterMap;

    const-string v3, "id"

    invoke-virtual {v1, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "charMap"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "name"

    invoke-virtual {v1, v5, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/brashmonkey/spriter/Entity$CharacterMap;-><init>(ILjava/lang/String;)V

    .line 158
    invoke-virtual {p2, v2}, Lcom/brashmonkey/spriter/Entity;->addCharacterMap(Lcom/brashmonkey/spriter/Entity$CharacterMap;)V

    const-string v3, "map"

    .line 159
    invoke-virtual {v1, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 160
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/brashmonkey/spriter/XmlReader$Element;

    const-string v4, "folder"

    .line 161
    invoke-virtual {v3, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "file"

    .line 162
    invoke-virtual {v3, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 163
    new-instance v6, Lcom/brashmonkey/spriter/FileReference;

    invoke-direct {v6, v4, v5}, Lcom/brashmonkey/spriter/FileReference;-><init>(II)V

    new-instance v7, Lcom/brashmonkey/spriter/FileReference;

    const-string v8, "target_folder"

    invoke-virtual {v3, v8, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v4

    const-string v8, "target_file"

    invoke-virtual {v3, v8, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-direct {v7, v4, v3}, Lcom/brashmonkey/spriter/FileReference;-><init>(II)V

    invoke-virtual {v2, v6, v7}, Lcom/brashmonkey/spriter/Entity$CharacterMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected loadEntities(Ljava/util/ArrayList;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 112
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 113
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/XmlReader$Element;

    const-string v2, "obj_info"

    .line 114
    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    const-string v3, "character_map"

    .line 115
    invoke-virtual {v1, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    const-string v4, "animation"

    .line 116
    invoke-virtual {v1, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 117
    new-instance v11, Lcom/brashmonkey/spriter/Entity;

    const-string v5, "id"

    invoke-virtual {v1, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string v5, "name"

    invoke-virtual {v1, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v10

    move-object v5, v11

    invoke-direct/range {v5 .. v10}, Lcom/brashmonkey/spriter/Entity;-><init>(ILjava/lang/String;III)V

    .line 119
    iget-object v1, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v1, v11}, Lcom/brashmonkey/spriter/Data;->addEntity(Lcom/brashmonkey/spriter/Entity;)V

    .line 120
    invoke-virtual {p0, v2, v11}, Lcom/brashmonkey/spriter/SCMLReader;->loadObjectInfos(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Entity;)V

    .line 121
    invoke-virtual {p0, v3, v11}, Lcom/brashmonkey/spriter/SCMLReader;->loadCharacterMaps(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Entity;)V

    .line 122
    invoke-virtual {p0, v4, v11}, Lcom/brashmonkey/spriter/SCMLReader;->loadAnimations(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Entity;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected loadFiles(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Folder;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Lcom/brashmonkey/spriter/Folder;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 97
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 98
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 99
    new-instance v3, Lcom/brashmonkey/spriter/File;

    const-string v4, "id"

    invoke-virtual {v2, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v4

    const-string v5, "name"

    invoke-virtual {v2, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/brashmonkey/spriter/Dimension;

    const-string v7, "width"

    invoke-virtual {v2, v7, v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v7

    int-to-float v7, v7

    const-string v8, "height"

    invoke-virtual {v2, v8, v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v8

    int-to-float v8, v8

    invoke-direct {v6, v7, v8}, Lcom/brashmonkey/spriter/Dimension;-><init>(FF)V

    new-instance v7, Lcom/brashmonkey/spriter/Point;

    const/4 v8, 0x0

    const-string v9, "pivot_x"

    invoke-virtual {v2, v9, v8}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v8

    const/high16 v9, 0x3f800000    # 1.0f

    const-string v10, "pivot_y"

    invoke-virtual {v2, v10, v9}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v2

    invoke-direct {v7, v8, v2}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    invoke-direct {v3, v4, v5, v6, v7}, Lcom/brashmonkey/spriter/File;-><init>(ILjava/lang/String;Lcom/brashmonkey/spriter/Dimension;Lcom/brashmonkey/spriter/Point;)V

    .line 103
    invoke-virtual {p2, v3}, Lcom/brashmonkey/spriter/Folder;->addFile(Lcom/brashmonkey/spriter/File;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected loadFolders(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 82
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 83
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/XmlReader$Element;

    const-string v2, "file"

    .line 84
    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 85
    new-instance v3, Lcom/brashmonkey/spriter/Folder;

    const-string v4, "id"

    invoke-virtual {v1, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "no_name_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "name"

    invoke-virtual {v1, v6, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-direct {v3, v4, v1, v5}, Lcom/brashmonkey/spriter/Folder;-><init>(ILjava/lang/String;I)V

    .line 86
    invoke-virtual {p0, v2, v3}, Lcom/brashmonkey/spriter/SCMLReader;->loadFiles(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Folder;)V

    .line 87
    iget-object v1, p0, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v1, v3}, Lcom/brashmonkey/spriter/Data;->addFolder(Lcom/brashmonkey/spriter/Folder;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected loadMainlineKeys(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Mainline;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Lcom/brashmonkey/spriter/Mainline;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 196
    :goto_0
    iget-object v2, p2, Lcom/brashmonkey/spriter/Mainline;->keys:[Lcom/brashmonkey/spriter/Mainline$Key;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    .line 197
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/brashmonkey/spriter/XmlReader$Element;

    const-string v3, "object_ref"

    .line 198
    invoke-virtual {v2, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    const-string v4, "bone_ref"

    .line 199
    invoke-virtual {v2, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    .line 200
    new-instance v8, Lcom/brashmonkey/spriter/Curve;

    invoke-direct {v8}, Lcom/brashmonkey/spriter/Curve;-><init>()V

    const-string v5, "curve_type"

    const-string v6, "linear"

    .line 201
    invoke-virtual {v2, v5, v6}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/brashmonkey/spriter/Curve;->getType(Ljava/lang/String;)Lcom/brashmonkey/spriter/Curve$Type;

    move-result-object v5

    invoke-virtual {v8, v5}, Lcom/brashmonkey/spriter/Curve;->setType(Lcom/brashmonkey/spriter/Curve$Type;)V

    .line 202
    iget-object v5, v8, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    const/4 v6, 0x0

    const-string v7, "c1"

    invoke-virtual {v2, v7, v6}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v7

    const-string v9, "c2"

    invoke-virtual {v2, v9, v6}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v9

    const-string v10, "c3"

    invoke-virtual {v2, v10, v6}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v10

    const-string v11, "c4"

    invoke-virtual {v2, v11, v6}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v6

    invoke-virtual {v5, v7, v9, v10, v6}, Lcom/brashmonkey/spriter/Curve$Constraints;->set(FFFF)V

    .line 203
    new-instance v11, Lcom/brashmonkey/spriter/Mainline$Key;

    const-string v5, "id"

    invoke-virtual {v2, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v6

    const-string v5, "time"

    invoke-virtual {v2, v5, v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v7

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    move-object v5, v11

    invoke-direct/range {v5 .. v10}, Lcom/brashmonkey/spriter/Mainline$Key;-><init>(IILcom/brashmonkey/spriter/Curve;II)V

    .line 205
    invoke-virtual {p2, v11}, Lcom/brashmonkey/spriter/Mainline;->addKey(Lcom/brashmonkey/spriter/Mainline$Key;)V

    .line 206
    invoke-virtual {p0, v3, v4, v11}, Lcom/brashmonkey/spriter/SCMLReader;->loadRefs(Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Mainline$Key;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected loadObjectInfos(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Entity;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Lcom/brashmonkey/spriter/Entity;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 132
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 133
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 134
    new-instance v3, Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "info"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "name"

    invoke-virtual {v2, v5, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "type"

    const-string v6, ""

    invoke-virtual {v2, v5, v6}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/brashmonkey/spriter/Entity$ObjectType;->getObjectInfoFor(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity$ObjectType;

    move-result-object v5

    new-instance v6, Lcom/brashmonkey/spriter/Dimension;

    const/4 v7, 0x0

    const-string v8, "w"

    invoke-virtual {v2, v8, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v8

    const-string v9, "h"

    invoke-virtual {v2, v9, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v7

    invoke-direct {v6, v8, v7}, Lcom/brashmonkey/spriter/Dimension;-><init>(FF)V

    invoke-direct {v3, v4, v5, v6}, Lcom/brashmonkey/spriter/Entity$ObjectInfo;-><init>(Ljava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectType;Lcom/brashmonkey/spriter/Dimension;)V

    .line 137
    invoke-virtual {p2, v3}, Lcom/brashmonkey/spriter/Entity;->addInfo(Lcom/brashmonkey/spriter/Entity$ObjectInfo;)V

    const-string v4, "frames"

    .line 138
    invoke-virtual {v2, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    const-string v4, "i"

    .line 140
    invoke-virtual {v2, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 141
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/brashmonkey/spriter/XmlReader$Element;

    const-string v5, "folder"

    .line 142
    invoke-virtual {v4, v5, v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v5

    const-string v6, "file"

    .line 143
    invoke-virtual {v4, v6, v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 144
    iget-object v6, v3, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->frames:Ljava/util/List;

    new-instance v7, Lcom/brashmonkey/spriter/FileReference;

    invoke-direct {v7, v5, v4}, Lcom/brashmonkey/spriter/FileReference;-><init>(II)V

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_2
    return-void
.end method

.method protected loadRefs(Ljava/util/ArrayList;Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Mainline$Key;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Lcom/brashmonkey/spriter/Mainline$Key;",
            ")V"
        }
    .end annotation

    .line 217
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, -0x1

    const-string v2, "parent"

    const-string v3, "key"

    const-string v4, "timeline"

    const-string v5, "id"

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 218
    new-instance v6, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    invoke-virtual {v0, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v0, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v1}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p3, v0}, Lcom/brashmonkey/spriter/Mainline$Key;->getBoneRef(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object v0

    invoke-direct {v6, v5, v4, v3, v0}, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;-><init>(IIILcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    .line 220
    invoke-virtual {p3, v6}, Lcom/brashmonkey/spriter/Mainline$Key;->addBoneRef(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    goto :goto_0

    .line 223
    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 224
    new-instance v0, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    invoke-virtual {p2, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {p2, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {p2, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {p2, v2, v1}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v6

    invoke-virtual {p3, v6}, Lcom/brashmonkey/spriter/Mainline$Key;->getBoneRef(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object v10

    const/4 v6, 0x0

    const-string v11, "z_index"

    invoke-virtual {p2, v11, v6}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v11

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;-><init>(IIILcom/brashmonkey/spriter/Mainline$Key$BoneRef;I)V

    .line 226
    invoke-virtual {p3, v0}, Lcom/brashmonkey/spriter/Mainline$Key;->addObjectRef(Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;)V

    goto :goto_1

    .line 228
    :cond_1
    iget-object p1, p3, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    invoke-static {p1}, Ljava/util/Arrays;->sort([Ljava/lang/Object;)V

    return-void
.end method

.method protected loadTimelineKeys(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Timeline;)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Lcom/brashmonkey/spriter/Timeline;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p2

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 257
    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    move-object/from16 v3, p1

    .line 258
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 259
    new-instance v5, Lcom/brashmonkey/spriter/Curve;

    invoke-direct {v5}, Lcom/brashmonkey/spriter/Curve;-><init>()V

    const-string v6, "curve_type"

    const-string v7, "linear"

    .line 260
    invoke-virtual {v4, v6, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/brashmonkey/spriter/Curve;->getType(Ljava/lang/String;)Lcom/brashmonkey/spriter/Curve$Type;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/brashmonkey/spriter/Curve;->setType(Lcom/brashmonkey/spriter/Curve$Type;)V

    .line 261
    iget-object v6, v5, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    const/4 v7, 0x0

    const-string v8, "c1"

    invoke-virtual {v4, v8, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v8

    const-string v9, "c2"

    invoke-virtual {v4, v9, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v9

    const-string v10, "c3"

    invoke-virtual {v4, v10, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v10

    const-string v11, "c4"

    invoke-virtual {v4, v11, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v11

    invoke-virtual {v6, v8, v9, v10, v11}, Lcom/brashmonkey/spriter/Curve$Constraints;->set(FFFF)V

    .line 262
    new-instance v6, Lcom/brashmonkey/spriter/Timeline$Key;

    const-string v8, "id"

    invoke-virtual {v4, v8}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v8

    const-string v9, "time"

    invoke-virtual {v4, v9, v1}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v9

    const/4 v10, 0x1

    const-string v11, "spin"

    invoke-virtual {v4, v11, v10}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v10

    invoke-direct {v6, v8, v9, v10, v5}, Lcom/brashmonkey/spriter/Timeline$Key;-><init>(IIILcom/brashmonkey/spriter/Curve;)V

    const-string v5, "bone"

    .line 263
    invoke-virtual {v4, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object v8

    const-string v9, "object"

    if-nez v8, :cond_0

    .line 264
    invoke-virtual {v4, v9}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildByName(Ljava/lang/String;)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object v8

    .line 266
    :cond_0
    new-instance v11, Lcom/brashmonkey/spriter/Point;

    const-string v4, "x"

    invoke-virtual {v8, v4, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v4

    const-string v10, "y"

    invoke-virtual {v8, v10, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v10

    invoke-direct {v11, v4, v10}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    .line 267
    new-instance v12, Lcom/brashmonkey/spriter/Point;

    const/high16 v4, 0x3f800000    # 1.0f

    const-string v10, "scale_x"

    invoke-virtual {v8, v10, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v10

    const-string v13, "scale_y"

    invoke-virtual {v8, v13, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v13

    invoke-direct {v12, v10, v13}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    .line 268
    new-instance v10, Lcom/brashmonkey/spriter/Point;

    const-string v13, "pivot_x"

    invoke-virtual {v8, v13, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v14

    iget-object v15, v0, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    iget-object v15, v15, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->type:Lcom/brashmonkey/spriter/Entity$ObjectType;

    sget-object v1, Lcom/brashmonkey/spriter/Entity$ObjectType;->Bone:Lcom/brashmonkey/spriter/Entity$ObjectType;

    if-ne v15, v1, :cond_1

    const/high16 v1, 0x3f000000    # 0.5f

    goto :goto_1

    :cond_1
    const/high16 v1, 0x3f800000    # 1.0f

    :goto_1
    const-string v15, "pivot_y"

    invoke-virtual {v8, v15, v1}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v1

    invoke-direct {v10, v14, v1}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    const-string v1, "angle"

    .line 269
    invoke-virtual {v8, v1, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v14

    .line 271
    invoke-virtual {v8}, Lcom/brashmonkey/spriter/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v7, -0x1

    if-eqz v1, :cond_2

    .line 272
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    iget-object v1, v1, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->type:Lcom/brashmonkey/spriter/Entity$ObjectType;

    sget-object v9, Lcom/brashmonkey/spriter/Entity$ObjectType;->Sprite:Lcom/brashmonkey/spriter/Entity$ObjectType;

    if-ne v1, v9, :cond_2

    const-string v1, "a"

    .line 273
    invoke-virtual {v8, v1, v4}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v1

    const-string v4, "folder"

    .line 274
    invoke-virtual {v8, v4, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v4

    const-string v9, "file"

    .line 275
    invoke-virtual {v8, v9, v7}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;I)I

    move-result v7

    move-object/from16 v9, p0

    .line 276
    iget-object v10, v9, Lcom/brashmonkey/spriter/SCMLReader;->data:Lcom/brashmonkey/spriter/Data;

    invoke-virtual {v10, v4}, Lcom/brashmonkey/spriter/Data;->getFolder(I)Lcom/brashmonkey/spriter/Folder;

    move-result-object v10

    invoke-virtual {v10, v7}, Lcom/brashmonkey/spriter/Folder;->getFile(I)Lcom/brashmonkey/spriter/File;

    move-result-object v10

    move/from16 v16, v1

    .line 277
    new-instance v1, Lcom/brashmonkey/spriter/Point;

    iget-object v3, v10, Lcom/brashmonkey/spriter/File;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-virtual {v8, v13, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v3

    iget-object v13, v10, Lcom/brashmonkey/spriter/File;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v13, v13, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {v8, v15, v13}, Lcom/brashmonkey/spriter/XmlReader$Element;->getFloat(Ljava/lang/String;F)F

    move-result v13

    invoke-direct {v1, v3, v13}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    .line 278
    iget-object v3, v0, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    iget-object v3, v3, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->size:Lcom/brashmonkey/spriter/Dimension;

    iget-object v10, v10, Lcom/brashmonkey/spriter/File;->size:Lcom/brashmonkey/spriter/Dimension;

    invoke-virtual {v3, v10}, Lcom/brashmonkey/spriter/Dimension;->set(Lcom/brashmonkey/spriter/Dimension;)V

    move-object v13, v1

    move/from16 v15, v16

    goto :goto_2

    :cond_2
    move-object/from16 v9, p0

    move-object v13, v10

    const/4 v4, -0x1

    const/high16 v15, 0x3f800000    # 1.0f

    .line 282
    :goto_2
    invoke-virtual {v8}, Lcom/brashmonkey/spriter/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    new-instance v3, Lcom/brashmonkey/spriter/FileReference;

    invoke-direct {v3, v4, v7}, Lcom/brashmonkey/spriter/FileReference;-><init>(II)V

    move-object v10, v1

    move-object/from16 v16, v3

    invoke-direct/range {v10 .. v16}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FFLcom/brashmonkey/spriter/FileReference;)V

    goto :goto_3

    .line 283
    :cond_3
    new-instance v1, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    new-instance v3, Lcom/brashmonkey/spriter/FileReference;

    invoke-direct {v3, v4, v7}, Lcom/brashmonkey/spriter/FileReference;-><init>(II)V

    move-object v10, v1

    move-object/from16 v16, v3

    invoke-direct/range {v10 .. v16}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FFLcom/brashmonkey/spriter/FileReference;)V

    .line 284
    :goto_3
    invoke-virtual {v6, v1}, Lcom/brashmonkey/spriter/Timeline$Key;->setObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    .line 285
    invoke-virtual {v0, v6}, Lcom/brashmonkey/spriter/Timeline;->addKey(Lcom/brashmonkey/spriter/Timeline$Key;)V

    add-int/lit8 v2, v2, 0x1

    const/4 v1, 0x0

    goto/16 :goto_0

    :cond_4
    move-object/from16 v9, p0

    return-void
.end method

.method protected loadTimelines(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Animation;Lcom/brashmonkey/spriter/Entity;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;",
            "Lcom/brashmonkey/spriter/Animation;",
            "Lcom/brashmonkey/spriter/Entity;",
            ")V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 238
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 239
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 240
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/brashmonkey/spriter/XmlReader$Element;

    const-string v3, "key"

    invoke-virtual {v2, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->getChildrenByName(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    const-string v3, "name"

    .line 241
    invoke-virtual {v1, v3}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "object_type"

    const-string v5, "sprite"

    .line 242
    invoke-virtual {v1, v4, v5}, Lcom/brashmonkey/spriter/XmlReader$Element;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/brashmonkey/spriter/Entity$ObjectType;->getObjectInfoFor(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity$ObjectType;

    move-result-object v4

    .line 243
    invoke-virtual {p3, v3}, Lcom/brashmonkey/spriter/Entity;->getInfo(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    move-result-object v5

    if-nez v5, :cond_0

    .line 244
    new-instance v5, Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    new-instance v6, Lcom/brashmonkey/spriter/Dimension;

    const/4 v7, 0x0

    invoke-direct {v6, v7, v7}, Lcom/brashmonkey/spriter/Dimension;-><init>(FF)V

    invoke-direct {v5, v3, v4, v6}, Lcom/brashmonkey/spriter/Entity$ObjectInfo;-><init>(Ljava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectType;Lcom/brashmonkey/spriter/Dimension;)V

    .line 245
    :cond_0
    new-instance v4, Lcom/brashmonkey/spriter/Timeline;

    const-string v6, "id"

    invoke-virtual {v1, v6}, Lcom/brashmonkey/spriter/XmlReader$Element;->getInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-direct {v4, v1, v3, v5, v6}, Lcom/brashmonkey/spriter/Timeline;-><init>(ILjava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectInfo;I)V

    .line 246
    invoke-virtual {p2, v4}, Lcom/brashmonkey/spriter/Animation;->addTimeline(Lcom/brashmonkey/spriter/Timeline;)V

    .line 247
    invoke-virtual {p0, v2, v4}, Lcom/brashmonkey/spriter/SCMLReader;->loadTimelineKeys(Ljava/util/ArrayList;Lcom/brashmonkey/spriter/Timeline;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
