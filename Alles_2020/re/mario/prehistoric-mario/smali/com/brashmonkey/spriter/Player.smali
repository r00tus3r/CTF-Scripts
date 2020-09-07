.class public Lcom/brashmonkey/spriter/Player;
.super Ljava/lang/Object;
.source "Player.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/Player$Attachment;,
        Lcom/brashmonkey/spriter/Player$PlayerListener;,
        Lcom/brashmonkey/spriter/Player$BoneIterator;,
        Lcom/brashmonkey/spriter/Player$ObjectIterator;
    }
.end annotation


# instance fields
.field private angle:F

.field animation:Lcom/brashmonkey/spriter/Animation;

.field public final attachments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/brashmonkey/spriter/Player$Attachment;",
            ">;"
        }
    .end annotation
.end field

.field private boneIterator:Lcom/brashmonkey/spriter/Player$BoneIterator;

.field public characterMaps:[Lcom/brashmonkey/spriter/Entity$CharacterMap;

.field public copyObjects:Z

.field private currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

.field private dirty:Z

.field protected entity:Lcom/brashmonkey/spriter/Entity;

.field private listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/brashmonkey/spriter/Player$PlayerListener;",
            ">;"
        }
    .end annotation
.end field

.field private final objToTimeline:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Object;",
            "Lcom/brashmonkey/spriter/Timeline$Key;",
            ">;"
        }
    .end annotation
.end field

.field private objectIterator:Lcom/brashmonkey/spriter/Player$ObjectIterator;

.field private final pivot:Lcom/brashmonkey/spriter/Point;

.field private final position:Lcom/brashmonkey/spriter/Point;

.field public final prevBBox:Lcom/brashmonkey/spriter/Box;

.field private prevKey:Lcom/brashmonkey/spriter/Mainline$Key;

.field private rect:Lcom/brashmonkey/spriter/Rectangle;

.field root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

.field public speed:I

.field private tempTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

.field private tempUnmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

.field time:I

.field tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

.field unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;


# direct methods
.method public constructor <init>(Lcom/brashmonkey/spriter/Entity;)V
    .locals 3

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->attachments:Ljava/util/List;

    .line 38
    new-instance v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    new-instance v1, Lcom/brashmonkey/spriter/Point;

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    invoke-direct {v0, v1}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;-><init>(Lcom/brashmonkey/spriter/Point;)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    .line 39
    new-instance v0, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v0, v2, v2}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->position:Lcom/brashmonkey/spriter/Point;

    new-instance v0, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v0, v2, v2}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->pivot:Lcom/brashmonkey/spriter/Point;

    .line 40
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->objToTimeline:Ljava/util/HashMap;

    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Player;->dirty:Z

    .line 49
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Player;->copyObjects:Z

    .line 56
    new-instance v0, Lcom/brashmonkey/spriter/Player$BoneIterator;

    invoke-direct {v0, p0}, Lcom/brashmonkey/spriter/Player$BoneIterator;-><init>(Lcom/brashmonkey/spriter/Player;)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->boneIterator:Lcom/brashmonkey/spriter/Player$BoneIterator;

    .line 57
    new-instance v0, Lcom/brashmonkey/spriter/Player$ObjectIterator;

    invoke-direct {v0, p0}, Lcom/brashmonkey/spriter/Player$ObjectIterator;-><init>(Lcom/brashmonkey/spriter/Player;)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->objectIterator:Lcom/brashmonkey/spriter/Player$ObjectIterator;

    const/16 v0, 0xf

    .line 58
    iput v0, p0, Lcom/brashmonkey/spriter/Player;->speed:I

    .line 59
    new-instance v0, Lcom/brashmonkey/spriter/Rectangle;

    invoke-direct {v0, v2, v2, v2, v2}, Lcom/brashmonkey/spriter/Rectangle;-><init>(FFFF)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->rect:Lcom/brashmonkey/spriter/Rectangle;

    .line 60
    new-instance v0, Lcom/brashmonkey/spriter/Box;

    invoke-direct {v0}, Lcom/brashmonkey/spriter/Box;-><init>()V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    .line 62
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->setEntity(Lcom/brashmonkey/spriter/Entity;)V

    return-void
.end method

