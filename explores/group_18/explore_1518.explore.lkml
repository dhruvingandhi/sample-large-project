# Update for 2000 file diff target
# Explore: explore_1518
# Auto-generated LookML Explore File

include: "/views/domain_05/view_04555.view.lkml"
include: "/views/domain_07/view_04557.view.lkml"
include: "/views/domain_08/view_04558.view.lkml"
include: "/views/domain_09/view_04559.view.lkml"

explore: explore_1518 {
  label: "Explore Explore 1518"
  description: "Comprehensive analytics explore joining base view_04555 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04555
  
  always_filter: {
    filters: [view_04555.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04555.created_at_date: "7 days"]
    unless: [view_04555.id, view_04555.status]
  }

  join: view_04557 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04555.user_id} = ${view_04557.id} ;;
    required_joins: []
  }

  join: view_04558 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04555.account_id} = ${view_04558.account_id} ;;
    required_joins: [view_04557]
  }

  join: view_04559 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04555.category} = ${view_04559.category} ;;
  }

  access_filter: {
    field: view_04555.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04555.is_deleted} = false ;;
}
