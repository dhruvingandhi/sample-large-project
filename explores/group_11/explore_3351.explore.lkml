# Explore: explore_3351
# Auto-generated LookML Explore File

include: "/views/domain_04/view_10054.view.lkml"
include: "/views/domain_06/view_10056.view.lkml"
include: "/views/domain_07/view_10057.view.lkml"
include: "/views/domain_08/view_10058.view.lkml"

explore: explore_3351 {
  label: "Explore Explore 3351"
  description: "Comprehensive analytics explore joining base view_10054 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_10054
  
  always_filter: {
    filters: [view_10054.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10054.created_at_date: "7 days"]
    unless: [view_10054.id, view_10054.status]
  }

  join: view_10056 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10054.user_id} = ${view_10056.id} ;;
    required_joins: []
  }

  join: view_10057 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10054.account_id} = ${view_10057.account_id} ;;
    required_joins: [view_10056]
  }

  join: view_10058 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10054.category} = ${view_10058.category} ;;
  }

  access_filter: {
    field: view_10054.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10054.is_deleted} = false ;;
}
