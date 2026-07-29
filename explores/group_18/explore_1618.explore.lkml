# Explore: explore_1618
# Auto-generated LookML Explore File

include: "/views/domain_05/view_04855.view.lkml"
include: "/views/domain_07/view_04857.view.lkml"
include: "/views/domain_08/view_04858.view.lkml"
include: "/views/domain_09/view_04859.view.lkml"

explore: explore_1618 {
  label: "Explore Explore 1618"
  description: "Comprehensive analytics explore joining base view_04855 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_04855
  
  always_filter: {
    filters: [view_04855.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04855.created_at_date: "7 days"]
    unless: [view_04855.id, view_04855.status]
  }

  join: view_04857 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04855.user_id} = ${view_04857.id} ;;
    required_joins: []
  }

  join: view_04858 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04855.account_id} = ${view_04858.account_id} ;;
    required_joins: [view_04857]
  }

  join: view_04859 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04855.category} = ${view_04859.category} ;;
  }

  access_filter: {
    field: view_04855.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04855.is_deleted} = false ;;
}
