# Explore: explore_0510
# Auto-generated LookML Explore File

include: "/views/domain_31/view_01531.view.lkml"
include: "/views/domain_33/view_01533.view.lkml"
include: "/views/domain_34/view_01534.view.lkml"
include: "/views/domain_35/view_01535.view.lkml"

explore: explore_0510 {
  label: "Explore Explore 0510"
  description: "Comprehensive analytics explore joining base view_01531 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01531
  
  always_filter: {
    filters: [view_01531.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01531.created_at_date: "7 days"]
    unless: [view_01531.id, view_01531.status]
  }

  join: view_01533 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01531.user_id} = ${view_01533.id} ;;
    required_joins: []
  }

  join: view_01534 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01531.account_id} = ${view_01534.account_id} ;;
    required_joins: [view_01533]
  }

  join: view_01535 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01531.category} = ${view_01535.category} ;;
  }

  access_filter: {
    field: view_01531.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01531.is_deleted} = false ;;
}
