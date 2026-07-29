# Explore: explore_0377
# Auto-generated LookML Explore File

include: "/views/domain_32/view_01132.view.lkml"
include: "/views/domain_34/view_01134.view.lkml"
include: "/views/domain_35/view_01135.view.lkml"
include: "/views/domain_36/view_01136.view.lkml"

explore: explore_0377 {
  label: "Explore Explore 0377"
  description: "Comprehensive analytics explore joining base view_01132 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01132
  
  always_filter: {
    filters: [view_01132.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01132.created_at_date: "7 days"]
    unless: [view_01132.id, view_01132.status]
  }

  join: view_01134 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01132.user_id} = ${view_01134.id} ;;
    required_joins: []
  }

  join: view_01135 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01132.account_id} = ${view_01135.account_id} ;;
    required_joins: [view_01134]
  }

  join: view_01136 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01132.category} = ${view_01136.category} ;;
  }

  access_filter: {
    field: view_01132.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01132.is_deleted} = false ;;
}