.method private calcBoundingRectangle(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V
    .locals 9

    .line 652
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 653
    iget-object v5, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eq v5, p1, :cond_0

    if-eqz p1, :cond_0

    goto :goto_1

    .line 654
    :cond_0
    iget-object v5, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v6, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v5

    .line 655
    iget-object v6, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    iget-object v7, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v8, v4, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {v7, v8}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v7

    iget-object v7, v7, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    invoke-virtual {v6, v5, v7}, Lcom/brashmonkey/spriter/Box;->calcFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Entity$ObjectInfo;)V

    .line 656
    iget-object v5, p0, Lcom/brashmonkey/spriter/Player;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget-object v6, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    invoke-virtual {v6}, Lcom/brashmonkey/spriter/Box;->getBoundingRect()Lcom/brashmonkey/spriter/Rectangle;

    move-result-object v6

    iget-object v7, p0, Lcom/brashmonkey/spriter/Player;->rect:Lcom/brashmonkey/spriter/Rectangle;

    invoke-static {v5, v6, v7}, Lcom/brashmonkey/spriter/Rectangle;->setBiggerRectangle(Lcom/brashmonkey/spriter/Rectangle;Lcom/brashmonkey/spriter/Rectangle;Lcom/brashmonkey/spriter/Rectangle;)V

    .line 657
    invoke-direct {p0, v4}, Lcom/brashmonkey/spriter/Player;->calcBoundingRectangle(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 659
    :cond_1
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    array-length v1, v0

    :goto_2
    if-ge v2, v1, :cond_3

    aget-object v3, v0, v2

    .line 660
    iget-object v4, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eq v4, p1, :cond_2

    goto :goto_3

    .line 661
    :cond_2
    iget-object v4, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v5, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v4

    .line 662
    iget-object v5, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    iget-object v6, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v3, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    invoke-virtual {v6, v3}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v3

    iget-object v3, v3, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    invoke-virtual {v5, v4, v3}, Lcom/brashmonkey/spriter/Box;->calcFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Entity$ObjectInfo;)V

    .line 663
    iget-object v3, p0, Lcom/brashmonkey/spriter/Player;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget-object v4, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    invoke-virtual {v4}, Lcom/brashmonkey/spriter/Box;->getBoundingRect()Lcom/brashmonkey/spriter/Rectangle;

    move-result-object v4

    iget-object v5, p0, Lcom/brashmonkey/spriter/Player;->rect:Lcom/brashmonkey/spriter/Rectangle;

    invoke-static {v3, v4, v5}, Lcom/brashmonkey/spriter/Rectangle;->setBiggerRectangle(Lcom/brashmonkey/spriter/Rectangle;Lcom/brashmonkey/spriter/Rectangle;Lcom/brashmonkey/spriter/Rectangle;)V

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method

.method private copyObjects()V
    .locals 3

    const/4 v0, 0x0

    .line 99
    :goto_0
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v1, v1, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 100
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v2, v2, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v2, v2, v0

    iget-boolean v2, v2, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    iput-boolean v2, v1, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    .line 101
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v1, v1, v0

    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v2, v2, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v2, v2, v0

    iget-boolean v2, v2, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    iput-boolean v2, v1, Lcom/brashmonkey/spriter/Timeline$Key;->active:Z

    .line 102
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v1

    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v2, v2, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    .line 103
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v1

    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v2, v2, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private increaseTime()V
    .locals 3

    .line 108
    iget v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    iget v1, p0, Lcom/brashmonkey/spriter/Player;->speed:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    .line 109
    iget v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v1, v1, Lcom/brashmonkey/spriter/Animation;->length:I

    if-le v0, v1, :cond_0

    .line 110
    iget v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v1, v1, Lcom/brashmonkey/spriter/Animation;->length:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    .line 111
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player$PlayerListener;

    .line 112
    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    invoke-interface {v1, v2}, Lcom/brashmonkey/spriter/Player$PlayerListener;->animationFinished(Lcom/brashmonkey/spriter/Animation;)V

    goto :goto_0

    .line 114
    :cond_0
    iget v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    if-gez v0, :cond_2

    .line 115
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player$PlayerListener;

    .line 116
    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    invoke-interface {v1, v2}, Lcom/brashmonkey/spriter/Player$PlayerListener;->animationFinished(Lcom/brashmonkey/spriter/Animation;)V

    goto :goto_1

    .line 117
    :cond_1
    iget v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v1, v1, Lcom/brashmonkey/spriter/Animation;->length:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    :cond_2
    return-void
.end method

.method private updateRoot()V
    .locals 2

    .line 122
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget v1, p0, Lcom/brashmonkey/spriter/Player;->angle:F

    iput v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    .line 123
    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->set(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    .line 124
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, p0, Lcom/brashmonkey/spriter/Player;->angle:F

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->rotate(F)Lcom/brashmonkey/spriter/Point;

    .line 125
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, v1}, Lcom/brashmonkey/spriter/Point;->translate(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Point;

    const/4 v0, 0x0

    .line 126
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Player;->dirty:Z

    return-void
.end method


# virtual methods
.method public addListener(Lcom/brashmonkey/spriter/Player$PlayerListener;)V
    .locals 1

    .line 921
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public boneIterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Bone;",
            ">;"
        }
    .end annotation

    .line 937
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Player;->boneIterator(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public boneIterator(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;",
            ")",
            "Ljava/util/Iterator<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Bone;",
            ">;"
        }
    .end annotation

    .line 946
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->boneIterator:Lcom/brashmonkey/spriter/Player$BoneIterator;

    iget p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->id:I

    iput p1, v0, Lcom/brashmonkey/spriter/Player$BoneIterator;->index:I

    .line 947
    iget-object p1, p0, Lcom/brashmonkey/spriter/Player;->boneIterator:Lcom/brashmonkey/spriter/Player$BoneIterator;

    return-object p1
.end method

.method public collidesFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;FF)Z
    .locals 2

    .line 263
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObjectInfoFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    move-result-object v0

    .line 264
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    invoke-virtual {v1, p1, v0}, Lcom/brashmonkey/spriter/Box;->calcFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Entity$ObjectInfo;)V

    .line 265
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    invoke-virtual {v1, p1, v0, p2, p3}, Lcom/brashmonkey/spriter/Box;->collides(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Entity$ObjectInfo;FF)Z

    move-result p1

    return p1
.end method

.method public collidesFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Point;)Z
    .locals 1

    .line 276
    iget v0, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget p2, p2, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, p1, v0, p2}, Lcom/brashmonkey/spriter/Player;->collidesFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;FF)Z

    move-result p1

    return p1
.end method

