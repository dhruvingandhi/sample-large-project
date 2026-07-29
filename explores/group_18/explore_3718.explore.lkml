# Explore: explore_3718
# Auto-generated LookML Explore File

include: "/views/domain_05/view_11155.view.lkml"
include: "/views/domain_07/view_11157.view.lkml"
include: "/views/domain_08/view_11158.view.lkml"
include: "/views/domain_09/view_11159.view.lkml"

explore: explore_3718 {
  label: "Explore Explore 3718"
  description: "Comprehensive analytics explore joining base view_11155 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11155
  
  always_filter: {
    filters: [view_11155.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11155.created_at_date: "7 days"]
    unless: [view_11155.id, view_11155.status]
  }

  join: view_11157 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11155.user_id} = ${view_11157.id} ;;
    required_joins: []
  }

  join: view_11158 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11155.account_id} = ${view_11158.account_id} ;;
    required_joins: [view_11157]
  }

  join: view_11159 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11155.category} = ${view_11159.category} ;;
  }

  access_filter: {
    field: view_11155.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11155.is_deleted} = false ;;
}
