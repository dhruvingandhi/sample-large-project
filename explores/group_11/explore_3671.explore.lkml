# Explore: explore_3671
# Auto-generated LookML Explore File

include: "/views/domain_14/view_11014.view.lkml"
include: "/views/domain_16/view_11016.view.lkml"
include: "/views/domain_17/view_11017.view.lkml"
include: "/views/domain_18/view_11018.view.lkml"

explore: explore_3671 {
  label: "Explore Explore 3671"
  description: "Comprehensive analytics explore joining base view_11014 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11014
  
  always_filter: {
    filters: [view_11014.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11014.created_at_date: "7 days"]
    unless: [view_11014.id, view_11014.status]
  }

  join: view_11016 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11014.user_id} = ${view_11016.id} ;;
    required_joins: []
  }

  join: view_11017 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11014.account_id} = ${view_11017.account_id} ;;
    required_joins: [view_11016]
  }

  join: view_11018 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11014.category} = ${view_11018.category} ;;
  }

  access_filter: {
    field: view_11014.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11014.is_deleted} = false ;;
}