.method public collidesFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Rectangle;)Z
    .locals 2

    .line 286
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObjectInfoFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    move-result-object v0

    .line 287
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    invoke-virtual {v1, p1, v0}, Lcom/brashmonkey/spriter/Box;->calcFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Entity$ObjectInfo;)V

    .line 288
    iget-object p1, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    invoke-virtual {p1, p2}, Lcom/brashmonkey/spriter/Box;->isInside(Lcom/brashmonkey/spriter/Rectangle;)Z

    move-result p1

    return p1
.end method

.method public flip(ZZ)Lcom/brashmonkey/spriter/Player;
    .locals 0

    if-eqz p1, :cond_0

    .line 735
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->flipX()Lcom/brashmonkey/spriter/Player;

    :cond_0
    if-eqz p2, :cond_1

    .line 736
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->flipY()Lcom/brashmonkey/spriter/Player;

    :cond_1
    return-object p0
.end method

.method public flipX()Lcom/brashmonkey/spriter/Player;
    .locals 3

    .line 745
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v0, Lcom/brashmonkey/spriter/Point;->x:F

    const/high16 v2, -0x40800000    # -1.0f

    mul-float v1, v1, v2

    iput v1, v0, Lcom/brashmonkey/spriter/Point;->x:F

    return-object p0
.end method

.method public flipY()Lcom/brashmonkey/spriter/Player;
    .locals 3

    .line 754
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v1, v0, Lcom/brashmonkey/spriter/Point;->y:F

    const/high16 v2, -0x40800000    # -1.0f

    mul-float v1, v1, v2

    iput v1, v0, Lcom/brashmonkey/spriter/Point;->y:F

    return-object p0
.end method

.method public flippedX()I
    .locals 1

    .line 763
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public flippedY()I
    .locals 1

    .line 771
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-static {v0}, Ljava/lang/Math;->signum(F)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public getAngle()F
    .locals 1

    .line 855
    iget v0, p0, Lcom/brashmonkey/spriter/Player;->angle:F

    return v0
.end method

.method public getAnimation()Lcom/brashmonkey/spriter/Animation;
    .locals 1

    .line 624
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    return-object v0
.end method

