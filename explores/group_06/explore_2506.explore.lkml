# Explore: explore_2506
# Auto-generated LookML Explore File

include: "/views/domain_19/view_07519.view.lkml"
include: "/views/domain_21/view_07521.view.lkml"
include: "/views/domain_22/view_07522.view.lkml"
include: "/views/domain_23/view_07523.view.lkml"

explore: explore_2506 {
  label: "Explore Explore 2506"
  description: "Comprehensive analytics explore joining base view_07519 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07519
  
  always_filter: {
    filters: [view_07519.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07519.created_at_date: "7 days"]
    unless: [view_07519.id, view_07519.status]
  }

  join: view_07521 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07519.user_id} = ${view_07521.id} ;;
    required_joins: []
  }

  join: view_07522 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07519.account_id} = ${view_07522.account_id} ;;
    required_joins: [view_07521]
  }

  join: view_07523 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07519.category} = ${view_07523.category} ;;
  }

  access_filter: {
    field: view_07519.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07519.is_deleted} = false ;;
}
