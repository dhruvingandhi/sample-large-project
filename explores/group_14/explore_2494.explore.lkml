# Explore: explore_2494
# Auto-generated LookML Explore File

include: "/views/domain_33/view_07483.view.lkml"
include: "/views/domain_35/view_07485.view.lkml"
include: "/views/domain_36/view_07486.view.lkml"
include: "/views/domain_37/view_07487.view.lkml"

explore: explore_2494 {
  label: "Explore Explore 2494"
  description: "Comprehensive analytics explore joining base view_07483 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07483
  
  always_filter: {
    filters: [view_07483.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07483.created_at_date: "7 days"]
    unless: [view_07483.id, view_07483.status]
  }

  join: view_07485 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07483.user_id} = ${view_07485.id} ;;
    required_joins: []
  }

  join: view_07486 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07483.account_id} = ${view_07486.account_id} ;;
    required_joins: [view_07485]
  }

  join: view_07487 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07483.category} = ${view_07487.category} ;;
  }

  access_filter: {
    field: view_07483.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07483.is_deleted} = false ;;
}