.method public getBone(I)Lcom/brashmonkey/spriter/Timeline$Key$Bone;
    .locals 2

    .line 135
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/brashmonkey/spriter/Mainline$Key;->getBoneRef(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object p1

    iget p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object p1, v0, p1

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object p1

    return-object p1
.end method

.method public getBone(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Bone;
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    invoke-virtual {v1, p1}, Lcom/brashmonkey/spriter/Animation;->getTimeline(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline;

    move-result-object p1

    iget p1, p1, Lcom/brashmonkey/spriter/Timeline;->id:I

    aget-object p1, v0, p1

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object p1

    return-object p1
.end method

.method public getBoneIndex(Ljava/lang/String;)I
    .locals 6

    .line 153
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 154
    iget-object v4, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v5, v3, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    invoke-virtual {v4, v5}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v4

    iget-object v4, v4, Lcom/brashmonkey/spriter/Timeline;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 155
    iget p1, v3, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->id:I

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public getBoneRef(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;
    .locals 2

    .line 177
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->objToTimeline:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/brashmonkey/spriter/Timeline$Key;

    iget p1, p1, Lcom/brashmonkey/spriter/Timeline$Key;->id:I

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Mainline$Key;->getBoneRefTimeline(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object p1

    return-object p1
.end method

.method public getBoudingRectangle(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Rectangle;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 648
    :cond_0
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getBoneRef(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object p1

    :goto_0
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getBoundingRectangle(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)Lcom/brashmonkey/spriter/Rectangle;

    move-result-object p1

    return-object p1
.end method

.method public getBoundingRectangle(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)Lcom/brashmonkey/spriter/Rectangle;
    .locals 5

    if-nez p1, :cond_0

    .line 634
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v1, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    .line 635
    :goto_0
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->rect:Lcom/brashmonkey/spriter/Rectangle;

    iget-object v2, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v2, v2, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v3, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v3, v3, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v4, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v4, v4, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/brashmonkey/spriter/Rectangle;->set(FFFF)V

    .line 636
    invoke-direct {p0, p1}, Lcom/brashmonkey/spriter/Player;->calcBoundingRectangle(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    .line 637
    iget-object p1, p0, Lcom/brashmonkey/spriter/Player;->rect:Lcom/brashmonkey/spriter/Rectangle;

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Rectangle;->calculateSize()V

    .line 638
    iget-object p1, p0, Lcom/brashmonkey/spriter/Player;->rect:Lcom/brashmonkey/spriter/Rectangle;

    return-object p1
.end method

.method public getBox(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Box;
    .locals 2

    .line 249
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObjectInfoFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    move-result-object v0

    .line 250
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    invoke-virtual {v1, p1, v0}, Lcom/brashmonkey/spriter/Box;->calcFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;Lcom/brashmonkey/spriter/Entity$ObjectInfo;)V

    .line 251
    iget-object p1, p0, Lcom/brashmonkey/spriter/Player;->prevBBox:Lcom/brashmonkey/spriter/Box;

    return-object p1
.end method

.method public getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;
    .locals 1

    .line 672
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    return-object v0
.end method

.method public getEntity()Lcom/brashmonkey/spriter/Entity;
    .locals 1

    .line 578
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->entity:Lcom/brashmonkey/spriter/Entity;

    return-object v0
.end method

.method public getKeyFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Timeline$Key;
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->objToTimeline:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/brashmonkey/spriter/Timeline$Key;

    return-object p1
.end method

.method public getNameFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Ljava/lang/String;
    .locals 2

    .line 220
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->objToTimeline:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/brashmonkey/spriter/Timeline$Key;

    iget p1, p1, Lcom/brashmonkey/spriter/Timeline$Key;->id:I

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object p1

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline;->name:Ljava/lang/String;

    return-object p1
.end method

.method public getObject(I)Lcom/brashmonkey/spriter/Timeline$Key$Object;
    .locals 2

    .line 144
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/brashmonkey/spriter/Mainline$Key;->getObjectRef(I)Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    move-result-object p1

    iget p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    aget-object p1, v0, p1

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object p1

    return-object p1
.end method

.method public getObject(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Object;
    .locals 2

    .line 200
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    invoke-virtual {v1, p1}, Lcom/brashmonkey/spriter/Animation;->getTimeline(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline;

    move-result-object p1

    iget p1, p1, Lcom/brashmonkey/spriter/Timeline;->id:I

    aget-object p1, v0, p1

    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object p1

    return-object p1
.end method

.method public getObjectIndex(Ljava/lang/String;)I
    .locals 6

    .line 186
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 187
    iget-object v4, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v5, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    invoke-virtual {v4, v5}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object v4

    iget-object v4, v4, Lcom/brashmonkey/spriter/Timeline;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 188
    iget p1, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->id:I

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public getObjectInfoFor(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)Lcom/brashmonkey/spriter/Entity$ObjectInfo;
    .locals 2

    .line 230
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->objToTimeline:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/brashmonkey/spriter/Timeline$Key;

    iget p1, p1, Lcom/brashmonkey/spriter/Timeline$Key;->id:I

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Animation;->getTimeline(I)Lcom/brashmonkey/spriter/Timeline;

    move-result-object p1

    iget-object p1, p1, Lcom/brashmonkey/spriter/Timeline;->objectInfo:Lcom/brashmonkey/spriter/Entity$ObjectInfo;

    return-object p1
.end method

.method public getObjectRef(Lcom/brashmonkey/spriter/Timeline$Key$Object;)Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;
    .locals 2

    .line 210
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->objToTimeline:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/brashmonkey/spriter/Timeline$Key;

    iget p1, p1, Lcom/brashmonkey/spriter/Timeline$Key;->id:I

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Mainline$Key;->getObjectRefTimeline(I)Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    move-result-object p1

    return-object p1
.end method

.method public getPivotX()F
    .locals 1

    .line 905
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    return v0
.end method

.method public getPivotY()F
    .locals 1

    .line 913
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->y:F

    return v0
.end method

.method public getScale()F
    .locals 1

    .line 725
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    return v0
.end method

.method public getTime()I
    .locals 1

    .line 681
    iget v0, p0, Lcom/brashmonkey/spriter/Player;->time:I

    return v0
.end method

.method public getX()F
    .locals 1

    .line 819
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 827
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->y:F

    return v0
.end method

.method public objectIterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Object;",
            ">;"
        }
    .end annotation

    .line 955
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Player;->objectIterator(Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public objectIterator(Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;)Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;",
            ")",
            "Ljava/util/Iterator<",
            "Lcom/brashmonkey/spriter/Timeline$Key$Object;",
            ">;"
        }
    .end annotation

    .line 964
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->objectIterator:Lcom/brashmonkey/spriter/Player$ObjectIterator;

    iget p1, p1, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->id:I

    iput p1, v0, Lcom/brashmonkey/spriter/Player$ObjectIterator;->index:I

    .line 965
    iget-object p1, p0, Lcom/brashmonkey/spriter/Player;->objectIterator:Lcom/brashmonkey/spriter/Player$ObjectIterator;

    return-object p1
.end method

.method public removeListener(Lcom/brashmonkey/spriter/Player$PlayerListener;)V
    .locals 1

    .line 929
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public rotate(F)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 847
    iget v0, p0, Lcom/brashmonkey/spriter/Player;->angle:F

    add-float/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->setAngle(F)Lcom/brashmonkey/spriter/Player;

    move-result-object p1

    return-object p1
.end method

.method public scale(F)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 716
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, p1, p1}, Lcom/brashmonkey/spriter/Point;->scale(FF)Lcom/brashmonkey/spriter/Point;

    return-object p0
.end method

.method public setAngle(F)Lcom/brashmonkey/spriter/Player;
    .locals 1

    const/4 v0, 0x1

    .line 836
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Player;->dirty:Z

    .line 837
    iput p1, p0, Lcom/brashmonkey/spriter/Player;->angle:F

    return-object p0
.end method

.method public setAnimation(I)V
    .locals 1

    .line 616
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->entity:Lcom/brashmonkey/spriter/Entity;

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Entity;->getAnimation(I)Lcom/brashmonkey/spriter/Animation;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->setAnimation(Lcom/brashmonkey/spriter/Animation;)V

    return-void
.end method

.method public setAnimation(Lcom/brashmonkey/spriter/Animation;)V
    .locals 3

    .line 587
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_5

    .line 590
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->entity:Lcom/brashmonkey/spriter/Entity;

    invoke-virtual {v1, p1}, Lcom/brashmonkey/spriter/Entity;->containsAnimation(Lcom/brashmonkey/spriter/Animation;)Z

    move-result v1

    if-nez v1, :cond_2

    iget v1, p1, Lcom/brashmonkey/spriter/Animation;->id:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "animation has to be in the same entity as the current set one!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 591
    :cond_2
    :goto_0
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    const/4 v2, 0x0

    if-eq p1, v1, :cond_3

    iput v2, p0, Lcom/brashmonkey/spriter/Player;->time:I

    .line 592
    :cond_3
    iput-object p1, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    .line 593
    iget v1, p0, Lcom/brashmonkey/spriter/Player;->time:I

    .line 594
    iput v2, p0, Lcom/brashmonkey/spriter/Player;->time:I

    .line 595
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->update()V

    .line 596
    iput v1, p0, Lcom/brashmonkey/spriter/Player;->time:I

    .line 597
    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/brashmonkey/spriter/Player$PlayerListener;

    .line 598
    invoke-interface {v2, v0, p1}, Lcom/brashmonkey/spriter/Player$PlayerListener;->animationChanged(Lcom/brashmonkey/spriter/Animation;Lcom/brashmonkey/spriter/Animation;)V

    goto :goto_1

    :cond_4
    return-void

    .line 589
    :cond_5
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "animation can not be null!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public setAnimation(Ljava/lang/String;)V
    .locals 1

    .line 607
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->entity:Lcom/brashmonkey/spriter/Entity;

    invoke-virtual {v0, p1}, Lcom/brashmonkey/spriter/Entity;->getAnimation(Ljava/lang/String;)Lcom/brashmonkey/spriter/Animation;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->setAnimation(Lcom/brashmonkey/spriter/Animation;)V

    return-void
.end method

.method public setBone(Ljava/lang/String;F)V
    .locals 2

    .line 376
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getBone(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    move-result-object v0

    .line 377
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, p1, v1, v0, p2}, Lcom/brashmonkey/spriter/Player;->setBone(Ljava/lang/String;FFF)V

    return-void
.end method

.method public setBone(Ljava/lang/String;FF)V
    .locals 1

    .line 355
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getBone(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    move-result-object v0

    .line 356
    iget v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/brashmonkey/spriter/Player;->setBone(Ljava/lang/String;FFF)V

    return-void
.end method

.method public setBone(Ljava/lang/String;FFF)V
    .locals 9

    .line 331
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getBone(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    move-result-object v0

    .line 332
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v7, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v8, v0, Lcom/brashmonkey/spriter/Point;->y:F

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v2 .. v8}, Lcom/brashmonkey/spriter/Player;->setBone(Ljava/lang/String;FFFFF)V

    return-void
.end method

.method public setBone(Ljava/lang/String;FFFFF)V
    .locals 9

    .line 302
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getBoneIndex(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 304
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/brashmonkey/spriter/Mainline$Key;->getBoneRef(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object p1

    .line 305
    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/Player;->getBone(I)Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    move-result-object v1

    const/4 v7, 0x0

    const/4 v8, 0x0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    .line 306
    invoke-virtual/range {v1 .. v8}, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->set(FFFFFFF)V

    .line 307
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->unmapObjects(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    return-void

    .line 303
    :cond_0
    new-instance p2, Lcom/brashmonkey/spriter/SpriterException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "No bone found of name \""

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\""

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public setBone(Ljava/lang/String;Lcom/brashmonkey/spriter/Point;)V
    .locals 1

    .line 366
    iget v0, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget p2, p2, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, p1, v0, p2}, Lcom/brashmonkey/spriter/Player;->setBone(Ljava/lang/String;FF)V

    return-void
.end method

.method public setBone(Ljava/lang/String;Lcom/brashmonkey/spriter/Point;F)V
    .locals 8

    .line 343
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getBone(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    move-result-object v0

    .line 344
    iget v3, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget v4, p2, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object p2, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v6, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object p2, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    iget v7, p2, Lcom/brashmonkey/spriter/Point;->y:F

    move-object v1, p0

    move-object v2, p1

    move v5, p3

    invoke-virtual/range {v1 .. v7}, Lcom/brashmonkey/spriter/Player;->setBone(Ljava/lang/String;FFFFF)V

    return-void
.end method

.method public setBone(Ljava/lang/String;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V
    .locals 7

    .line 319
    iget v2, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget v3, p2, Lcom/brashmonkey/spriter/Point;->y:F

    iget v5, p4, Lcom/brashmonkey/spriter/Point;->x:F

    iget v6, p4, Lcom/brashmonkey/spriter/Point;->y:F

    move-object v0, p0

    move-object v1, p1

    move v4, p3

    invoke-virtual/range {v0 .. v6}, Lcom/brashmonkey/spriter/Player;->setBone(Ljava/lang/String;FFFFF)V

    return-void
.end method

.method public setBone(Ljava/lang/String;Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V
    .locals 2

    .line 387
    iget-object v0, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->angle:F

    iget-object p2, p2, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/brashmonkey/spriter/Player;->setBone(Ljava/lang/String;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V

    return-void
.end method

.method public setEntity(Lcom/brashmonkey/spriter/Entity;)V
    .locals 8

    if-eqz p1, :cond_1

    .line 555
    iput-object p1, p0, Lcom/brashmonkey/spriter/Player;->entity:Lcom/brashmonkey/spriter/Entity;

    .line 556
    invoke-virtual {p1}, Lcom/brashmonkey/spriter/Entity;->getAnimationWithMostTimelines()Lcom/brashmonkey/spriter/Animation;

    move-result-object v0

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/Animation;->timelines()I

    move-result v0

    .line 557
    new-array v1, v0, [Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v1, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    .line 558
    new-array v1, v0, [Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v1, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 560
    new-instance v3, Lcom/brashmonkey/spriter/Timeline$Key;

    invoke-direct {v3, v2}, Lcom/brashmonkey/spriter/Timeline$Key;-><init>(I)V

    .line 561
    new-instance v4, Lcom/brashmonkey/spriter/Timeline$Key;

    invoke-direct {v4, v2}, Lcom/brashmonkey/spriter/Timeline$Key;-><init>(I)V

    .line 562
    new-instance v5, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    new-instance v6, Lcom/brashmonkey/spriter/Point;

    const/4 v7, 0x0

    invoke-direct {v6, v7, v7}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    invoke-direct {v5, v6}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;)V

    invoke-virtual {v3, v5}, Lcom/brashmonkey/spriter/Timeline$Key;->setObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    .line 563
    new-instance v5, Lcom/brashmonkey/spriter/Timeline$Key$Object;

    new-instance v6, Lcom/brashmonkey/spriter/Point;

    invoke-direct {v6, v7, v7}, Lcom/brashmonkey/spriter/Point;-><init>(FF)V

    invoke-direct {v5, v6}, Lcom/brashmonkey/spriter/Timeline$Key$Object;-><init>(Lcom/brashmonkey/spriter/Point;)V

    invoke-virtual {v4, v5}, Lcom/brashmonkey/spriter/Timeline$Key;->setObject(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    .line 564
    iget-object v5, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aput-object v3, v5, v2

    .line 565
    iget-object v3, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    aput-object v4, v3, v2

    .line 566
    iget-object v3, p0, Lcom/brashmonkey/spriter/Player;->objToTimeline:Ljava/util/HashMap;

    invoke-virtual {v4}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v5

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 568
    :cond_0
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->tempTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    .line 569
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->tempUnmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    .line 570
    invoke-virtual {p1, v1}, Lcom/brashmonkey/spriter/Entity;->getAnimation(I)Lcom/brashmonkey/spriter/Animation;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->setAnimation(Lcom/brashmonkey/spriter/Animation;)V

    return-void

    .line 554
    :cond_1
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "entity can not be null!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public setObject(Ljava/lang/String;F)V
    .locals 2

    .line 498
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObject(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    .line 499
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v1, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, p1, v1, v0, p2}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;FFF)V

    return-void
.end method

.method public setObject(Ljava/lang/String;FF)V
    .locals 1

    .line 477
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObject(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    .line 478
    iget v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->angle:F

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;FFF)V

    return-void
.end method

.method public setObject(Ljava/lang/String;FFF)V
    .locals 9

    .line 453
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObject(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    .line 454
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget v7, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget v8, v0, Lcom/brashmonkey/spriter/Point;->y:F

    move-object v2, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v2 .. v8}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;FFFFF)V

    return-void
.end method

.method public setObject(Ljava/lang/String;FFFFF)V
    .locals 14

    .line 440
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObject(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    .line 441
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v9, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v10, v1, Lcom/brashmonkey/spriter/Point;->y:F

    iget v11, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    iget v12, v1, Lcom/brashmonkey/spriter/FileReference;->folder:I

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    iget v13, v0, Lcom/brashmonkey/spriter/FileReference;->file:I

    move-object v2, p0

    move-object v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    invoke-virtual/range {v2 .. v13}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;FFFFFFFFII)V

    return-void
.end method

.method public setObject(Ljava/lang/String;FFFFFFFFII)V
    .locals 14

    move-object v0, p0

    .line 406
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObjectIndex(Ljava/lang/String;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 408
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/brashmonkey/spriter/Mainline$Key;->getObjectRef(I)Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    move-result-object v2

    .line 409
    invoke-virtual {p0, v1}, Lcom/brashmonkey/spriter/Player;->getObject(I)Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v3

    move/from16 v4, p2

    move/from16 v5, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    move/from16 v13, p11

    .line 410
    invoke-virtual/range {v3 .. v13}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(FFFFFFFFII)V

    .line 411
    invoke-virtual {p0, v2}, Lcom/brashmonkey/spriter/Player;->unmapObjects(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    return-void

    .line 407
    :cond_0
    new-instance v1, Lcom/brashmonkey/spriter/SpriterException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No object found for name \""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object v3, p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public setObject(Ljava/lang/String;FII)V
    .locals 14

    .line 511
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObject(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    .line 512
    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v4, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v5, v1, Lcom/brashmonkey/spriter/Point;->y:F

    iget v6, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->angle:F

    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget v7, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget v8, v1, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object v1, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v9, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v10, v0, Lcom/brashmonkey/spriter/Point;->y:F

    move-object v2, p0

    move-object v3, p1

    move/from16 v11, p2

    move/from16 v12, p3

    move/from16 v13, p4

    invoke-virtual/range {v2 .. v13}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;FFFFFFFFII)V

    return-void
.end method

.method public setObject(Ljava/lang/String;Lcom/brashmonkey/spriter/Point;)V
    .locals 1

    .line 488
    iget v0, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget p2, p2, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, p1, v0, p2}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;FF)V

    return-void
.end method

.method public setObject(Ljava/lang/String;Lcom/brashmonkey/spriter/Point;F)V
    .locals 8

    .line 465
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Player;->getObject(Ljava/lang/String;)Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v0

    .line 466
    iget v3, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget v4, p2, Lcom/brashmonkey/spriter/Point;->y:F

    iget-object p2, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget v6, p2, Lcom/brashmonkey/spriter/Point;->x:F

    iget-object p2, v0, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget v7, p2, Lcom/brashmonkey/spriter/Point;->y:F

    move-object v1, p0

    move-object v2, p1

    move v5, p3

    invoke-virtual/range {v1 .. v7}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;FFFFF)V

    return-void
.end method

.method public setObject(Ljava/lang/String;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/FileReference;)V
    .locals 12

    move-object v0, p2

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p7

    .line 426
    iget v4, v0, Lcom/brashmonkey/spriter/Point;->x:F

    iget v5, v0, Lcom/brashmonkey/spriter/Point;->y:F

    iget v6, v1, Lcom/brashmonkey/spriter/Point;->x:F

    iget v7, v1, Lcom/brashmonkey/spriter/Point;->y:F

    iget v8, v2, Lcom/brashmonkey/spriter/Point;->x:F

    iget v9, v2, Lcom/brashmonkey/spriter/Point;->y:F

    iget v10, v3, Lcom/brashmonkey/spriter/FileReference;->folder:I

    iget v11, v3, Lcom/brashmonkey/spriter/FileReference;->file:I

    move-object v0, p0

    move-object v1, p1

    move v2, v4

    move v3, v5

    move v4, p3

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move/from16 v9, p6

    invoke-virtual/range {v0 .. v11}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;FFFFFFFFII)V

    return-void
.end method

.method public setObject(Ljava/lang/String;Lcom/brashmonkey/spriter/Timeline$Key$Object;)V
    .locals 8

    .line 522
    iget-object v2, p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;->position:Lcom/brashmonkey/spriter/Point;

    iget v3, p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;->angle:F

    iget-object v4, p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;->scale:Lcom/brashmonkey/spriter/Point;

    iget-object v5, p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v6, p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;->alpha:F

    iget-object v7, p2, Lcom/brashmonkey/spriter/Timeline$Key$Object;->ref:Lcom/brashmonkey/spriter/FileReference;

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v7}, Lcom/brashmonkey/spriter/Player;->setObject(Ljava/lang/String;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/FileReference;)V

    return-void
.end method

.method public setPivot(FF)Lcom/brashmonkey/spriter/Player;
    .locals 1

    const/4 v0, 0x1

    .line 866
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Player;->dirty:Z

    .line 867
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->pivot:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, p1, p2}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    return-object p0
.end method

.method public setPivot(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 878
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Player;->setPivot(FF)Lcom/brashmonkey/spriter/Player;

    move-result-object p1

    return-object p1
.end method

.method public setPosition(FF)Lcom/brashmonkey/spriter/Player;
    .locals 1

    const/4 v0, 0x1

    .line 781
    iput-boolean v0, p0, Lcom/brashmonkey/spriter/Player;->dirty:Z

    .line 782
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->position:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {v0, p1, p2}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    return-object p0
.end method

.method public setPosition(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 792
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Player;->setPosition(FF)Lcom/brashmonkey/spriter/Player;

    move-result-object p1

    return-object p1
.end method

.method public setScale(F)Lcom/brashmonkey/spriter/Player;
    .locals 3

    .line 706
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Timeline$Key$Bone;->scale:Lcom/brashmonkey/spriter/Point;

    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->flippedX()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, p1

    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->flippedY()I

    move-result v2

    int-to-float v2, v2

    mul-float p1, p1, v2

    invoke-virtual {v0, v1, p1}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    return-object p0
.end method

.method public setTime(I)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 691
    iput p1, p0, Lcom/brashmonkey/spriter/Player;->time:I

    .line 692
    iget p1, p0, Lcom/brashmonkey/spriter/Player;->speed:I

    const/4 v0, 0x0

    .line 693
    iput v0, p0, Lcom/brashmonkey/spriter/Player;->speed:I

    .line 694
    invoke-direct {p0}, Lcom/brashmonkey/spriter/Player;->increaseTime()V

    .line 695
    iput p1, p0, Lcom/brashmonkey/spriter/Player;->speed:I

    return-object p0
.end method

.method public translate(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 811
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Player;->translatePosition(FF)Lcom/brashmonkey/spriter/Player;

    move-result-object p1

    return-object p1
.end method

.method public translatePivot(FF)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 888
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->pivot:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    add-float/2addr v0, p1

    iget-object p1, p0, Lcom/brashmonkey/spriter/Player;->pivot:Lcom/brashmonkey/spriter/Point;

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    add-float/2addr p1, p2

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Player;->setPivot(FF)Lcom/brashmonkey/spriter/Player;

    move-result-object p1

    return-object p1
.end method

.method public translatePivot(Lcom/brashmonkey/spriter/Point;)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 897
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Player;->translatePivot(FF)Lcom/brashmonkey/spriter/Player;

    move-result-object p1

    return-object p1
.end method

.method public translatePosition(FF)Lcom/brashmonkey/spriter/Player;
    .locals 1

    .line 802
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->position:Lcom/brashmonkey/spriter/Point;

    iget v0, v0, Lcom/brashmonkey/spriter/Point;->x:F

    add-float/2addr v0, p1

    iget-object p1, p0, Lcom/brashmonkey/spriter/Player;->position:Lcom/brashmonkey/spriter/Point;

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    add-float/2addr p1, p2

    invoke-virtual {p0, v0, p1}, Lcom/brashmonkey/spriter/Player;->setPosition(FF)Lcom/brashmonkey/spriter/Player;

    move-result-object p1

    return-object p1
.end method

.method public unmapObjects(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V
    .locals 8

    if-nez p1, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    .line 530
    :cond_0
    iget v0, p1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->id:I

    add-int/lit8 v0, v0, -0x1

    :goto_0
    add-int/lit8 v0, v0, 0x1

    .line 531
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v1

    iget-object v1, v1, Lcom/brashmonkey/spriter/Mainline$Key;->boneRefs:[Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 532
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/brashmonkey/spriter/Mainline$Key;->getBoneRef(I)Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    move-result-object v1

    .line 533
    iget-object v2, v1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eq v2, p1, :cond_1

    if-eqz p1, :cond_1

    goto :goto_2

    .line 534
    :cond_1
    iget-object v2, v1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget-object v3, v1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    iget v3, v3, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v2, v2, v3

    invoke-virtual {v2}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v2

    .line 535
    :goto_1
    iget-object v3, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v4, v1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v3

    iget-object v4, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v5, v1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    .line 536
    iget-object v3, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v4, v1, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v3, v3, v4

    invoke-virtual {v3}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->unmap(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    .line 537
    invoke-virtual {p0, v1}, Lcom/brashmonkey/spriter/Player;->unmapObjects(Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;)V

    :goto_2
    goto :goto_0

    .line 539
    :cond_3
    invoke-virtual {p0}, Lcom/brashmonkey/spriter/Player;->getCurrentKey()Lcom/brashmonkey/spriter/Mainline$Key;

    move-result-object v0

    iget-object v0, v0, Lcom/brashmonkey/spriter/Mainline$Key;->objectRefs:[Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_3
    if-ge v2, v1, :cond_6

    aget-object v3, v0, v2

    .line 540
    iget-object v4, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-eq v4, p1, :cond_4

    if-eqz p1, :cond_4

    goto :goto_5

    .line 541
    :cond_4
    iget-object v4, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    if-nez v4, :cond_5

    iget-object v4, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    goto :goto_4

    :cond_5
    iget-object v4, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget-object v5, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->parent:Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;

    iget v5, v5, Lcom/brashmonkey/spriter/Mainline$Key$BoneRef;->timeline:I

    aget-object v4, v4, v5

    invoke-virtual {v4}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v4

    .line 542
    :goto_4
    iget-object v5, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v6, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    aget-object v5, v5, v6

    invoke-virtual {v5}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v5

    iget-object v6, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v7, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    aget-object v6, v6, v7

    invoke-virtual {v6}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->set(Lcom/brashmonkey/spriter/Timeline$Key$Object;)V

    .line 543
    iget-object v5, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iget v3, v3, Lcom/brashmonkey/spriter/Mainline$Key$ObjectRef;->timeline:I

    aget-object v3, v5, v3

    invoke-virtual {v3}, Lcom/brashmonkey/spriter/Timeline$Key;->object()Lcom/brashmonkey/spriter/Timeline$Key$Object;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/brashmonkey/spriter/Timeline$Key$Object;->unmap(Lcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    :goto_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_6
    return-void
.end method

.method public update()V
    .locals 4

    .line 70
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player$PlayerListener;

    .line 71
    invoke-interface {v1, p0}, Lcom/brashmonkey/spriter/Player$PlayerListener;->preProcess(Lcom/brashmonkey/spriter/Player;)V

    goto :goto_0

    .line 72
    :cond_0
    iget-boolean v0, p0, Lcom/brashmonkey/spriter/Player;->dirty:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/brashmonkey/spriter/Player;->updateRoot()V

    .line 73
    :cond_1
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget v1, p0, Lcom/brashmonkey/spriter/Player;->time:I

    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->root:Lcom/brashmonkey/spriter/Timeline$Key$Bone;

    invoke-virtual {v0, v1, v2}, Lcom/brashmonkey/spriter/Animation;->update(ILcom/brashmonkey/spriter/Timeline$Key$Bone;)V

    .line 74
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Animation;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    .line 75
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->prevKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Player;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    if-eq v0, v1, :cond_3

    .line 76
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player$PlayerListener;

    .line 77
    iget-object v2, p0, Lcom/brashmonkey/spriter/Player;->prevKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iget-object v3, p0, Lcom/brashmonkey/spriter/Player;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    invoke-interface {v1, v2, v3}, Lcom/brashmonkey/spriter/Player$PlayerListener;->mainlineKeyChanged(Lcom/brashmonkey/spriter/Mainline$Key;Lcom/brashmonkey/spriter/Mainline$Key;)V

    goto :goto_1

    .line 78
    :cond_2
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->currentKey:Lcom/brashmonkey/spriter/Mainline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->prevKey:Lcom/brashmonkey/spriter/Mainline$Key;

    .line 80
    :cond_3
    iget-boolean v0, p0, Lcom/brashmonkey/spriter/Player;->copyObjects:Z

    if-eqz v0, :cond_4

    .line 81
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->tempTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    .line 82
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->tempUnmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    .line 83
    invoke-direct {p0}, Lcom/brashmonkey/spriter/Player;->copyObjects()V

    goto :goto_2

    .line 86
    :cond_4
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Animation;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->tweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    .line 87
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->animation:Lcom/brashmonkey/spriter/Animation;

    iget-object v0, v0, Lcom/brashmonkey/spriter/Animation;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    iput-object v0, p0, Lcom/brashmonkey/spriter/Player;->unmappedTweenedKeys:[Lcom/brashmonkey/spriter/Timeline$Key;

    .line 90
    :goto_2
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->attachments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player$Attachment;

    .line 91
    invoke-virtual {v1}, Lcom/brashmonkey/spriter/Player$Attachment;->update()V

    goto :goto_3

    .line 93
    :cond_5
    iget-object v0, p0, Lcom/brashmonkey/spriter/Player;->listeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/Player$PlayerListener;

    .line 94
    invoke-interface {v1, p0}, Lcom/brashmonkey/spriter/Player$PlayerListener;->postProcess(Lcom/brashmonkey/spriter/Player;)V

    goto :goto_4

    .line 95
    :cond_6
    invoke-direct {p0}, Lcom/brashmonkey/spriter/Player;->increaseTime()V

    return-void
.end method
