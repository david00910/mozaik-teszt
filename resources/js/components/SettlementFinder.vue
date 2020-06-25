<template>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="alert alert-success" v-if="success" role="alert">
                        {{success}}
                    </div>
                    <div class="alert alert-danger" v-if="error" role="alert">
                        {{error}}
                    </div>

                    <h5 class="card-header bg-mozaik text-center text-light">Településkezelő</h5>

                    <div class="card-body">

                        <div class="form-group">
                            <span><strong class="mr-2">Megye:</strong></span>
                            <select @change="fetchSettlementsForCounty()" v-model="selectedCounty">
                                <option disabled value="">Válasszon</option>
                                <option v-for="county in counties" v-bind:value="county.id">
                                    {{ county.cName }}
                                </option>
                            </select>
                        </div>

                        <hr v-if="selectedCounty">

                        <div v-if="loader" class="loader"></div>

                        <strong v-if="selectedCounty">Települések</strong>

                        <ul v-if="selectedCounty" class="list-group list-group-flush">
                            <li v-if="editing === settlement.id" v-for="settlement in settlements"
                                :key="settlement.id"
                                class="list-group-item settlements">
                                <input type="text" class="form-control" v-model="settlement.sName">
                                <input type="number" class="form-control" v-model="settlement.pCode">
                                <button v-if="selected === settlement.id" @click="saveSettlement(settlement)"
                                        class="mt-4 btn-sm btn-outline-success">Módosít
                                </button>
                                <button v-if="selected === settlement.id" @click="confirmDelete = settlement.id"
                                        class="btn-sm btn-outline-danger">Törlés
                                </button>
                                <button v-if="selected === settlement.id" @click="resetItem()"
                                        class="btn-sm btn-outline-secondary">Vissza
                                </button>

                                <div class="confirmDelete" v-if="confirmDelete === settlement.id">
                                    <hr>
                                    <button @click="deleteSettlement(settlement)" class="btn-sm btn-outline-danger">Megerősít</button>
                                    <button @click="confirmDelete = false" class="btn-sm btn-outline-secondary">Mégse
                                    </button>
                                </div>
                            </li>
                            <li v-if="!editing" v-for="settlement in settlements" @click="editSettlement(settlement)"
                                :key="settlement.id"
                                class="list-group-item settlements">
                                {{settlement.sName}} {{settlement.pCode}}
                            </li>



                            <li class="list-group-item" v-if="nameActiveInput">
                                <input type="text" v-bind:class="isEmpty ? 'alert-danger' : ''"
                                       v-model="newSettlement.name" required class="form-control"
                                       placeholder="Új település neve" aria-label="newSettlement"
                                       aria-describedby="newSettlement">
                                <input type="number" v-bind:class="isEmpty ? 'alert-danger' : ''"
                                       v-model="newSettlement.pCode" required class="form-control"
                                       placeholder="Új település irányítószáma" aria-label="newSettlement"
                                       aria-describedby="newSettlement">
                                <div class="form-group mt-1">
                                    <button @click="addSettlement" class="btn-sm btn-success">Hozzáadás</button>
                                    <button @click="nameActiveInput = false" class="btn-sm btn-secondary">Mégse</button>
                                </div>
                            </li>

                            <li class="list-group-item">
                                <button type="button" @click="nameActiveInput = true" class="btn btn-link">+ Új
                                    település
                                    hozzáadása..
                                </button>
                            </li>

                        </ul>

                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data: function () {
            return {
                counties: '',
                selectedCounty: '',
                settlements: [],
                nameActiveInput: false,
                newSettlement: {
                    name: null,
                    pCode: null,
                },
                loader: false,
                isEmpty: false,
                hasError: false,
                success: '',
                error: '',
                activeEdit: false,
                selected: undefined,
                confirmDelete: false,
                editing: false,
                editedSettlementName: '',
                editedSettlementpCode: '',
            }
        },
        mounted() {
            //console.log('Component mounted.')
        },
        created() {
            this.fetchCounties()
        },
        methods: {
            fetchCounties() {
                this.loading = true;
                axios.get('counties')
                    .then(res => {
                        //console.log(res.data);
                        this.counties = res.data;
                        this.loading = false;
                    }).catch(error => {
                    //console.log(error.res.data);
                    this.error = error.res.data;
                    this.loading = false;
                });
            },

            fetchSettlementsForCounty() {
                this.loading = true;
                axios.get('settlements/' + this.selectedCounty)
                    .then(res => {
                        //console.log(res.data);
                        this.settlements = res.data;
                        this.loading = false;
                    }).catch(error => {
                    //console.log(error.res.data);
                    this.error = error.res.data;
                    this.loading = false;
                });
            },

            addSettlement() {
                this.loading = true;
                this.error = false;
                this.success = false;
                this.isEmpty = false;
                if (this.newSettlement.pCode && this.newSettlement.name) {
                    axios.post('addSettlement', {
                        countyId: this.selectedCounty,
                        newSettlementName: this.newSettlement.name,
                        newSettlementpCode: this.newSettlement.pCode
                    })
                        .then(res => {
                            //console.log(res.data);
                            this.success = res.data.status;
                            this.loading = false;
                            this.fetchSettlementsForCounty();
                            this.newSettlement = {name: null, pCode: null};
                            this.nameActiveInput = false;
                            let vm = this;
                            setTimeout(function () {
                                vm.success = false;
                                vm.error = false;
                            }, 5000)
                        }).catch(error => {
                        //console.log(error.msg.msg);
                        this.error = error.msg.msg;
                        this.loading = false;
                    });
                } else {
                    this.error = 'A mezők kitöltése kötelező!';
                    this.isEmpty = true;
                }

            },
            editSettlement: function (settlement) {
                this.editing = settlement.id;
                this.selected = settlement.id;

                //console.log(this.selected);
            },
            resetItem: function () {
                self = this;
                setTimeout(function() {self.selected = undefined; self.editing = false;}, 100);
            },
            saveSettlement(settlement) {
                this.editedSettlementName = settlement.sName;
                this.editedSettlementpCode = settlement.pCode;
                //console.log(this.editedSettlementName);
                if (this.editedSettlementName && this.editedSettlementpCode) {
                    axios.post('editSettlement/' + settlement.id, {
                        countyId: this.selectedCounty,
                        editedSettlementName: this.editedSettlementName,
                        editedSettlementpCode: this.editedSettlementpCode
                    })
                        .then(res => {
                            //console.log(res.data);
                            this.success = res.data.status;
                            this.loading = false;
                            this.fetchSettlementsForCounty();
                            this.newSettlement = '';
                            this.nameActiveInput = false;
                            let vm = this;
                            setTimeout(function () {
                                vm.success = false;
                                vm.error = false;
                            }, 5000)
                        }).catch(error => {
                        //console.log(error.msg.msg);
                        this.error = error.msg.msg;
                        this.loading = false;
                    });
                } else {
                    this.error = 'A mezők kitöltése kötelező!';
                }
            },

            deleteSettlement: function(settlement) {
                axios.delete('deleteSettlement/' + settlement.id)
                    .then(res => {
                        //console.log(res.data);
                        this.success = res.data.msg;
                        this.loading = false;
                        this.fetchSettlementsForCounty();
                        this.newSettlement = '';
                        this.nameActiveInput = false;
                        this.selected = undefined;
                        this.editing = false;
                        let vm = this;
                        setTimeout(function () {
                            vm.success = false;
                            vm.error = false;
                        }, 5000)
                    }).catch(error => {
                    //console.log(error.msg.msg);
                    this.error = error.msg.msg;
                    this.loading = false;
                });
            }
        }

    }
</script>
