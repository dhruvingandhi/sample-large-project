# Explore: explore_2762
# Auto-generated LookML Explore File

include: "/views/domain_37/view_08287.view.lkml"
include: "/views/domain_39/view_08289.view.lkml"
include: "/views/domain_40/view_08290.view.lkml"
include: "/views/domain_41/view_08291.view.lkml"

explore: explore_2762 {
  label: "Explore Explore 2762"
  description: "Comprehensive analytics explore joining base view_08287 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08287
  
  always_filter: {
    filters: [view_08287.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08287.created_at_date: "7 days"]
    unless: [view_08287.id, view_08287.status]
  }

  join: view_08289 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08287.user_id} = ${view_08289.id} ;;
    required_joins: []
  }

  join: view_08290 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08287.account_id} = ${view_08290.account_id} ;;
    required_joins: [view_08289]
  }

  join: view_08291 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08287.category} = ${view_08291.category} ;;
  }

  access_filter: {
    field: view_08287.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08287.is_deleted} = false ;;
}
