.class public Lcom/brashmonkey/spriter/Entity;
.super Ljava/lang/Object;
.source "Entity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/Entity$CharacterMap;,
        Lcom/brashmonkey/spriter/Entity$ObjectInfo;,
        Lcom/brashmonkey/spriter/Entity$ObjectType;
    }
.end annotation


# instance fields
.field private animationPointer:I

.field private final animations:[Lcom/brashmonkey/spriter/Animation;

.field private charMapPointer:I

.field private final characterMaps:[Lcom/brashmonkey/spriter/Entity$CharacterMap;

.field public final id:I

.field public final name:Ljava/lang/String;

.field private final namedAnimations:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/brashmonkey/spriter/Animation;",
            ">;"
        }
    .end annotation
.end field

.field private objInfoPointer:I

.field private final objectInfos:[Lcom/brashmonkey/spriter/Entity$ObjectInfo;


# direct methods
.method constructor <init>(ILjava/lang/String;III)V
    .locals 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/brashmonkey/spriter/Entity;->animationPointer:I

    .line 22
    iput v0, p0, Lcom/brashmonkey/spriter/Entity;->charMapPointer:I

    .line 24
    iput v0, p0, Lcom/brashmonkey/spriter/Entity;->objInfoPointer:I

    .line 27
    iput p1, p0, Lcom/brashmonkey/spriter/Entity;->id:I

    .line 28
    iput-object p2, p0, Lcom/brashmonkey/spriter/Entity;->name:Ljava/lang/String;

    .line 29
    new-array p1, p3, [Lcom/brashmonkey/spriter/Animation;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Entity;->animations:[Lcom/brashmonkey/spriter/Animation;

    .line 30
    new-array p1, p4, [Lcom/brashmonkey/spriter/Entity$CharacterMap;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Entity;->characterMaps:[Lcom/brashmonkey/spriter/Entity$CharacterMap;

    .line 31
    new-array p1, p5, [Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    iput-object p1, p0, Lcom/brashmonkey/spriter/Entity;->objectInfos:[Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    .line 32
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/brashmonkey/spriter/Entity;->namedAnimations:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method addAnimation(Lcom/brashmonkey/spriter/Animation;)V
    .locals 3

    .line 36
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->animations:[Lcom/brashmonkey/spriter/Animation;

    iget v1, p0, Lcom/brashmonkey/spriter/Entity;->animationPointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Entity;->animationPointer:I

    aput-object p1, v0, v1

    .line 37
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->namedAnimations:Ljava/util/HashMap;

    iget-object v1, p1, Lcom/brashmonkey/spriter/Animation;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method addCharacterMap(Lcom/brashmonkey/spriter/Entity$CharacterMap;)V
    .locals 3

    .line 102
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->characterMaps:[Lcom/brashmonkey/spriter/Entity$CharacterMap;

    iget v1, p0, Lcom/brashmonkey/spriter/Entity;->charMapPointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Entity;->charMapPointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method addInfo(Lcom/brashmonkey/spriter/Entity$ObjectInfo;)V
    .locals 3

    .line 106
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->objectInfos:[Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    iget v1, p0, Lcom/brashmonkey/spriter/Entity;->objInfoPointer:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/brashmonkey/spriter/Entity;->objInfoPointer:I

    aput-object p1, v0, v1

    return-void
.end method

.method public animations()I
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->animations:[Lcom/brashmonkey/spriter/Animation;

    array-length v0, v0

    return v0
.end method

.method public containsAnimation(Lcom/brashmonkey/spriter/Animation;)Z
    .locals 5

    .line 73
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->animations:[Lcom/brashmonkey/spriter/Animation;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    if-ne v4, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public getAnimation(I)Lcom/brashmonkey/spriter/Animation;
    .locals 1

    .line 47
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->animations:[Lcom/brashmonkey/spriter/Animation;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getAnimation(Ljava/lang/String;)Lcom/brashmonkey/spriter/Animation;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->namedAnimations:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/brashmonkey/spriter/Animation;

    return-object p1
.end method

.method public getAnimationWithMostTimelines()Lcom/brashmonkey/spriter/Animation;
    .locals 7

    const/4 v0, 0x0

    .line 83
    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Entity;->getAnimation(I)Lcom/brashmonkey/spriter/Animation;

    move-result-object v1

    .line 84
    iget-object v2, p0, Lcom/brashmonkey/spriter/Entity;->animations:[Lcom/brashmonkey/spriter/Animation;

    array-length v3, v2

    :goto_0
    if-ge v0, v3, :cond_1

    aget-object v4, v2, v0

    .line 85
    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Animation;->timelines()I

    move-result v5

    invoke-virtual {v4}, Lcom/brashmonkey/spriter/Animation;->timelines()I

    move-result v6

    if-ge v5, v6, :cond_0

    move-object v1, v4

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public getCharacterMap(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity$CharacterMap;
    .locals 5

    .line 96
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->characterMaps:[Lcom/brashmonkey/spriter/Entity$CharacterMap;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 97
    iget-object v4, v3, Lcom/brashmonkey/spriter/Entity$CharacterMap;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getInfo(I)Lcom/brashmonkey/spriter/Entity$ObjectInfo;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->objectInfos:[Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getInfo(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;
    .locals 5

    .line 125
    iget-object v0, p0, Lcom/brashmonkey/spriter/Entity;->objectInfos:[Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 126
    iget-object v4, v3, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getInfo(Ljava/lang/String;Lcom/brashmonkey/spriter/Entity$ObjectType;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;
    .locals 1

    .line 137
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Entity;->getInfo(Ljava/lang/String;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 138
    iget-object v0, p1, Lcom/brashmonkey/spriter/Entity$ObjectInfo;->type:Lcom/brashmonkey/spriter/Entity$ObjectType;

    if-ne v0, p2, :cond_0

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 9

    .line 227
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|[id: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/brashmonkey/spriter/Entity;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", name: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Entity;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 228
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "Object infos:\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 229
    iget-object v2, p0, Lcom/brashmonkey/spriter/Entity;->objectInfos:[Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    array-length v3, v2

    const/4 v4, 0x0

    move-object v5, v0

    const/4 v0, 0x0

    :goto_0
    const-string v6, "\n"

    if-ge v0, v3, :cond_0

    aget-object v7, v2, v0

    .line 230
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 231
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "Character maps:\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 232
    iget-object v2, p0, Lcom/brashmonkey/spriter/Entity;->characterMaps:[Lcom/brashmonkey/spriter/Entity$CharacterMap;

    array-length v3, v2

    move-object v5, v0

    const/4 v0, 0x0

    :goto_1
    if-ge v0, v3, :cond_1

    aget-object v7, v2, v0

    .line 233
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 234
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "Animations:\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 235
    iget-object v2, p0, Lcom/brashmonkey/spriter/Entity;->animations:[Lcom/brashmonkey/spriter/Animation;

    array-length v3, v2

    :goto_2
    if-ge v4, v3, :cond_2

    aget-object v5, v2, v4

    .line 236
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 237
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
