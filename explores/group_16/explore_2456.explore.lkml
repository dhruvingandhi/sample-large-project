# Explore: explore_2456
# Auto-generated LookML Explore File

include: "/views/domain_19/view_07369.view.lkml"
include: "/views/domain_21/view_07371.view.lkml"
include: "/views/domain_22/view_07372.view.lkml"
include: "/views/domain_23/view_07373.view.lkml"

explore: explore_2456 {
  label: "Explore Explore 2456"
  description: "Comprehensive analytics explore joining base view_07369 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07369
  
  always_filter: {
    filters: [view_07369.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07369.created_at_date: "7 days"]
    unless: [view_07369.id, view_07369.status]
  }

  join: view_07371 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07369.user_id} = ${view_07371.id} ;;
    required_joins: []
  }

  join: view_07372 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07369.account_id} = ${view_07372.account_id} ;;
    required_joins: [view_07371]
  }

  join: view_07373 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07369.category} = ${view_07373.category} ;;
  }

  access_filter: {
    field: view_07369.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07369.is_deleted} = false ;;
}
