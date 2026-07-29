# Explore: explore_1712
# Auto-generated LookML Explore File

include: "/views/domain_37/view_05137.view.lkml"
include: "/views/domain_39/view_05139.view.lkml"
include: "/views/domain_40/view_05140.view.lkml"
include: "/views/domain_41/view_05141.view.lkml"

explore: explore_1712 {
  label: "Explore Explore 1712"
  description: "Comprehensive analytics explore joining base view_05137 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05137
  
  always_filter: {
    filters: [view_05137.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05137.created_at_date: "7 days"]
    unless: [view_05137.id, view_05137.status]
  }

  join: view_05139 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05137.user_id} = ${view_05139.id} ;;
    required_joins: []
  }

  join: view_05140 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05137.account_id} = ${view_05140.account_id} ;;
    required_joins: [view_05139]
  }

  join: view_05141 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05137.category} = ${view_05141.category} ;;
  }

  access_filter: {
    field: view_05137.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05137.is_deleted} = false ;;
}
