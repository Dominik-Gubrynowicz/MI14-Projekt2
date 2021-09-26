
const getClubs = async () => {
    try {
        const clubs = await fetch('./get-clubs.php')
            .then( res => res.json() );

        clubs.map((club) => {

            let players = '';
            club.pilkarze.map( pilkarz => players += `<li>${pilkarz}</li>` )

            document.querySelector('#root').innerHTML += `
                <div class="card square mb-4">
                    <div class="card-header">
                        <h4 class="my-0 font-weight-normal">${club.nazwa}</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title">${club.trener} <br><small class="text-muted"> Lista zwodników</small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            ${players}
                        </ul>
                        <button type="button" class="btn btn-lg btn-block btn-outline-primary">Kup bilet na mecz</button>
                    </div>
                </div>
            `
        });

    } catch (e) {
        console.error(e);
        document.querySelector('#root').innerHTML = `
            <div class="card square mb-4">
                <div class="card-header">
                    <h4 class="my-0 font-weight-normal">Error!</h4>
                </div>
                <div class="card-body">
                    <p>${e}</p>
                </div>
            </div>
        `
    }
}

getClubs();
