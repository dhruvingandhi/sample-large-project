# Explore: explore_0671
# Auto-generated LookML Explore File

include: "/views/domain_14/view_02014.view.lkml"
include: "/views/domain_16/view_02016.view.lkml"
include: "/views/domain_17/view_02017.view.lkml"
include: "/views/domain_18/view_02018.view.lkml"

explore: explore_0671 {
  label: "Explore Explore 0671"
  description: "Comprehensive analytics explore joining base view_02014 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02014
  
  always_filter: {
    filters: [view_02014.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02014.created_at_date: "7 days"]
    unless: [view_02014.id, view_02014.status]
  }

  join: view_02016 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02014.user_id} = ${view_02016.id} ;;
    required_joins: []
  }

  join: view_02017 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02014.account_id} = ${view_02017.account_id} ;;
    required_joins: [view_02016]
  }

  join: view_02018 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02014.category} = ${view_02018.category} ;;
  }

  access_filter: {
    field: view_02014.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02014.is_deleted} = false ;;
}
