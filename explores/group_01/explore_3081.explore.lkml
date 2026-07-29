# Explore: explore_3081
# Auto-generated LookML Explore File

include: "/views/domain_44/view_09244.view.lkml"
include: "/views/domain_46/view_09246.view.lkml"
include: "/views/domain_47/view_09247.view.lkml"
include: "/views/domain_48/view_09248.view.lkml"

explore: explore_3081 {
  label: "Explore Explore 3081"
  description: "Comprehensive analytics explore joining base view_09244 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09244
  
  always_filter: {
    filters: [view_09244.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09244.created_at_date: "7 days"]
    unless: [view_09244.id, view_09244.status]
  }

  join: view_09246 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09244.user_id} = ${view_09246.id} ;;
    required_joins: []
  }

  join: view_09247 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09244.account_id} = ${view_09247.account_id} ;;
    required_joins: [view_09246]
  }

  join: view_09248 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09244.category} = ${view_09248.category} ;;
  }

  access_filter: {
    field: view_09244.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09244.is_deleted} = false ;;
}
