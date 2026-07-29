# Explore: explore_3494
# Auto-generated LookML Explore File

include: "/views/domain_33/view_10483.view.lkml"
include: "/views/domain_35/view_10485.view.lkml"
include: "/views/domain_36/view_10486.view.lkml"
include: "/views/domain_37/view_10487.view.lkml"

explore: explore_3494 {
  label: "Explore Explore 3494"
  description: "Comprehensive analytics explore joining base view_10483 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10483
  
  always_filter: {
    filters: [view_10483.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10483.created_at_date: "7 days"]
    unless: [view_10483.id, view_10483.status]
  }

  join: view_10485 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10483.user_id} = ${view_10485.id} ;;
    required_joins: []
  }

  join: view_10486 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10483.account_id} = ${view_10486.account_id} ;;
    required_joins: [view_10485]
  }

  join: view_10487 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10483.category} = ${view_10487.category} ;;
  }

  access_filter: {
    field: view_10483.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10483.is_deleted} = false ;;
}
