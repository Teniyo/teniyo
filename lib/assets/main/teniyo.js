class Teniyo {
    static MouseEvent(props) {
        return React.createElement("div", {
            ...props,
            onMouseEnter: props.onEnter,
            onMouseLeave: props.onExit,
            onMouseMove: props.onHover,
            onClick: props.onClick,
            style: {
                width: "fit-content",
                height: "fit-content",
            },
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

    static Slider(props) {
        return React.createElement(MaterialUI.Slider, {
            ...props,
            step: props.step,
            disabled: props.disabled,
            defaultValue: props?.value,
            onChange: (e, value) => props.onChanged != null ? props.onChanged(value) : null,
            valueLabelDisplay: props.showLabel?"auto":"off",
            valueLabelFormat: (v)=>props.label,
            marks: props.markStep,
        });
    }

    static Switch(props){
        return React.createElement(MaterialUI.Switch, {
            ...props,
            defaultChecked: props.value,
            disabled: props.disabled,
            onChange: () => props.onChanged != null ? props.onChanged(!props.value) : null,
        });
    }

    static Snackbar(props){
        const [open, setOpen] = React.useState(true);

        return React.createElement(MaterialUI.Snackbar, {
            open: open,
            autoHideDuration: props.duration,
            message: props.content,
            onClose: () => {
                props.onClose != null ? props.onClose() : null;
                setOpen(false);
            },
            action: React.createElement(MaterialUI.IconButton,
                {
                    onClick: (event, reason)=>{
                        if (reason === 'clickaway') return;
                        setOpen(false);
                        props.onClick();
                    }
                },
                "OK"
            ),
        });
    }
}

window['Teniyo'] = Teniyo;