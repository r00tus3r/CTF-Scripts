.class public Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$AssetTextureProvider;
.super Ljava/lang/Object;
.source "TextureProvider.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AssetTextureProvider"
.end annotation


# instance fields
.field public final assetManager:Lcom/badlogic/gdx/assets/AssetManager;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/AssetManager;)V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$AssetTextureProvider;->assetManager:Lcom/badlogic/gdx/assets/AssetManager;

    return-void
.end method


# virtual methods
.method public load(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/Texture;
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$AssetTextureProvider;->assetManager:Lcom/badlogic/gdx/assets/AssetManager;

    const-class v1, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {v0, p1, v1}, Lcom/badlogic/gdx/assets/AssetManager;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/Texture;

    return-object p1
.end method
