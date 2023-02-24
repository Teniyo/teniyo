class Teniyo {
    static MouseRegion(props) {
        var elm = React.createElement("div", {
            onMouseEnter: () => props?.onEnter(),
            onMouseLeave: () => props?.onExit(),
            onMouseMove: () => props?.onHover(),
            onClick: () => props?.onClick(),
            id: props?.id,
        },props?.children);
        return elm
    }
}

window['Teniyo'] = Teniyo;