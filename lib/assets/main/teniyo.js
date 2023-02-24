class Teniyo {
    static MouseRegion(props) {
        return React.createElement("div", {
            ...props,
            onMouseEnter: props.onEnter,
            onMouseLeave: props.onExit,
            onMouseMove: props.onHover,
            onClick: props.onClick,
        }, props?.children);
    }

    static Checkbox(props) {
        return React.createElement(MaterialUI.Checkbox, {
            ...props,
            checked: props.value,
            onChange: () => props.onChanged != null ? props.onChanged(!props.value) : null,
        });
    }

    static Radio(props) {
        return React.createElement(MaterialUI.Radio, {
            ...props,
            onClick: () => props.onChanged != null ? props.onChanged(!props.value) : null,
            checked: props.value,
        });
    }

    static DropDownButtons(props) {
        return React.createElement(MaterialUI.FormControl, {
            variant: "filled",
            fullWidth: props.fullWidth,
        },
            React.createElement(MaterialUI.InputLabel, {}, props?.label),
            React.createElement(MaterialUI.Select, {
                ...props,
                onChange: (e) => props.onChanged != null ? props.onChanged(e.target.value) : null,
            }, ...props?.children),
        );
    }
}

window['Teniyo'] = Teniyo;