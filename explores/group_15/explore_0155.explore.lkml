# Explore: explore_0155
# Auto-generated LookML Explore File

include: "/views/domain_16/view_00466.view.lkml"
include: "/views/domain_18/view_00468.view.lkml"
include: "/views/domain_19/view_00469.view.lkml"
include: "/views/domain_20/view_00470.view.lkml"

explore: explore_0155 {
  label: "Explore Explore 0155"
  description: "Comprehensive analytics explore joining base view_00466 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00466
  
  always_filter: {
    filters: [view_00466.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00466.created_at_date: "7 days"]
    unless: [view_00466.id, view_00466.status]
  }

  join: view_00468 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00466.user_id} = ${view_00468.id} ;;
    required_joins: []
  }

  join: view_00469 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00466.account_id} = ${view_00469.account_id} ;;
    required_joins: [view_00468]
  }

  join: view_00470 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00466.category} = ${view_00470.category} ;;
  }

  access_filter: {
    field: view_00466.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00466.is_deleted} = false ;;
}
