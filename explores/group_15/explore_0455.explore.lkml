# Explore: explore_0455
# Auto-generated LookML Explore File

include: "/views/domain_16/view_01366.view.lkml"
include: "/views/domain_18/view_01368.view.lkml"
include: "/views/domain_19/view_01369.view.lkml"
include: "/views/domain_20/view_01370.view.lkml"

explore: explore_0455 {
  label: "Explore Explore 0455"
  description: "Comprehensive analytics explore joining base view_01366 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01366
  
  always_filter: {
    filters: [view_01366.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01366.created_at_date: "7 days"]
    unless: [view_01366.id, view_01366.status]
  }

  join: view_01368 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01366.user_id} = ${view_01368.id} ;;
    required_joins: []
  }

  join: view_01369 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01366.account_id} = ${view_01369.account_id} ;;
    required_joins: [view_01368]
  }

  join: view_01370 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01366.category} = ${view_01370.category} ;;
  }

  access_filter: {
    field: view_01366.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01366.is_deleted} = false ;;
}
