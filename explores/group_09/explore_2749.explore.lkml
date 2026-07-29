# Explore: explore_2749
# Auto-generated LookML Explore File

include: "/views/domain_48/view_08248.view.lkml"
include: "/views/domain_50/view_08250.view.lkml"
include: "/views/domain_01/view_08251.view.lkml"
include: "/views/domain_02/view_08252.view.lkml"

explore: explore_2749 {
  label: "Explore Explore 2749"
  description: "Comprehensive analytics explore joining base view_08248 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08248
  
  always_filter: {
    filters: [view_08248.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08248.created_at_date: "7 days"]
    unless: [view_08248.id, view_08248.status]
  }

  join: view_08250 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08248.user_id} = ${view_08250.id} ;;
    required_joins: []
  }

  join: view_08251 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08248.account_id} = ${view_08251.account_id} ;;
    required_joins: [view_08250]
  }

  join: view_08252 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08248.category} = ${view_08252.category} ;;
  }

  access_filter: {
    field: view_08248.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08248.is_deleted} = false ;;
}
