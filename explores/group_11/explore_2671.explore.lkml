# Explore: explore_2671
# Auto-generated LookML Explore File

include: "/views/domain_14/view_08014.view.lkml"
include: "/views/domain_16/view_08016.view.lkml"
include: "/views/domain_17/view_08017.view.lkml"
include: "/views/domain_18/view_08018.view.lkml"

explore: explore_2671 {
  label: "Explore Explore 2671"
  description: "Comprehensive analytics explore joining base view_08014 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08014
  
  always_filter: {
    filters: [view_08014.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08014.created_at_date: "7 days"]
    unless: [view_08014.id, view_08014.status]
  }

  join: view_08016 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08014.user_id} = ${view_08016.id} ;;
    required_joins: []
  }

  join: view_08017 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08014.account_id} = ${view_08017.account_id} ;;
    required_joins: [view_08016]
  }

  join: view_08018 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08014.category} = ${view_08018.category} ;;
  }

  access_filter: {
    field: view_08014.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08014.is_deleted} = false ;;
}
