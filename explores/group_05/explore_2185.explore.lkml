# Explore: explore_2185
# Auto-generated LookML Explore File

include: "/views/domain_06/view_06556.view.lkml"
include: "/views/domain_08/view_06558.view.lkml"
include: "/views/domain_09/view_06559.view.lkml"
include: "/views/domain_10/view_06560.view.lkml"

explore: explore_2185 {
  label: "Explore Explore 2185"
  description: "Comprehensive analytics explore joining base view_06556 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06556
  
  always_filter: {
    filters: [view_06556.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06556.created_at_date: "7 days"]
    unless: [view_06556.id, view_06556.status]
  }

  join: view_06558 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06556.user_id} = ${view_06558.id} ;;
    required_joins: []
  }

  join: view_06559 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06556.account_id} = ${view_06559.account_id} ;;
    required_joins: [view_06558]
  }

  join: view_06560 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06556.category} = ${view_06560.category} ;;
  }

  access_filter: {
    field: view_06556.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06556.is_deleted} = false ;;
}
