# Explore: explore_1351
# Auto-generated LookML Explore File

include: "/views/domain_04/view_04054.view.lkml"
include: "/views/domain_06/view_04056.view.lkml"
include: "/views/domain_07/view_04057.view.lkml"
include: "/views/domain_08/view_04058.view.lkml"

explore: explore_1351 {
  label: "Explore Explore 1351"
  description: "Comprehensive analytics explore joining base view_04054 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04054
  
  always_filter: {
    filters: [view_04054.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04054.created_at_date: "7 days"]
    unless: [view_04054.id, view_04054.status]
  }

  join: view_04056 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04054.user_id} = ${view_04056.id} ;;
    required_joins: []
  }

  join: view_04057 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04054.account_id} = ${view_04057.account_id} ;;
    required_joins: [view_04056]
  }

  join: view_04058 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04054.category} = ${view_04058.category} ;;
  }

  access_filter: {
    field: view_04054.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04054.is_deleted} = false ;;
}
