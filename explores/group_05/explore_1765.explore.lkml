# Explore: explore_1765
# Auto-generated LookML Explore File

include: "/views/domain_46/view_05296.view.lkml"
include: "/views/domain_48/view_05298.view.lkml"
include: "/views/domain_49/view_05299.view.lkml"
include: "/views/domain_50/view_05300.view.lkml"

explore: explore_1765 {
  label: "Explore Explore 1765"
  description: "Comprehensive analytics explore joining base view_05296 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05296
  
  always_filter: {
    filters: [view_05296.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05296.created_at_date: "7 days"]
    unless: [view_05296.id, view_05296.status]
  }

  join: view_05298 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05296.user_id} = ${view_05298.id} ;;
    required_joins: []
  }

  join: view_05299 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05296.account_id} = ${view_05299.account_id} ;;
    required_joins: [view_05298]
  }

  join: view_05300 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05296.category} = ${view_05300.category} ;;
  }

  access_filter: {
    field: view_05296.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05296.is_deleted} = false ;;
}
