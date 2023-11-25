import{inputFieldProperties as i,labelProperties as l,helperTextProperties as s,errorMessageProperties as m}from"./vaadin-text-field-0b3db014-4c055feb.js";import{k as t,R as e,O as a,X as p,Z as c}from"./indexhtml-6a469b1f.js";const n={tagName:"vaadin-multi-select-combo-box",displayName:"Multi-Select Combo Box",elements:[{selector:"vaadin-multi-select-combo-box::part(input-field)",displayName:"Input field",properties:i},{selector:"vaadin-multi-select-combo-box::part(toggle-button)",displayName:"Toggle button",properties:[t.iconColor,t.iconSize]},{selector:"vaadin-multi-select-combo-box::part(label)",displayName:"Label",properties:l},{selector:"vaadin-multi-select-combo-box::part(helper-text)",displayName:"Helper text",properties:s},{selector:"vaadin-multi-select-combo-box::part(error-message)",displayName:"Error message",properties:m},{selector:"vaadin-multi-select-combo-box-overlay::part(overlay)",displayName:"Overlay",properties:[e.backgroundColor,e.borderColor,e.borderWidth,e.borderRadius,e.padding]},{selector:"vaadin-multi-select-combo-box-overlay vaadin-multi-select-combo-box-item",displayName:"Overlay items",properties:[a.textColor,a.fontSize,a.fontWeight]},{selector:"vaadin-multi-select-combo-box-overlay vaadin-multi-select-combo-box-item::part(checkmark)::before",displayName:"Overlay item checkmark",properties:[t.iconColor,t.iconSize]},{selector:"vaadin-multi-select-combo-box vaadin-multi-select-combo-box-chip",displayName:"Chip",properties:[e.backgroundColor,e.borderColor,e.borderWidth,e.borderRadius,e.padding]},{selector:"vaadin-multi-select-combo-box vaadin-multi-select-combo-box-chip",displayName:"Chip label",properties:[a.textColor,a.fontSize,a.fontWeight]},{selector:"vaadin-multi-select-combo-box vaadin-multi-select-combo-box-chip::part(remove-button)",displayName:"Chip remove button",properties:[e.backgroundColor,e.borderColor,e.borderWidth,e.borderRadius,e.padding]},{selector:"vaadin-multi-select-combo-box vaadin-multi-select-combo-box-chip::part(remove-button)::before",displayName:"Chip remove button icon",properties:[t.iconColor,t.iconSize]}],async setupElement(o){o.overlayClass=o.getAttribute("class"),o.items=[{label:"Item",value:"value"}],o.value="value",o.opened=!0,await new Promise(r=>setTimeout(r,10))},async cleanupElement(o){o.opened=!1},openOverlay:p,hideOverlay:c};export{n as default};
