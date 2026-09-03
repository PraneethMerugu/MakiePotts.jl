# [MakiePotts API](@id makiepotts-api)

MakiePotts converts explicit saved host observations into render frames and
ordinary Makie recipes. It never advances a simulation, mutates state,
implicitly synchronizes a device, or reconstructs an unsaved channel.

| Task | Primary names |
|:--|:--|
| Materialize frames | `RenderRequest`, `renderframe`, `renderframes`, `PottsRenderFrame` |
| Select geometry | `FullDomain`, `OrthogonalSlice` |
| Represent retained channels | `RenderChannel`, `SiteChannelKey`, `CellChannelKey`, `MediumChannelKey` |
| Extend source-specific channel materialization | `CellPropertyRequest`, `materialize_channel` |
| Encode | `CellTypeEncoding`, `CellIdentityEncoding`, `ChannelEncoding` |
| Plot | `pottsplot`, `pottsplot!`, `pottsboundaries!`, `pottsvolume!`, `potts_legend` |
| Record | `record_potts` |

The stable boundary is the immutable render frame, not a CorePotts runtime
object. `PottsExplorer`, `explore_potts`, `RerunController`, `reexecute!`, and
the rerun-state accessors are exported experimental interfaces: they may change
within the pre-1.0 series and are not covered by the stable render-frame
contract.

The native `PottsSavedState` adapter materializes ownership and cell metadata
only. It rejects nonempty channel requests because a saved state does not carry
arbitrary retained observations. `materialize_channel` is the open protocol for
a source integration that owns such data; it is not an implicit reconstruction
mechanism for native saved states.

```@example makie_boundary
using MakiePotts
required = (
    :PottsRenderFrame,
    :RenderRequest,
    :renderframe,
    :CellTypeEncoding,
    :pottsplot,
)
all(name -> isdefined(MakiePotts, name), required)
```

## Reference

```@autodocs
Modules = [MakiePotts]
Private = false
```
