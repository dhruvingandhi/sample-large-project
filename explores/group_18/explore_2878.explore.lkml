# Explore: explore_2878
# Auto-generated LookML Explore File

include: "/views/domain_35/view_08635.view.lkml"
include: "/views/domain_37/view_08637.view.lkml"
include: "/views/domain_38/view_08638.view.lkml"
include: "/views/domain_39/view_08639.view.lkml"

explore: explore_2878 {
  label: "Explore Explore 2878"
  description: "Comprehensive analytics explore joining base view_08635 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08635
  
  always_filter: {
    filters: [view_08635.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08635.created_at_date: "7 days"]
    unless: [view_08635.id, view_08635.status]
  }

  join: view_08637 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08635.user_id} = ${view_08637.id} ;;
    required_joins: []
  }

  join: view_08638 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08635.account_id} = ${view_08638.account_id} ;;
    required_joins: [view_08637]
  }

  join: view_08639 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08635.category} = ${view_08639.category} ;;
  }

  access_filter: {
    field: view_08635.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08635.is_deleted} = false ;;
}
