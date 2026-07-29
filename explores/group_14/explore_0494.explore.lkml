# Explore: explore_0494
# Auto-generated LookML Explore File

include: "/views/domain_33/view_01483.view.lkml"
include: "/views/domain_35/view_01485.view.lkml"
include: "/views/domain_36/view_01486.view.lkml"
include: "/views/domain_37/view_01487.view.lkml"

explore: explore_0494 {
  label: "Explore Explore 0494"
  description: "Comprehensive analytics explore joining base view_01483 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01483
  
  always_filter: {
    filters: [view_01483.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01483.created_at_date: "7 days"]
    unless: [view_01483.id, view_01483.status]
  }

  join: view_01485 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01483.user_id} = ${view_01485.id} ;;
    required_joins: []
  }

  join: view_01486 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01483.account_id} = ${view_01486.account_id} ;;
    required_joins: [view_01485]
  }

  join: view_01487 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01483.category} = ${view_01487.category} ;;
  }

  access_filter: {
    field: view_01483.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01483.is_deleted} = false ;;
}
