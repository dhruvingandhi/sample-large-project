# Explore: explore_0244
# Auto-generated LookML Explore File

include: "/views/domain_33/view_00733.view.lkml"
include: "/views/domain_35/view_00735.view.lkml"
include: "/views/domain_36/view_00736.view.lkml"
include: "/views/domain_37/view_00737.view.lkml"

explore: explore_0244 {
  label: "Explore Explore 0244"
  description: "Comprehensive analytics explore joining base view_00733 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00733
  
  always_filter: {
    filters: [view_00733.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00733.created_at_date: "7 days"]
    unless: [view_00733.id, view_00733.status]
  }

  join: view_00735 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00733.user_id} = ${view_00735.id} ;;
    required_joins: []
  }

  join: view_00736 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00733.account_id} = ${view_00736.account_id} ;;
    required_joins: [view_00735]
  }

  join: view_00737 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00733.category} = ${view_00737.category} ;;
  }

  access_filter: {
    field: view_00733.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00733.is_deleted} = false ;;
}
