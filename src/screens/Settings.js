import { Grid, TextField } from "@material-ui/core";
import React, { Component } from "react";
import PageTitle from "../components/PageTitle";
import * as ActionType from "../store/Actions";

class Settings extends Component{

    state = {
        cordappDirectory: ""
    }

    dirty = {
        cordappDirectory: false
    }

    handleChange = (event, type) => {
        if(type === 'cordappDir'){
            this.setState({cordappDirectory: event.target.value});
            this.dirty.cordappDirectory = true;
        }
    }

    handleBlur = (type) => {
        if(type === 'cordappDir'){
            if(this.dirty.cordappDirectory){
                ActionType.updateSettings(this.state);
                this.dirty.cordappDirectory = false;
            }
        }
    }

    render() {
        return( 
            <React.Fragment>
                <PageTitle value="Settings" />
                <div style={{padding: "10px 20px"}}>
                    <Grid container spacing={2}>
                        <Grid item xs={6}>
                            <TextField label="Enter the path of your cordapps directory" fullWidth
                            onChange={event => this.handleChange(event, 'cordappDir')} 
                            onBlur={() => this.handleBlur('cordappDir')} />
                        </Grid>
                    </Grid>
                </div>
            </React.Fragment>
        );
    }
}

export default Settings;