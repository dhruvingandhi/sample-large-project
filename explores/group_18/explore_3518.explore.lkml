# Update for 2000 file diff target
# Explore: explore_3518
# Auto-generated LookML Explore File

include: "/views/domain_05/view_10555.view.lkml"
include: "/views/domain_07/view_10557.view.lkml"
include: "/views/domain_08/view_10558.view.lkml"
include: "/views/domain_09/view_10559.view.lkml"

explore: explore_3518 {
  label: "Explore Explore 3518"
  description: "Comprehensive analytics explore joining base view_10555 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10555
  
  always_filter: {
    filters: [view_10555.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10555.created_at_date: "7 days"]
    unless: [view_10555.id, view_10555.status]
  }

  join: view_10557 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10555.user_id} = ${view_10557.id} ;;
    required_joins: []
  }

  join: view_10558 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10555.account_id} = ${view_10558.account_id} ;;
    required_joins: [view_10557]
  }

  join: view_10559 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10555.category} = ${view_10559.category} ;;
  }

  access_filter: {
    field: view_10555.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10555.is_deleted} = false ;;
}
