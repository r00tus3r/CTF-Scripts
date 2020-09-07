.class public final enum Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;
.super Ljava/lang/Enum;
.source "TiledMapTile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/maps/tiled/TiledMapTile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BlendMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

.field public static final enum ALPHA:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

.field public static final enum NONE:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 27
    new-instance v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    const/4 v1, 0x0

    const-string v2, "NONE"

    invoke-direct {v0, v2, v1}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->NONE:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    new-instance v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    const/4 v2, 0x1

    const-string v3, "ALPHA"

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->ALPHA:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    const/4 v0, 0x2

    .line 26
    new-array v0, v0, [Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    sget-object v3, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->NONE:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    aput-object v3, v0, v1

    sget-object v1, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->ALPHA:Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    aput-object v1, v0, v2

    sput-object v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->$VALUES:[Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;
    .locals 1

    .line 26
    const-class v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    return-object p0
.end method

.method public static values()[Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;
    .locals 1

    .line 26
    sget-object v0, Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->$VALUES:[Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    invoke-virtual {v0}, [Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/badlogic/gdx/maps/tiled/TiledMapTile$BlendMode;

    return-object v0
.end method
