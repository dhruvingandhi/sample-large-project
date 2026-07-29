# Explore: explore_1727
# Auto-generated LookML Explore File

include: "/views/domain_32/view_05182.view.lkml"
include: "/views/domain_34/view_05184.view.lkml"
include: "/views/domain_35/view_05185.view.lkml"
include: "/views/domain_36/view_05186.view.lkml"

explore: explore_1727 {
  label: "Explore Explore 1727"
  description: "Comprehensive analytics explore joining base view_05182 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05182
  
  always_filter: {
    filters: [view_05182.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05182.created_at_date: "7 days"]
    unless: [view_05182.id, view_05182.status]
  }

  join: view_05184 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05182.user_id} = ${view_05184.id} ;;
    required_joins: []
  }

  join: view_05185 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05182.account_id} = ${view_05185.account_id} ;;
    required_joins: [view_05184]
  }

  join: view_05186 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05182.category} = ${view_05186.category} ;;
  }

  access_filter: {
    field: view_05182.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05182.is_deleted} = false ;;
}
