# Explore: explore_3448
# Auto-generated LookML Explore File

include: "/views/domain_45/view_10345.view.lkml"
include: "/views/domain_47/view_10347.view.lkml"
include: "/views/domain_48/view_10348.view.lkml"
include: "/views/domain_49/view_10349.view.lkml"

explore: explore_3448 {
  label: "Explore Explore 3448"
  description: "Comprehensive analytics explore joining base view_10345 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10345
  
  always_filter: {
    filters: [view_10345.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10345.created_at_date: "7 days"]
    unless: [view_10345.id, view_10345.status]
  }

  join: view_10347 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10345.user_id} = ${view_10347.id} ;;
    required_joins: []
  }

  join: view_10348 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10345.account_id} = ${view_10348.account_id} ;;
    required_joins: [view_10347]
  }

  join: view_10349 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10345.category} = ${view_10349.category} ;;
  }

  access_filter: {
    field: view_10345.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10345.is_deleted} = false ;;
}
