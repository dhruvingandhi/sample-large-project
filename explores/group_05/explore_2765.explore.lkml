# Explore: explore_2765
# Auto-generated LookML Explore File

include: "/views/domain_46/view_08296.view.lkml"
include: "/views/domain_48/view_08298.view.lkml"
include: "/views/domain_49/view_08299.view.lkml"
include: "/views/domain_50/view_08300.view.lkml"

explore: explore_2765 {
  label: "Explore Explore 2765"
  description: "Comprehensive analytics explore joining base view_08296 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08296
  
  always_filter: {
    filters: [view_08296.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08296.created_at_date: "7 days"]
    unless: [view_08296.id, view_08296.status]
  }

  join: view_08298 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08296.user_id} = ${view_08298.id} ;;
    required_joins: []
  }

  join: view_08299 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08296.account_id} = ${view_08299.account_id} ;;
    required_joins: [view_08298]
  }

  join: view_08300 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08296.category} = ${view_08300.category} ;;
  }

  access_filter: {
    field: view_08296.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08296.is_deleted} = false ;;
}
