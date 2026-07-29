# Explore: explore_3455
# Auto-generated LookML Explore File

include: "/views/domain_16/view_10366.view.lkml"
include: "/views/domain_18/view_10368.view.lkml"
include: "/views/domain_19/view_10369.view.lkml"
include: "/views/domain_20/view_10370.view.lkml"

explore: explore_3455 {
  label: "Explore Explore 3455"
  description: "Comprehensive analytics explore joining base view_10366 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10366
  
  always_filter: {
    filters: [view_10366.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10366.created_at_date: "7 days"]
    unless: [view_10366.id, view_10366.status]
  }

  join: view_10368 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10366.user_id} = ${view_10368.id} ;;
    required_joins: []
  }

  join: view_10369 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10366.account_id} = ${view_10369.account_id} ;;
    required_joins: [view_10368]
  }

  join: view_10370 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10366.category} = ${view_10370.category} ;;
  }

  access_filter: {
    field: view_10366.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10366.is_deleted} = false ;;
}
