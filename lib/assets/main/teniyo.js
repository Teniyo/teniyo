class Teniyo {
    static MouseRegion(props) {
        return React.createElement("div", {
            ...props,
            onMouseEnter: props.onEnter,
            onMouseLeave: props.onExit,
            onMouseMove: props.onHover,
            onClick: props.onClick,
        },props?.children);
    }

    static Checkbox(props) {
        return React.createElement(MaterialUI.Checkbox, {
            ...props,
            checked: props.value,
            onChange: ()=> props.onChanged!=null?props.onChanged(!props.value):null,
        });
    }
}

window['Teniyo'] = Teniyo;