# Explore: explore_1718
# Auto-generated LookML Explore File

include: "/views/domain_05/view_05155.view.lkml"
include: "/views/domain_07/view_05157.view.lkml"
include: "/views/domain_08/view_05158.view.lkml"
include: "/views/domain_09/view_05159.view.lkml"

explore: explore_1718 {
  label: "Explore Explore 1718"
  description: "Comprehensive analytics explore joining base view_05155 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05155
  
  always_filter: {
    filters: [view_05155.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05155.created_at_date: "7 days"]
    unless: [view_05155.id, view_05155.status]
  }

  join: view_05157 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05155.user_id} = ${view_05157.id} ;;
    required_joins: []
  }

  join: view_05158 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05155.account_id} = ${view_05158.account_id} ;;
    required_joins: [view_05157]
  }

  join: view_05159 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05155.category} = ${view_05159.category} ;;
  }

  access_filter: {
    field: view_05155.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05155.is_deleted} = false ;;
}
